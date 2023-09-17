(function ($) {
    "use strict";
    // $('#loading-overlay').addClass('show');
    // $(window).on('load', function() {
    $(document).ready(function() {
        //Alert si il y a un stock épuisé
        // Sélectionnez l'élément de l'alerte clignotante
        const $alertStockEmpty = $(".stock-empty");
        if(sessionStorage.getItem("haveZero")==="true"){
            setInterval(function () {
                $alertStockEmpty.removeAttr("hidden");
                $alertStockEmpty.fadeIn(1000).fadeOut(1000);
            }, 1000);
        }else{
            $alertStockEmpty.hide();
        }
        
        let userType=sessionStorage.getItem("userType");
        let userAgentCode=sessionStorage.getItem("userAgentCode");
        let userName=sessionStorage.getItem("userName");
        $("#userTypeTitle").text(userType==="admin"? "Admin": "Agent "+userAgentCode);
        $("#titleUserConnected").text(userName);
        $("#titleUserConnected2").text(userName);

        if (userType!=="admin") {
            // Masquer les éléments de menu qui ne doivent pas être visibles pour les utilisateurs non administrateurs
            $("#bordMenu").hide();
            $("#stockMenu").hide();
            $("#userMenu").hide();
            $("#clientFournisseurMenu").hide();

            $('#bordContent').attr("hidden",true);
            $('#stockContent').attr("hidden",true);
            $('#userContent').attr("hidden",true);
            $('#clientFournisseurContent').attr("hidden",true);
            $('#factureContent').attr("hidden",false);
            $('#facturesTable').attr("hidden",true);
        }else{
            $('#facturesTable').attr("hidden",false);
        }

        fetch("/api/users", {
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
            const tableauResultat = $('#usersTable tbody');
            data.forEach(user => {
                const ligne = $('<tr>');
                ligne.data('user', user); // Stocker l'identifiant dans l'attribut data-id
                ligne.append('<td>' + user.userAgentCode + '</td>');
                ligne.append('<td>' + user.userName + '</td>');
                ligne.append('<td>' + user.userType + '</td>');
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

        //Afficher formulaire d'ajout utilisateur
        $("#openUserModal").click(function() {
            $("#myUserModal").modal("show");
        });

        //Enregistrement utilisateur
        $("#saveUser").click(function() {
           let code = $("#codeAgentAdd").val();
           let nom = $("#nomUtilisateurAdd").val();
           let typeCompte = $("#typeCompteAdd").val();
           let mdp = $("#passwordUtilisateurAdd").val();
           var dataToSend = {
                userAgentCode: code,
                userName: nom,
                userType: typeCompte,
                password: mdp
            };

            fetch("/api/addUser", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(dataToSend)
            })
            .then(response => response.json())
            .then(data => {
                alert('Utilisateur créé.');
                $("#myUserModal").modal("hide");

                // Créer le tableau HTML
                const tableauResultat = $('#usersTable tbody');
                $('#usersTable tbody tr').remove();
                data.forEach(user => {
                    const ligne = $('<tr>');
                    ligne.data('user', user); // Stocker l'identifiant dans l'attribut data-id
                    ligne.append('<td>' + user.userAgentCode + '</td>');
                    ligne.append('<td>' + user.userName + '</td>');
                    ligne.append('<td>' + user.userType + '</td>');
                    ligne.append('<div class="btn-group" role="group" aria-label="Actions"><button class="btn btn-primary btn-sm edit-btn ml-2"><i class="fas fa-edit"></i></button><button class="btn btn-danger btn-sm delete-btn ml-2"><i class="fas fa-trash"></i></button></div>');
                    // ligne.append('</tr>')
                    tableauResultat.append(ligne);
                });
                // console.log("Réponse du serveur :", data);
            })
            .catch(error => {
                console.error("Erreur :", error);
            });
        });
        //Afficher formulaire de modification utilisateur
        $("#usersTable").on('click', '.edit-btn',function() {
            $("#myUserModalUpdate").modal("show");
            var ligne = $(this).closest('tr');
            var user = ligne.data('user');
            sessionStorage.setItem("userSelectedId", user.userId);
            $("#codeAgentUpdate").val(user.userAgentCode);
            $("#nomUtilisateurUpdate").val(user.userName);
            $("#typeCompteUpdate").val(user.userType);
            $("#passwordUtilisateurUpdate").val(user.userPassword);       
        });
        //Modifier l'utilisateur
        $("#updateUser").on('click', function (){
            let code = $("#codeAgentUpdate").val();
            let nom = $("#nomUtilisateurUpdate").val();
            let typeCompte = $("#typeCompteUpdate").val();
            let mdp = $("#passwordUtilisateurUpdate").val();
            let userId = sessionStorage.getItem("userSelectedId");
            var newUser = {
                userId: userId,
                userAgentCode: code,
                userName: nom,
                userType: typeCompte,
                password: mdp
            };
            
            fetch("/api/updateUser", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(newUser)
            })
            .then(response => response.json())
            .then(data => {
                alert('Modification enregistré.');
                $("#myUserModalUpdate").modal("hide");

                // Créer le tableau HTML
                const tableauResultat = $('#usersTable tbody');
                $('#usersTable tbody tr').remove();
                data.forEach(user => {
                    const ligne = $('<tr>');
                    ligne.data('user', user); // Stocker l'identifiant dans l'attribut data-id
                    ligne.append('<td>' + user.userAgentCode + '</td>');
                    ligne.append('<td>' + user.userName + '</td>');
                    ligne.append('<td>' + user.userType + '</td>');
                    ligne.append('<div class="btn-group" role="group" aria-label="Actions"><button class="btn btn-primary btn-sm edit-btn ml-2"><i class="fas fa-edit"></i></button><button class="btn btn-danger btn-sm delete-btn ml-2"><i class="fas fa-trash"></i></button></div>');
                    // ligne.append('</tr>')
                    tableauResultat.append(ligne);
                });
            })
            .catch(error => {
                console.error("Erreur :", error);
            });
        })
    
          // Fermer le formulaire d'ajout utilisateur
          $("#closeUserModal").click(function() {
            $("#myUserModal").modal("hide");
          });
        //Suppression utilisateur
        $('#usersTable').on('click', '.delete-btn', function(event) {
            var ligne = $(this).closest('tr');
            var user = ligne.data('user');
            var connectedUser= sessionStorage.getItem('userId');
            if(connectedUser===user.userId.toString()){
                alert("Vous ne pouvez pas supprimer votre propre compte.");
            }else{
                var newUser = {
                    userId: user.userId
                };
                if (confirm("Êtes-vous sûr de supprimer cet utilisateur ?")) {
                    // Code à exécuter si l'utilisateur clique sur "OK"
                    fetch("/api/deleteUser", {
                        method: "POST",
                        headers: {
                            "Content-Type": "application/json"
                        },
                        body: JSON.stringify(newUser)
                    })
                    .then(response => response.json())
                    .then(data => {
                        alert('Modification enregistré.');
                        $("#myUserModalUpdate").modal("hide");
        
                        // Créer le tableau HTML
                        const tableauResultat = $('#usersTable tbody');
                        $('#usersTable tbody tr').remove();
                        data.forEach(user => {
                            const ligne = $('<tr>');
                            ligne.data('user', user); // Stocker l'identifiant dans l'attribut data-id
                            ligne.append('<td>' + user.userAgentCode + '</td>');
                            ligne.append('<td>' + user.userName + '</td>');
                            ligne.append('<td>' + user.userType + '</td>');
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
            }
        });

        
    });
    $('#apercuFacture').on('click', function(){
        $('#invoice-modal').css('display', 'block');
    })

    const printInvoiceButton = $('#print-invoice');
    printInvoiceButton.on('click', function() {

        // Récupérer le contenu à convertir en PDF
        const contentToExport = $("#invoice-preview")[0];

        // Créer une instance de jsPDF
        const pdf = new jsPDF();

        // Générer le PDF à partir du contenu HTML
        pdf.fromHTML(contentToExport, 15, 15, {
            width: 170
        });

        // Enregistrez le fichier PDF
        pdf.save("nom_du_fichier.pdf");
        const generatePDFButton = $('#generate-pdf');
        // generatePDFButton.on('click', function() {
            // Récupérer la partie spécifique que vous souhaitez convertir en PDF
            // const contentToConvert = document.getElementById('invoice-preview');

            // // Utiliser html2pdf.js pour générer un PDF à partir du contenu
            // const opt = {
            // margin: 10,
            // filename: 'export.pdf',
            // image: { type: 'jpeg', quality: 0.98 },
            // html2canvas: { scale: 2 },
            // jsPDF: { unit: 'mm', format: 'a4', orientation: 'portrait' }
            // };

            // html2pdf().from(contentToConvert).set(opt).outputPdf().then(function(pdf) {
            // // Sauvegarder le PDF généré ou afficher une fenêtre contextuelle pour télécharger le fichier
            // // Vous pouvez ajouter ici le code pour afficher le PDF, le télécharger ou l'enregistrer sur le serveur.
            // });
        // });
        // // Imprimer la facture
        // window.print();
    });
    // const printInvoiceButton = $('#preview-invoice');
    // printInvoiceButton.on('click', function() {
    //     // Imprimer la facture
    //     window.print();
    // });
    $(document).on('click', '#deconnexionLink', function(event) {
        if (confirm("Êtes-vous sûr de vouloir se déconnecter ?")) {
            window.location.href = '/';
            // Supprime les données du sessionStorage
            sessionStorage.clear();
        }
        
    });
    // Spinner
    var spinner = function () {
        setTimeout(function () {
            if ($('#spinner').length > 0) {
                $('#spinner').removeClass('show');
            }
        }, 1);
    };
    spinner();
    
    
    // Back to top button
    $(window).scroll(function () {
        if ($(this).scrollTop() > 300) {
            $('.back-to-top').fadeIn('slow');
        } else {
            $('.back-to-top').fadeOut('slow');
        }
    });
    $('.back-to-top').click(function () {
        $('html, body').animate({scrollTop: 0}, 1500, 'easeInOutExpo');
        return false;
    });


    // Sidebar Toggler
    $('.sidebar-toggler').click(function () {
        $('.sidebar, .content').toggleClass("open");
        return false;
    });


    // Progress Bar
    $('.pg-bar').waypoint(function () {
        $('.progress .progress-bar').each(function () {
            $(this).css("width", $(this).attr("aria-valuenow") + '%');
        });
    }, {offset: '80%'});


    // Calender
    $('#calender').datetimepicker({
        inline: true,
        format: 'L'
    });


    // Testimonials carousel
    $(".testimonial-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 1000,
        items: 1,
        dots: true,
        loop: true,
        nav : false
    });
    
    $(document).on('click', '#bordMenu', function (){
        $('#bordContent').attr("hidden",false);
        $('#stockContent').attr("hidden",true);
        $('#userContent').attr("hidden",true);
        $('#clientFournisseurContent').attr("hidden",true);
        $('#factureContent').attr("hidden",true);

        //Selectionner le sidebar
        $('#userMenu').removeClass('active');
        $('#stockMenu').removeClass('active');
        $('#bordMenu').addClass('active');
        $('#clientFournisseurMenu').removeClass('active');
        $('#factureMenu').removeClass('active');
    });
    $(document).on('click', '#stockMenu',function (){
        $('#stockContent').attr("hidden",false);
        $('#bordContent').attr("hidden",true);
        $('#userContent').attr("hidden",true);
        $('#clientFournisseurContent').attr("hidden",true);
        $('#factureContent').attr("hidden",true);

        //Selectionner le sidebar
        $('#userMenu').removeClass('active');
        $('#stockMenu').addClass('active');
        $('#bordMenu').removeClass('active');
        $('#clientFournisseurMenu').removeClass('active');
        $('#factureMenu').removeClass('active');
    });
    $(document).on('click', '#userMenu', function (){
        $('#userContent').attr("hidden",false);
        $('#stockContent').attr("hidden",true);
        $('#bordContent').attr("hidden",true);
        $('#clientFournisseurContent').attr("hidden",true);
        $('#factureContent').attr("hidden",true);

        //Selectionner le sidebar
        $('#userMenu').addClass('active');
        $('#stockMenu').removeClass('active');
        $('#bordMenu').removeClass('active');
        $('#clientFournisseurMenu').removeClass('active');
        $('#factureMenu').removeClass('active');
    });
    $(document).on('click', '#clientFournisseurMenu',function (){
        $('#clientFournisseurContent').attr("hidden",false);
        $('#userContent').attr("hidden",true);
        $('#stockContent').attr("hidden",true);
        $('#bordContent').attr("hidden",true);
        $('#factureContent').attr("hidden",true);

        //Selectionner le sidebar
        $('#userMenu').removeClass('active');
        $('#stockMenu').removeClass('active');
        $('#bordMenu').removeClass('active');
        $('#clientFournisseurMenu').addClass('active');
        $('#factureMenu').removeClass('active');
    });
    $(document).on('click', '#factureMenu',function (){
        $('#factureContent').attr("hidden",false);
        $('#userContent').attr("hidden",true);
        $('#stockContent').attr("hidden",true);
        $('#bordContent').attr("hidden",true);
        $('#clientFournisseurContent').attr("hidden",true);

        //Selectionner le sidebar
        $('#userMenu').removeClass('active');
        $('#stockMenu').removeClass('active');
        $('#bordMenu').removeClass('active');
        $('#clientFournisseurMenu').removeClass('active');
        $('#factureMenu').addClass('active');
    });

    //Tableau de bord

    const dateActuelle = new Date();
    // Obtenez la date du mois (jour du mois)
    const jourDuMois = dateActuelle.getDate();
    // Obtenez le mois (numéro du mois) - Notez que les mois commencent à partir de 0 (janvier) à 11 (décembre), donc vous pouvez ajouter 1 pour obtenir le numéro du mois réel.
    const mois = dateActuelle.getMonth() + 1;
    // Obtenez l'année
    const annee = dateActuelle.getFullYear();
    //récupération date base de données: date.slice(0,10)
    $('#chiffreAffaire').text(`Chiffre d'affaire du mois`)
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
        const tableauResultat = $('#dashboardCATable tbody');
        $('#dashboardCATable tbody tr').remove();
        const tableauResultatAnnuelle = $('#dashboardAnnuelTable tbody');
        $('#dashboardAnnuelTable tbody tr').remove();
        const dataCa = data.filter(objet => parseInt(objet.bill_date.slice(0,4)) === annee && parseInt(objet.bill_date.slice(5,7)) === mois );
        //Somme les même date
        const resultat = [];
        // console.log(22,dataCa);
        dataCa.forEach(objet => {//console.log("objet", parseFloat(objet.bill_total_price)+parseFloat(objet.bill_total_price))
            const existant = resultat.find(item => item.bill_date === objet.bill_date);
            let paTotal = 0;
            objet.detail.forEach(detail=>{//console.log(13,detail)
                paTotal= paTotal+parseFloat(paTotal)+parseFloat(detail.articlepa)*parseFloat(detail.quantity);
            });
            
            if (existant) {
                existant.bill_total_price = parseFloat(existant.bill_total_price)+parseFloat(objet.bill_total_price);
                existant.bill_benefice = parseFloat(existant.bill_benefice)+parseFloat(objet.bill_total_price)-paTotal;
            } else {
                resultat.push({ bill_date: objet.bill_date, bill_total_price: parseFloat(objet.bill_total_price), bill_benefice : parseFloat(objet.bill_total_price)-paTotal });
            }
            // console.log(22,parseFloat(objet.bill_total_price));
        // console.log(111,parseFloat(objet.bill_total_price),paTotal)
        });
        
        // console.log(112,resultat)
        resultat.forEach(facture => {
            const ligne = $('<tr>');
            ligne.data('facture', facture); // Stocker l'identifiant dans l'attribut data-id
            ligne.append('<td>' + facture.bill_date.slice(0,10) + '</td>');
            ligne.append('<td>' + facture.bill_total_price + '</td>');
            ligne.append('<td>' + facture.bill_benefice + '</td>');
            // ligne.append('</tr>')
            tableauResultat.append(ligne);
            const ligne2 = $('<tr>');
            ligne2.data('facture', facture); // Stocker l'identifiant dans l'attribut data-id
            ligne2.append('<td>' + facture.bill_date.slice(0,4) + '</td>');
            ligne2.append('<td>' + facture.bill_total_price + '</td>');
            ligne2.append('<td>' + facture.bill_benefice + '</td>');
            tableauResultatAnnuelle.append(ligne2);
        });
    })
    
})(jQuery);

