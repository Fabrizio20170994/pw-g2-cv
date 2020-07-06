<%@ page contentType="text/html; charset=UTF-8" %>
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
          <li class="nav-item">
            <a class="nav-link" href="/ocupaciones">Ocupaciones</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/experiencias">Experiencia</a>
          </li>
          <li class="nav-item active">
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
      <h1 style="margin-top: 1rem;">Lista de mi formación</h1>
      <div class="form-group d-flex justify-content-end">
        <label for="infoTypeSelect">Filtrar por</label>
        <select class="form-control select-input" id="infoTypeSelect">
          <option>Todo</option>
          <option>Estudio</option>
          <option>Curso</option>
        </select>
      </div>
      <ul class="list-group">
        <li
          class="list-group-item d-flex justify-content-between align-items-center"
        >
          <div style="margin-right: 0.75rem;">(Tipo)</div>
          <div class="formacion-desc"><strong>En:</strong> (Entidad x)</div>
          <div class="formacion-desc"><strong>Año de fin:</strong> YYYY</div>
          <div class="formacion-desc">
            Lorem ipsum dolor sit amet consectetur, adipisicing elit.
            Reprehenderit tempora soluta pariatur dolor eveniet impedit, ullam
            vel quis quos repellendus quas facilis voluptatibus voluptatem eos a
            nesciunt nam eius laboriosam?
          </div>
          <a href=""
            ><i class="fa fa-pencil-square-o" aria-hidden="true"></i
          ></a>
        </li>
        <li
          class="list-group-item d-flex justify-content-between align-items-center"
        >
          <div style="margin-right: 0.75rem;">(Tipo)</div>
          <div class="formacion-desc"><strong>En:</strong> (Entidad x)</div>
          <div class="formacion-desc"><strong>Año de fin:</strong> YYYY</div>
          <div class="formacion-desc">
            Lorem ipsum dolor sit amet consectetur, adipisicing elit.
            Reprehenderit tempora soluta pariatur dolor eveniet impedit, ullam
            vel quis quos repellendus quas facilis voluptatibus voluptatem eos a
            nesciunt nam eius laboriosam?
          </div>
          <a href=""
            ><i class="fa fa-pencil-square-o" aria-hidden="true"></i
          ></a>
        </li>
        <li
          class="list-group-item d-flex justify-content-between align-items-center"
        >
          <div style="margin-right: 0.75rem;">(Tipo)</div>
          <div class="formacion-desc"><strong>En:</strong> (Entidad x)</div>
          <div class="formacion-desc"><strong>Año de fin:</strong> YYYY</div>
          <div class="formacion-desc">
            Lorem ipsum dolor sit amet consectetur, adipisicing elit.
            Reprehenderit tempora soluta pariatur dolor eveniet impedit, ullam
            vel quis quos repellendus quas facilis voluptatibus voluptatem eos a
            nesciunt nam eius laboriosam?
          </div>
          <a href=""
            ><i class="fa fa-pencil-square-o" aria-hidden="true"></i
          ></a>
        </li>
        <li
          class="list-group-item disabled d-flex justify-content-between align-items-center"
        >
          <div style="margin-right: 0.75rem;">(Tipo)</div>
          <div class="formacion-desc"><strong>En:</strong> (Entidad x)</div>
          <div class="formacion-desc"><strong>Año de fin:</strong> YYYY</div>
          <div class="formacion-desc">
            Formación marcada como no visible. Lorem ipsum dolor sit amet
            consectetur, adipisicing elit. Reprehenderit tempora soluta pariatur
            dolor eveniet impedit, ullam vel quis quos repellendus quas facilis
            voluptatibus
          </div>
          <a class="edit-button" href=""
            ><i class="fa fa-pencil-square-o" aria-hidden="true"></i
          ></a>
        </li>
      </ul>
    </div>
    <ul class="pagination justify-content-center">
      <li class="page-item disabled">
        <a class="page-link" href="#" tabindex="-1" aria-disabled="true"
          >Anterior</a
        >
      </li>
      <li class="page-item"><a class="page-link" href="#">1</a></li>
      <li class="page-item"><a class="page-link" href="#">2</a></li>
      <li class="page-item"><a class="page-link" href="#">3</a></li>
      <li class="page-item">
        <a class="page-link" href="#">Siguiente</a>
      </li>
    </ul>

    <div class="container">
      <hr />
      <h1>Añadir formación</h1>
      <div class="alert alert-danger" role="alert">
        El detalle supera los 250 caracteres
      </div>
      <div class="alert alert-danger" role="alert">
        El año de fin no es del calendario vigente
      </div>
      <div class="alert alert-danger" role="alert">
        El campo xxxx no ha sido completado correctamente
      </div>
      <form>
        <div class="form-group">
          <label for="newTypeSelect">Tipo</label>
          <select class="form-control select-input" id="newTypeSelect">
            <option>Estudio</option>
            <option>Curso</option>
          </select>
        </div>
        <div class="form-group">
          <label for="entidadSelect">Entidad</label>
          <select class="form-control select-input" id="entidadSelect">
            <option>Entidad 1</option>
            <option>Entidad 2</option>
            <option>Entidad 3</option>
            <option>Entidad 4</option>
          </select>
        </div>
        <div class="form-group">
          <label for="detalleInput">Detalle</label>
          <textarea class="form-control" id="detalleInput" rows="3"></textarea>
        </div>
        <div class="form-group">
          <label for="yearInput">Año de fin</label>
          <input type="text" class="form-control select-input" id="yearInput" />
        </div>
        <div class="form-group form-check">
          <input
            type="checkbox"
            class="form-check-input"
            id="exampleCheck1"
            checked
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
