<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/css/bootstrap-min.css" />
    <link rel="stylesheet" href="/css/usuarios.css" />
    <title>Usuarios</title>
  </head>
  <body>
    <div th:replace="fragments/header :: header"></div>
    <div 
        th:if="${errores == 'no'}"
        class="alert alert-success centrado">
        Se creó el usuario correctamente
      </div>
    <div class="container margin_top">
      <form th:action="@{/admin/create-user}" method="GET" enctype="utf8">
        <button class="btn btn-success" type="submit">Crear Nuevo Usuario</button>
      </form>
        <div class="row">
          <div class="col">Filtro:</div>
        </div>
        <form action="/admin/users" method="GET" enctype="utf8">
          <div class="row">
            <div class="col-md-3">
              <select name="filter" class="form-control" id="">
                <option selected value="Ambos">Ambos</option>
                <option value="Activo">Activo</option>
                <option value="Inactivo">Inactivo</option>
              </select>
            </div>
            <div class="col-md-3">
              <button class="btn btn-secondary" type="submit">Aplicar Filtro</button>
            </div>
          </div>
          <div class="col-md-3 offset-md-3 total">
            <p class="total_texto" th:text="${cuenta}"></p>
          </div>
        </form> 
    </div>  
      <hr/>
      <div class="container contenido centrado margin_top">
        <div class="row fila1">
          <div class="col-md-3">E-mail</div>
          <div class="col-md-3">Rol</div>
          <div class="col-md-3">Estado</div>
        </div>
        <div class="row fila" th:each="usuario: ${listaUsuarios}">
          <div class="col-md-3" th:text="${usuario.email}">example@example.com</div>
          <div class="col-md-3" th:text="${usuario.role.nombre}">Profesional</div>
          <div class="col-md-3" th:if="${usuario.active}">Activo</div>
          <div class="col-md-3" th:unless="${usuario.active}">Inactivo</div>
          <div class="col-md-3 actualizar"><a th:href="'/admin/user/'+${usuario.id}">Actualizar</a></div>
        </div>
      </div>
    </div>
  </body>
</html>
