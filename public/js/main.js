(function ($) {
    "use strict";
    // $('#loading-overlay').addClass('show');
    // $(window).on('load', function() {
    $(document).ready(function() {
        let userType=sessionStorage.getItem("userType");
        let userAgentCode=sessionStorage.getItem("userAgentCode");
        let userName=sessionStorage.getItem("userName");
        $("#userTypeTitle").text(userType==="admin"? "Admin": "Agent "+userAgentCode);
        $("#titleUserConnected").text(userName);
        $("#titleUserConnected2").text(userName);
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
            const tableauResultat = $('#usersTable');
            data.forEach(user => {
                const ligne = $('<tr>');
                ligne.append('<td>' + user.userAgentCode + '</td>');
                ligne.append('<td>' + user.userName + '</td>');
                ligne.append('<td>' + user.userType + '</td>');
                // ligne.append('</tr>')
                tableauResultat.append(ligne);
            });
            // console.log(data)
        })
        .catch((error) => {
            message.textContent = "Une erreur s'est produite lors de la connexion.";
            console.error("Error:", error);
            $('#loading-overlay').removeClass('show');
        });

        //Création fature
        const addItemButton = $('#add-item');
        const itemList = $('#item-list');
        const invoiceTotalElement = $('#invoice-total');

        addItemButton.on('click', function() {
            const newRow = $('<tr>\
            <td><input type="text" class="description" placeholder="Description"></td>\
            <td><input type="number" class="quantity" placeholder="Quantité"></td>\
            <td><input type="number" class="price" placeholder="Prix"></td>\
            <td><span class="total">0.00</span></td>\
            </tr>');
            itemList.append(newRow);
        });

        itemList.on('input', '.quantity, .price', function() {
            updateTotal();
        });

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

        const generateInvoiceButton = $('#generate-invoice');
        generateInvoiceButton.on('click', function() {
            const client = $('#client').val();
            const date = $('#date').val();
            const total = parseFloat(invoiceTotalElement.text()).toFixed(2);
        });
    });
    $('#apercuFacture').on('click', function(){
        $('#invoice-modal').css('display', 'block');
    })
    const closePreviewButton = $('.close');
    closePreviewButton.on('click', function() {
        // Fermer la fenêtre modale de prévisualisation de la facture
        $('#invoice-modal').css('display', 'none');
    });

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
    
})(jQuery);
