<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/css/bootstrap-min.css" />
    <link rel="stylesheet" href="/css/experiencias.css" />
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <title>Experiencias</title>
  </head>
  <body>
    <div th:replace="fragments/header :: header"></div>
    <div class="container">
      <form th:action="@{/experiencias}" method="GET" enctype="utf8">
        <button class="btn btn-success" type="submit">Crear Nueva Experiencia</button>
      </form>
    </div>
    <div class="container">
      <hr/>
      <div class="row" th:each="entity: ${listEntity}">
        <div class="">

        </div>
      </div>
    </div>
  </body>
</html>
