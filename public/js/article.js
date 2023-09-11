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
                ligne.append( article.articleQuantity===0?'<td style="color: red;">' + article.articleQuantity + '</td>': '<td>' + article.articleQuantity + '</td>');
                ligne.append('<div class="btn-group" role="group" aria-label="Actions"><button class="btn btn-primary btn-sm edit-btn ml-2"><i class="fas fa-edit"></i></button><button class="btn btn-danger btn-sm delete-btn ml-2"><i class="fas fa-trash"></i></button></div>');
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

        //Afficher formulaire d'ajout article
        $("#openStockModal").click(function() {
            $("#myStockModal").modal("show");
          });

        //Afficher formulaire de modification article
        $("#stockTable").on('click', '.edit-btn',function() {
            $("#myStockModalUpdate").modal("show");
            var ligne = $(this).closest('tr');
            var article = ligne.data('article');
            sessionStorage.setItem("articleSelectedId", article.articleId);
            $("#familleArticleUpdate").val(article.articleFamily);
            $("#nomArticleUpdate").val(article.articleName);
            $("#detailArticleUpdate").val(article.articleDetail);
            $("#uniteArticleUpdate").val(article.articleUnit);
            $("#PVDetArticleUpdate").val(article.articlePVDet);
            $("#PVGrosArticleUpdate").val(article.articlePvGros);
            $("#PVRevArticleUpdate").val(article.articlePvRev);
            $("#PAArticleUpdate").val(article.articlePa);
            $("#QuantityUpdate").val(article.articleQuantity);
        });
        
        //Modifier article
        $("#updateArticle").on('click', function (){
            let famille = $("#familleArticleUpdate").val();
            let nom = $("#nomArticleUpdate").val();
            let detail = $("#detailArticleUpdate").val();
            let unite = $("#uniteArticleUpdate").val();
            let pvDet = $("#PVDetArticleUpdate").val();
            let pvGros = $("#PVGrosArticleUpdate").val();
            let pvRev = $("#PVRevArticleUpdate").val();
            let pa = $("#PAArticleUpdate").val();
            let quantity = $("#QuantityUpdate").val();
            let articleId = sessionStorage.getItem("articleSelectedId");
            var newArticle = {
                articleId: articleId,
                articleFamily:famille,
                articleName: nom,
                articleDetail: detail,
                articleUnit: unite,
                articlePVDet: pvDet,
                articlePvGros: pvGros,
                articlePvRev: pvRev,
                articlePa:pa,
                articleQuantity: quantity
            };
            
            fetch("/api/updateArticle", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(newArticle)
            })
            .then(response => response.json())
            .then(data => {
                alert('Modification enregistré.');
                $("#myStockModalUpdate").modal("hide");

                // Créer le tableau HTML
                const tableauResultat = $('#stockTable tbody');
                $('#stockTable tbody tr').remove();
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
                    ligne.append( article.articleQuantity===0?'<td style="color: red;">' + article.articleQuantity + '</td>': '<td>' + article.articleQuantity + '</td>');
                    ligne.append('<div class="btn-group" role="group" aria-label="Actions"><button class="btn btn-primary btn-sm edit-btn ml-2"><i class="fas fa-edit"></i></button><button class="btn btn-danger btn-sm delete-btn ml-2"><i class="fas fa-trash"></i></button></div>');
                    // ligne.append('</tr>')
                    tableauResultat.append(ligne);
                });
            })
            .catch(error => {
                console.error("Erreur :", error);
            });
        })
        
          // Fermer le formulaire d'ajout Article
          $("#closeStockModal").click(function() {
            $("#myStockModal").modal("hide");
          });
        
        //Suppression article
        $('#stockTable').on('click', '.delete-btn', function(event) {
            var ligne = $(this).closest('tr');
            var article = ligne.data('article');
            var newArticle = {
                articleId: article.articleId
            };
            if (confirm("Êtes-vous sûr de supprimer cet article ?")) {
                fetch("/api/deleteArticle", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json"
                    },
                    body: JSON.stringify(newArticle)
                })
                .then(response => response.json())
                .then(data => {
                    alert('Modification enregistré.');
                    $("#myStockModalUpdate").modal("hide");
    
                    // Créer le tableau HTML
                    const tableauResultat = $('#stockTable tbody');
                    $('#stockTable tbody tr').remove();
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
                        ligne.append( article.articleQuantity===0?'<td style="color: red;">' + article.articleQuantity + '</td>': '<td>' + article.articleQuantity + '</td>');
                        ligne.append('<div class="btn-group" role="group" aria-label="Actions"><button class="btn btn-primary btn-sm edit-btn ml-2"><i class="fas fa-edit"></i></button><button class="btn btn-danger btn-sm delete-btn ml-2"><i class="fas fa-trash"></i></button></div>');
                        // ligne.append('</tr>')
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

        //Afficher formulaire d'ajout article
        $("#openStockModal").click(function() {
            $("#myStockModal").modal("show");
        });

        //Enregistrement article
        $("#addArticle").click(function() {
            let famille = $("#familleArticleForm").val();
            let nom = $("#nomArticleForm").val();
            let detail = $("#detailArticleForm").val();
            let unite = $("#uniteArticleForm").val();
            let pvDet = $("#PVDetArticleForm").val();
            let pvGros = $("#PVGrosArticleForm").val();
            let pvRev = $("#PVRevArticleForm").val();
            let pa = $("#PAArticleForm").val();
            let quantity = $("#QuantityForm").val();
            var newArticle = {
                articleFamily:famille,
                articleName: nom,
                articleDetail: detail,
                articleUnit: unite,
                articlePVDet: pvDet,
                articlePvGros: pvGros,
                articlePvRev: pvRev,
                articlePa:pa,
                articleQuantity: quantity
            };

             fetch("/api/addArticle", {
                 method: "POST",
                 headers: {
                     "Content-Type": "application/json"
                 },
                 body: JSON.stringify(newArticle)
             })
             .then(response => response.json())
             .then(data => {
                 alert('Article ajouté.');
                 $("#myStockModal").modal("hide");
 
                // Créer le tableau HTML
                const tableauResultat = $('#stockTable tbody');
                $('#stockTable tbody tr').remove();
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
                    ligne.append( article.articleQuantity===0?'<td style="color: red;">' + article.articleQuantity + '</td>': '<td>' + article.articleQuantity + '</td>');
                    ligne.append('<div class="btn-group" role="group" aria-label="Actions"><button class="btn btn-primary btn-sm edit-btn ml-2"><i class="fas fa-edit"></i></i></button><button class="btn btn-danger btn-sm delete-btn ml-2"><i class="fas fa-trash"></i></button></div>');
                    // ligne.append('</tr>')
                    tableauResultat.append(ligne);
                });
             })
             .catch(error => {
                 console.error("Erreur :", error);
             });
        });
        //Recherche article
        $("#searchArticle").on('input', function() {
            // console.log($('#searchArticle').val())
            let motCle = $('#searchArticle').val();

            var newArticle = {
                motCle:motCle
            };
            fetch("/api/searchArticle", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(newArticle)
            })
            .then(response => response.json())
            .then(data => {
                $("#myStockModal").modal("hide");

               // Créer le tableau HTML
               const tableauResultat = $('#stockTable tbody');
               $('#stockTable tbody tr').remove();
               data.forEach(article => {console.log(article)
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
                   ligne.append( article.articleQuantity===0?'<td style="color: red;">' + article.articleQuantity + '</td>': '<td>' + article.articleQuantity + '</td>');
                   ligne.append('<div class="btn-group" role="group" aria-label="Actions"><button class="btn btn-primary btn-sm edit-btn ml-2"><i class="fas fa-edit"></i></i></button><button class="btn btn-danger btn-sm delete-btn ml-2"><i class="fas fa-trash"></i></button></div>');
                   // ligne.append('</tr>')
                   tableauResultat.append(ligne);
               });
            })
            .catch(error => {
                console.error("Erreur :", error);
            });
        });

        $("#btnRechercheArticle").click( function() {
            // console.log($('#searchArticle').val())
            let motCle = $('#searchArticle').val();

            var newArticle = {
                motCle:motCle
            };
            fetch("/api/searchArticle", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(newArticle)
            })
            .then(response => response.json())
            .then(data => {
                $("#myStockModal").modal("hide");

               // Créer le tableau HTML
               const tableauResultat = $('#stockTable tbody');
               $('#stockTable tbody tr').remove();
               data.forEach(article => {console.log(article)
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
                   ligne.append( article.articleQuantity===0?'<td style="color: red;">' + article.articleQuantity + '</td>': '<td>' + article.articleQuantity + '</td>');
                   ligne.append('<div class="btn-group" role="group" aria-label="Actions"><button class="btn btn-primary btn-sm edit-btn ml-2"><i class="fas fa-edit"></i></i></button><button class="btn btn-danger btn-sm delete-btn ml-2"><i class="fas fa-trash"></i></button></div>');
                   // ligne.append('</tr>')
                   tableauResultat.append(ligne);
               });
            })
            .catch(error => {
                console.error("Erreur :", error);
            });
        });
    });
    
})(jQuery);

