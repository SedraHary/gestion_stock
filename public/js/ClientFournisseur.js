(function ($) {
    "use strict";
    $(document).ready(function() {
        let userType=sessionStorage.getItem("userType");
        let userAgentCode=sessionStorage.getItem("userAgentCode");
        let userName=sessionStorage.getItem("userName");
        
        fetch("/api/suppliers", {
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
            const tableauResultat = $('#fournisseurTable');
            data.forEach(fournisseur => {
                const ligne = $('<tr>');
                ligne.data('fournisseur', fournisseur); // Stocker l'identifiant dans l'attribut data-id
                ligne.append('<td>' + fournisseur.supplierName + '</td>');
                ligne.append('<td>' + fournisseur.supplierLastName + '</td>');
                ligne.append('<td>' + fournisseur.supplierContact + '</td>');
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

        //Liste clients
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
            $('#loading-overlay').removeClass('show');
            return response.json();
        })
        .then((data) => {
            // Créer le tableau HTML
            const tableauResultat = $('#clientTable');
            data.forEach(client => {
                const ligne = $('<tr>');
                ligne.data('client', client); // Stocker l'identifiant dans l'attribut data-id
                ligne.append('<td>' + client.customerName + '</td>');
                ligne.append('<td>' + client.customerLastName + '</td>');
                ligne.append('<td>' + client.customerContact + '</td>');
                ligne.append('<td>' + client.customerCode + '</td>');
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

        //Afficher formulaire d'ajout fournisseur
        $("#openfournisseurModal").click(function() {
            $("#myfournisseurModal").modal("show");
          });

        //Afficher formulaire de modification fournisseur
        $("#fournisseursTable").on('click', '.edit-btn',function() {
            $("#myfournisseurModalUpdate").modal("show");
            var ligne = $(this).closest('tr');
            var fournisseur = ligne.data('fournisseur');
            console.log(fournisseur);
          });
    
          // Fermer le formulaire d'ajout fournisseur
          $("#closefournisseurModal").click(function() {
            $("#myfournisseurModal").modal("hide");
          });
        //Suppression fournisseur
        $('#fournisseursTable').on('click', '.delete-btn', function(event) {
            var ligne = $(this).closest('tr');
            var fournisseur = ligne.data('fournisseur');
            console.log(fournisseur);
        });

        //Afficher formulaire d'ajout Client
        $("#openClientModal").click(function() {
            $("#myClientModal").modal("show");
          });

        //Afficher formulaire de modification Client
        $("#ClientsTable").on('click', '.edit-btn',function() {
            $("#myClientModalUpdate").modal("show");
            var ligne = $(this).closest('tr');
            var Client = ligne.data('Client');
            console.log(Client);
          });
    
          // Fermer le formulaire d'ajout Client
          $("#closeClientModal").click(function() {
            $("#myClientModal").modal("hide");
          });
        //Suppression Client
        $('#ClientsTable').on('click', '.delete-btn', function(event) {
            var ligne = $(this).closest('tr');
            var Client = ligne.data('Client');
            console.log(Client);
        });

    });
    
})(jQuery);

