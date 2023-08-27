(function ($) {
    "use strict";
    
    $(document).ready(function() {
        var clientOption = [];
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
                return { text: option.customerName+" "+option.customerLastName, value: option.customerCode? option.customerCode : option.customerName };
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
            var clientValue = $("#searchInput").val();
            var dataToSend = {
                client : clientValue,
            }
            console.log(dataToSend)
        })
    })
    
})(jQuery);

