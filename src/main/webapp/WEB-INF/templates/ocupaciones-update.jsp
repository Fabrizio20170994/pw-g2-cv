<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/css/bootstrap-min.css" />
    <link rel="stylesheet" href="/css/ocupaciones.css" />
    <title>Ocupaciones</title>
  </head>
  <body>
    <div th:replace="fragments/header :: header"></div>

    <div class="container">
      <h2 id="titulo">Ocupaciones</h2>
      <div class="row">
        <label class="col-md-3">Filtrar por entidad:</label>
      </div>
      <div class="row">
        <form method="GET" action="/ocupaciones_filtradas" class="col-md-5">
          <select name="entidad" class="form-control btn btn-info bot-ocup bot-filt col-md-8">
            <option th:each="enti:${listaEntidades}" th:text="${enti.nombre}" th:value="${enti.id}">ejemplo</option>
          </select>
          <button type="submit" class="btn btn-secondary bot-ocup col-md-4">
            Ordenar
          </button>
        </form>
        <div class="col-md-2"></div>
        <button type="button" class="btn btn-success bot-ocup" data-toggle="modal" data-target="#crear" id="modalCrear">
          Agregar ocupación
        </button>
      </div>
      <!-- Modal de creacion-->
      <div class="modal fade alert" id="crear" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Crear ocupacion</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close" href="/ocupaciones">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <!---->
              <form method ="POST" th:action="@{/guardar_ocupacion}">
                <div class="container">
                  <div class="row">
                    <div class="form-group col-md-6"> 
                      <label for = "ocup">
                        Entidad:
                      </label>
                      <select name="entidad_nombre" class="form-control">
                        <option th:each="enti:${listaEntidades}" th:text="${enti.nombre}" th:value="${enti.id}">ejemplo</option>
                      </select>
                    </div>
                    <div class="form-group col-md-6">
                      <label for = "ocup">
                        Nombre:
                      </label>
                      <input type="text" class="text form-control" id="nombre_ocupC" name="nombreOcup"/>
                    </div>
                  </div>
                  <div class="row">
                    <div class="form-group col-md-12">
                      <label for="ocup">
                        Descripcion:
                      </label>
                      <textarea type="text" class="input-text-area form-control" name="descripcionOcup" id="descripcionOcupC"></textarea>
                    </div>
                  </div>
                  <div class="row">
                    <div class="form-group col-md-6">
                      <label for="ocup">
                        Año inicio:
                      </label>
                      <input type="number" class="años form-control" name="anioIOcup" id="anioIOcupC"/>
                    </div>
                    <div class="form-group col-md-6">
                      <label for="ocup">
                        Año final:
                      </label>
                      <input type="number" class="años form-control" name="anioFOcup" id="anioFOcupC"/>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12 centro">
                      <button type="submit" class="btn btn-success bot-ocup" id="submitCrearC" disabled >
                        Agregar
                      </button>
                    </div>
                  </div>
                </div>
              </form>
              <div class="alert alert-danger escondido" role="alert" id="fallaAniosC">
                Los años no cuadran
              </div>
              <div class="alert alert-danger escondido" role="alert" id="excesoDescripcionC">
                Descripcion supera las 30 palabras
              </div>
              <div class="alert alert-danger escondido" role="alert" id="excesoNombreC">
                Nombre supera los 250 caracteres
              </div>
              <div class="alert alert-danger escondido" role="alert" id="anioImayorC">
                El año final es menor al inicial
              </div>
            <!---->
            </div>
          </div>
        </div>
      </div>
      <!-- Modal de update-->
      <div class="modal fade alert" id="update" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">actualizar ocupacion</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close" href="/ocupaciones">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <!---->
              <form method ="POST" th:action="@{/actualizar_ocupacion}">
                <div class="container">
                  <div class="row">
                    <div class="form-group col-md-6"> 
                      <label for = "ocup">
                        Entidad:
                      </label>
                      <select name="entidad_nombre" class="form-control">
                        <option th:each="enti:${listaEntidades}" th:text="${enti.nombre}" th:value="${enti.id}" th:selected="${ocupacion.entidad.id} == ${enti.id}">ejemplo</option>
                      </select>
                    </div>
                    <div class="form-group col-md-6">
                      <label for = "ocup">
                        Nombre:
                      </label>
                      <input type="text" class="text form-control" id="nombre_ocupU" name="nombreOcup" th:value="${ocupacion.nombre}"/>
                    </div>
                  </div>
                  <div class="row">
                    <div class="form-group col-md-12">
                      <label for="ocup">
                        Descripcion:
                      </label>
                      <textarea type="text" class="input-text-area form-control" name="descripcionOcup" id="descripcionOcupU" th:text="${ocupacion.descripcion}"></textarea>
                    </div>
                  </div>
                  <div class="row">
                    <div class="form-group col-md-6">
                      <label for="ocup">
                        Año inicio:
                      </label>
                      <input type="number" class="años form-control" name="anioIOcup" id="anioIOcupU" th:value="${ocupacion.anioI}"/>
                    </div>
                    <div class="form-group col-md-6">
                      <label for="ocup">
                        Año final:
                      </label>
                      <input type="number" class="años form-control" name="anioFOcup" id="anioFOcupU" th:value="${ocupacion.anioF}"/>
                    </div>
                  </div>
                  <input type="hidden" name="ocuID" th:value="${ocupacion.id}" />
                  <div class="row">
                    <div class="col-md-12 centro">
                      <button type="submit" class="btn btn-success bot-ocup" id="submitCrearU" href="/ocupaciones" disabled >
                        Actualizar
                      </button>
                    </div>
                  </div>
                </div>
              </form>
              <div class="alert alert-danger escondido" role="alert" id="fallaAniosU">
                Los años no cuadran
              </div>
              <div class="alert alert-danger escondido" role="alert" id="excesoDescripcionU">
                Descripcion supera las 30 palabras
              </div>
              <div class="alert alert-danger escondido" role="alert" id="excesoNombreU">
                Nombre supera los 250 caracteres
              </div>
              <div class="alert alert-danger escondido" role="alert" id="anioImayorU">
                El año final es menor al inicial
              </div>
            <!---->
            </div>
          </div>
        </div>
      </div>
      
    </div>
    <div class="container contenido">
      <div class="row fila1" >
        <div class="col-md-3">Nombre ocupacion:</div>
        <div class="col-md-3">Nombre entidad:</div>
        <div class="col-md-2">Año inicio:</div>
        <div class="col-md-1"></div>
        <div class="col-md-2">Año fin:</div>
        <div class="col-md-1"></div>
      </div>
      <div class="row fila" th:each="ocupa:${listaOcupaciones}">
        <div class="col-md-3" th:text="${ocupa.nombre}">Ocupacion 1</div>
        <div class="col-md-3" th:text="${ocupa.entidad.nombre}">Entidad 1</div>
        <div class="col-md-2" th:text="${ocupa.anioI}">2000</div>
        <div class="col-md-1"></div>
        <div class="col-md-2" th:text="${ocupa.anioF}">2005</div>
        <div class="col-md-1">
          <a class="upd" th:href="'/ocupaciones-update/'+${ocupa.id}">Actualizar</a>
        </div>
      </div>
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
    <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
      integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
      crossorigin="anonymous"
    ></script>
    <script src="/js/ocupaciones-update.js"></script>
    <script>
      $('#update').modal('toggle')
    </script>
  </body>
</html>