<html>

<head>
  <meta charset="UTF-8" />
  <link rel="stylesheet" href="/css/bootstrap-min.css" />
  <link rel="stylesheet" href="/css/entidades.css" />
  <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

  <title>Entidades</title>
</head>

<body class="container">

  <div th:replace="fragments/header :: header"></div>
  <div class="container">
    <h1 class="título">Entidades</h1>
    <hr>
    <form class="container alert alert-secondary" th:action="@{/entidades}" th:object="${entity}" method="POST"
      enctype="utf8">
      <div class="form-group">
        <label for="exampleFormControlInput1">Nombre:</label>
        <input type="text" class="form-control" id="nombre" th:field="*{nombre}">
      </div>
      <div class="form-group">
        <label for="exampleFormControlTextarea1">Descripción:</label>
        <textarea class="form-control" id="descripcion" rows="3" th:field="*{descripcion}"></textarea>
      </div>
      <div class="form-group boton-container">
        <button id="botonActualizar" type="submit" class="enviar btn btn-success bot-ocup">Crear Entidad</button>
      </div>
    </form>
    <div th:if="${errores == 0}" class="alert alert-success" role="alert">
      Entidad agredada correctamente
    </div>



    <div class="container">
      <div class="row fila1" th:each="entities: ${entities}">
        <div class="col-md-3 columna" th:text="${entities.nombre}"></div>
        <div class="col-md-8 columna" th:text="${entities.descripcion}"></div>
        <div class="col-md-1"><a href=""><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
        </div>
      </div>
    </div>
    <script src="/js/entidades.js"></script>
</body>

</html>