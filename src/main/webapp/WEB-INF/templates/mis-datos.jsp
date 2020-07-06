<%@ page contentType="text/html; charset=UTF-8" %>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/css/bootstrap-min.css" />
    <link rel="stylesheet" href="/css/mis-datos.css" />
    <title>Header</title>
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
          <li class="nav-item active">
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
          <li class="nav-item">
            <a class="nav-link" href="/autenticacion">Cerrar sesión</a>
            <!--solo se muestra si ha iniciado sesion-->
          </li>
        </ul>
      </div>
    </nav>
    <main class="container">
      <h1>Actualizar mis datos</h1>
      <div id="nombre">
        <input
          type="text"
          id="txt_nombre"
          placeholder="Nombre"
          class="form-control campo"
        />
      </div>
      <div id="apellido">
        <input
          type="text"
          id="txt_apellido"
          placeholder="Apellido Paterno"
          class="form-control campo"
        />
      </div>
      <div id="celular">
        <input
          type="number"
          id="txt_celular"
          placeholder="Teléfono Celular"
          class="form-control campo"
        />
      </div>
      <div id="linkedin">
        <input
          type="url"
          id="txt_linkedin"
          placeholder="URL LinkedIn"
          class="form-control campo"
        />
      </div>
      <div id="relevantes">
        <input
          type="text"
          rows="5"
          id="txt_relevantes"
          placeholder="Datos Relevantes"
          class="form-control campo"
        />
      </div>
      <button id="but_guardar" class="btn btn-primary boton">Guardar</button>
      <!--el boton estara deshabilitado si hay algún error-->
    </main>
  </body>
</html>
