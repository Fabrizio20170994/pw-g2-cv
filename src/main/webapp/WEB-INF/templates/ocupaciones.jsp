<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/css/bootstrap-min.css" />
    <link rel="stylesheet" href="/css/ocupaciones.css" />
    <title>Ocupaciones</title>
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
          <li class="nav-item active">
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
        <button type="button" class="btn btn-success bot-ocup" data-toggle="modal" data-target="#crear">
          Agregar ocupación
        </button>
      </div>

      <!-- Modal de creacion-->
      <div class="modal fade alert" id="crear" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Crear ocupacion</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <!---->
              <form method ="POST" action="/guardar_ocupacion">
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
                      <input type="text" class="text form-control" id="nombre_ocup" name="nombreOcup"/>
                    </div>
                  </div>
                  <div class="row">
                    <div class="form-group col-md-12">
                      <label for="ocup">
                        Descripcion:
                      </label>
                      <textarea type="text" class="input-text-area form-control" name="descripcionOcup"></textarea>
                    </div>
                  </div>
                  <div class="row">
                    <div class="form-group col-md-6">
                      <label for="ocup">
                        Año inicio:
                      </label>
                      <input type="number" class="años form-control" name="anioIOcup" />
                    </div>
                    <div class="form-group col-md-6">
                      <label for="ocup">
                        Año final:
                      </label>
                      <input type="number" class="años form-control" name="anioFOcup"/>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12 centro">
                      <button type="submit" class="btn btn-success bot-ocup">
                        Agregar
                      </button>
                    </div>
                  </div>
                </div>
              </form>
            <!---->
            </div>
          </div>
        </div>
      </div>
      <!--modal update-->
      <div class="modal fade alert" id="modificar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">modificar ocupacion</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <!---->
              <form method ="POST" action="/modificar_ocupacion">
                <div class="container">
                  <div class="row">
                    <div class="form-group col-md-6"> 
                      <label for = "ocup">
                        Entidad:
                      </label>
                      <select name="entidad_nombre" class="form-control">
                        <option value="1">Entidad 1</option>
                        <option value="2">Entidad 2</option>
                        <option value="3">Entidad 3</option>
                        <option value="4">Entidad 4</option>
                        <option value="5">Entidad 5</option>
                      </select>
                    </div>
                    <div class="form-group col-md-6">
                      <label for = "ocup">
                        Nombre:
                      </label>
                      <input type="text" class="text form-control" id="nombre_ocup" name="nombreOcup"/>
                    </div>
                  </div>
                  <div class="row">
                    <div class="form-group col-md-12">
                      <label for="ocup">
                        Descripcion:
                      </label>
                      <textarea type="text" class="input-text-area form-control" name="descripcionOcup"></textarea>
                    </div>
                  </div>
                  <div class="row">
                    <div class="form-group col-md-6">
                      <label for="ocup">
                        Año inicio:
                      </label>
                      <input type="number" class="años form-control" name="anioIOcup" />
                    </div>
                    <div class="form-group col-md-6">
                      <label for="ocup">
                        Año final:
                      </label>
                      <input type="number" class="años form-control" name="anioFOcup"/>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12 centro">
                      <button type="submit" class="btn btn-success bot-ocup">
                        Agregar
                      </button>
                    </div>
                  </div>
                </div>
              </form>
            <!---->
            </div>
          </div>
        </div>
      </div>
      <div class="alert alert-danger" role="alert">
        El año de fin es menor que el de inicio
      </div>
      <div class="alert alert-danger" role="alert">
        Descripcion supera las 30 palabras
      </div>
      <div class="alert alert-danger" role="alert">
        Nombre supera los 250 caracteres
      </div>
      <div class="alert alert-danger" role="alert">
        Falta llenar un campo
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
          <button type="button" class="upd">Actualizar</button>
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
    <!--<script>
      $('#crear').modal('toggle')
    </script>-->
  </body>
</html>
