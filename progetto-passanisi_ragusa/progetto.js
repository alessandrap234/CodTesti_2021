$(document).ready(function () {

    //Funzioni per la gestione del pop-up "Termini e Definizioni"
    $("#terms_i").click(function(){
        $("#popup").css("display", "block");
    });

    $("#chiudi").click(function(){
        $("#popup").css("display", "none");
    });

    //Funzioni per la gestione della traduzione del testo
    $("#traduci1").click(function(){
        $("#it_text1").css("display", "block");
        $("#fr_text1").css("display", "none");
        $("#traduci1_fr").css("display", "block");
        $("#traduci1").css("display", "none");
    });

    $("#traduci1_fr").click(function(){
        $("#it_text1").css("display", "none");
        $("#fr_text1").css("display", "block");
        $("#traduci1_fr").css("display", "none");
        $("#traduci1").css("display", "block");
    });

    $("#traduci2").click(function(){
        $("#it_text2").css("display", "block");
        $("#fr_text2").css("display", "none");
        $("#traduci2_fr").css("display", "block");
        $("#traduci2").css("display", "none");
    });

    $("#traduci2_fr").click(function(){
        $("#it_text2").css("display", "none");
        $("#fr_text2").css("display", "block");
        $("#traduci2_fr").css("display", "none");
        $("#traduci2").css("display", "block");
    });

    //Funzione per la gestione delle opzioni di visualizzazione
    $("select").change(function(){
        $(".gap").css("display", "none");
        $(".del").css("display", "none");
        $(".expan").css("display", "none");
        $(".choice").css("background-color", "rgba(237, 252, 255, 0)");
        $(".persName").css("background-color", "rgba(237, 252, 255, 0)");
        $(".term").css("background-color", "rgba(237, 252, 255, 0)");
        $(".date").css("background-color", "rgba(237, 252, 255, 0)");
        var voce = ($('#visualizza :selected').val());
        if (voce == "gap") {
            $(".gap").css("display", "inline");
        }
        else if (voce == "del") {
            $(".del").css("display", "inline");
            $(".del").css("background-color", "rgba(255, 135, 102, 0.8)");
        }   
        else if (voce == "abbr") {
            $(".expan").css("display", "inline");
            $(".choice").css("background-color", "rgba(255, 135, 102, 0.8)");
        }
        else if (voce == "nomi"){
            $(".persName").css("background-color", "rgba(255, 135, 102, 0.8)");
        }
        else if (voce == "term"){
            $(".term").css("background-color", "rgba(255, 135, 102, 0.8)");
        }
        else if (voce == "date"){
            $(".date").css("background-color", "rgba(255, 135, 102, 0.8)");
        }
    });
});