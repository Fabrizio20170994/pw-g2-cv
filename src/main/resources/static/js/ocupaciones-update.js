var hayIntervaloC=0;
var hayIntervaloU=0;

function verificacionC(){
  var nombre= document.getElementById("nombre_ocupC").value;
  
  var descripcion = document.getElementById("descripcionOcupC").value;
  
  var anioI = document.getElementById("anioIOcupC").value;
  
  var anioF = document.getElementById("anioFOcupC").value;
  
  var errorA=1;
  var errorB=1;
  var errorC=1;
  var errorD=1;

  if(nombre!=""){
    if(nombre.length > 250){
      document.getElementById("excesoNombreC").style.display="block";
      errorA=1;
    }else{
      document.getElementById("excesoNombreC").style.display="none";
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
        document.getElementById("excesoDescripcionC").style.display="block";
        errorB=1;
      }else{
        document.getElementById("excesoDescripcionC").style.display="none";
        errorB=0;
      }
    }else{
      errorB=0;
      document.getElementById("excesoDescripcionC").style.display="none";
    }
  }
  
  if(anioI!="" && anioF!=""){
    if(( anioI <= 2020) && (anioF <= 2020)){
      document.getElementById("fallaAniosC").style.display="none";
      errorC=0;
    }else{
      document.getElementById("fallaAniosC").style.display="block";
      errorC=1;
    }
    if(anioF>=anioI){
      errorD=0;
      document.getElementById("anioImayorC").style.display="none"
    }else{
      errorD=1;
      document.getElementById("anioImayorC").style.display="block"
    }
  }
  console.log(errorA);
  console.log(errorB);
  console.log(errorC);
  console.log(errorD);
  if(errorA+errorB+errorC+errorD==0){
    document.getElementById("submitCrearC").disabled=false;
  }else{
    document.getElementById("submitCrearC").disabled=true;
  }
}

function verificacionU(){
  var nombre= document.getElementById("nombre_ocupU").value;
  
  var descripcion = document.getElementById("descripcionOcupU").value;
  
  var anioI = document.getElementById("anioIOcupU").value;
  
  var anioF = document.getElementById("anioFOcupU").value;
  
  var errorA=1;
  var errorB=1;
  var errorC=1;
  var errorD=1;

  if(nombre!=""){
    if(nombre.length > 250){
      document.getElementById("excesoNombreU").style.display="block";
      errorA=1;
    }else{
      document.getElementById("excesoNombreU").style.display="none";
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
        document.getElementById("excesoDescripcionU").style.display="block";
        errorB=1;
      }else{
        document.getElementById("excesoDescripcionU").style.display="none";
        errorB=0;
      }
    }else{
      errorB=0;
      document.getElementById("excesoDescripcionU").style.display="none";
    }
  }
  
  if(anioI!="" && anioF!=""){
    if(( anioI <= 2020) && (anioF <= 2020)){
      document.getElementById("fallaAniosU").style.display="none";
      errorC=0;
    }else{
      document.getElementById("fallaAniosU").style.display="block";
      errorC=1;
    }
    if(anioF>=anioI){
      errorD=0;
      document.getElementById("anioImayorU").style.display="none"
    }else{
      errorD=1;
      document.getElementById("anioImayorU").style.display="block"
    }
  }
  console.log(errorA);
  console.log(errorB);
  console.log(errorC);
  console.log(errorD);
  if(errorA+errorB+errorC+errorD==0){
    document.getElementById("submitCrearU").disabled=false;
  }else{
    document.getElementById("submitCrearU").disabled=true;
  }
}

var main=function(){
  if(hayIntervaloC==0){
    var intervalo = window.setInterval(verificacionC,100);
    hayIntervaloC=1;
    console.log("se carga verificacion crear");
  }

  if(hayIntervaloU==0){
    var intervalo = window.setInterval(verificacionU,100);
    hayIntervaloU=1;
    console.log("se carga verificacion update");
  }
}

window.onload=main;