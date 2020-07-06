<%@ page contentType="text/html; charset=UTF-8" %>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/css/bootstrap-min.css" />
    <link rel="stylesheet" href="/css/entidades.css" />
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <title>Entidades</title>
  </head>
  <body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <a class="navbar-brand" href="#">Web</a>
      <button
        class="navbar-toggler"
        type="button"
        data-toggle="collapse"
        data-target="#navbarNavDropdown"
        aria-controls="navbarNavDropdown"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" href="/mis-datos"
              >Mis datos<span class="sr-only">(current)</span></a
            >
          </li>
          <li class="nav-item active">
            <a class="nav-link" href="/entidades">Entidades</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/ocupaciones">Ocupaciones</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/experiencias">Experiencia</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/formacion">Formación</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/cv">CV</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/usuarios">Usuarios</a>
            <!--solo se muestra si es admin-->
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/autenticacion"
              >Iniciar sesión / Mi cuenta</a
            >
            <!--si ha iniciado sesion se muestra "mi cuenta"-->
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/autenticacion">Cerrar sesión</a>
            <!--solo se muestra si ha iniciado sesion-->
          </li>
        </ul>
      </div>
    </nav>



  </div>
    <div class="container">
      <h1 class="título">Entidades</h1>
      <hr>
      <form class="container alert alert-secondary">
        <div class="form-group">
          <label for="exampleFormControlInput1">Nombre:</label>
          <input type="email" class="form-control" id="exampleFormControlInput1">
        </div>
        <div class="form-group">
          <label for="exampleFormControlTextarea1">Descripción:</label>
          <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
        </div>
        <div class="form-group boton-container">
          <button type="submit" class="enviar btn btn-success bot-ocup">Guardar</button>
        </div>
      </form>
      <form class="container alert alert-warning">
        <div class="form-group">
          <label for="exampleFormControlInput1">Nombre:</label>
          <input type="email" class="form-control" id="exampleFormControlInput1">
        </div>
        <div class="form-group">
          <label for="exampleFormControlTextarea1">Descripción:</label>
          <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
        </div>
        <div class="form-group boton-container">
          <button type="submit" class="enviar btn btn-warning bot-ocup" disabled>Actualizar</button>
        </div>
      </form>
      <div class="alert alert-danger" role="alert">
        El nombre supera los 250 caracteres
      </div>
      <div class="alert alert-danger" role="alert">
        La Descripción supera las 20 palabras
      </div>
      <div class="alert alert-danger" role="alert">
        El campo de nombre esta vacío
      </div>
      <div class="alert alert-danger" role="alert">
        El nombre ingresado ya existe
      </div>
      <div class="container">
      <div class="row fila1">
        <div class="col-md-3">Entidad 1</div>
        <div class="col-md-8">Esta es una bonita descripción de la entidad :3</div>
        <div class="col-md-1"><a href=""><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
</div>
      </div>
      <div class="row fila">
        <div class="col-md-3">Entidad 2</div>
        <div class="col-md-8">Esta es una bonita descripción de la entidad :3</div>
        <div class="col-md-1"><a href=""><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
</div>
      </div>
      <div class="row fila">
        <div class="col-md-3">Entidad 3</div>
        <div class="col-md-8">Esta es una bonita descripción de la entidad :3</div>
        <div class="col-md-1"><a href=""><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
        </div>
      </div>
      <div class="row fila">
        <div class="col-md-3">Entidad 4</div>
        <div class="col-md-8">Esta es una bonita descripción de la entidad :3</div>
        <div class="col-md-1"><a href=""><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
</div>
      </div>
      <div class="row fila">
        <div class="col-md-3">Entidad 5</div>
        <div class="col-md-8">Esta es una bonita descripción de la entidad :3</div>
        <div class="col-md-1"><a href=""><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
</div>
      </div>
      <div class="row fila">
        <div class="col-md-3">Entidad 6</div>
        <div class="col-md-8">Esta es una bonita descripción de la entidad :3</div>
        <div class="col-md-1"><a href=""><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
</div>
      </div>
      <div class="row fila">
        <div class="col-md-3">Entidad 7</div>
        <div class="col-md-8">Esta es una bonita descripción de la entidad :3</div>
        <div class="col-md-1"><a href=""><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
</div>
      </div>
      <div class="row fila">
        <div class="col-md-3">Entidad 6</div>
        <div class="col-md-8">Esta es una bonita descripción de la entidad :3</div>
        <div class="col-md-1"><a href=""><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
</div>
      </div>
      <div class="row fila">
        <div class="col-md-3">Entidad 9</div>
        <div class="col-md-8">Esta es una bonita descripción de la entidad :3</div>
        <div class="col-md-1"><a href=""><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
</div>
      </div>
      <div class="row fila">
        <div class="col-md-3">Entidad 10</div>
        <div class="col-md-8">Esta es una bonita descripción de la entidad :3</div>
        <div class="col-md-1"><a href=""><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
</div>
</div>
      </div>
      <nav aria-label="Page navigation example">
        <ul class="pagination">
          <li class="page-item"><a class="page-link" href="#">Anterior</a></li>
          <li class="page-item"><a class="page-link" href="#">1</a></li>
          <li class="page-item"><a class="page-link" href="#">2</a></li>
          <li class="page-item"><a class="page-link" href="#">3</a></li>
          <li class="page-item"><a class="page-link" href="#">Siguiente</a></li>
        </ul>
      </nav>
  </body>
</html>
