var hayIntervalo=0;

function redireccionar(entidadId){
    location.href="/actualizar-crear-experiencia/" + entidadId;
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

function main(){
    if(hayIntervalo==0){
        var intervalo = window.setInterval(verifacacionCrearExperiencia,100);
        hayIntervalo=1;
      }
}

window.onload=main;
