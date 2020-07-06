<%@ page contentType="text/html; charset=UTF-8" %>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/css/bootstrap-min.css" />
    <link rel="stylesheet" href="/css/usuarios.css" />
    <title>Usuarios</title>
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
          <li class="nav-item">
            <a class="nav-link" href="/formacion">Formación</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/cv">CV</a>
          </li>
          <li class="nav-item active">
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
    <div class="container margin_top">
      <div class="row border_bottom">
        <h1>Crear Nuevo Usuario</h1>
      </div>
      <div class="alert alert-secondary margin_top sin_padding_bottom">
        <form action="" method="">
          <div class="row">
            <div class="col-md-3 form-group sin_margin_bottom">
              <label for="correo_nuevo">E-mail</label>
            </div>
            <div class="col-md-3 form-group sin_margin_bottom">
              <label for="rol_nuevo">Rol</label>
            </div>
            <div class="col-md-3 form-group sin_margin_bottom">
              <label for="estado_nuevo">Estado</label>
            </div>
          </div>
          <div class="row">
            <div class="col-md-3 form-group">
              <input
                id="correo_nuevo"
                type="text"
                name="correo_nuevo"
                class="form-control"
              />
            </div>
            <div class="col-md-3 form-group">
              <input
                id="rol_nuevo"
                type="text"
                name="rol_nuevo"
                class="form-control"
              />
            </div>
            <div class="col-md-3 form-group">
              <select class="form-control" id="estado_nuevo">
                <option selected>Elegir una opción</option>
                <option>Activo</option>
                <option>Inactivo</option>
              </select>
            </div>
            <div class="col-md-3 centrado">
              <button class="btn btn-success" type="submit">
                Crear Nuevo Usuario
              </button>
            </div>
          </div>
          <div class="alert alert-danger centrado">
            El usuario ya está registrado
          </div>
        </form>
      </div>
      <div class="alert alert-warning margin_top sin_padding_bottom">
        <form action="" method="">
          <div class="row justify-content-center">
            <div class="col-md-3 form-group sin_margin_bottom">
              <label for="rol_actualizar">Nuevo rol</label>
            </div>
            <div class="col-md-3 form-group sin_margin_bottom">
              <label for="estado_actualizar">Nuevo estado</label>
            </div>
            <div class="col-md-3 form-group sin_margin_bottom"></div>
          </div>
          <div class="row justify-content-center">
            <div class="col-md-3 form-group">
              <input
                id="rol_actualizar"
                type="text"
                name="rol_nuevo"
                class="form-control"
              />
            </div>
            <div class="col-md-3 form-group">
              <select class="form-control" id="estado_actualizar">
                <option selected>Elegir una opción</option>
                <option>Activo</option>
                <option>Inactivo</option>
              </select>
            </div>
            <div class="col-md-3 centrado">
              <button class="btn btn-warning" type="submit">
                Actualizar usuario
              </button>
            </div>
          </div>
        </form>
      </div>
      <div class="row">
        <div class="col-md-3">
          Filtro:
          <select class="form-control" id="">
            <option selected>Filtrar por</option>
            <option>Activo</option>
            <option>Inactivo</option>
          </select>
        </div>
        <div class="col-md-3 offset-md-6 total">
          <p class="total_texto">Total: 7</p>
        </div>
      </div>
      <div class="container contenido centrado margin_top">
        <div class="row fila1">
          <div class="col-md-3">E-mail</div>
          <div class="col-md-3">Rol</div>
          <div class="col-md-3">Estado</div>
        </div>
        <div class="row fila">
          <div class="col-md-3">ManuelMontoya@example.com</div>
          <div class="col-md-3">Profesional</div>
          <div class="col-md-3">Activo</div>
          <div class="col-md-3 actualizar">Actualizar</div>
        </div>
        <div class="row fila">
          <div class="col-md-3">ManuelMontoya@example.com</div>
          <div class="col-md-3">Profesional</div>
          <div class="col-md-3">Activo</div>
          <div class="col-md-3 actualizar">Actualizar</div>
        </div>
        <div class="row fila">
          <div class="col-md-3">ManuelMontoya@example.com</div>
          <div class="col-md-3">Profesional</div>
          <div class="col-md-3">Activo</div>
          <div class="col-md-3 actualizar">Actualizar</div>
        </div>
        <div class="row fila">
          <div class="col-md-3">ManuelMontoya@example.com</div>
          <div class="col-md-3">Profesional</div>
          <div class="col-md-3">Activo</div>
          <div class="col-md-3 actualizar">Actualizar</div>
        </div>
        <div class="row fila">
          <div class="col-md-3">ManuelMontoya@example.com</div>
          <div class="col-md-3">Profesional</div>
          <div class="col-md-3">Activo</div>
          <div class="col-md-3 actualizar">Actualizar</div>
        </div>
        <div class="row fila">
          <div class="col-md-3">ManuelMontoya@example.com</div>
          <div class="col-md-3">Profesional</div>
          <div class="col-md-3">Activo</div>
          <div class="col-md-3 actualizar">Actualizar</div>
        </div>
        <div class="row fila">
          <div class="col-md-3">ManuelMontoya@example.com</div>
          <div class="col-md-3">Profesional</div>
          <div class="col-md-3">Activo</div>
          <div class="col-md-3 actualizar">Actualizar</div>
        </div>
        <nav aria-label="Page navigation example">
          <ul class="pagination">
            <li class="page-item">
              <a class="page-link" href="#">Anterior</a>
            </li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item">
              <a class="page-link" href="#">Siguiente</a>
            </li>
          </ul>
        </nav>
      </div>
    </div>
  </body>
</html>
