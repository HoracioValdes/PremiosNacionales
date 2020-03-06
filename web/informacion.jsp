<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : index
    Created on : 01-07-2018, 19:22:00
    Author     : Horacio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!--Import Google Icon Font-->
        <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>

        <!--favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="img/icono.ico" />
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Cartografía de Artistas</title>

        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>

        <!-- Hoja propia-->
        <link rel="STYLESHEET" type="text/css" href="css/estilos.css">

        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    </head>
    <%
        java.util.Calendar fecha = java.util.Calendar.getInstance();
    %>
    <body>
        <script type="text/javascript" src="js/materialize.min.js"></script>

        <div class="container">
            <!-- Caja del menú de navegación -->
            <div class="row">
                <nav style="height: 230px;">
                    <div class="nav-wrapper teal">
                        <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a>
                        <ul class="right hide-on-med-and-down" style="margin-top: 14%; margin-right: 10px;">
                            <li><a href="index.jsp">Juego</a></li>
                            <li><a href="instrucciones.jsp">Instrucciones</a></li>
                            <li><a href="informacion.jsp">Información</a></li>
                        </ul>
                        <ul class="sidenav" id="mobile-demo">
                            <li><a href="index.jsp">Juego</a></li>
                            <li><a href="instrucciones.jsp">Instrucciones</a></li>
                            <li><a href="informacion.jsp">Información</a></li>
                        </ul>
                    </div>
                </nav>
            </div>

            <div class="row">
                <div class="col s10 offset-s1 card-panel z-depth-5" style="margin-top: 50px; margin-bottom: 100px;">
                    <h4 style="margin: 15px; color: #3b6e80;">INFORMACIÓN</h4>
                    <br>
                    <br>
                    <p style="margin: 15px; color: #3b6e80; text-align: justify;">Cartografía de artistas es un juego didáctico elaborado a partir de información sobre los premios nacionales de Literatura, Artes Plásticas, Artes Musicales, y Artes de la Representación y Audiovisuales. Fue diseñado para ser usado con un grupo-curso en sesiones consecutivas y consiste en responder colectivamente preguntas abiertas que abordan aspectos socioculturales vinculados con la obra de los/as artistas representados/as. El juego avanza a medida que los/as estudiantes responden las preguntas, cuyas respuestas son coevaluadas por todo el curso y por el o la docente a cargo.</p>
                    <p style="margin: 15px; color: #3b6e80; text-align: justify;">El juego opera sobre la base de una gráfica digital interactiva que es posible recorrer de acuerdo con una programación que combina el azar, la selección y la interacción. Este "tablero" digital permite el acceso a preguntas en torno a los/as 136 artistas de las cuatro disciplinas premiadas. Estas preguntas han sido clasificadas por categorías que permiten abordar distintas áreas de interés cultural: sociedad y política, medioambiente, emociones, género, arte y patrimonio, derechos humanos, vida cotidiana, diversidad cultural y creatividad.</p>
                    <p style="margin: 15px; color: #3b6e80; text-align: justify;">El recurso está diseñado para que el o la docente genere una sesión de juego grupal que permite la interacción de todo el curso, organizado en grupos. Cada sesión, con un código único, es activada con una clave asignada por el o la docente, que permite dar acceso a todos/as los/as jugadores/as y mantener un juego único, con su propio historial de avance.</p>
                    <p style="margin: 15px; color: #3b6e80; text-align: justify;">La administración de cada juego es llevada por el o la docente mediante el uso de un computador estacionario, conectado a internet y a un sistema de proyección, que permita la visualización y el acceso por parte de todos/as los/as participantes a la información que ofrece el juego. Por su parte, los/as estudiantes pueden interactuar grupalmente mediante el uso de un tablet, smartphone o un computador.</p>
                    <p style="margin: 15px; color: #3b6e80; text-align: justify;">El juego ha sido diseñando para la interacción conjunta de seis grupos como máximo, los cuales, siguiendo los desafíos planteados en las preguntas desplegadas en el recurso, podrán formular y organizar sus respuestas, las que serán coevaluadas por su carácter original, su consistencia, su carga de humor, su aporte valórico u otro pará- metro propuesto de manera consensuada entre los/as estudiantes y el o la docente. La coevaluación corresponde a un puntaje acumulativo, que al final de cada sesión arrojará los resultados sobre la posición de los grupos. Cabe destacar que el proceso de coevaluación es netamente cualitativo y solo busca dinamizar de forma lúdica el avance en el proceso del juego. En este sentido, el grupo ganador es la expresión de un proceso participativo, cuyo valor mayor está en las discusiones previas que establecen los/as estudiantes antes de compartir sus respuestas.</p>
                    <p style="margin: 15px; color: #3b6e80; text-align: justify;">El juego propone niveles de complejidad en el tipo de pregunta o desafío. Por defecto, el juego se inicia en el Nivel 1 y avanza a medida que se superan las etapas; sin embargo, el o la docente puede determinar este avance, decidiendo mantener, adelantar o postergar cada nivel.</p>
                    <p style="margin: 15px; color: #3b6e80; text-align: justify;">Este recurso didáctico se propone como complemento al desarrollo de las clases de Artes Visuales, Música, Lenguaje y Comunicación e Historia, Geografía y Ciencias Sociales, correspondientes a los niveles de entre 7° básico y 2° medio (ver cruces curriculares), a la vez que constituye una posibilidad de uso del tiempo académico libre para la vinculación con contenidos de arte y literatura.</p>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                </div>
            </div>

            <footer class="page-footer teal">
                <div class="container">
                    <img src="img/LOGO_MINCAP.png" class="responsive-img" style="height: 20%; width: 20%;">
                    <div class="row">
                        <div>
                            <br/>
                            <h5 class="white-text">Créditos</h5>
                            <p class="grey-text text-lighten-4"><b>© Ministerio de las Culturas, las Artes y el Patrimonio</b></p>
                            <p class="grey-text text-lighten-4"><b>Dirección y coordinación del proyecto:</b> Alejandra Claro Eyzaguirre</p>
                            <p class="grey-text text-lighten-4"><b>Desarrollo de propuesta didáctica, guion de interacción y contenidos:</b> Alex Meza Cárdenas</p>
                            <p class="grey-text text-lighten-4"><b>Edición de textos y apoyo al desarrollo de contenidos:</b> Patricio González Ríos</p>
                            <p class="grey-text text-lighten-4"><b>Desarrollo informático:</b> Horacio Valdés Galaz</p>
                            <p class="grey-text text-lighten-4"><b>Diseño gráfico:</b> María de los Ángeles Vargas Torres</p>
                            <br/>
                        </div>
                    </div>
                </div>
                <div class="footer-copyright">
                    <div class="container">
                        © <%=fecha.get(java.util.Calendar.YEAR)%> Cartografía de Artistas
                    </div>
                </div>
            </footer>
        </div>
        <!--Import jQuery before materialize.js-->
        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script>
            // Initialize collapse button
            $(document).ready(function () {
                $('.sidenav').sidenav();
            });
        </script>
        <script type="text/javascript">
            function refrescar() {
                location.reload();
            }

            function validandoIngreso()
            {
                var nombreIngreso = document.getElementById("nombreIngreso").value;
                var claveIngreso = document.getElementById("claveIngreso").value;

                if (nombreIngreso == null || nombreIngreso.length == 0 || /^\s+$/.test(nombreIngreso)) {
                    M.toast({html: 'El campo que indica el nombre de usuario no puede estar vacío', classes: 'rounded'});
                    return false;
                } else if (nombreIngreso.length > 50) {
                    M.toast({html: 'El campo que indica el nombre de admin no puede tener más de 50 caracteres', classes: 'rounded'});
                    return false;
                } else if (claveIngreso == null || claveIngreso.length == 0 || /^\s+$/.test(claveIngreso)) {
                    M.toast({html: 'El campo que indica la clave no puede estar vacío', classes: 'rounded'});
                    return false;
                } else if (claveIngreso.length > 20) {
                    M.toast({html: 'El campo que indica la contraseña no puede tener más de 20 caracteres', classes: 'rounded'});
                    return false;
                }
                return true;
            }
        </script>
    </body>
</html>
