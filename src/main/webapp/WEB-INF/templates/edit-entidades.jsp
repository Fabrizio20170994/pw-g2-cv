<html>

<head>
  <meta charset="UTF-8" />
  <link rel="stylesheet" href="/css/bootstrap-min.css" />
  <link rel="stylesheet" href="/css/entidades.css" />
  <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

  <title>Editar Entidad</title>
</head>

<body>

  <div th:replace="fragments/header :: header"></div>
  <div class="container">
    <h1 class="título">Editar Entidad</h1>
    <hr>
    <div class="container alert alert-secondary">
    <form th:action="@{'/entidades/edit/'+${id}}" method="POST"
      enctype="utf8" th:object="${entity}">
      <div class="form-group">
        <label for="exampleFormControlInput1">Nombre:</label>
        <input type="text" class="form-control" id="nombre" th:value="${entity.nombre}" th:field="*{nombre}">
      </div>
      <div class="form-group">
        <label for="exampleFormControlTextarea1">Descripción:</label>
        <textarea class="form-control" id="descripcion" rows="3" th:value="${entity.descripcion}"th:field="*{descripcion}"></textarea>
      </div>
      <div class="form-group boton-container">
        <button id="botonActualizar" type="submit"class="enviar btn btn-success bot-ocup">Validar</button>


      </div>
    </form>
    <form class="container botonVolver " th:action="@{/entidades}" method="GET"
    enctype="utf8">
    <button type="submit" class="btn btn-danger bot-ocup">Volver</button>
  </form>
</div>

</body>

</html>