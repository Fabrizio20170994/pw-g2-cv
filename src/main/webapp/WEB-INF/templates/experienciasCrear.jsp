<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/ocupaciones.css"/>
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <title>Experiencias</title>
  </head>
  <body>
    <div th:replace="fragments/header :: header"></div>
    <div class="container contenido">
      <button data-toggle="modal" data-target="#crear" id="modalCrear" class="btn btn-success" type="button">Crear Nueva Experiencia</button>
    </div>
    <hr/>
    <!--
    <div class="container contenido">
      <div class="row fila1">
        <div class="col-md-3">Entidad</div>
        <div class="col-md-3">ocupacion</div>
        <div class="col-md-3">logro</div>
        <div class="col-md-3">visibilidad</div>
      </div>
    </div>

    <div class="container contenido">
      
        <div class="row fila" th:each="exp: ${listaExperiencias}">
          <div class="col-md-3" th:text="${exp.entidad.nombre}"></div>
          <div class="col-md-3" th:text="${exp.ocupacion.nombre}"></div>
          <div class="col-md-3" th:text="${exp.logro}"></div>
          <div class="col-md-2" th:text="${exp.visibilidad}"></div>
          <a class="col-md-1" th:href="'/ExperienciasUpdate/'+${exp.id}">actualizar</a>
        </div>
    </div>
    -->
    <div class="container contenido">
      <div th:each="entidad, iStat : ${entidades}" class="entidad">
        <h1 th:text="${entidad.nombre}"></h1>
        <div class="contenedor-ocupación">
          <div th:each="ocupacion, iStat : ${entidad.ocupaciones}" class="ocupacion">
            <h3 th:text="${ocupacion.nombre}"></h3>
              <div th:each="experiencia, iStat: ${ocupacion.experiencias}" class="experiencia row">
                <div th:text="${experiencia.logro}" class="col"></div>
                <div th:text="${experiencia.visibilidad}" class="col"></div>
                <a class="col" th:href="'/ExperienciasUpdate/'+${experiencia.id}">Actualizar</a>
              </div>
          </div>
        </div>
      </div>
    </div>
    <nav aria-label="Page navigation example">
      <ul class="pagination">
        <li class="page-item"><a class="page-link" th:if="${paginaActual} &gt; 1" th:href="@{'/experiencias'(page=${pagAnterior})}">Previous</a></li>
        <li class="page-item"><a class="page-link" th:if="${paginaActual} &lt; ${totalPaginas}" th:href="@{'/experiencias'(page=${pagSiguiente})}">Next</a></li>
      </ul>
    </nav>
    <!---->
    <!--MODAL CREACION-->
    <div class="modal fade alert" id="crear" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Crear Experiencia</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close" href="/experiencias">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <!---->
            <form method ="POST" th:action="@{/crear-experiencia}">
              <div class="container">
                <div class="row">
                  <div class="form-group col-md-6"> 
                    <label for = "ocup">
                      Entidad:
                    </label>
                    <select name="entidad_nombre" class="form-control" onchange="redireccionar(this.value)">
                      <option th:each="enti:${listaEntidades}" th:selected="${entidadID} == ${enti.id}" th:text="${enti.nombre}" th:value="${enti.id}">ejemplo
                      </option>
                    </select>
                  </div>
                  <div class="form-group col-md-6">
                    <label for = "exp">
                      Ocupación
                    </label>
                    <select name="id_ocupacion" class="form-control">
                      <option th:each="ocup :${listaOcupacionesFiltrada}" th:text="${ocup.nombre}" th:value="${ocup.id}">ejemplo
                      </option>
                    </select>
                  </div>
                </div>
                <div class="row">
                  <div class="form-group col-md-6">
                    <label for="exp">
                      Nombre del logro:
                    </label>
                    <input type="text" class="text form-control" id="logro" name="logro"/>
                  </div>
                  <div class="form-group col-md-6">
                    <label for="exp">Visibilidad:</label>
                    <select name="visibilidad" class="form-control">
                      <option value="true">Visible</option>
                      <option value="false">No visible</option>
                    </select>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-12 centro">
                    <button type="submit" class="btn btn-success bot-ocup" id="submitExp" >
                      Agregar
                    </button>
                  </div>
                </div>
              </div>
            </form>
            <div class="alert alert-danger escondido" role="alert" id="fallaLogro">
              hay mas de 30 palabras en el logro
            </div>
          <!---->
          </div>
        </div>
      </div>
    </div>
    <!--FIN MODAL CREACION-->
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
    <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
      integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
      crossorigin="anonymous"
    ></script>
    <script src="/js/experiencias.js"></script>
    <script>
      $('#crear').modal('toggle')
    </script>
  </body>
</html>
