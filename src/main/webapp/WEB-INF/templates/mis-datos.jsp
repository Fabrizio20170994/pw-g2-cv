<%@ page contentType="text/html; charset=UTF-8" %>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/css/bootstrap-min.css" />
    <link rel="stylesheet" href="/css/mis-datos.css" />
    <title>Header</title>
  </head>
  <body>
    <div th:replace="fragments/header :: header"></div>
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
