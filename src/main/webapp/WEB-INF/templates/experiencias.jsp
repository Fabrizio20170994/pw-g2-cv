<%@ page contentType="text/html; charset=UTF-8" %>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/css/bootstrap-min.css" />
    <link rel="stylesheet" href="/css/experiencias.css" />
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <title>Entidades</title>
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
          <li class="nav-item active">
            <a class="nav-link" href="/experiencias">Experiencia</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/formacion">Formación</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/cv">CV</a>
          </li>
          <li class="nav-item">
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
  </div>
    <div class="container">
      <h1 class="título">Experiencias</h1>
      <div class="col-md-12">Ocultar/Mostrar tablas de actualizar      <a href=""><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
      </form>
      <div class="container">
        <div class="row fila1">
          <!--entidades-->
          <div class="col-md-5">Nombre de Profesional</div>
          <input class="col-md-6"></input>
          <div class="col-md-1"></div>
          <div class="col-md-12">.</div>
          <div class="col-md-5">
            <select name="Ocupaciones">
              <option>Ocupacion 1</option>
              <option>Ocupacion 2</option>
              <option>Ocupacion 3</option>
            </select>
          </div>
          <div class="col-md-4">
              <select name="Años">
                <option>1980</option>
                <option>1981</option>
                <option>...</option>
              </select>
          </div>
          <div class="col-md-3"><button type="button">Buscar</button></div>
        </div>
        <div class="row">
            <div class="col fila">
              <img src="https://www.google.com/imgres?imgurl=https%3A%2F%2Flookaside.fbsbx.com%2Flookaside%2Fcrawler%2Fmedia%2F%3Fmedia_id%3D126341370850041&imgrefurl=https%3A%2F%2Fes-la.facebook.com%2FGon-Freecss-%25E3%2582%25B4%25E3%2583%25B3%25E3%2583%2595%25E3%2583%25AA%25E3%2583%25BC%25E3%2582%25AF%25E3%2582%25B9-Hunter-X-Hunter-126341370850041%2Fabout%2F&tbnid=jF6ZlklyCpNXKM&vet=12ahUKEwiEpN-BqJzqAhUmazABHT-zBm8QMygZegUIARD2AQ..i&docid=2V_iJ0AlWDkiZM&w=640&h=480&q=hunter%20x%20hunter%20gon&ved=2ahUKEwiEpN-BqJzqAhUmazABHT-zBm8QMygZegUIARD2AQ">
              <div class="col-md-4"><p>Entidad 1</p></div>
              <div class="col-md-2"><p>Ocupacion_1</p></div>
              <div class="col-md-8"><p>Accion: Crea el pudin</p></div>
              <div class="col-md-6"><p>Logro: Novel</p></div>
              <form class="container alert alert-info">
                <div class="form-group">
                  <div for="exampleFormControlInput1">Experiencia:</div>
                  <select name="Añadir">
                    <option>Actualizar</option>
                    <option>Agregar</option>
                  </select>
                </div>
                <div class="form-group">
                  <label for="exampleFormControlTextarea1">Accion:</label>
                  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                </div>
                <div class="form-group">
                  <label for="exampleFormControlTextarea1">Logro:</label>
                  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                </div>
                <div class="form-group boton-container">
                  <button type="submit" class="enviar btn btn-info bot-ocup" disabled>Actualizar</button>
                </div>
              </form>
            </div>
            <div class="col fila">
              <img src="https://www.google.com/imgres?imgurl=https%3A%2F%2Flookaside.fbsbx.com%2Flookaside%2Fcrawler%2Fmedia%2F%3Fmedia_id%3D126341370850041&imgrefurl=https%3A%2F%2Fes-la.facebook.com%2FGon-Freecss-%25E3%2582%25B4%25E3%2583%25B3%25E3%2583%2595%25E3%2583%25AA%25E3%2583%25BC%25E3%2582%25AF%25E3%2582%25B9-Hunter-X-Hunter-126341370850041%2Fabout%2F&tbnid=jF6ZlklyCpNXKM&vet=12ahUKEwiEpN-BqJzqAhUmazABHT-zBm8QMygZegUIARD2AQ..i&docid=2V_iJ0AlWDkiZM&w=640&h=480&q=hunter%20x%20hunter%20gon&ved=2ahUKEwiEpN-BqJzqAhUmazABHT-zBm8QMygZegUIARD2AQ">
              <div class="col-md-4"><p>Entidad 2</p></div>
              <div class="col-md-2"><p>Ocupacion_2</p></div>
              <div class="col-md-8"><p>Accion: hongear pan</p></div>
              <div class="col-md-6"><p>Logro: penicilina</p></div>
              <form class="container alert alert-info">
                <div class="form-group">
                  <div for="exampleFormControlInput1">Experiencia:</div>
                  <select name="Añadir">
                    <option>Actualizar</option>
                    <option>Agregar</option>
                  </select>
                </div>
                <div class="form-group">
                  <label for="exampleFormControlTextarea1">Accion:</label>
                  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                </div>
                <div class="form-group">
                  <label for="exampleFormControlTextarea1">Logro:</label>
                  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                </div>
                <div class="form-group boton-container">
                  <button type="submit" class="enviar btn btn-info bot-ocup" disabled>Actualizar</button>
                </div>
              </form>
            </div>
            <div class="col fila">
              <img src="https://www.google.com/imgres?imgurl=https%3A%2F%2Flookaside.fbsbx.com%2Flookaside%2Fcrawler%2Fmedia%2F%3Fmedia_id%3D126341370850041&imgrefurl=https%3A%2F%2Fes-la.facebook.com%2FGon-Freecss-%25E3%2582%25B4%25E3%2583%25B3%25E3%2583%2595%25E3%2583%25AA%25E3%2583%25BC%25E3%2582%25AF%25E3%2582%25B9-Hunter-X-Hunter-126341370850041%2Fabout%2F&tbnid=jF6ZlklyCpNXKM&vet=12ahUKEwiEpN-BqJzqAhUmazABHT-zBm8QMygZegUIARD2AQ..i&docid=2V_iJ0AlWDkiZM&w=640&h=480&q=hunter%20x%20hunter%20gon&ved=2ahUKEwiEpN-BqJzqAhUmazABHT-zBm8QMygZegUIARD2AQ">
              <div class="col-md-4"><p>Entidad 3</p></div>
              <div class="col-md-2"><p>Ocupacion_3</p></div>
              <div class="col-md-8"><p>Accion: Leche putrefacta</p></div>
              <div class="col-md-8"><p>Logro: Nace el yougur</p></div>
              <form class="container alert alert-info">
                <div class="form-group">
                  <div for="exampleFormControlInput1">Experiencia:</div>
                  <select name="Añadir">
                    <option>Actualizar</option>
                    <option>Agregar</option>
                  </select>
                </div>
                <div class="form-group">
                  <label for="exampleFormControlTextarea1">Accion:</label>
                  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                </div>
                <div class="form-group">
                  <label for="exampleFormControlTextarea1">Logro:</label>
                  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                </div>
                <div class="form-group boton-container">
                  <button type="submit" class="enviar btn btn-info bot-ocup" disabled>Actualizar</button>
                </div>
              </form>
            </div>
        </div>
      </div>
      <nav aria-label="Page navigation example">
        <ul class="pagination">
          <li class="page-item"><a class="page-link" href="#">Anterior</a></li>
          <li class="page-item"><a class="page-link" href="#">1</a></li>
          <li class="page-item"><a class="page-link" href="#">2</a></li>
          <li class="page-item"><a class="page-link" href="#">3</a></li>
          <li class="page-item"><a class="page-link" href="#">Siguiente</a></li>
        </ul>
      </nav>
  </body>
</html>
