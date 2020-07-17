<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/css/bootstrap-min.css" />
    <link rel="stylesheet" href="/css/usuarios.css" />
    <title>Crear Nuevo Usuario</title>
  </head>
  <body>
    <div th:replace="fragments/header :: header"></div>
    <div class="container margin_top">
      <div class="row border_bottom">
        <h1>Crear Nuevo Usuario</h1>
      </div>
      <div class="alert alert-secondary margin_top sin_padding_bottom">
        <form th:action="@{/admin/user}" th:object="${user}" method="POST" enctype="utf8">
          <div class="row">
            <div class="col-md-3 form-group sin_margin_bottom">
              <label for="correo_nuevo">E-mail</label>
            </div>
            <div class="col-md-3 form-group sin_margin_bottom">
              <label for="rol_nuevo">Rol</label>
            </div>
            <div class="col-md-3 form-group sin_margin_bottom">
            </div>
          </div>
          <div class="row">
            <div class="col-md-3 form-group">
              <input
                th:field="*{email}"
                id="correo_nuevo"
                type="text"
                name="correo_nuevo"
                class="form-control"
              />
              <input
                th:field="*{password}"
                id="correo_nuevo"
                type="password"
                name="password"
                class="form-control"
                placeholder="Contraseña"
              />
            </div>
            <div class="col-md-3 form-group">
              <select th:field="*{role}" name="role" class="form-control" id="rol_nuevo">
                <option value="" selected>Elegir una opción</option>
                <option 
                  th:each="role, iStat : ${roles}" 
                  th:value="${role.id}"
                  th:text="${role.nombre}">
                </option>
              </select>
            </div>
            <div class="col-md-3 form-check">
              <div class="form-check">
                <input
                  type="checkbox"
                  th:field="*{active}"
                  name="state"
                  class="form-check-input"
                  id="estado_nuevo"
                  checked>
                <label class="form-check-label" for="estado_nuevo">Activo</label>
              </div>
            </div>
            <div class="col-md-3 centrado">
              <button class="btn btn-success" type="submit">
                Crear Nuevo Usuario
              </button>
            </div>
          </div>
          <div th:each="error: ${errors}" th:text="${error}" class="alert alert-danger centrado">
            El usuario ya está registrado
          </div>
        </form>
      </div>
    </div>
  </body>
</html>
