<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/css/bootstrap-min.css" />
    <link rel="stylesheet" href="/css/cv.css" />
    <title>CV</title>
  </head>
  <body>
    <div th:replace="fragments/header :: header"></div>
    <main class="container">
      <h1>CURRICULUM VITAE</h1>
      <div id="encabezado" class="rubro">
        <h2 th:text="${#authentication.getPrincipal().getNombre()} + ' ' + ${#authentication.getPrincipal().getApellido()}">Juan Perez</h2>
        <p>Correo: <span th:text="${#authentication.getPrincipal().getEmail()}"></span></p>
        <p>LinkedIn: <a th:href="${#authentication.getPrincipal().getLinkedinUrl()}" th:text="${#authentication.getPrincipal().getLinkedinUrl()}"></a></p>
        <p>Número: <span th:text="${#authentication.getPrincipal().getTelefono()}"></span></p>
      </div>
      <div id="posicionamiento" class="rubro">
        <p th:text="${#authentication.getPrincipal().getDatosRelevantes()}">
        </p>
      </div>
      <div id="experiencia-laboral" class="rubro">
        <h3>Experiencia Laboral</h3>
        <div class="experiencia" th:each="ocupacion, iStat : ${ocupaciones}">
          <div class="empresa">
            <h4 th:text="${ocupacion.entidad.nombre}">Google</h4>
            <div class="puesto">
              <div th:text="${ocupacion.nombre}">Supervisor TI</div>
              <div th:text="${ocupacion.anioI} + ' - ' + ${ocupacion.anioF}">2018-2020</div>
            </div>
            <div th:text="${ocupacion.descripcion}">
            </div>
          </div>
          <div class="logro" th:each="experiencia, iStat : ${ocupacion.experiencias}">
            <div th:text="${experiencia.logro}">
              ACA PONGAN LO DE EXPERIENCIAS, PUEDEN AGREGARLE UN ATRIBUTO EXPERIENCIAS @OneToMany 
              A OcupacionEntity PARA SACAR LA LISTA DE AHI NOMAS
            </div>
            <div>Acción</div>
          </div>
        </div>
      </div>
      <div id="estudios" class="rubro">
        <h3>Estudios</h3>
        <div style="padding-top: 0.75rem;" th:each="formacion, iStat : ${formaciones}" th:if="${formacion.visible and formacion.tipo.nombre.equals('Estudio')}">
          <h5 th:text="${formacion.entidad.nombre}"></h5>
          <p th:text="${formacion.detalle}"></p>
          <p th:text="'Año de fin: ' + ${formacion.anioFin}"></p>
        </div>
        <br>
        <h3>Cursos</h3>
        <div style="padding-top: 0.75rem;" th:each="formacion, iStat : ${formaciones}" th:if="${formacion.visible  and formacion.tipo.nombre.equals('Curso')}">
          <h5 th:text="${formacion.entidad.nombre}"></h5>
          <p th:text="${formacion.detalle}"></p>
          <p th:text="'Año de fin: ' + ${formacion.anioFin}"></p>
        </div>
      </div>
    </main>
  </body>
</html>
