<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/css/bootstrap-min.css" />
    <link rel="stylesheet" href="/css/formacion.css" />
    <link
      href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
      rel="stylesheet"
    />
    <title>Formación</title>
  </head>
  <body>
    <div th:replace="fragments/header :: header"></div>

    <div class="container">
      <h1 style="margin-top: 1rem;">Lista de mi formación</h1>
      <div class="form-group d-flex justify-content-end">
        <label style="margin-right: 1rem;">Filtrar por</label>
        <div class="dropdown select-input">
          <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Seleccionar
          </button>
          <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <a
              class="dropdown-item"
              th:href="@{/formacion}">Todos</a>
            <a
              class="dropdown-item"
              th:each="tipo, iStat : ${tipos}"
              th:text="${tipo.nombre}"
              th:href="@{/formacion(tipo=${tipo.id})}"></a>
          </div>
        </div>
      </div>
      <ul class="list-group">
        <li
          th:each="formacion, iStat : ${formaciones}"
          class="list-group-item d-flex justify-content-between align-items-center"
          th:classappend="${formacion.visible} ? xd : disabled"
        >
          <div style="margin-right: 0.75rem; font-weight: bold;" th:text="${formacion.tipo.nombre}">(Tipo)</div>
          <div class="formacion-desc"><strong>En:</strong> <span th:text="${formacion.entidad.nombre}">Lugar</span></div>
          <div class="formacion-desc"><strong>Año de fin:</strong> <span th:text="${formacion.anioFin}"></span></div>
          <div class="formacion-desc" th:text="${formacion.detalle}"></div>
          <a class="edit-button" th:href="@{/formacion/{id}/edit(id=${formacion.id})}">
            <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
          </a>
        </li>
      </ul>
    </div>

    <div class="container">
      <hr />
      <h1>Añadir formación</h1>
      <div
        class="alert alert-danger"
        role="alert"
        th:each="error: ${errors}"
        th:text="${error}">
        El detalle supera los 250 caracteres
      </div>
      <form th:action="@{/formacion}" th:object="${formacion}" method="POST">
        <div class="form-group">
          <label for="newTypeSelect">Tipo</label>
          <select th:field="*{tipo}" name="tipo" class="form-control select-input" id="newTypeSelect">
            <option
              th:each="tipo, iStat : ${tipos}"
              th:value="${tipo.id}"
              th:text="${tipo.nombre}"></option>
          </select>
        </div>
        <div class="form-group">
          <label for="entidadSelect">Entidad</label>
          <select th:field="*{entidad}" name="entidad" class="form-control select-input" id="entidadSelect">
            <option
              th:each="entidad, iStat : ${entities}"
              th:value="${entidad.id}"
              th:text="${entidad.nombre}"></option>
          </select>
        </div>
        <div class="form-group">
          <label for="detalleInput">Detalle</label>
          <textarea th:field="*{detalle}" name="detalle" class="form-control" id="detalleInput" rows="3"></textarea>
        </div>
        <div class="form-group">
          <label for="yearInput">Año de fin</label>
          <input th:field="*{anioFin}" name="anioFin" type="text" class="form-control select-input" id="yearInput" />
        </div>
        <div class="form-group form-check">
          <input
            type="checkbox"
            class="form-check-input"
            id="exampleCheck1"
            th:field="*{visible}"
            name="visible"
          />
          <label class="form-check-label" for="exampleCheck1">Visible</label>
        </div>
        <button type="submit" class="btn btn-primary">Crear</button>
      </form>
    </div>

    <script
      src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
      integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
      integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
      crossorigin="anonymous"
    ></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/js/bootstrap-datepicker.js"></script>
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/css/bootstrap-datepicker.css"
      rel="stylesheet"
    />
    <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
      integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
      crossorigin="anonymous"
    ></script>
    <script>
      $("#yearInput").datepicker({
        format: "yyyy",
        viewMode: "years",
        minViewMode: "years",
      });
    </script>
  </body>
</html>
