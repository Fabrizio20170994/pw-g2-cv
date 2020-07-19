<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/experiencias.css" />
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <title>Experiencias</title>
  </head>
  <body>
    <div th:replace="fragments/header :: header"></div>
    <div class="container espacioArriba">
      <form th:action="@{/experiencias}" method="GET" enctype="utf8">
        <button class="btn btn-success" type="submit">Crear Nueva Experiencia</button>
      </form>
    </div>
    <div class="container espacioArriba">
      <hr/>
        <div class="row fila" th:each="ent: ${listaEntidades}" th:text="${ent.nombre}">
          <div class="col fila" th:each="ocu: ${listaOcupaciones}" th:text="${ocu.nombre}">
            <div class="col fila" th:each="exp: ${listaExperiencias}" th:text="@{exp.logro}">
            </div>
          </div>
        </div>
    </div>
  </body>
</html>
