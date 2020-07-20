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
      <div id="nullError" style="display: none;" class="alert alert-danger">
        ¡Te faltan campos por completar!
      </div>
      <div id="numberError" style="display: none;" class="alert alert-danger">
        ¡El número no tiene el formato correcto de 9 dígitos!
      </div>
      <div id="nombreLengthError" style="display: none;" class="alert alert-danger">
        ¡El nombre tiene más de 100 caracteres!
      </div>
      <div id="apellidoLengthError" style="display: none;" class="alert alert-danger">
        ¡El apellido tiene más de 100 caracteres!
      </div>
      <div id="infoLengthError" style="display: none;" class="alert alert-danger">
        ¡La informacion relevante tiene más de 60 palabras!
      </div>
      <div id="urlError" style="display: none;" class="alert alert-danger">
        ¡La url de linkedin no tiene un formato correcto!
      </div>
      <div th:if="${success}" class="alert alert-primary">
        Información actualizada exitosamente
      </div>
      <form th:object="${user}" th:action="@{/mis-datos}" method="POST">
        <div id="nombre">
          <input
            type="text"
            id="txt_nombre"
            placeholder="Nombre"
            class="form-control campo"
            th:field="*{nombre}"
            th:value="${#authentication.getPrincipal().getNombre()}"
          />
        </div>
        <div id="apellido">
          <input
            type="text"
            id="txt_apellido"
            placeholder="Apellido Paterno"
            class="form-control campo"
            th:field="*{apellido}"
            th:value="${#authentication.getPrincipal().getApellido()}"
          />
        </div>
        <div id="celular">
          <input
            type="number"
            id="txt_celular"
            placeholder="Teléfono Celular"
            class="form-control campo"
            th:field="*{telefono}"
            th:value="${#authentication.getPrincipal().getTelefono()}"
          />
        </div>
        <div id="linkedin">
          <input
            type="url"
            id="txt_linkedin"
            placeholder="URL LinkedIn"
            class="form-control campo"
            th:field="*{linkedinUrl}"
            th:value="${#authentication.getPrincipal().getLinkedinUrl()}"
          />
        </div>
        <div id="relevantes">
          <textarea
            type="text"
            rows="5"
            id="txt_relevantes"
            placeholder="Datos Relevantes"
            class="form-control campo"
            th:field="*{datosRelevantes}"
            th:text="${#authentication.getPrincipal().getDatosRelevantes()}"
          ></textarea>
        </div>
        <button id="but_guardar" class="btn btn-primary boton">Guardar</button>
      </form>
    </main>
  <script src="/js/MisDatos.js"></script>
  </body>
</html>
