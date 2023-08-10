// frontend/js/login.js
$(document).ready(function () {
    // Écouteur d'événement pour le formulaire de login
    $('#loginButton').on( "click", function(event) {
        
        event.preventDefault();
        const email = $('#email').val();
        const password = $('#password').val();
        console.log(email,password);
        fetch("/api/login/user", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify({
                username: email,
                password: password,
            }),
        })
        .then((response) => {
            console.log(11,response);
            if (!response.ok) {
                throw new Error("Network response was not ok");
            }
            return response.json();
        })
        .then((data) => {
            console.log(data)
            if (data.length>0) {
                window.location.href = 'dashboard';
            } else {
                alert("Votre mot de passe ou identifiant n'est pas correcte.");
            }
        })
        .catch((error) => {
            let message = "Une erreur s'est produite lors de la connexion.";
            alert(message);
            console.error("Error:", error);
        });
    });
        // Envoyer les informations de connexion au backend
        // $.ajax({
        //     url: '/api/login/user', // Remplacez par l'URL de votre API de login backend
        //     method: 'POST',
        //     data: { email, password },
        //     success: function (response) {console.log("loginOK")
        //         // Gérer la réponse du backend (par exemple, redirection vers la page principale)
        //         window.location.href = '../dashboard'; // Remplacez par l'URL de votre page principale après la connexion
        //     },
        //     error: function (error) {
        //         // Gérer les erreurs (par exemple, afficher un message d'erreur à l'utilisateur)
        //         console.error(error);
        //         alert('Échec de la connexion. Veuillez vérifier vos informations de connexion.');
        //     }
        // });
    // });
});
