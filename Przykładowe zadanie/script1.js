window.onload = function(){
    passCell = document.getElementById("err_password")
    passCell1 = document.getElementById("err_password2")
    formularz = document.getElementById("myform")
    imiePole = document.getElementById("name");
    imiePole.oninput = validateImie;
    nazwiskoPole = document.getElementById("phone");
    nazwiskoPole.oninput = validateNazwisko;
    hasloPole = document.getElementById("password");
    hasloPole.oninput = validateHaslo;
    liczbaDzieci = passCell.childNodes.length;
}


function validateImie(){
    var imieChecker = /^\p{Lu}/u;
    if(imieChecker.test(imiePole.value)){
        imiePole.style.backgroundColor = "lightgreen";
    }else{
        imiePole.style.backgroundColor = "red";
    }
    return poprawneImie;
}
function validateNazwisko(){
    var nazwiskoChecker = /^\d{9}$/;
    if(nazwiskoChecker.test(nazwiskoPole.value)){
        nazwiskoPole.style.backgroundColor = "lightgreen";
    }else{
        nazwiskoPole.style.backgroundColor = "red";
    }
    return poprawneNazwisko;
}

function validateHaslo(){
    hasloString = hasloPole.value;
    jestCyfra = /[0-9]/.test(hasloString);
    poprawnaDlugosc = hasloString.length >= 8;

    bledy = passCell.getElementsByTagName('span');
    while(passCell.childNodes.length > liczbaDzieci){
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
        hasloPole.style.backgroundColor = "lightgreen";
    } else{
        hasloPole.style.backgroundColor = "red";
    }
    return poprawneNazwisko;
}