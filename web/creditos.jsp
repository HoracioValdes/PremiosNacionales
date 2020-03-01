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
                    <h4 style="margin: 15px; color: #1a237e;">CRÉDITOS</h4>
                    <br>
                    <br>
                    <p style="margin: 15px; color: #1a237e;">Publicación a cargo de</p>                                       
                    <p style="margin: 15px; color: #1a237e;"><b>Beatriz González Fulle (Ministerio de las Culturas)</b></p> 
                    <br>
                    <p style="margin: 15px; color: #1a237e;">Dirección y producción editorial</p>                                       
                    <p style="margin: 15px; color: #1a237e;"><b>Alejandra Claro Eyzaguirre (Ministerio de las Culturas)</b></p>
                    <br>
                    <p style="margin: 15px; color: #1a237e;">Desarrollo de propuesta didáctica, guión de interacción y contenidos</p>                                       
                    <p style="margin: 15px; color: #1a237e;"><b>Alex Meza Cárdenas</b></p>
                    <br>
                    <p style="margin: 15px; color: #1a237e;">Investigación y contenidos biográficos</p>                                       
                    <p style="margin: 15px; color: #1a237e;"><b>Valeska Navea Castro</b></p>    
                    <p style="margin: 15px; color: #1a237e;"><b>Daniela Antivilo Frutos</b></p>    
                    <p style="margin: 15px; color: #1a237e;"><b>Patricio González Ríos</b></p>
                    <br>
                    <p style="margin: 15px; color: #1a237e;">Desarrollo informático</p>                                       
                    <p style="margin: 15px; color: #1a237e;"><b>Horacio Valdés Galaz</b></p>
                    <br>
                    <p style="margin: 15px; color: #1a237e;">Edición y corrección de estilo</p>                                       
                    <p style="margin: 15px; color: #1a237e;"><b>Patricio González Ríos</b></p>
                    <br>
                    <p style="margin: 15px; color: #1a237e;">Diseño y diagramación</p>                                       
                    <p style="margin: 15px; color: #1a237e;"><b>María de los Ángeles Vargas Torres</b></p> 
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
