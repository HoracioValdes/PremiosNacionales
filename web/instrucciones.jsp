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
                        <ul class="right hide-on-med-and-down" style="margin-top: 15%; margin-right: 10px;">
                            <li><a href="index.jsp">Juego</a></li>
                            <li><a href="instrucciones.jsp">Instrucciones</a></li>
                            <li><a href="creditos.jsp">Creditos</a></li>
                        </ul>
                        <ul class="sidenav" id="mobile-demo">
                            <li><a href="index.jsp">Juego</a></li>
                            <li><a href="instrucciones.jsp">Instrucciones</a></li>
                            <li><a href="creditos.jsp">Creditos</a></li>
                        </ul>
                    </div>
                </nav>
            </div>

            <div class="row">
                <div class="col s10 offset-s1 card-panel z-depth-5" style="margin-top: 50px; margin-bottom: 100px;">
                    <h4 style="margin: 15px; color: #1a237e;">INSTRUCCIONES</h4>
                    <br>
                    <br>
                    <p style="margin: 15px; color: #1a237e;"><b>Cómo jugar paso a paso.</b></p>
                    <br>
                    <ol style='text-align: justify;text-justify: inter-word; margin: 10px;'>
                        <li value='1'>Los/as estudiantes deberán contar con un dispositivo conectado a la misma plataforma de juego <b>www.cartografiadeartistas.gob.cl</b> e ingresar la clave creada por el o la docente. El sistema le asignará aleatoriamente un número de grupo.</li>
                        <br>
                        <li>El equipo que inicia el juego debe presionar el dado animado que se visualiza en la pantalla. Por azar será redirigido aleatoriamente a una de las categorías de los premios nacionales: Artes Plásticas, Artes Musicales, Literatura o Artes de la Representación y Audiovisuales.</li>
                        <br>
                        <li>Una vez en la categoría asignada, el equipo siguiente deberá presionar el dado en su dispositivo, siendo redirigido aleatoriamente a una subcategoría temática: Sociedad y Política, Medioambiente, Emociones, Género, Arte y Patrimonio, Derechos Humanos, Vida cotidiana, Diversidad cultural y Creatividad.</li>
                        <br>
                        <li>De los/as artistas disponibles en la subcategoría, se deberá escoger una opción, la que será activada por el o la docente presionando sobre el nombre seleccionado.</li>
                        <br>
                        <li>Se desplegará una pregunta o desafío vinculado al artista, acompañado de una breve contextualización. Esta pregunta o desafío debe ser resuelta por todos los equipos a la vez, los que tienen que utilizar su dispositivo para escribir las respuestas y luego presionar el botón Enviar.</li>
                        <br>
                        <li>Una vez enviadas las respuestas, estas podrán visualizarse en la proyección central. Para esto, el o la docente debe presionar el botón Obtener respuesta.</li>
                        <br>
                        <li>El o la docente debe presionar el botón Evaluar para que cada grupo evalúe con un puntaje a los demás grupos.</li>
                        <br>
                        <li>Los/as estudiantes podrán visualizar en sus dispositivos una pantalla de evaluación, donde deberán evaluar de 1 a 10 las respuestas de sus compañeros/as. Asimismo, el o la docente debe evaluar cada una de las respuestas.</li>
                        <br>
                        <li>Realizadas las evaluaciones, el o la docente debe presionar nuevamente el botón Ver resultados de la aplicación. En ese momento, la proyección central mostrará los puntajes de cada grupo.</li>
                        <br>
                        <li>Al finalizar la evaluación, el o la docente debe presionar el botón Cerrar Desafío. Se reiniciará el juego en la selección aleatoria de categoría (punto 3), dando la alternativa de interactuar al grupo siguiente.</li>
                        <br>
                        <li>Al terminar un nivel completo de juego, el o la docente debe presionar el botón Cerrar Nivel. El sistema guardará todos los datos y automáticamente pasará al nivel siguiente.</li>
                        <br>
                        <li>Al terminar los tres niveles de juego, el o la docente debe presionar el botón Cerrar Juego.</li>
                        <br>
                        <li><a href="recursos/Premios_nacionales_web.pdf" target="_blank"><b>Puedes descargar el material educativo complementario clickeando acá.</b></a></li>
                    </ol>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                </div>
            </div>

            <footer class="page-footer teal">
                <div class="container">
                    <img src="img/monocromo Blanco_MCAP.png" class="responsive-img" style="height: 20%; width: 20%;">
                    <div class="row">
                        <div class="col l6 s12">
                            <h5 class="white-text">Contáctanos</h5>
                            <p class="grey-text text-lighten-4">Envíanos tus sugerencias o comentarios a <a href="mailto:contacto@cartografiadeartistas.gob.cl" style="color: #ffff00">contacto@cartografiadeartistas.gob.cl</a></p>
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
