<%@ page contentType="text/html; charset=UTF-8" %>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/css/bootstrap-min.css" />
    <link rel="stylesheet" href="/css/autenticacion.css" />
    <title>Autentication</title>
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
          <li class="nav-item">
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
          <li class="nav-item active">
            <a class="nav-link" href="/autenticacion">Cerrar sesión</a>
            <!--solo se muestra si ha iniciado sesion-->
          </li>
        </ul>
      </div>
    </nav>
    <div class="container margin_top">
      <div class="row border_bottom">
        <h1>Inicia Sesión</h1>
      </div>
      <form action="" method="">
        <div class="row margin_top">
          <div class="form-group">
            <label for="correo">E-mail</label>
            <input id="correo" type="text" name="correo" class="form-control" />
          </div>
        </div>
        <div class="row">
          <div class="form-group">
            <label for="password">Contraseña</label>
            <input
              id="password"
              type="password"
              name="password"
              class="form-control"
            />
          </div>
        </div>
        <div class="row" style="margin-top: 0.5rem;">
          <button class="btn btn-primary" type="submit">Iniciar Sesión</button>
        </div>
      </form>
      <div class="row margin_top border_bottom" style="padding-bottom: 0.5rem;">
        <a href="contraseña.html">He olvidado mi contraseña</a>
      </div>
      <div class="row margin_top">
        <h1>Mi Cuenta</h1>
      </div>
      <div class="row margin_top">
        <div class="col-md-4">
          <img
            class="total_width"
            src="https://www.eldiario.es/hojaderouter/Imagen-aparece-Facebook-usuario-perfil_EDIIMA20140628_0051_5.jpg"
            alt="usuario"
          />
        </div>
        <div class="col-md-8">
          <!--<h4>Nombre:</h4>
        <h6>Fabricio Sotelo Parra</h6>
        <h4>Correo:</h4>
        <h6>FabricioSot@correoexample.com</h6>
        <h4>Rol:</h4>
        <h6>Usuario</h6>
        <h4>Estado:</h4>
        <h6>Activo</h6>-->
          <ul class="list-group list-group-flush">
            <li class="list-group-item">
              <h4>Nombre:</h4>
              <h6>Fabricio Sotelo Parra</h6>
            </li>
            <li class="list-group-item">
              <h4>Correo:</h4>
              <h6>FabricioSot@correoexample.com</h6>
            </li>
            <li class="list-group-item">
              <h4>Rol:</h4>
              <h6>Usuario</h6>
            </li>
            <li class="list-group-item">
              <h4>Estado:</h4>
              <h6>Activo</h6>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </body>
</html>
