var hayIntervalo=0;

function verificacion(){
  var nombre= document.getElementById("nombre_ocup").value;
  
  var descripcion = document.getElementById("descripcionOcup").value;
  
  var anioI = document.getElementById("anioIOcup").value;
  
  var anioF = document.getElementById("anioFOcup").value;
  
  var errorA=1;
  var errorB=1;
  var errorC=1;
  var errorD=1;

  if(nombre!=""){
    if(nombre.length > 250){
      document.getElementById("excesoNombre").style.display="block";
      errorA=1;
    }else{
      document.getElementById("excesoNombre").style.display="none";
      errorA=0;
    }
  }
  if(descripcion!=""){
    if(descripcion.length>59){
      var espacios = 0;
      for(var i = 0; i < descripcion.length; i++){
        if(descripcion.charAt(i)==" "){
          espacios++;
        }
      }
      console.log(espacios);
      if(espacios > 60){
        document.getElementById("excesoDescripcion").style.display="block";
        errorB=1;
      }else{
        document.getElementById("excesoDescripcion").style.display="none";
        errorB=0;
      }
    }else{
      errorB=0;
      document.getElementById("excesoDescripcion").style.display="none";
    }
  }
  
  if(anioI!="" && anioF!=""){
    if(( anioI <= 2020) && (anioF <= 2020)){
      document.getElementById("fallaAnios").style.display="none";
      errorC=0;
    }else{
      document.getElementById("fallaAnios").style.display="block";
      errorC=1;
    }
    if(anioF>=anioI){
      errorD=0;
      document.getElementById("anioImayor").style.display="none"
    }else{
      errorD=1;
      document.getElementById("anioImayor").style.display="block"
    }
  }
  console.log(errorA);
  console.log(errorB);
  console.log(errorC);
  console.log(errorD);
  if(errorA+errorB+errorC+errorD==0){
    document.getElementById("submitCrear").disabled=false;
  }else{
    document.getElementById("submitCrear").disabled=true;
  }
}

var main=function(){
  if(hayIntervalo==0){
    var intervalo = window.setInterval(verificacion,100);
  }
}

