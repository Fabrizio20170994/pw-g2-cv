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
        <h1>Actualizar Usuario</h1>
      </div>
      <div class="alert alert-warning margin_top sin_padding_bottom">
        <form th:action="@{'/admin/user/'+${userId}+'/edit'}" th:object="${UserForm}" method="POST" enctype="utf8">
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
              <select name="user_role" class="form-control" id="rol_nuevo">
                <option 
                  th:each="role : ${roles}" 
                  th:value="${role.id}"
                  th:text="${role.nombre}"
                  th:selected="${role.id} == ${idRole}">
                </option>
              </select>
            </div>
            <div class="col-md-3 form-group">
              <select name="user_active" class="form-control" id="estado_actualizar">
                <option value="true" th:selected="${usuarioEditar.active} == true">Activo</option>
                <option value="false" th:selected="${usuarioEditar.active} == false">Inactivo</option>
              </select>
            </div>
            <div class="col-md-3 centrado">
              <button class="btn btn-warning" type="submit">
                Actualizar usuario
              </button>
            </div>
          </div>
        </form>
      </div><!---->