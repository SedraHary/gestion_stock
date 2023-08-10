
(function ($) {
    "use strict";
    $(window).on('load', function() {
        $('#loading-overlay').fadeOut('slow');
    });

    /*==================================================================
    [ Focus input ]*/
    $('.input100').each(function(){
        $(this).on('blur', function(){
            if($(this).val().trim() != "") {
                $(this).addClass('has-val');
            }
            else {
                $(this).removeClass('has-val');
            }
        })    
    })
  
  
    /*==================================================================
    [ Validate ]*/
    var input = $('.validate-input .input100');

    $('.validate-form').on('submit',function(event){
        $('#loading-overlay').addClass('show');
        var check = true;

        for(var i=0; i<input.length; i++) {
            if(validate(input[i]) == false){
                showValidate(input[i]);
                check=false;
            }
        }
        if(check==true){
            event.preventDefault();
            const email = $('#email').val();
            const password = $('#password').val();
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
                if (!response.ok) {
                    throw new Error("Network response was not ok");
                }
                $('#loading-overlay').removeClass('show');
                return response.json();
            })
            .then((data) => {
                if (data.length>0) {
                    
                    sessionStorage.setItem('userName',data[0].userName);
                    sessionStorage.setItem('userId',data[0].userId);
                    sessionStorage.setItem('userType',data[0].userType);
                    sessionStorage.setItem('userAgentCode',data[0].userAgentCode);
                    window.location.href = 'dashboard';
                } else {
                    $("#errorMessageLogin").show();
                }
            })
            .catch((error) => {
                let message = "Une erreur s'est produite lors de la connexion.";
                alert(message);
                console.error("Error:", error);
                $('#loading-overlay').removeClass('show');
            });
        }
        return check;
    });


    $('.validate-form .input100').each(function(){
        $(this).focus(function(){
           hideValidate(this);
        });
    });

    function validate (input) {
        // if($(input).attr('type') == 'email' || $(input).attr('name') == 'email') {
        //     if($(input).val().trim().match(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/) == null) {
        //         return false;
        //     }
        // }
        // else {
        //     if($(input).val().trim() == ''){
        //         return false;
        //     }
        // }
        if($(input).val().trim() == ''){
            return false;
        }
    }

    function showValidate(input) {
        var thisAlert = $(input).parent();

        $(thisAlert).addClass('alert-validate');
    }

    function hideValidate(input) {
        var thisAlert = $(input).parent();

        $(thisAlert).removeClass('alert-validate');
    }
    
    /*==================================================================
    [ Show pass ]*/
    var showPass = 0;
    $('.btn-show-pass').on('click', function(){
        if(showPass == 0) {
            $(this).next('input').attr('type','text');
            $(this).find('i').removeClass('zmdi-eye');
            $(this).find('i').addClass('zmdi-eye-off');
            showPass = 1;
        }
        else {
            $(this).next('input').attr('type','password');
            $(this).find('i').addClass('zmdi-eye');
            $(this).find('i').removeClass('zmdi-eye-off');
            showPass = 0;
        }
        
    });


})(jQuery);