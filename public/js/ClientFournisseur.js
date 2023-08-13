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
            const tableauResultat = $('#fournisseursTable');
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
        $("#openFournisseurModal").click(function() {
            $("#myFournisseurModal").modal("show");
        });
        
        //Enregistrement fournisseur
        $("#saveFournisseur").click(function() {
            let nom = $("#nomFournisseurAdd").val();
            let prenom = $("#prenomFournisseurAdd").val();
            let contact = $("#fournisseurContactAdd").val();
            var dataToSend = {
                 fournisseurName: nom,
                 fournisseurLastName: prenom,
                 fournisseurContact: contact
             };
 
             fetch("/api/addSupplier", {
                 method: "POST",
                 headers: {
                     "Content-Type": "application/json"
                 },
                 body: JSON.stringify(dataToSend)
             })
             .then(response => response.json())
             .then(data => {
                 alert('Fournisseur ajouté.');
                 $("#myFournisseurModal").modal("hide");
 
                 // Créer le tableau HTML
                 const tableauResultat = $('#fournisseursTable');
                 $('#fournisseursTable tr').remove();
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
                 // console.log("Réponse du serveur :", data);
             })
             .catch(error => {
                 console.error("Erreur :", error);
             });
         });

        //Afficher formulaire de modification fournisseur
        $("#fournisseursTable").on('click', '.edit-btn',function() {
            $("#myFournisseurModalUpdate").modal("show");
            var ligne = $(this).closest('tr');
            var fournisseur = ligne.data('fournisseur');
            sessionStorage.setItem("fournisseurSelectedId", fournisseur.supplierId);
            $("#nomFournisseurUpdate").val(fournisseur.supplierName);
            $("#prenomFournisseurUpdate").val(fournisseur.supplierLastName);
            $("#fournisseurContactUpdate").val(fournisseur.supplierContact);
        });
          //Modifier le fournisseur
          $("#updateFournisseur").on('click', function (){
            let nom = $("#nomFournisseurUpdate").val();
            let prenom = $("#prenomFournisseurUpdate").val();
            let contact = $("#fournisseurContactUpdate").val();
            let fournisseurId = sessionStorage.getItem("fournisseurSelectedId");
            var newFournisseur = {
                fournisseurId: fournisseurId,
                fournisseurName: nom,
                fournisseurLastName: prenom,
                fournisseurContact: contact
            };
            
            fetch("/api/updateSupplier", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(newFournisseur)
            })
            .then(response => response.json())
            .then(data => {
                alert('Modification enregistré.');
                $("#myFournisseurModalUpdate").modal("hide");

                // Créer le tableau HTML
                const tableauResultat = $('#fournisseursTable');
                $('#fournisseursTable tr').remove();
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
            .catch(error => {
                console.error("Erreur :", error);
            });
        })
          // Fermer le formulaire d'ajout fournisseur
          $("#closefournisseurModal").click(function() {
            $("#myfournisseurModal").modal("hide");
          });
          
        //Suppression fournisseur
        $('#fournisseursTable').on('click', '.delete-btn', function(event) {
            var ligne = $(this).closest('tr');
            var fournisseur = ligne.data('fournisseur');
            var newFournisseur = {
                fournisseurId: fournisseur.supplierId
            };
            if (confirm("Êtes-vous sûr de supprimer ce fournisseur ?")) {
                fetch("/api/deleteSupplier", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json"
                    },
                    body: JSON.stringify(newFournisseur)
                })
                .then(response => response.json())
                .then(data => {
                    alert('Modification enregistré.');
                    $("#myFournisseurModalUpdate").modal("hide");
    
                    // Créer le tableau HTML
                    const tableauResultat = $('#fournisseursTable');
                    $('#fournisseursTable tr').remove();
                    data.forEach(fournisseur => {
                        const ligne = $('<tr>');
                        ligne.data('fournisseur', fournisseur); // Stocker l'identifiant dans l'attribut data-id
                        ligne.append('<td>' + fournisseur.supplierName + '</td>');
                        ligne.append('<td>' + fournisseur.supplierLastName + '</td>');
                        ligne.append('<td>' + fournisseur.supplierContact + '</td>');
                        ligne.append('<div class="btn-group" role="group" aria-label="Actions"><button class="btn btn-primary btn-sm edit-btn ml-2">Modifier</button><button class="btn btn-danger btn-sm delete-btn ml-2">Supprimer</button></div>');
                        tableauResultat.append(ligne);
                    });
                })
                .catch(error => {
                    console.error("Erreur :", error);
                });

            } else {
                // Code à exécuter si l'utilisateur clique sur "Annuler"
            }
        });

        //Afficher formulaire d'ajout Client
        $("#openClientModal").click(function() {
            $("#myClientModal").modal("show");
          });

        //Afficher formulaire de modification Client
        $("#clientTable").on('click', '.edit-btn',function() {
            $("#myClientModalUpdate").modal("show");
            var ligne = $(this).closest('tr');
            var client = ligne.data('client');
            sessionStorage.setItem("clientSelectedId", client.customerId);
            $("#nomClientUpdate").val(client.customerName);
            $("#prenomClientUpdate").val(client.customerLastName);
            $("#clientContactUpdate").val(client.customerContact);
            $("#clientCodeUpdate").val(client.customerCode);
          });
          
          //Modifier le client
          $("#updateClient").on('click', function (){
            let nom = $("#nomClientUpdate").val();
            let prenom = $("#prenomClientUpdate").val();
            let contact = $("#clientContactUpdate").val();
            let code = $("#clientCodeUpdate").val();
            let clientId = sessionStorage.getItem("clientSelectedId");
            var newClient = {
                customerId: clientId,
                customerName: nom,
                customerLastName: prenom,
                customerContact: contact,
                customerCode: code
            };
            
            fetch("/api/updateCustomer", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(newClient)
            })
            .then(response => response.json())
            .then(data => {
                alert('Modification enregistré.');
                $("#myClientModalUpdate").modal("hide");

                // Créer le tableau HTML
                const tableauResultat = $('#clientTable');
                $('#clientTable tr').remove();
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
            .catch(error => {
                console.error("Erreur :", error);
            });
        })

          // Fermer le formulaire d'ajout Client
          $("#closeClientModal").click(function() {
            $("#myClientModal").modal("hide");
          });
        //Suppression Client
        $('#clientTable').on('click', '.delete-btn', function(event) {
            var ligne = $(this).closest('tr');
            var client = ligne.data('client');
            console.log(client);
        });

    });
    
})(jQuery);

