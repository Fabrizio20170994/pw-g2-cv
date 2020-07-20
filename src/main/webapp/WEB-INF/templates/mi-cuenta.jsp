<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/css/bootstrap-min.css" />
    <link rel="stylesheet" href="/css/autenticacion.css" />
    <title>Autentication</title>
  </head>
  <body>
    <div th:replace="fragments/header :: header"></div>
    <div class="container margin_top">
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
          <ul class="list-group list-group-flush">
            <li class="list-group-item">
              <h4>Nombre:</h4>
              <h6 th:text="${#authentication.getPrincipal().getNombre()} + 
                ' ' + ${#authentication.getPrincipal().getApellido()}">
                (Sin nombre)
              </h6>
            </li>
            <li class="list-group-item">
              <h4>Correo:</h4>
              <h6 th:text="${#authentication.getPrincipal().getEmail()}"></h6>
            </li>
            <li class="list-group-item">
              <h4>Rol:</h4>
              <h6 th:text="${#authentication.getPrincipal().getRole().getNombre()}">Usuario</h6>
            </li>
            <li class="list-group-item">
              <h4>Estado:</h4>
              <h6 th:if="${#authentication.getPrincipal().getActive()}">Activo</h6>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </body>
</html>