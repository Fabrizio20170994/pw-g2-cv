<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="https://www.thymeleaf.org"
  xmlns:sec="https://www.thymeleaf.org/thymeleaf-extras-springsecurity">
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/css/bootstrap-min.css" />
    <link rel="stylesheet" href="/css/autenticacion.css" />
    <title>Inicia Sesión</title>
  </head>
  <body>
    <div th:replace="fragments/header :: header"></div>
    <div class="container margin_top">
      <div class="row border_bottom">
        <h1>Inicia Sesión</h1>
      </div>
      <div th:if="${param.error}" class="alert alert-danger" role="alert">
        Usuario y/o contraseña inválido
      </div>
      <div th:if="${param.logout}" class="alert alert-primary" role="alert">
        Cerraste sesión
      </div>
      <form th:action="@{/login}" method="POST">
        <div class="row margin_top">
          <div class="form-group">
            <label for="correo">E-mail</label>
            <input id="correo" type="text" name="username" class="form-control" />
          </div>
        </div>
        <div class="row">
          <div class="form-group">
            <label for="password">Contraseña</label>
            <input
              id="password"
              type="password"
              name="password"
              class="form-control"
            />
          </div>
        </div>
        <div class="row" style="margin-top: 0.5rem;">
          <button class="btn btn-primary" type="submit">Iniciar Sesión</button>
        </div>
      </form>
      <div class="row margin_top border_bottom" style="padding-bottom: 0.5rem;">
        <a href="contraseña.html">He olvidado mi contraseña</a>
      </div>
    </div>
  </body>
</html>
