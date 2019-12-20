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

        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

        <script>
            var array = '';
            var arrayAsignatura = '';
            var arrayComuna = '';
            var correoRegistrado = '';
            var claveRegistrada = '';
            var numeroSesion = '';

            function recibirData() {
                var dataSucia = '${msg}';
                var data = dataSucia.substring(36);
                correoRegistrado = '${correo}';
                claveRegistrada = '${clave}';
                numeroSesion = '${numeroSesion}';
                //alert(data);

                if (data.length > 0) {
                    agregarBotonSesionRojo(data);
                }
            }
        </script>
    </head>
    <body onload="recibirData();">
        <script type="text/javascript" src="js/materialize.min.js"></script>

        <div class="container">
            <!-- Caja del menú de navegación -->
            <div class="row">
                <nav>
                    <div class="nav-wrapper">
                        <a href="index.jsp" class="brand-logo center">Cartografía de Artistas</a>
                        <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
                        <ul class="right hide-on-med-and-down">
                            <li><a href="index.jsp">Cartografía</a></li>
                            <li><a href="admin.jsp">Admin</a></li>
                        </ul>
                        <ul class="side-nav" id="mobile-demo">
                            <li><a href="index.jsp">Cartografía</a></li>
                            <li><a href="admin.jsp">Admin</a></li>
                        </ul>
                    </div>
                </nav>
            </div>

            <div class="red-text center-align">
                <p class="flow-text">${requestScope.msgDos}</p>
            </div>

            <div class="row">
                <div class="col s10 offset-s1 card-panel z-depth-5">
                    <h4 style="margin: 15px;">Datos de ingreso necesarios</h4>
                    <p style="margin: 15px;">Ingrese su correo y la contraseña.</p>
                    <form class="cols10" action="ingreso.do" style="margin: 30px;">
                        <input placeholder="Ingrese el nombre de admin" id="nombreIngreso" name="nombreIngreso" type="text" class="validate">
                        <label for="nombreIngreso">Correo</label>
                        <input placeholder="Ingrese la contraseña" id="claveIngreso" name="claveIngreso" type="password" class="validate">
                        <label for="claveIngreso">Contraseña</label>
                        <div class="row" style="margin-top: 40px;">
                            <button class="btn waves-effect blue lighten-1" type="submit" name="action" onclick="return validandoIngreso();">Ingresar
                                <i class="material-icons right">send</i>
                            </button>
                        </div>
                    </form>
                </div>
            </div>

            <footer class="page-footer blue darken-3">
                <div class="container">
                    <div class="row">
                        <div class="col l6 s12">
                            <h5 class="white-text">Contáctanos</h5>
                            <p class="grey-text text-lighten-4">Envíanos tus sugerencias o comentarios a <a href="mailto:horacio_valdes@hotmail.com" style="color: #ffff00">horacio_valdes@hotmail.com</a></p>
                        </div>
                    </div>
                </div>
                <div class="footer-copyright">
                    <div class="container">
                        © 2018 Juego Premios Nacionales
                    </div>
                </div>
            </footer>
        </div>
        <!--Import jQuery before materialize.js-->
        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script>

        </script>
        <script>
            $(document).ready(function () {
                $('.modal').modal({
                    dismissible: false
                });
            });
        </script>
        <script>
            // Initialize collapse button
            $(".button-collapse").sideNav();
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
                    Materialize.toast('El campo que indica el correo no puede estar vacío', 4000);
                    return false;
                } else if (nombreIngreso.length > 50) {
                    Materialize.toast('El campo que indica el nombre de admin no puede tener más de 50 caracteres', 4000);
                    return false;
                } else if (claveIngreso == null || claveIngreso.length == 0 || /^\s+$/.test(claveIngreso)) {
                    Materialize.toast('El campo que indica la clave no puede estar vacío', 4000);
                    return false;
                } else if (claveIngreso.length > 20) {
                    Materialize.toast('El campo que indica la contraseña no puede tener más de 20 caracteres', 4000);
                    return false;
                }
                return true;
            }
        </script>
    </body>
</html>
