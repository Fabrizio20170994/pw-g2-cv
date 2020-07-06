<%@ page contentType="text/html; charset=UTF-8" %>
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
      <label>Filtrar por entidad:</label>
      <div class="dropdown">
        <button
          class="btn btn-info dropdown-toggle bot-ocup bot-filt"
          type="button"
          id="dropdownMenuButton"
          data-toggle="dropdown"
          aria-haspopup="true"
          aria-expanded="false"
        >
          Entidades
        </button>
        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
          <a class="dropdown-item" href="#">Entidad 1</a>
          <a class="dropdown-item" href="#">Entidad 2</a>
          <a class="dropdown-item" href="#">Entidad 3</a>
          <a class="dropdown-item" href="#">Entidad 4</a>
          <a class="dropdown-item" href="#">Entidad 5</a>
          <a class="dropdown-item" href="#">Entidad 6</a>
        </div>
        <button type="button" class="btn btn-success bot-ocup">
          Agregar ocupación
        </button>
      </div>
      <div class="alert alert-secondary" role="alert">
        <form>
          <div class="container">
            <div class="row">
              <label class="col-md-2">
                Entidad:
              </label>
              <label class="col-md-2">
                Nombre:
              </label>
              <label class="col-md-7">
                Descripcion:
              </label>
            </div>
            <div class="row">
              <div class="dropdown col-md-2">
                <button
                  class="btn btn-secondary dropdown-toggle bot-ocup ent"
                  type="button"
                  id="dropdownMenuButton"
                  data-toggle="dropdown"
                  aria-haspopup="true"
                  aria-expanded="false"
                >
                  Entidad
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                  <a class="dropdown-item" href="#">Entidad 1</a>
                  <a class="dropdown-item" href="#">Entidad 2</a>
                  <a class="dropdown-item" href="#">Entidad 3</a>
                  <a class="dropdown-item" href="#">Entidad 4</a>
                  <a class="dropdown-item" href="#">Entidad 5</a>
                  <a class="dropdown-item" href="#">Entidad 6</a>
                </div>
              </div>
              <div class="col-md-2">
                <input type="text" class="text" />
              </div>
              <div class="col-md-7">
                <textarea type="text" class="input-text-area"></textarea>
              </div>
            </div>
            <div class="row">
              <label class="col-md-2">
                Año inicio:
              </label>
              <label class="col-md-2">
                Año final:
              </label>
            </div>
            <div class="row">
              <div class="col-md-2">
                <input type="number" class="años" />
              </div>
              <div class="col-md-2">
                <input type="number" class="años" />
              </div>
              <div class="col-md-6"></div>
              <div class="col-md-2">
                <button type="submit" class="btn btn-success bot-ocup">
                  Agregar
                </button>
              </div>
            </div>
          </div>
        </form>
      </div>
      <div class="alert alert-warning" role="alert">
        <form>
          <div class="container">
            <div class="row">
              <label class="col-md-2">
                Entidad:
              </label>
              <label class="col-md-2">
                Nombre:
              </label>
              <label class="col-md-7">
                Descripcion:
              </label>
            </div>
            <div class="row">
              <div class="dropdown col-md-2">
                <button
                  class="btn btn-secondary dropdown-toggle bot-ocup ent"
                  type="button"
                  id="dropdownMenuButton"
                  data-toggle="dropdown"
                  aria-haspopup="true"
                  aria-expanded="false"
                >
                  Entidad
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                  <a class="dropdown-item" href="#">Entidad 1</a>
                  <a class="dropdown-item" href="#">Entidad 2</a>
                  <a class="dropdown-item" href="#">Entidad 3</a>
                  <a class="dropdown-item" href="#">Entidad 4</a>
                  <a class="dropdown-item" href="#">Entidad 5</a>
                  <a class="dropdown-item" href="#">Entidad 6</a>
                </div>
              </div>
              <div class="col-md-2">
                <input type="text" class="text" />
              </div>
              <div class="col-md-7">
                <textarea type="text" class="input-text-area"></textarea>
              </div>
            </div>
            <div class="row">
              <label class="col-md-2">
                Año inicio:
              </label>
              <label class="col-md-2">
                Año final:
              </label>
            </div>
            <div class="row">
              <div class="col-md-2">
                <input type="number" class="años" />
              </div>
              <div class="col-md-2">
                <input type="number" class="años" />
              </div>
              <div class="col-md-6"></div>
              <div class="col-md-2">
                <button type="submit" class="btn btn-warning bot-ocup" disabled>
                  Actualizar
                </button>
              </div>
            </div>
          </div>
        </form>
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
      <div class="row fila1">
        <div class="col-md-3">Nombre ocupacion:</div>
        <div class="col-md-3">Nombre entidad:</div>
        <div class="col-md-2">Año inicio:</div>
        <div class="col-md-1"></div>
        <div class="col-md-2">Año fin:</div>
        <div class="col-md-1"></div>
      </div>
      <div class="row fila">
        <div class="col-md-3">Ocupacion 1</div>
        <div class="col-md-3">Entidad 1</div>
        <div class="col-md-2">2000</div>
        <div class="col-md-1"></div>
        <div class="col-md-2">2005</div>
        <div class="col-md-1">
          <button type="button" class="upd">Actualizar</button>
        </div>
      </div>
      <div class="row fila">
        <div class="col-md-3">Ocupacion 2</div>
        <div class="col-md-3">Entidad 1</div>
        <div class="col-md-2">2000</div>
        <div class="col-md-1"></div>
        <div class="col-md-2">2005</div>
        <div class="col-md-1">
          <button type="button" class="upd">Actualizar</button>
        </div>
      </div>
      <div class="row fila">
        <div class="col-md-3">Ocupacion 3</div>
        <div class="col-md-3">Entidad 1</div>
        <div class="col-md-2">2000</div>
        <div class="col-md-1"></div>
        <div class="col-md-2">2005</div>
        <div class="col-md-1">
          <button type="button" class="upd">Actualizar</button>
        </div>
      </div>
      <div class="row fila">
        <div class="col-md-3">Ocupacion 4</div>
        <div class="col-md-3">Entidad 2</div>
        <div class="col-md-2">2000</div>
        <div class="col-md-1"></div>
        <div class="col-md-2">2005</div>
        <div class="col-md-1">
          <button type="button" class="upd">Actualizar</button>
        </div>
      </div>
      <div class="row fila">
        <div class="col-md-3">Ocupacion 5</div>
        <div class="col-md-3">Entidad 2</div>
        <div class="col-md-2">2000</div>
        <div class="col-md-1"></div>
        <div class="col-md-2">2005</div>
        <div class="col-md-1">
          <button type="button" class="upd">Actualizar</button>
        </div>
      </div>
      <div class="row fila">
        <div class="col-md-3">Ocupacion 6</div>
        <div class="col-md-3">Entidad 2</div>
        <div class="col-md-2">2000</div>
        <div class="col-md-1"></div>
        <div class="col-md-2">2005</div>
        <div class="col-md-1">
          <button type="button" class="upd">Actualizar</button>
        </div>
      </div>
      <div class="row fila">
        <div class="col-md-3">Ocupacion 7</div>
        <div class="col-md-3">Entidad 3</div>
        <div class="col-md-2">2000</div>
        <div class="col-md-1"></div>
        <div class="col-md-2">2005</div>
        <div class="col-md-1">
          <button type="button" class="upd">Actualizar</button>
        </div>
      </div>
      <div class="row fila">
        <div class="col-md-3">Ocupacion 8</div>
        <div class="col-md-3">Entidad 3</div>
        <div class="col-md-2">2000</div>
        <div class="col-md-1"></div>
        <div class="col-md-2">2005</div>
        <div class="col-md-1">
          <button type="button" class="upd">Actualizar</button>
        </div>
      </div>
      <div class="row fila">
        <div class="col-md-3">Ocupacion 9</div>
        <div class="col-md-3">Entidad 4</div>
        <div class="col-md-2">2000</div>
        <div class="col-md-1"></div>
        <div class="col-md-2">2005</div>
        <div class="col-md-1">
          <button type="button" class="upd">Actualizar</button>
        </div>
      </div>
      <div class="row fila">
        <div class="col-md-3">Ocupacion 10</div>
        <div class="col-md-3">Entidad 5</div>
        <div class="col-md-2">2000</div>
        <div class="col-md-1"></div>
        <div class="col-md-2">2005</div>
        <div class="col-md-1">
          <button type="button" class="upd">Actualizar</button>
        </div>
      </div>
      <nav aria-label="Page navigation example">
        <ul class="pagination">
          <li class="page-item"><a class="page-link" href="#">Anterior</a></li>
          <li class="page-item"><a class="page-link" href="#">1</a></li>
          <li class="page-item"><a class="page-link" href="#">2</a></li>
          <li class="page-item"><a class="page-link" href="#">3</a></li>
          <li class="page-item"><a class="page-link" href="#">Siguiente</a></li>
        </ul>
      </nav>
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
  </body>
</html>
