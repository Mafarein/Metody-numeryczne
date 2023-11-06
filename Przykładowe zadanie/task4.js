window.onload = function(){
    passCell = document.getElementById("err_password")
    passCell1 = document.getElementById("err_password2")
    nameField = document.getElementById("name");
    nameField.oninput = validateName;
    phoneField = document.getElementById("phone");
    phoneField.oninput = validatephone;
    passwordField = document.getElementById("password");
    passwordField.oninput = validatePassword;
    childNumber = passCell.childNodes.length;
}


function validateName(){
    var imieChecker = /^\p{Lu}/u;
    if(imieChecker.test(nameField.value)){
        nameField.style.backgroundColor = "lightgreen";
    }else{
        nameField.style.backgroundColor = "red";
    }
    return poprawneImie;
}
function validatephone(){
    var nazwiskoChecker = /^\d{9}$/;
    if(nazwiskoChecker.test(phoneField.value)){
        phoneField.style.backgroundColor = "lightgreen";
    }else{
        phoneField.style.backgroundColor = "red";
    }
    return poprawneNazwisko;
}

function validatePassword(){
    hasloString = passwordField.value;
    jestCyfra = /[0-9]/.test(hasloString);
    poprawnaDlugosc = hasloString.length >= 8;

    bledy = passCell.getElementsByTagName('span');
    while(passCell.childNodes.length > childNumber){
        passCell.removeChild(bledy[bledy.length-1]);
    }
    function dodajSpan(tekst){
        let span = document.createElement('span');
        let text = document.createTextNode(tekst);
        span.appendChild(text);
        passCell.appendChild(span);
    }
    if(!poprawnaDlugosc){
        dodajSpan('Too short, min 8 char. ');
    }

    if(!jestCyfra){
        dodajSpan('No digit. ');
    }

    poprawneHaslo = jestCyfra && poprawnaDlugosc;
    if(poprawneHaslo){
        passwordField.style.backgroundColor = "lightgreen";
    } else{
        passwordField.style.backgroundColor = "red";
    }
    return poprawneNazwisko;
}

