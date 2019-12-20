<%@page import="cl.modelo.Admin"%>
<%@page import="cl.modelo.SesionesJuego"%>
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

        <script src="./js/xlsx.full.min.js"></script>
        <script src="./js/FileSaver.min.js"></script>
        <script src="./js/tableexport.min.js"></script>

    </head>
</head>
<%
    Admin admin = (Admin) session.getAttribute("adminValido");
%>
<body onload="cargarSesiones();">
    <script type="text/javascript" src="js/materialize.min.js"></script>

    <div class="container">
        <% if (admin != null) {%>
        <!-- Caja del menú de navegación -->
        <div class="row">
            <nav>
                <div class="nav-wrapper">
                    <a href="index.jsp" class="brand-logo center">Cartografía de Artistas</a>
                    <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
                    <ul class="right hide-on-med-and-down">
                        <li><a href="cerrar.jsp">Salir</a></li>
                    </ul>
                    <ul class="side-nav" id="mobile-demo">
                        <li><a href="cerrar.jsp">Salir</a></li>
                    </ul>
                </div>
            </nav>
        </div>

        <div class="row">
            <div class="card-panel z-depth-5">
                <h4 style="margin: 15px;">Lista de Sesiones Registradas en el Juego</h4>
                <p style="margin: 15px;">Puede descargar el listado en un documento Excel.</p>

                <a class="waves-effect waves-light btn-small" id="btnExportar" style="margin: 30px;"><i class="material-icons left">archive</i>Exportar</a>

                <table class="responsive-table bordered" id="tabla">
                    <thead>
                        <tr>
                            <th>Id de sesión</th>
                            <th>Nombre de docente</th>
                            <th>Correo de docente</th>
                            <th>Asignatura</th>
                            <th>Institución</th>
                            <th>Comuna</th>
                            <th>Estado de sesión</th>
                        </tr>
                    </thead>
                    <tbody id="registros">

                    </tbody>
                </table>

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

        <% } else { %>
        <div class="row">
            <div class="col s12">
                <h3>Debes ingresar para acceder a la sesión de administración.</h3>
                <a href="index.jsp">Ir al acceso</a>
            </div>
        </div>
        <% }%>

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
    <script>
        const $btnExportar = document.querySelector("#btnExportar"),
                $tabla = document.querySelector("#tabla");

        $btnExportar.addEventListener("click", function () {
            let tableExport = new TableExport($tabla, {
                exportButtons: false, // No queremos botones
                filename: "Sesiones de Cartografía de Artistas", //Nombre del archivo de Excel
                sheetname: "Sesiones", //Título de la hoja
            });
            let datos = tableExport.getExportData();
            let preferenciasDocumento = datos.tabla.xlsx;
            tableExport.export2file(preferenciasDocumento.data, preferenciasDocumento.mimeType, preferenciasDocumento.filename, preferenciasDocumento.fileExtension, preferenciasDocumento.merges, preferenciasDocumento.RTL, preferenciasDocumento.sheetname);
        });
    </script>
    <script type="text/javascript">
        function cargarSesiones() {

            var xmlhttp = new XMLHttpRequest();
            var url = "http://localhost/juego/registroJuego.php/?opcion=45";
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                    var array = JSON.parse(xmlhttp.responseText);

                    if (array.length > 0) {

                        var contenedor = document.getElementById('registros');
                        contenedor.innerHTML = "";
                        for (i = 0; i < array.length; i++) {

                            contenedor.innerHTML += "<tr><td>" + array[i].ID_SESION + "</td><td>" + array[i].NOMBRE + "</td><td>" + array[i].CORREO + "</td><td>" + array[i].DESCRIPCION + "</td><td>" + array[i].INSTITUCION + "</td><td>" + array[i].COMUNA + "</td><td>" + array[i].ESTADO + "</td></tr>";
                        }


                    } else {
                        Materialize.toast('No hay sesiones ingresadas', 4000);
                    }


                }
            }
            xmlhttp.open("GET", url, true);
            xmlhttp.send();
        }
    </script>
</body>
</html>
