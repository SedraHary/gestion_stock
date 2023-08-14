(function ($) {
    "use strict";
    $(document).ready(function() {
        let userType=sessionStorage.getItem("userType");
        let userAgentCode=sessionStorage.getItem("userAgentCode");
        let userName=sessionStorage.getItem("userName");
        
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
            $('#loading-overlay').removeClass('show');
            return response.json();
        })
        .then((data) => {
            // Créer le tableau HTML
            const tableauResultat = $('#stockTable tbody');
            data.forEach(article => {
                const ligne = $('<tr>');
                ligne.data('article', article); // Stocker l'identifiant dans l'attribut data-id
                ligne.append('<td>' + article.articleFamily + '</td>');
                ligne.append('<td>' + article.articleName + '</td>');
                ligne.append('<td>' + article.articleDetail + '</td>');
                ligne.append('<td>' + article.articleUnit + '</td>');
                ligne.append('<td>' + article.articlePVDet + '</td>');
                ligne.append('<td>' + article.articlePvGros + '</td>');
                ligne.append('<td>' + article.articlePvRev + '</td>');
                ligne.append('<td>' + article.articlePa + '</td>');
                ligne.append('<div class="btn-group" role="group" aria-label="Actions"><button class="btn btn-primary btn-sm edit-btn ml-2">Modifier</button><button class="btn btn-danger btn-sm delete-btn ml-2">Supprimer</button></div>');
                // ligne.append('</tr>')
                tableauResultat.append(ligne);
            });
        })
        .catch((error) => {
            let message = "Une erreur s'est produite lors de la connexion.";
            alert(message);
            console.error("Error:", error);
            $('#loading-overlay').removeClass('show');
        });

        //Afficher formulaire d'ajout utilisateur
        $("#openStockModal").click(function() {
            $("#myStockModal").modal("show");
          });

        //Afficher formulaire de modification utilisateur
        $("#StocksTable").on('click', '.edit-btn',function() {
            $("#myStockModalUpdate").modal("show");
            var ligne = $(this).closest('tr');
            var Stock = ligne.data('Stock');
            console.log(Stock);
          });
    
          // Fermer le formulaire d'ajout utilisateur
          $("#closeStockModal").click(function() {
            $("#myStockModal").modal("hide");
          });
        //Suppression utilisateur
        $('#StocksTable').on('click', '.delete-btn', function(event) {
            var ligne = $(this).closest('tr');
            var Stock = ligne.data('Stock');
            console.log(Stock);
        });

    });
    
})(jQuery);

