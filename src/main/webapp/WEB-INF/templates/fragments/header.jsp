<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org"
  xmlns:sec="https://www.thymeleaf.org/thymeleaf-extras-springsecurity">
<body>
  <nav th:fragment="header" class="navbar navbar-expand-lg navbar-light bg-light">
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
          <a class="nav-link" th:href="@{/mis-datos}">Mis datos</a>
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
          <a class="nav-link" th:href="@{/formacion}">Formación</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/cv">CV</a>
        </li>
        <li sec:authorize="hasAuthority('Administrador')" class="nav-item">
          <a class="nav-link" th:href="@{/admin/users}">Usuarios</a>
          <!--solo se muestra si es admin-->
        </li>
        <li class="nav-item">
          <div sec:authorize="isAuthenticated()">
            <a class="nav-link" th:href="@{/me}">Mi cuenta</a>
          </div>
          <div th:unless="${#authorization.expression('isAuthenticated()')}">
            <a class="nav-link" th:href="@{/login}">Iniciar sesión</a>
          </div>
          <!--si ha iniciado sesion se muestra "mi cuenta, de lo contrario login"-->
        </li>
        <li sec:authorize="isAuthenticated()" class="nav-item active">
          <form th:action="@{/logout}" method="post" style="margin-block-end: 0px;">
            <a class="nav-link" href="javascript:;" onclick="parentNode.submit();">Cerrar sesión</a>
          </form>
          <!--solo se muestra si ha iniciado sesion-->
        </li>
      </ul>
    </div>
  </nav>
</body>
</html>