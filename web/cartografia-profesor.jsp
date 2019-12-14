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
    <script>
        $(document).ready(function () {
            $('.modal').modal();
        });
    </script>
    <body id="myDiv" onload="recibirDatos(), centrarMapa()" style="background: url('img/MAPA.png'); background-repeat: no-repeat; width: 100%; height: 100%;
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

            <div class="row">
                <div class="col s8 offset-s2 card-panel #3949ab indigo darken-1"> 
                    <h5 id="subtematica" align="center" style="color: #ffffff"></h5>
                </div>
            </div>

            <div class="row">
                <div class="col s10 offset-s1">
                    <div class="center" id="artistas" style="margin-top: 45px; margin-bottom: 45px;">

                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col s10 offset-s1">
                    <div class="center" id="respuestas" hidden="true" style="margin-top: 45px; margin-bottom: 45px;">
                        <button id="botonRespuestas" style="margin-top: 10px;" class="btn waves-effect blue lighten-1" type="submit" name="action" onclick="cargarResultados();">Obtener respuestas
                            <i class="material-icons right">check_circle</i>
                        </button>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col s10 offset-s1"  id="menuGeneral">
                    <div class="center" id="menu" style="margin-top: 45px; margin-bottom: 45px;">

                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col s10 offset-s1" >
                    <div class="center card-panel" id="menuOpciones" style="margin-top: 45px; margin-bottom: 45px;" hidden="true">
                        <h4>Opciones</h4>
                        <p><b>Seleccione el nivel del juego</b></p>
                        <select name="cboNivel" id="nivel" class="browser-default">
                            <option  value="NULO" disabled selected>SELECCIONE EL NIVEL DEL JUEGO</option>
                            <option  value="1">1</option>
                            <option  value="2">2</option>
                            <option  value="3">3</option>
                        </select>
                        <button id="botonNivel" style="margin-top: 10px;" class="btn waves-effect blue lighten-1" type="submit" name="action" onclick="fijarNivel();">Fijar Nivel
                            <i class="material-icons right">assignment_turned_in</i>
                        </button>
                    </div>
                </div>
            </div>

            <div class="row">
                <p style="text-align: center; color: white;"><b>Califica a los estudiantes</b></p>
                <div class="card-panel col s10 offset-s1" hidden="true" id="divResultados">
                </div>
            </div>

            <div class="col s6 offset-s4">
                <div class="blue-text center-align" style="position:fixed; bottom:0; margin-bottom: 50px; margin-left: 50px;">
                    <button id="botonLanzar" style="margin-top: 10px;" class="btn waves-effect blue lighten-1" type="submit" name="action" onclick="return obtenerLanzamiento();" disabled="true">Obtener Lanzamientos
                        <i class="material-icons right">loop</i>
                    </button>
                </div>
            </div>
        </div>

        <!-- Modal Structure -->
        <div id="modal2" class="modal">
            <div class="modal-content">
                <h4 align="center">Desafío de artista</h4>
                <p><b>Nombre de artista</b></p>
                <p id="nombreArtista">.</p>
                <p><b>Biografía de artista</b></p>
                <p id="biografiaArtista">.</p>
                <p style="font-size: 30px;"><b>Desafío de artista</b></p>
                <p id="desafioArtista" style="font-size: 30px;">.</p>
                <p><b>Enlaces de artista</b></p>
                <div id="enlaces">
                </div>
            </div>
            <div class="modal-footer">
                <a href="#!" class="modal-close waves-effect waves-green btn-flat">Cerrar</a>
            </div>
        </div>

        <!-- Modal Structure -->
        <div id="modal3" class="modal">
            <div class="modal-content">

                <h4 align="center">Evaluación de respuesta</h4>

                <p><b>Nombre de artista</b></p>
                <p id="nombreArtistaDesafio">.</p>
                <p><b>Desafío</b></p>
                <p id="desafioPregunta">.</p>
                <p><b>Respuesta</b></p>
                <p id="respuestaPregunta">.</p>
                <p><b>Calificación</b></p>

                <form>
                    <input type="hidden" id="id_respuesta">
                    <input type="hidden" id="equipoEvaluado">
                    <p class="range-field">
                        <input type="range" id="rango" min="0" max="10"/>
                    </p>

                    <div class="row" style="margin-top: 40px;">
                        <a class="btn waves-effect blue lighten-1" id="botonCalificacion" onclick="calificar(document.getElementById('id_respuesta').value, document.getElementById('rango').value)">Calificar
                            <i class="material-icons right">send</i>
                        </a>
                    </div>
                </form>



                <div class="modal-footer">
                    <a href="#!" onclick="comprobacionValoracion()" class="modal-close waves-effect waves-green btn-flat">Cerrar</a>
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
            function comprobacionValoracion() {
                alert("Comprobando respuestas valoradas...");

                // Obtención de id desafío
                alert('Id de artista: ' + id_artista);
                alert('Id sesion: ' + id_sesion);

                var xmlhttpF = new XMLHttpRequest();
                var urlF = 'http://localhost/juego/registroJuego.php/?opcion=23&id_artista=' + id_artista + '&id_sesion=' + id_sesion;

                xmlhttpF.onreadystatechange = function () {
                    if (xmlhttpF.readyState == 4 && xmlhttpF.status == 200) {
                        var desafio = JSON.parse(xmlhttpF.responseText);

                        if (desafio.length > 0) {
                            alert('Id desafio: ' + desafio[0].ID_DESAFIO);

                            var id_desafio = desafio[0].ID_DESAFIO;
                            var numero_equipo = 7;

                            // Consulta sobre calificaciones respecto al desafio (deben ser siete como máximo)
                            var xmlhttpR = new XMLHttpRequest();
                            var urlR = 'http://localhost/juego/registroJuego.php/?opcion=32&id_desafio=' + id_desafio + '&numero_equipo=' + numero_equipo;

                            xmlhttpR.onreadystatechange = function () {
                                if (xmlhttpR.readyState == 4 && xmlhttpR.status == 200) {
                                    var consulta = JSON.parse(xmlhttpR.responseText);

                                    alert(consulta[0].CALIFICACIONES);

                                    if (consulta[0].CALIFICACIONES == 6) {

                                        alert('Número de calificaciones: ' + consulta[0].CALIFICACIONES);

                                        Materialize.toast('Ya ha calificado a todos los equipo', 4000);

                                    } else {

                                        Materialize.toast('Aún le quedan equipos por calificar', 4000);

                                    }
                                }
                            }
                            xmlhttpR.open("GET", urlR, true);
                            xmlhttpR.send();
                        } else {
                            Materialize.toast('Problemas para obtener el id del desafío', 4000);
                        }
                    }
                }
                xmlhttpF.open("GET", urlF, true);
                xmlhttpF.send();

            }

            var premio = 0;
            var subtematica = 0;

            function calificar(id_respuesta, rango) {
                var id_respuesta = id_respuesta;
                alert('id de respuesta: ' + id_respuesta);
                var valor = rango;
                alert('Valor de calificación: ' + valor);
                var numero_equipo = 7;
                alert('Número de evaluador: ' + numero_equipo);

                // Obtención de id desafío
                alert('Id de artista: ' + id_artista);
                alert('Id sesion: ' + id_sesion);

                var xmlhttpF = new XMLHttpRequest();
                var urlF = 'http://localhost/juego/registroJuego.php/?opcion=23&id_artista=' + id_artista + '&id_sesion=' + id_sesion;

                xmlhttpF.onreadystatechange = function () {
                    if (xmlhttpF.readyState == 4 && xmlhttpF.status == 200) {
                        var desafio = JSON.parse(xmlhttpF.responseText);

                        if (desafio.length > 0) {
                            alert('Id desafio: ' + desafio[0].ID_DESAFIO);

                            var id_desafio = desafio[0].ID_DESAFIO;

                            // Consulta sobre calificaciones previas
                            var xmlhttpR = new XMLHttpRequest();
                            var urlR = 'http://localhost/juego/registroJuego.php/?opcion=30&id_respuesta=' + id_respuesta + '&numero_equipo=' + numero_equipo;

                            xmlhttpR.onreadystatechange = function () {
                                if (xmlhttpR.readyState == 4 && xmlhttpR.status == 200) {
                                    var consulta = JSON.parse(xmlhttpR.responseText);

                                    if (consulta[0].CALIFICACIONES > 0) {

                                        Materialize.toast('Usted ya calificó a este equipo', 4000);

                                    } else {

                                        // Realizar inserción de datos en calificaciones
                                        var xmlhttpL = new XMLHttpRequest();
                                        var urlL = 'http://localhost/juego/registroJuego.php/?opcion=31&id_respuesta=' + id_respuesta + '&id_desafio=' + id_desafio + '&valor=' + valor + '&numero_equipo=' + numero_equipo;

                                        xmlhttpL.onreadystatechange = function () {
                                            if (xmlhttpL.readyState == 4 && xmlhttpL.status == 200) {
                                                var comprobacion = JSON.parse(xmlhttpL.responseText);

                                                if (comprobacion == true) {
                                                    Materialize.toast('Calificación ingresada', 4000);
                                                }
                                            }
                                        }
                                        xmlhttpL.open("GET", urlL, true);
                                        xmlhttpL.send();


                                    }
                                }
                            }
                            xmlhttpR.open("GET", urlR, true);
                            xmlhttpR.send();
                        } else {
                            Materialize.toast('Problemas para obtener el id del desafío', 4000);
                        }
                    }
                }
                xmlhttpF.open("GET", urlF, true);
                xmlhttpF.send();
            }

            function eliminarBotonRespuestas() {
                document.getElementById("respuestas").hidden = true;
            }

            function cargarResultados() {
                // Comprobar si existen 6 respuestas
                alert(id_sesion);
                var xmlhttpY = new XMLHttpRequest();
                var urlY = 'http://localhost/juego/registroJuego.php/?opcion=26&id_sesion=' + id_sesion;

                xmlhttpY.onreadystatechange = function () {
                    if (xmlhttpY.readyState == 4 && xmlhttpY.status == 200) {
                        var numero_respuestas = JSON.parse(xmlhttpY.responseText);

                        if (numero_respuestas[0].RESPUESTAS < 6) {

                            Materialize.toast('Aún no están las 6 respuestas ingresadas', 4000);

                        } else {

                            // Comprobar se hay 7 calificaciones
                            // Obtención de id desafío
                            alert('Id sesion: ' + id_sesion);

                            // Obtención de id de artista
                            var xmlhttpW = new XMLHttpRequest();
                            var urlW = 'http://localhost/juego/registroJuego.php/?opcion=29&id_sesion=' + id_sesion;

                            xmlhttpW.onreadystatechange = function () {
                                if (xmlhttpW.readyState == 4 && xmlhttpW.status == 200) {
                                    var respuesta = JSON.parse(xmlhttpW.responseText);

                                    if (respuesta.length > 0) {

                                        var id_artista_consulta = respuesta[0].ID_ARTISTA;
                                        alert("Id de artista" + id_artista_consulta);

                                        // Consulta de id desafio
                                        var xmlhttpF = new XMLHttpRequest();
                                        var urlF = 'http://localhost/juego/registroJuego.php/?opcion=23&id_artista=' + id_artista_consulta + '&id_sesion=' + id_sesion;

                                        xmlhttpF.onreadystatechange = function () {
                                            if (xmlhttpF.readyState == 4 && xmlhttpF.status == 200) {
                                                var desafio = JSON.parse(xmlhttpF.responseText);

                                                if (desafio.length > 0) {
                                                    alert('Id desafio: ' + desafio[0].ID_DESAFIO);

                                                    var id_desafio = desafio[0].ID_DESAFIO;
                                                    var numero_equipo = 7;

                                                    // Consulta sobre calificaciones respecto al desafio (deben ser siete como máximo)
                                                    var xmlhttpR = new XMLHttpRequest();
                                                    var urlR = 'http://localhost/juego/registroJuego.php/?opcion=32&id_desafio=' + id_desafio + '&numero_equipo=' + numero_equipo;

                                                    xmlhttpR.onreadystatechange = function () {
                                                        if (xmlhttpR.readyState == 4 && xmlhttpR.status == 200) {
                                                            var consulta = JSON.parse(xmlhttpR.responseText);

                                                            alert(consulta[0].CALIFICACIONES);

                                                            if (consulta[0].CALIFICACIONES == 6) {

                                                                alert('Número de calificaciones: ' + consulta[0].CALIFICACIONES);

                                                                Materialize.toast('Ya ha calificado a todos los equipos', 4000);

                                                            } else {

                                                                Materialize.toast('Aún le quedan equipos por calificar', 4000);

                                                                eliminarBotonRespuestas();

                                                                // Carga de tabla de respuestas
                                                                var xmlhttp = new XMLHttpRequest();
                                                                var url = 'http://localhost/juego/registroJuego.php/?opcion=22&estado=' + estado_sesion + '&id_sesion=' + id_sesion;

                                                                xmlhttp.onreadystatechange = function () {
                                                                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                                                                        var array = JSON.parse(xmlhttp.responseText);

                                                                        if (array.length > 0) {

                                                                            var contenedor = document.getElementById('divResultados');

                                                                            contenedor.innerHTML = "";

                                                                            document.getElementById("divResultados").hidden = false;

                                                                            for (i = 0; i < array.length; i++) {
                                                                                contenedor.innerHTML += "\
                                                                                    <form style='margin-top: 10px; margin-bottom: 10px;'>\n\
                                                                                        <div class='row'>\n\
                                                                                            <h6 style='text-align: center;'>Equipo " + array[i].NUMERO_EQUIPO + "</h6>\n\
                                                                                            <input hidden='true' id='equipoEvaluadoForm' value=" + array[i].NUMERO_EQUIPO + ">\n\
                                                                                            <a style='display: block; margin-left: auto; margin-right: auto;' class='btn-floating blue' href='#modal3' onclick='cargarRespuesta(" + array[i].NUMERO_EQUIPO + ")'><i class='material-icons left'>add</i></a>\n\
                                                                                        </div>\n\
                                                                                    </form>";
                                                                            }
                                                                        } else {
                                                                            Materialize.toast('Aún no hay respuestas ingresadas', 4000);
                                                                        }
                                                                    }
                                                                }
                                                                xmlhttp.open("GET", url, true);
                                                                xmlhttp.send();S

                                                            }
                                                        }
                                                    }
                                                    xmlhttpR.open("GET", urlR, true);
                                                    xmlhttpR.send();
                                                } else {
                                                    Materialize.toast('Problemas para obtener el id del desafío', 4000);
                                                }
                                            }
                                        }
                                        xmlhttpF.open("GET", urlF, true);
                                        xmlhttpF.send();


                                    } else {
                                        Materialize.toast('Problema al cargar el id de artista', 4000);
                                    }
                                }
                            }
                            xmlhttpW.open("GET", urlW, true);
                            xmlhttpW.send();

                        }
                    }
                }
                xmlhttpY.open("GET", urlY, true);
                xmlhttpY.send();
            }

            function cargarRespuesta(equipo) {
                alert('Cargando respuesta...')

                // Obtención de equipo a evaluar
                var equipoEvaluado = equipo;
                alert('Equipo a evaluar: ' + equipoEvaluado);

                // Obtención de id de sesión
                alert('Id de sesión' + id_sesion);

                // Obtener id de artista
                var xmlhttpDos = new XMLHttpRequest();
                var urlDos = 'http://localhost/juego/registroJuego.php/?opcion=29&id_sesion=' + id_sesion;

                xmlhttpDos.onreadystatechange = function () {
                    if (xmlhttpDos.readyState == 4 && xmlhttpDos.status == 200) {
                        var array = JSON.parse(xmlhttpDos.responseText);

                        if (array.length > 0) {

                            id_artista = array[0].ID_ARTISTA;
                            alert('Id de artista: ' + id_artista);

                            // Obtención de respuesta a calificar
                            // Obtención de la respuesta a calificar
                            var xmlhttpW = new XMLHttpRequest();
                            var urlW = 'http://localhost/juego/registroJuego.php/?opcion=28&id_artista=' + id_artista + '&numero_equipo=' + equipoEvaluado + '&id_sesion=' + id_sesion;

                            xmlhttpW.onreadystatechange = function () {
                                if (xmlhttpW.readyState == 4 && xmlhttpW.status == 200) {
                                    var respuesta = JSON.parse(xmlhttpW.responseText);

                                    if (respuesta.length > 0) {

                                        document.getElementById('nombreArtistaDesafio').innerHTML = respuesta[0].NOMBRE_ARTISTA;
                                        document.getElementById('desafioPregunta').innerHTML = respuesta[0].DESAFIO;
                                        document.getElementById('respuestaPregunta').innerHTML = respuesta[0].RESPUESTA;
                                        document.getElementById('id_respuesta').value = respuesta[0].ID_RESPUESTA;
                                        document.getElementById('equipoEvaluado').value = respuesta[0].NUMERO_EQUIPO;
                                    } else {
                                        Materialize.toast('Problema al cargar la respuesta al calificar', 4000);
                                    }
                                }
                            }
                            xmlhttpW.open("GET", urlW, true);
                            xmlhttpW.send();

                        } else {
                            Materialize.toast('No se pudo obtener el Id del artista del desafío', 4000);
                        }

                    }
                }
                xmlhttpDos.open("GET", urlDos, true);
                xmlhttpDos.send();
            }

            function centrarMapa() {
                document.getElementById("myDiv").style.backgroundPosition = "left top";
            }

            function fijarNivel() {
                var nuevoNivel = document.getElementById("nivel").selectedIndex;

                if (nuevoNivel == null || nuevoNivel == 0) {

                    Materialize.toast('Debe seleccionar un nivel', 4000);

                } else {

                    var xmlhttp = new XMLHttpRequest();
                    var url = 'http://localhost/juego/registroJuego.php/?opcion=13&nivel=' + nuevoNivel + '&id_sesion=' + id_sesion + '&estado=' + estado_sesion;

                    xmlhttp.onreadystatechange = function () {
                        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                            nivel_sesion = nuevoNivel;
                        }
                    }
                    xmlhttp.open("GET", url, true);
                    xmlhttp.send();

                    document.getElementById('menuOpciones').hidden = true;
                    habilitarMenu();

                }

            }

            function obtenerLanzamiento()
            {
                if (estado_sesion == 'ABIERTA') {

                    // Obteniendo valor de los dados del equipo impar (primero)
                    var xmlhttp = new XMLHttpRequest();
                    var url = 'http://localhost/juego/registroJuego.php/?opcion=9&numero_equipo=' + 1 + '&id_sesion=' + id_sesion;

                    xmlhttp.onreadystatechange = function () {
                        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                            var array = JSON.parse(xmlhttp.responseText);

                            if (array.length > 0) {

                                premio = array[0].VALOR;

                                // Obteniendo valor de los dados del equipo par (segundo)
                                var xmlhttpDos = new XMLHttpRequest();
                                var urlDos = 'http://localhost/juego/registroJuego.php/?opcion=9&numero_equipo=' + 2 + '&id_sesion=' + id_sesion;

                                xmlhttpDos.onreadystatechange = function () {
                                    if (xmlhttpDos.readyState == 4 && xmlhttpDos.status == 200) {
                                        var array = JSON.parse(xmlhttpDos.responseText);
                                        subtematica = array[0].VALOR;

                                        if (array.length > 0) {

                                            document.getElementById("botonLanzar").style.height = "0px";

                                            // Cargando el primer dado (PREMIO)
                                            cargarMapa(premio);
                                            id_subtematica = array[0].VALOR;

                                            // Obteniendo Subtematicas
                                            obtenerSubtematicas(id_subtematica);

                                        } else {
                                            Materialize.toast('Los equipos aún no han realizado el lanzamiento de dados', 4000);
                                        }

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
                    var url = 'http://localhost/juego/registroJuego.php/?opcion=9&numero_equipo=' + 3 + '&id_sesion=' + id_sesion;

                    xmlhttp.onreadystatechange = function () {
                        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                            var array = JSON.parse(xmlhttp.responseText);

                            if (array.length > 0) {

                                premio = array[0].VALOR;

                                var xmlhttpDos = new XMLHttpRequest();
                                var urlDos = 'http://localhost/juego/registroJuego.php/?opcion=9&numero_equipo=' + 4 + '&id_sesion=' + id_sesion;

                                xmlhttpDos.onreadystatechange = function () {
                                    if (xmlhttpDos.readyState == 4 && xmlhttpDos.status == 200) {
                                        var array = JSON.parse(xmlhttpDos.responseText);

                                        if (array.length > 0) {

                                            document.getElementById("botonLanzar").style.height = "0px";
                                            cargarMapa(premio);
                                            subtematica = array[0].VALOR;
                                            obtenerSubtematicas(premio);

                                        } else {
                                            Materialize.toast('Los equipos aún no han realizado el lanzamiento de dados', 4000);
                                        }
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
                    var url = 'http://localhost/juego/registroJuego.php/?opcion=9&numero_equipo=' + 5 + '&id_sesion=' + id_sesion;

                    xmlhttp.onreadystatechange = function () {
                        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                            var array = JSON.parse(xmlhttp.responseText);

                            if (array.length > 0) {

                                premio = array[0].VALOR;

                                var xmlhttpDos = new XMLHttpRequest();
                                var urlDos = 'http://localhost/juego/registroJuego.php/?opcion=9&numero_equipo=' + 6 + '&id_sesion=' + id_sesion;

                                xmlhttpDos.onreadystatechange = function () {
                                    if (xmlhttpDos.readyState == 4 && xmlhttpDos.status == 200) {
                                        var array = JSON.parse(xmlhttpDos.responseText);

                                        if (array.length > 0) {

                                            document.getElementById("botonLanzar").style.height = "0px";
                                            cargarMapa(premio);
                                            subtematica = array[0].VALOR;
                                            obtenerSubtematicas(premio);

                                        } else {
                                            Materialize.toast('Los equipos aún no han realizado el lanzamiento de dados', 4000);
                                        }
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

            function obtenerSubtematicas(id_subtematica) {
                //alert('obteniendo subtemáticas');
                //alert('premio: ' + premio);
                alert(id_subtematica);

                var xmlhttp = new XMLHttpRequest();
                var url = 'http://localhost/juego/registroJuego.php/?opcion=24&id_subtematica=' + id_subtematica;

                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        var array = JSON.parse(xmlhttp.responseText);
                        //alert(array);

                        document.getElementById('subtematica').innerHTML = array[0].DESCRIPCION_SUBTEMATICA;
                        ;

                        // Carga de artistas según niveles de avance en el turno
                        obtenerArtistas(id_subtematica);
                    }
                }
                xmlhttp.open("GET", url, true);
                xmlhttp.send();
            }

            function obtenerArtistas(id_subtematica) {
                //alert('obteniendo artistas');
                //alert('id subtematica: ' + id_subtematica);

                // Identificación de desafíos pendientes
                var xmlhttpX = new XMLHttpRequest();
                var urlX = 'http://localhost/juego/registroJuego.php/?opcion=25&id_sesion=' + id_sesion;

                xmlhttpX.onreadystatechange = function () {
                    if (xmlhttpX.readyState == 4 && xmlhttpX.status == 200) {
                        var desafios_pendientes = JSON.parse(xmlhttpX.responseText);

                        if (desafios_pendientes.length > 0) {

                            deshabilitarListadoArtistas();

                        } else {

                            // Limpieza de desafíos ya generados en el juego, correspondientes al nivel
                            var xmlhttpSiete = new XMLHttpRequest();
                            var url = 'http://localhost/juego/registroJuego.php/?opcion=3&id_subtematica=' + id_subtematica + '&nivel=' + nivel_sesion;

                            xmlhttpSiete.onreadystatechange = function () {
                                if (xmlhttpSiete.readyState == 4 && xmlhttpSiete.status == 200) {
                                    var artistas_disponibles = JSON.parse(xmlhttpSiete.responseText);

                                    if (artistas_disponibles.length > 0) {

                                        var xmlhttpDos = new XMLHttpRequest();
                                        var urlDos = 'http://localhost/juego/registroJuego.php/?opcion=10&id_sesion=' + id_sesion + '&nivel=' + nivel_sesion;

                                        xmlhttpDos.onreadystatechange = function () {
                                            if (xmlhttpDos.readyState == 4 && xmlhttpDos.status == 200) {
                                                var arrayPasado = JSON.parse(xmlhttpDos.responseText);
                                                //alert(array);

                                                if (arrayPasado.length > 0) {
                                                    for (i = 0; i < arrayPasado.length; i++) {

                                                        for (x = 0; x < artistas_disponibles.length; x++) {

                                                            if (arrayPasado[i].ID_ARTISTA == artistas_disponibles[x].ID_ARTISTA) {
                                                                alert('eliminando repetidos!');
                                                                alert(artistas_disponibles.length);
                                                                artistas_disponibles.splice(x, 1);
                                                                alert(artistas_disponibles.length);
                                                            }
                                                        }
                                                    }
                                                }
                                                for (z = 0; z < artistas_disponibles.length; z++) {
                                                    agregarBotonArtista(artistas_disponibles[z].ID_ARTISTA, artistas_disponibles[z].NOMBRE_ARTISTA);
                                                }
                                                Materialize.toast('¿Cuál artista escogerán?', 4000);
                                            }
                                        }
                                        xmlhttpDos.open("GET", urlDos, true);
                                        xmlhttpDos.send();
                                    }
                                }
                                alert(artistas_disponibles);
                            }
                            xmlhttpSiete.open("GET", url, true);
                            xmlhttpSiete.send();

                        }

                    }
                }
                xmlhttpX.open("GET", urlX, true);
                xmlhttpX.send();
            }

            function agregarBotonArtista(id_artista, nombre_artista) {
                var contenedor = document.getElementById('artistas');
                contenedor.innerHTML += "<div class='row'><a style='margin: 10px auto;' class='btn waves-effect blue lighten-1 modal-trigger' onclick='deshabilitarListadoArtistas(), traerArtista(" + id_artista + ")' href='#modal2'>" + nombre_artista + "<i class='material-icons right'>assignment_ind</i></button></div>";
            }

            function deshabilitarListadoArtistas() {
                document.getElementById('artistas').hidden = true;
                document.getElementById('respuestas').hidden = false;
            }

            function traerArtista(id_artista) {
                var xmlhttp = new XMLHttpRequest();
                var url = 'http://localhost/juego/registroJuego.php/?opcion=11&id_artista=' + id_artista;

                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        var array = JSON.parse(xmlhttp.responseText);
                        //alert(array);

                        document.getElementById('nombreArtista').innerHTML = array[0].NOMBRE_ARTISTA;
                        document.getElementById('biografiaArtista').innerHTML = array[0].BIOGRAFIA_ARTISTA;
                        document.getElementById('desafioArtista').innerHTML = array[0].DESAFIO;
                    }
                }
                xmlhttp.open("GET", url, true);
                xmlhttp.send();

                var xmlhttpDos = new XMLHttpRequest();
                var urlDos = 'http://localhost/juego/registroJuego.php/?opcion=12&id_artista=' + id_artista;

                xmlhttpDos.onreadystatechange = function () {
                    if (xmlhttpDos.readyState == 4 && xmlhttpDos.status == 200) {
                        var arrayDos = JSON.parse(xmlhttpDos.responseText);
                        //alert(array);

                        for (i = 0; i < arrayDos.length; i++) {

                            var enlace = '<a href="' + arrayDos[i].TEXTO_ENLACE + '" target="_blank">' + arrayDos[i].TEXTO_ENLACE + '</a><br>';
                            document.getElementById("enlaces").innerHTML += enlace;
                        }
                    }
                }
                xmlhttpDos.open("GET", urlDos, true);
                xmlhttpDos.send();

                var xmlhttpTres = new XMLHttpRequest();
                var urlTres = 'http://localhost/juego/registroJuego.php/?opcion=19&id_sesion=' + id_sesion + '&estado=' + estado_sesion;

                xmlhttpTres.onreadystatechange = function () {
                    if (xmlhttpTres.readyState == 4 && xmlhttpTres.status == 200) {
                        var arrayTres = JSON.parse(xmlhttpTres.responseText);

                        if (arrayTres.length > 0) {
                            var id_nivel = arrayTres[0].ID_NIVEL;

                            var xmlhttpCuatro = new XMLHttpRequest();
                            var urlCuatro = 'http://localhost/juego/registroJuego.php/?opcion=18&id_artista=' + id_artista + '&id_sesion=' + id_sesion + '&id_nivel=' + id_nivel;

                            xmlhttpCuatro.onreadystatechange = function () {
                                if (xmlhttpCuatro.readyState == 4 && xmlhttpCuatro.status == 200) {
                                    Materialize.toast('Las y los estudiantes pueden cargar el desafío', 4000);
                                }
                            }
                            xmlhttpCuatro.open("GET", urlCuatro, true);
                            xmlhttpCuatro.send();
                        }
                    }
                }
                xmlhttpTres.open("GET", urlTres, true);
                xmlhttpTres.send();
            }

            var estado_sesion = '';
            var id_sesion = 0;
            var nivel_sesion = 0;

            function desplegarMenu() {
                var contenedor = document.getElementById('menu');
                contenedor.innerHTML += "<div class='row' id='botonInstrucciones'><a style='margin: 10px auto;' class='btn waves-effect blue lighten-1 modal-trigger' onclick='' href='instrucciones.jsp' target='_blank'>INSTRUCCIONES<i class='material-icons right'>format_list_numbered</i></button></div>";
                contenedor.innerHTML += "<div class='row' id='botonOpciones'><a style='margin: 10px auto;' class='btn waves-effect blue lighten-1 modal-trigger' onclick='habilitarOpciones()'>OPCIONES<i class='material-icons right'>settings</i></button></div>";
                contenedor.innerHTML += "<div class='row' id='botonCreditos'><a style='margin: 10px auto;' class='btn waves-effect blue lighten-1 modal-trigger' onclick='' href='creditos.jsp' target='_blank'>CREDITOS<i class='material-icons right'>subject</i></button></div>";
                contenedor.innerHTML += "<div class='row' id='botonJugar'><a style='margin: 10px auto;' class='btn waves-effect blue lighten-1 modal-trigger' onclick='habilitarPartida()'>JUGAR<i class='material-icons right'>play_circle_outline</i></button></div>";
            }

            function habilitarPartida() {

                var xmlhttp = new XMLHttpRequest();
                var url = 'http://localhost/juego/registroJuego.php/?opcion=16&id_sesion=' + id_sesion;

                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        var array = JSON.parse(xmlhttp.responseText);

                        if (array[0].NUMERO_EQUIPOS == 6) {

                            var xmlhttpDos = new XMLHttpRequest();
                            var urlDos = 'http://localhost/juego/registroJuego.php/?opcion=15&id_sesion=' + id_sesion;

                            xmlhttpDos.onreadystatechange = function () {
                                if (xmlhttpDos.readyState == 4 && xmlhttpDos.status == 200) {

                                    document.getElementById('botonLanzar').disabled = false;
                                    deshabilitarMenu();

                                }
                            }
                            xmlhttpDos.open("GET", urlDos, true);
                            xmlhttpDos.send();

                        } else {
                            Materialize.toast('No hay 6 equipos registrados en el sistema', 4000);
                        }
                    }
                }
                xmlhttp.open("GET", url, true);
                xmlhttp.send();
            }

            function habilitarOpciones() {
                deshabilitarMenu();

                document.getElementById('menuOpciones').hidden = false;
            }

            function deshabilitarMenu() {
                document.getElementById('botonInstrucciones').hidden = true;
                document.getElementById('botonOpciones').hidden = true;
                document.getElementById('botonCreditos').hidden = true;
                document.getElementById('botonJugar').hidden = true;
            }

            function habilitarMenu() {
                document.getElementById('botonInstrucciones').hidden = false;
                document.getElementById('botonOpciones').hidden = false;
                document.getElementById('botonCreditos').hidden = false;
                document.getElementById('botonJugar').hidden = false;
            }

            function recibirDatos() {
                estado_sesion = '${estado_sesion}';
                id_sesion = '${id_sesion}';
                nivel_sesion = '${nivel_sesion}';
                alert('estado_sesion: ' + estado_sesion);
                alert('id_sesion: ' + id_sesion);
                alert('nivel_sesion: ' + nivel_sesion);

                if (estado_sesion == 'ABIERTA') {


                    // Consulta de inicio de partida

                    var xmlhttpTres = new XMLHttpRequest();
                    var urlTres = 'http://localhost/juego/registroJuego.php/?opcion=14&id_sesion=' + id_sesion;

                    xmlhttpTres.onreadystatechange = function () {
                        if (xmlhttpTres.readyState == 4 && xmlhttpTres.status == 200) {
                            var arrayTres = JSON.parse(xmlhttpTres.responseText);

                            if (arrayTres[0].PLAY == 0) {

                                desplegarMenu();

                            } else {
                                document.getElementById('botonLanzar').disabled = false;
                            }
                        }
                    }
                    xmlhttpTres.open("GET", urlTres, true);
                    xmlhttpTres.send();

                }
            }
        </script>
    </body>
</html>
