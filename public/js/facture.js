(function ($) {
    "use strict";
    let idClient = 0;
    $(document).ready(function() {
        var clientOption = [];
        var articleOption = [];
        var isValid = false;
        
        $('#btnRefreshFacture').click(function () {
            // location.reload();
            $('#item-list tr').remove();
            $('#searchInput').val('');
            $('#remise').val('');
            $('#invoice-total').text('');
            $('#invoice-totalTTC').text('');
        });

        $("#factureMenu").on('click', function(){
            getFactures();
        })
        
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
                return { text: article, value: option.articleName, id: option.articleId, unite: option.articleUnit, pvDet: option.articlePVDet, quantity: option.articleQuantity};
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
                    idClient = option.id;
                    optionsContainer.empty(); // Cacher les options après sélection
                  }
                }));
              }
              let texteTrouve = clientOption.some(objet => objet["text"] === $("#searchInput").val());
              if(!texteTrouve){
                idClient = 0;
              }
            });
            
        });


        $("#generate-invoice").on("click", function() {
            var articleData = [];
            if (isValid){
                $("#item-list tr").each(function() {
                    var description = $(this).find(".description").val();
                    var quantity = $(this).find(".quantity").val();
                    var unity = $(this).find(".unity").val();
                    var price = $(this).find(".price").val();
                    var total = $(this).find(".total").text();
                    var idArticle = $(this).find(".idArticle").val();
    
                    var item = {
                        idArticle:idArticle,
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
                const currentDate = new Date();
                const year = currentDate.getFullYear();
                const month = String(currentDate.getMonth() + 1).padStart(2, '0');
                const day = String(currentDate.getDate()).padStart(2, '0');
                const formattedDate = `${day}-${month}-${year}`;
                var dataToSend = {
                    clientId : idClient,
                    client : clientValue,
                    dateFacture : formattedDate,
                    articleData : articleData,
                    remise : remise,
                    totalApres : totalApres,
                    totalAvant : totalAvant,
                    agent : agent
                }
                // console.log(dataToSend);
    
                fetch("/api/addBill", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json"
                    },
                    body: JSON.stringify(dataToSend)
                })
                .then(response1 => response1.json())
                .then(data => {
                    dataToSend.numeroFacture = data;
                    // Perform AJAX request to the backend to generate and download the bill
                    fetch('/generate-bill', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify(dataToSend)
                    })
                    .then(response => response.blob())
                    .then(blob => {
                        const url = URL.createObjectURL(blob);
                        const a = document.createElement('a');
                        a.href = url;
                        a.download = 'Facture.pdf';
                        a.click();
                    })
                    .catch(error => {
                        console.error('Error downloading bill:', error);
                    });
                })
                .then(data2 => {
                    getFactures();
                })
                .catch(error => {
                    console.error('Error saving bill:', error);
                });
            }else{
                alert("Veuillez bien vérifier la formulaire.");
            }
             
        })

        //Afficher détail facture
        $("#facturesTable").on('click', '.edit-btn',function() {
            $("#factureDetail").modal("show");
            var ligne = $(this).closest('tr');
            var facture = ligne.data('facture');
            // console.log(facture)
            $("#factureLabel").text(`Détail facture n° ${facture.bill_id}`);
            $("#numAgentFacture").val(facture.agent_id);
            $("#remiseFacture").val(facture.remise);
            $("#prixTotalFacture").val(facture.bill_total_price);
            const tableauResultat = $('#factureDetailTable tbody');
            $('#factureDetailTable tbody tr').remove();
            facture.detail.forEach(facture => {
                const ligne = $('<tr>');
                ligne.data('facture', facture); // Stocker l'identifiant dans l'attribut data-id
                ligne.append('<td>' + facture.articlename+" "+facture.articledetail + '</td>');
                ligne.append('<td>' + facture.quantity + '</td>');
                ligne.append('<td>' + facture.amount + '</td>');
                    
                tableauResultat.append(ligne);
            });   
        });

        //Création fature
        const addItemButton = $('#add-item');
        const itemList = $('#item-list');
        const invoiceTotalElement = $('#invoice-total');


        addItemButton.on('click', function() {
            const newRow = $('<tr>\
            <td hidden><input type="text" class="idArticle"></td>\
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
                    let id= option.id;
                    let quantityDispo = option.quantity;
                    $descriptionInput.val(option.text);
                    $descriptionInput.closest("tr").find(".unity").val(unit);
                    $descriptionInput.closest("tr").find(".price").val(parseInt(prixVente).toFixed(2));
                    $descriptionInput.closest("tr").find(".idArticle").val(id);
                    $descriptionInput.closest("tr").find(".quantityDispo").val(quantityDispo);
                    
                    const quantity = parseFloat($descriptionInput.closest("tr").find(".quantity").val());
                    const price = parseFloat($descriptionInput.closest("tr").find(".price").val());
                    const rowTotal = quantity * price;
                    let totalRow = !isNaN(rowTotal)? rowTotal.toFixed(2) : parseInt('0');
                    $descriptionInput.closest("tr").find(".total").text(totalRow);
                    
                    optionsContainer.empty(); // Cacher les options après sélection
                  }
                }));
              }
            });
        });
        //Annulation Facture
        $('#facturesTable').on('click', '.delete-btn', function(event) {
            var ligne = $(this).closest('tr');
            var facture = ligne.data('facture');
            var idFacture = facture.bill_id;
            var dataFacture = {
                idFacture: idFacture
            }
            if (confirm("Êtes-vous sûr de vouloir annuler cette facture ?")) {
                fetch("/api/deleteBill", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json"
                    },
                    body: JSON.stringify(dataFacture)
                })
                .then(response => {
                    alert('Annulation effectué.');
                    getFactures();
                })
                .catch(error => {
                    console.error("Erreur :", error);
                });
            }
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
                const quantityDispo = parseFloat($(this).find('.quantityDispo').val());
                const quantity = parseFloat($(this).find('.quantity').val());
                // console.log(44,quantityDispo)
                if(quantityDispo<quantity){
                    alert('Stock en manque!');
                    isValid=false;
                }else{
                    isValid=true;
                    const price = parseFloat($(this).find('.price').val());
                    const rowTotal = quantity * price;
                    $(this).find('.total').text(rowTotal.toFixed(2));
                    total += rowTotal;
                }
                
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
        function getFactures(){
            fetch("/api/bills",{
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
                // console.log(12, data)
                const tableauResultat = $('#facturesTable tbody');
                $('#facturesTable tbody tr').remove();
                data.forEach(facture => {
                    const ligne = $('<tr>');
                    ligne.data('facture', facture); // Stocker l'identifiant dans l'attribut data-id
                    ligne.append('<td>' + facture.bill_number + '</td>');
                    ligne.append('<td>' + facture.customer_name + '</td>');
                    ligne.append('<td>' + facture.bill_date.slice(0,10) + '</td>');
                    ligne.append('<div class="btn-group" role="group" aria-label="Actions"><button class="btn btn-primary btn-sm edit-btn ml-2"><i class="fas fa-eye"></i></button><button class="btn btn-danger btn-sm delete-btn ml-2"><i class="fas fa-undo"></i></button></div>');
                    // ligne.append('</tr>')
                    tableauResultat.append(ligne);
                });
            })
        }
    })
    
})(jQuery);

