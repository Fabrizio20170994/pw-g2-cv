<%@ page contentType="text/html; charset=UTF-8" %>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/css/bootstrap-min.css" />
    <link rel="stylesheet" href="/css/cv.css" />
    <title>CV</title>
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
          <li class="nav-item">
            <a class="nav-link" href="/experiencias">Experiencia</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/formacion">Formación</a>
          </li>
          <li class="nav-item active">
            <a class="nav-link" href="/cv">CV</a>
          </li>
          <li class="nav-item active">
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
    <main class="container">
      <h1>CURRICULUM VITAE</h1>
      <div id="encabezado" class="rubro">
        <h2>Juan Perez</h2>
        <p>Correo: juanperez2000@gmail.com</p>
        <p>LinkedIn: https://pe.linkedin.com/in/jorgeperez</p>
        <p>Número: 963456355</p>
      </div>
      <div id="posicionamiento" class="rubro">
        <p>
          Posicionamiento del profesional Lorem ipsum dolor sit amet,
          consectetur adipiscing elit. Donec eleifend efficitur pellentesque.
          Cras vulputate porta metus, id egestas risus efficitur at. Phasellus
          gravida risus non consequat scelerisque. Duis at tincidunt urna. In
          pellentesque purus id purus auctor lacinia. Quisque sit amet urna
          diam. Donec cursus consectetur vestibulum. Fusce scelerisque purus in
          magna fermentum condimentum.
        </p>
      </div>
      <div id="experiencia-laboral" class="rubro">
        <h3>Experiencia Laboral</h3>
        <div class="experiencia">
          <div class="empresa">
            <h4>Google</h4>
            <div>
              Aenean sagittis at ante scelerisque commodo. Etiam efficitur purus
              ut magna sagittis dictum nec dignissim eros. Vivamus tempus
              sagittis erat blandit bibendum. Gnean sagittis at ante scelerisque
              commodo. s pretium enim in ultrices.
            </div>
          </div>
          <div class="puesto">
            <div>Supervisor TI</div>
            <div>2018-2020</div>
          </div>
          <div class="logro">
            <div>Resultado</div>
            <div>Acción</div>
          </div>
        </div>
        <div class="experiencia">
          <div class="empresa">
            <h4>Facebook</h4>
            <div>
              Praesent efficitur nibh non odio posuere gravida. Nunc sem risus,
              molestie vitae eros ac, suscipit elementum metus. Curabitur eget
              maximus lorem. Integer quis porttitor dui.
            </div>
          </div>
          <div class="puesto">
            <div>Programador</div>
            <div>2014-2018</div>
          </div>
          <div class="logro">
            <div>Resultado</div>
            <div>Acción</div>
          </div>
        </div>
      </div>
      <div id="actividades" class="rubro">
        <h3>Otras Actividades</h3>
        <p>Natación y Fútbol</p>
      </div>
      <div id="estudios" class="rubro">
        <h3>Estudios / Cursos y Seminarios</h3>
        <p>Master of Business Administration - M.B.A. EDHEC BUSINESS SCHOOL</p>
        <p>Ingeniero de Sistemas - Univerisdad de Lima</p>
        <p>"Ethical Hacking", 2015</p>
      </div>
      <div id="datos-personales" class="rubro">
        <h3>Datos Personales</h3>
        <p>Bilingûe: Inglés y Español</p>
        <p>Dominio de idioma Alemán</p>
      </div>
    </main>
  </body>
</html>
