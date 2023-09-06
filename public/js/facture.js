(function ($) {
    "use strict";
    
    $(document).ready(function() {
        var clientOption = [];
        var articleOption = [];

        fetch("/api/articles", {
            method: "GET",
            headers: {
                "Content-Type": "application/json",
            },
        })
        .then((response) => {
            if (!response.ok) {
                throw new Error("Network response was not ok");
            }
            return response.json();
        })
        .then((data) => {
            var newData = data.map(function(option) {
                let article = option.articleName+" "+option.articleDetail+" "+option.articleUnit;
                return { text: article, value: option.articleName, id: option.articleId, unite: option.articleUnit, pvDet: option.articlePVDet};
            });
            articleOption = newData;
        })
        .catch((error) => {
            let message = "Une erreur s'est produite lors de la connexion.";
            alert(message);
            console.error("Error:", error);
        });
        
        //fetch client
        fetch("/api/customers", {
            method: "GET",
            headers: {
                "Content-Type": "application/json",
            },
        })
        .then((response) => {
            if (!response.ok) {
                throw new Error("Network response was not ok");
            }
            return response.json();
        })
        .then((data) => {
            var newData = data.map(function(option) {
                return { text: option.customerName+" "+option.customerLastName, value: option.customerCode? option.customerCode : option.customerName, id: option.customerId };
            });
            clientOption = newData;
        })
        .catch((error) => {
            let message = "Une erreur s'est produite lors de la connexion.";
            alert(message);
            console.error("Error:", error);
            $('#loading-overlay').removeClass('show');
        });

        $("#searchInput").on("input", function() {
            var input = $(this).val().toLowerCase();
            var optionsContainer = $("#optionsContainer");
            optionsContainer.empty(); // Effacer les anciennes options
            
            $.each(clientOption, function(index, option) {
              if (option.text.toLowerCase().startsWith(input)) {
                optionsContainer.append($("<div>", {
                  class: "option-item",
                  text: option.text,
                  click: function() {
                    let value = option.value? option.value : input;
                    $("#searchInput").val(option.text);
                    optionsContainer.empty(); // Cacher les options après sélection
                  }
                }));
              }
            });
        });


        $("#generate-invoice").on("click", function() {
            var articleData = [];

            $("#item-list tr").each(function() {
                var description = $(this).find(".description").val();
                var quantity = $(this).find(".quantity").val();
                var unity = $(this).find(".unity").val();
                var price = $(this).find(".price").val();
                var total = $(this).find(".total").text();

                var item = {
                    description: description,
                    quantity: quantity,
                    unity: unity,
                    price: price,
                    total: total
                };

                articleData.push(item);
            });

            var clientValue = $("#searchInput").val();
            var remise = $("#remise").val();
            var totalAvant = $("#invoice-total").text();
            var totalApres = $("#invoice-totalTTC").text();
            var agent = sessionStorage.getItem('userAgentCode');
            var dataToSend = {
                client : clientValue,
                articleData : articleData,
                remise : remise,
                totalApres : totalApres,
                totalAvant : totalAvant,
                agent : agent
            }
            // console.log(dataToSend);

            // Perform AJAX request to the backend to generate and download the bill
            // fetch('/generate-bill', {
            //     method: 'POST',
            //     headers: {
            //         'Content-Type': 'application/json'
            //     },
            //     body: JSON.stringify(dataToSend)
            // })
            // .then(response => response.blob())
            // .then(blob => {
            //     const url = URL.createObjectURL(blob);
            //     const a = document.createElement('a');
            //     a.href = url;
            //     a.download = 'Facture.pdf';
            //     a.click();
            // })
            // .catch(error => {
            //     console.error('Error generating bill:', error);
            // });
        })

        //Création fature
        const addItemButton = $('#add-item');
        const itemList = $('#item-list');
        const invoiceTotalElement = $('#invoice-total');


        addItemButton.on('click', function() {
            const newRow = $('<tr>\
            <td><input type="text" class="description" placeholder="Désignation"></td>\
            <td><input type="number" class="quantity" placeholder="Quantité"></td>\
            <td><input type="text" class="unity" placeholder="Unité"></td>\
            <td><input type="number" class="price" placeholder="Prix unitaire"></td>\
            <td><span class="total">0.00</span></td>\
            </tr>');
            itemList.append(newRow);
        });

        itemList.on('input', '.quantity, .price', function() {
            updateTotal();
        });
        itemList.on("input", ".description", function() {
            var $descriptionInput = $(this);
            var input = $(this).val().toLowerCase();
            var optionsContainer = $("#optionsArticleContainer");
            optionsContainer.empty(); // Effacer les anciennes options
            
            $.each(articleOption, function(index, option) {
              if (option.text.toLowerCase().startsWith(input)) {
                optionsContainer.append($("<div>", {
                  class: "option-item",
                  text: option.text,
                  click: function() {
                    let prixVente = option.pvDet;
                    let unit = option.unite;
                    $descriptionInput.val(option.text);
                    $descriptionInput.closest("tr").find(".unity").val(unit);
                    $descriptionInput.closest("tr").find(".price").val(parseInt(prixVente).toFixed(2));
                    
                    const quantity = parseFloat($descriptionInput.closest("tr").find(".quantity").val());
                    const price = parseFloat($descriptionInput.closest("tr").find(".price").val());
                    const rowTotal = quantity * price;
                    let totalRow = !isNaN(rowTotal)? rowTotal.toFixed(2) : parseInt('0');
                    $descriptionInput.closest("tr").find(".total").text(totalRow);
                    // $(this).siblings(".unity").val("hahaha");
                    // updatePuUnit(option, $descriptionInput);
                    optionsContainer.empty(); // Cacher les options après sélection
                  }
                }));
              }
            });
        });
        $("#remise").on("input", function() {
            let remiseValue = $(this).val();
            let remise = !isNaN(remiseValue)? parseInt(remiseValue).toFixed(2) : remiseValue.toFixed(2);
            let totalAvantRemise = $("#invoice-total").text()
            let totalAvantRemiseNbr = !isNaN(totalAvantRemise)? parseInt(totalAvantRemise).toFixed(2) : totalAvantRemise.toFixed(2);
            let result = totalAvantRemiseNbr-remise;
            $("#invoice-totalTTC").text(parseInt(result).toFixed(2));
        })

        function updateTotal() {
            let total = 0;
            const rows = itemList.find('tr');
            rows.each(function() {
            const quantity = parseFloat($(this).find('.quantity').val());
            const price = parseFloat($(this).find('.price').val());
            const rowTotal = quantity * price;
            $(this).find('.total').text(rowTotal.toFixed(2));
            total += rowTotal;
            });
            invoiceTotalElement.text(total.toFixed(2));
        }
        function updatePuUnit(option, descriptionInput) {
            const rows = itemList.find('tr');
            let prixVente = option.pvDet;
            let unit = option.unite;
            let total = 0;
            rows.each(function() {
            $(this).find('.unity').val(unit);
            $(this).find('.price').val(parseInt(prixVente).toFixed(2));
            const quantity = parseFloat($(this).find('.quantity').val());
            const price = parseFloat($(this).find('.price').val());
            const rowTotal = quantity * price;
            let totalRow = !isNaN(rowTotal)? rowTotal.toFixed(2) : parseInt('0');
            $(this).find('.total').text(totalRow);
            total += totalRow;
            });
            invoiceTotalElement.text(total.toFixed(2));
        }
    })
    
})(jQuery);

