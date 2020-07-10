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