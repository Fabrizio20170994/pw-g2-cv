var hayIntervalo=0;
var hayIntercaloU=0;

function redireccionar(entidadId){
    location.href="/actualizar-crear-experiencia/" + entidadId;
}

function redireccionarUpdate(entidadId){
    var experienciaID = document.getElementById("data").value;
    location.href="/actualizar-actualizar-experiencia/" + entidadId +"/"+ experienciaID;
}

function verifacacionCrearExperiencia(){
    error=1;
    var nombre=document.getElementById("logro").value;
    if(nombre != null){
        if(nombre.length>59){
            var espacios=0;
            for(var i = 0; i < nombre.length; i++){
                if(nombre.charAt(i)==" "){
                  espacios++;
                }
            }
            if(espacios>30){
                document.getElementById("fallaLogro").style.display="block";
                error=1;
            }else{
                document.getElementById("fallaLogro").style.display="none";
                error=0;
            }
        }else{
            document.getElementById("fallaLogro").style.display="none";
            error=0;
        }
    }
    if(error==0){
        document.getElementById("submitExp").disabled=false;
    }else{
        document.getElementById("submitExp").disabled=true;
    }
}

function verifacacionUpdateExperiencia(){
    error=1;
    var nombre=document.getElementById("logroU").value;
    if(nombre != null){
        if(nombre.length>59){
            var espacios=0;
            for(var i = 0; i < nombre.length; i++){
                if(nombre.charAt(i)==" "){
                  espacios++;
                }
            }
            if(espacios>30){
                document.getElementById("fallaLogroU").style.display="block";
                error=1;
            }else{
                document.getElementById("fallaLogroU").style.display="none";
                error=0;
            }
        }else{
            document.getElementById("fallaLogroU").style.display="none";
            error=0;
        }
    }
    if(error==0){
        document.getElementById("submitExpU").disabled=false;
    }else{
        document.getElementById("submitExpU").disabled=true;
    }
}

function main(){
    if(hayIntervalo==0){
        var intervalo = window.setInterval(verifacacionCrearExperiencia,100);
        hayIntervalo=1;
    }
    if(hayIntercaloU==1){
        var intervaloU = window.setInterval(verifacacionUpdateExperiencia,100);
        hayIntercaloU=1;
    }
}

window.onload=main;
