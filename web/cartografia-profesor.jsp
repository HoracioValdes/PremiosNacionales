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
        <title>Juego de Premios Nacionales</title>
    </head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <body id="myDiv" onload="recibirDatos(), centrarMapa()" style="background: url('img/MAPA.jpg'); background-repeat: no-repeat; width: 100%; height: 100%;
          -webkit-transition:background-position .20s ease-in;  
          -moz-transition:background-position .20s ease-in;  
          -o-transition:background-position .20s ease-in;  
          transition:background-position .20s ease-in; ">
        <div class="container">

            <nav>
                <div class="nav-wrapper blue darken-3">
                    <a href="#" class="brand-logo" style="margin-left: 10px;">Premios Nacionales</a>
                </div>
            </nav>

            <div>
                <div class="col s8 offset-s4 card-panel #3949ab indigo darken-1"> 
                    <h5 id="subtematica" align="center" style="color: #ffffff"></h5>
                </div>
            </div>

            <div class="row">
                <div class="col s10 offset-s1">
                    <div class="center" id="artistas" style="margin-top: 45px; margin-bottom: 45px;">

                    </div>
                </div>
            </div>

            <div class="col s6 offset-s4">
                <div class="blue-text center-align" style="position:fixed; bottom:0; margin-bottom: 50px; margin-left: 50px;">
                    <button id="botonLanzar" style="margin-top: 10px;" class="btn waves-effect blue lighten-1" type="submit" name="action" onclick="return obtenerLanzamiento();">Obtener Lanzamientos
                        <i class="material-icons right">loop</i>
                    </button>
                </div>
            </div>
        </div>
        <!--Import jQuery before materialize.js-->
        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script>
                        $(function () {

                            $(".button-collapse").sideNav();
                        });
        </script>
        <script>
            var premio = 0;
            var subtematica = 0;

            function centrarMapa() {
                document.getElementById("myDiv").style.backgroundPosition = "left top";
            }

            function obtenerLanzamiento()
            {
                if (estado_sesion == 'ABIERTA') {

                    var xmlhttp = new XMLHttpRequest();
                    var url = 'http://premios-nacionales.desarrollo-tecnologico.com/juego/registroJuego.php/?opcion=9&numero_equipo=' + 1 + '&id_sesion=' + id_sesion;

                    xmlhttp.onreadystatechange = function () {
                        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                            var array = JSON.parse(xmlhttp.responseText);
                            //alert(array);

                            if (array.length > 0) {

                                premio = array[0].VALOR;
                                // alert('premio: ' + premio);
                                cargarMapa(premio);

                                var xmlhttpDos = new XMLHttpRequest();
                                var urlDos = 'http://premios-nacionales.desarrollo-tecnologico.com/juego/registroJuego.php/?opcion=9&numero_equipo=' + 2 + '&id_sesion=' + id_sesion;

                                xmlhttpDos.onreadystatechange = function () {
                                    if (xmlhttpDos.readyState == 4 && xmlhttpDos.status == 200) {
                                        var array = JSON.parse(xmlhttpDos.responseText);
                                        //alert(array);

                                        subtematica = array[0].VALOR;
                                        // alert('subtematica: ' + subtematica);
                                        
                                        //document.getElementById("myDiv").style.backgroundImage = "url('img/grilla.jpg')";
                                        obtenerSubtematicas(premio);
                                    }
                                }
                                xmlhttpDos.open("GET", urlDos, true);
                                xmlhttpDos.send();

                            } else {
                                Materialize.toast('Los equipos aún no han realizado el lanzamiento de dados', 4000);
                            }
                        }
                    }
                    xmlhttp.open("GET", url, true);
                    xmlhttp.send();

                } else if (estado_sesion == 'SEGUNDA') {

                    var xmlhttp = new XMLHttpRequest();
                    var url = 'http://premios-nacionales.desarrollo-tecnologico.com/juego/registroJuego.php/?opcion=9&numero_equipo=' + 3 + '&id_sesion=' + id_sesion;

                    xmlhttp.onreadystatechange = function () {
                        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                            var array = JSON.parse(xmlhttp.responseText);
                            //alert(array);

                            if (array.length > 0) {

                                premio = array[0].VALOR;
                                // alert('premio: ' + premio);
                                cargarMapa(premio);

                                var xmlhttpDos = new XMLHttpRequest();
                                var urlDos = 'http://premios-nacionales.desarrollo-tecnologico.com/juego/registroJuego.php/?opcion=9&numero_equipo=' + 4 + '&id_sesion=' + id_sesion;

                                xmlhttpDos.onreadystatechange = function () {
                                    if (xmlhttpDos.readyState == 4 && xmlhttpDos.status == 200) {
                                        var array = JSON.parse(xmlhttpDos.responseText);
                                        //alert(array);

                                        subtematica = array[0].VALOR;
                                        // alert('subtematica: ' + subtematica);
                                        
                                        //document.getElementById("myDiv").style.backgroundImage = "url('img/grilla.jpg')";
                                        obtenerSubtematicas(premio);
                                    }
                                }
                                xmlhttpDos.open("GET", urlDos, true);
                                xmlhttpDos.send();

                            } else {
                                Materialize.toast('Los equipos aún no han realizado el lanzamiento de dados', 4000);
                            }
                        }
                    }
                    xmlhttp.open("GET", url, true);
                    xmlhttp.send();

                } else if (estado_sesion == 'TERCERA') {

                    var xmlhttp = new XMLHttpRequest();
                    var url = 'http://premios-nacionales.desarrollo-tecnologico.com/juego/registroJuego.php/?opcion=9&numero_equipo=' + 5 + '&id_sesion=' + id_sesion;

                    xmlhttp.onreadystatechange = function () {
                        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                            var array = JSON.parse(xmlhttp.responseText);
                            //alert(array);

                            if (array.length > 0) {

                                premio = array[0].VALOR;
                                // alert('premio: ' + premio);
                                cargarMapa(premio);

                                var xmlhttpDos = new XMLHttpRequest();
                                var urlDos = 'http://premios-nacionales.desarrollo-tecnologico.com/juego/registroJuego.php/?opcion=9&numero_equipo=' + 6 + '&id_sesion=' + id_sesion;

                                xmlhttpDos.onreadystatechange = function () {
                                    if (xmlhttpDos.readyState == 4 && xmlhttpDos.status == 200) {
                                        var array = JSON.parse(xmlhttpDos.responseText);
                                        //alert(array);

                                        subtematica = array[0].VALOR;
                                        //alert('subtematica: ' + subtematica);
                                        
                                        //document.getElementById("myDiv").style.backgroundImage = "url('img/grilla.jpg')";
                                        obtenerSubtematicas(premio);
                                    }
                                }
                                xmlhttpDos.open("GET", urlDos, true);
                                xmlhttpDos.send();

                            } else {
                                Materialize.toast('Los equipos aún no han realizado el lanzamiento de dados', 4000);
                            }
                        }
                    }
                    xmlhttp.open("GET", url, true);
                    xmlhttp.send();

                }
            }

            function cargarSubtematica() {
                //alert('Carga de subtemática');
                document.getElementById("dado").style.height = "0px";
                obtenerSubtematicas(premio);
            }

            function cargarMapa(premio) {
                // alert(posicion);
                if (premio === 4) {
                    document.getElementById("myDiv").style.backgroundPosition = "right 70%";
                } else if (premio === 3) {
                    document.getElementById("myDiv").style.backgroundPosition = "left 70%";
                } else if (premio === 2) {
                    document.getElementById("myDiv").style.backgroundPosition = "right top";
                } else if (premio == 1) {
                    document.getElementById("myDiv").style.backgroundPosition = "center 37%";
                }
            }

            function obtenerSubtematicas(premio) {
                //alert('obteniendo subtemáticas');
                //alert('premio: ' + premio);

                var xmlhttp = new XMLHttpRequest();
                var url = 'http://premios-nacionales.desarrollo-tecnologico.com/juego/registroJuego.php/?opcion=2&id_premio=' + premio;

                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        var array = JSON.parse(xmlhttp.responseText);
                        //alert(array);

                        //Elección aleatoria de subtemática
                        var subtematicaAzar = Math.floor((Math.random() * (array.length - 1)) + 1);
                        //alert(subtematicaAzar);
                        //alert(array[subtematicaAzar - 1].DESCRIPCION_SUBTEMATICA);
                        document.getElementById('subtematica').innerHTML = array[subtematicaAzar - 1].DESCRIPCION_SUBTEMATICA;
                        obtenerArtistas(array[subtematicaAzar - 1].ID_SUBTEMATICA)
                    }
                }
                xmlhttp.open("GET", url, true);
                xmlhttp.send();
            }

            function obtenerArtistas(id_subtematica) {
                //alert('obteniendo artistas');
                //alert('id subtematica: ' + id_subtematica);

                var xmlhttp = new XMLHttpRequest();
                var url = 'http://premios-nacionales.desarrollo-tecnologico.com/juego/registroJuego.php/?opcion=3&id_subtematica=' + id_subtematica + '&nivel=' + nivel_sesion;

                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        var array = JSON.parse(xmlhttp.responseText);
                        //alert(array);

                        if (array.length > 0) {
                            for (i = 0; i < array.length; i++) {
                                agregarBotonArtista(array[i].ID_ARTISTA, array[i].NOMBRE_ARTISTA);
                            }
                            Materialize.toast('¿Cuál artista escogerán?', 4000);
                        }
                    }
                }
                xmlhttp.open("GET", url, true);
                xmlhttp.send();
            }

            function agregarBotonArtista(id_artista, nombre_artista) {
                var contenedor = document.getElementById('artistas');
                contenedor.innerHTML += "<div class='row'><a style='margin: 10px auto;' class='btn waves-effect blue lighten-1 modal-trigger' onclick='enviarSesion(" + id_artista + ")'>" + nombre_artista + "<i class='material-icons right'>assignment_ind</i></button></div>";
            }

            var estado_sesion = '';
            var id_sesion = 0;
            var nivel_sesion = 0;
            function recibirDatos() {
                estado_sesion = '${estado_sesion}';
                id_sesion = '${id_sesion}';
                nivel_sesion = '${nivel_sesion}';
                alert('estado_sesion: ' + estado_sesion);
                alert('id_sesion: ' + id_sesion);
                alert('nivel_sesion: ' + nivel_sesion);
            }
        </script>
    </body>
</html>
