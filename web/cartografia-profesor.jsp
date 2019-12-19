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
            $('.modal').modal({
                dismissible: false
            });
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
                <div class="col s10 offset-s1">
                    <div class="center" id="paso_resultado" hidden="true" style="margin-top: 45px; margin-bottom: 45px;">
                        <button id="botonPasoResultado" style="margin-top: 10px;" class="btn waves-effect blue lighten-1" type="submit" name="action" onclick="verResultadosCalificaciones();">Ver resultados
                            <i class="material-icons right">check_circle</i>
                        </button>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="card-panel col s10 offset-s1" hidden="true" id="divCalificaciones">

                </div>
            </div>

            <div class="row">
                <div class="card-panel col s10 offset-s1" hidden="true" id="divCalificacionesNivel">

                </div>
            </div>

            <div class="row">
                <div class="col s10 offset-s1">
                    <div class="center" id="paso_desafio" hidden="true" style="margin-top: 45px; margin-bottom: 45px;">
                        <form action="paso-docente.do">
                            <input type="hidden" id="estado_sesion" name="estado_sesion">
                            <input type="hidden" id="id_sesion" name="id_sesion">
                            <input type="hidden" id="nivel_sesion" name="nivel_sesion">
                            <button id="botonPasoResultado_tres" style="margin-top: 10px;" class="btn waves-effect blue lighten-1" type="submit" name="action" onclick="return pasar()">Cerrar desafío
                                <i class="material-icons right">check_circle</i>
                            </button>
                        </form>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col s10 offset-s1">
                    <div class="center" id="paso_nivel" hidden="true" style="margin-top: 45px; margin-bottom: 45px;">
                        <form action="paso-docente.do">
                            <input type="hidden" id="estado_sesion_dos" name="estado_sesion">
                            <input type="hidden" id="id_sesion_dos" name="id_sesion">
                            <input type="hidden" id="nivel_sesion_dos" name="nivel_sesion">
                            <button id="botonPasoResultado_dos" style="margin-top: 10px;" class="btn waves-effect blue lighten-1" type="submit" name="action" onclick="return pasarNivel()">Cerrar último desafío de nivel 
                                <i class="material-icons right">check_circle</i>
                            </button>
                        </form>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col s10 offset-s1">
                    <div class="center" id="paso_nivel_final" hidden="true" style="margin-top: 45px; margin-bottom: 45px;">
                        <form action="paso-docente-final-nivel.do">
                            <input type="hidden" id="estado_sesion_cuatro" name="estado_sesion">
                            <input type="hidden" id="id_sesion_cuatro" name="id_sesion">
                            <input type="hidden" id="nivel_sesion_cuatro" name="nivel_sesion">
                            <button id="botonPasoResultado_cinco" style="margin-top: 10px;" class="btn waves-effect blue lighten-1" type="submit" name="action" onclick="return pasarNivel()">Cerrar Nivel
                                <i class="material-icons right">check_circle</i>
                            </button>
                        </form>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col s10 offset-s1">
                    <div class="center" id="paso_nivel_final_dos" hidden="true" style="margin-top: 45px; margin-bottom: 45px;">
                        <form action="paso-docente-final-juego.do">
                            <input type="hidden" id="estado_sesion_tres" name="estado_sesion">
                            <input type="hidden" id="id_sesion_tres" name="id_sesion">
                            <input type="hidden" id="nivel_sesion_tres" name="nivel_sesion">
                            <button id="botonPasoResultado_cuatro" style="margin-top: 10px;" class="btn waves-effect blue lighten-1" type="submit" name="action" onclick="return pasarNivel()">Cerrar Juego
                                <i class="material-icons right">check_circle</i>
                            </button>
                        </form>
                    </div>
                </div>
            </div>

            <!--<button id="sapeo" style="margin-top: 10px;" class="btn waves-effect blue lighten-1" type="submit" name="action" onclick="sapeo();">Sapeo
                <i class="material-icons right">check_circle</i>
            </button>-->


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
                <div class="col s10 offset-s1" >
                    <div class="center card-panel" id="menuOpcionesNivel" style="margin-top: 45px; margin-bottom: 45px;" hidden="true">
                        <h4>Opciones</h4>
                        <p><b>Seleccione el nivel del juego</b></p>
                        <select name="cboNivel" id="nivelDos" class="browser-default">
                            <option  value="NULO" disabled selected>SELECCIONE EL NIVEL DEL JUEGO</option>
                            <option  value="1">1</option>
                            <option  value="2">2</option>
                            <option  value="3">3</option>
                        </select>
                        <button id="botonNivel" style="margin-top: 10px;" class="btn waves-effect blue lighten-1" type="submit" name="action" onclick="fijarNivelSegunda();">Fijar Nivel
                            <i class="material-icons right">assignment_turned_in</i>
                        </button>
                        <button id="botonCerrarOpcionNivel" style="margin-top: 10px;" class="btn waves-effect blue lighten-1" type="submit" name="action" onclick="cerrarMenuOpciones();">Cerrar
                            <i class="material-icons right">assignment_turned_in</i>
                        </button>
                    </div>
                </div>
            </div>

            <div class="row">
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
        <div id="modal2" class="modal dismissible">
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
        <div id="modal3" class="modal dismissible">
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
            function sapeo() {
                var idSesion = document.getElementById("id_sesion").value;
                var nivel = document.getElementById("nivel_sesion").value;
                var estadoS = document.getElementById("estado_sesion").value;

                console.log('id sesion: ' + idSesion);
                console.log('nivel sesion: ' + nivel);
                console.log('estado sesion: ' + estadoS);

            }

            function pasar() {

                console.log('Pasando...');

            }

            function cerrarMenuOpciones() {
                document.getElementById('menuOpcionesNivel').hidden = true;
                document.getElementById('menu').hidden = true;
                document.getElementById('botonLanzar').disabled = false;
            }

            function pasarNivel() {

                console.log('Pasando nivel...');
                // return false;

            }

            function verResultadosCalificaciones() {
                console.log('Evaluando resultados...');

                console.log('Id sesión: ' + id_sesion);

                // Obtención de id de desafío según el id de sesión y el estado 'ABIERTO'
                var xmlhttpR = new XMLHttpRequest();
                var urlR = 'http://localhost/juego/registroJuego.php/?opcion=25&id_sesion=' + id_sesion;

                xmlhttpR.onreadystatechange = function () {
                    if (xmlhttpR.readyState == 4 && xmlhttpR.status == 200) {
                        var consulta = JSON.parse(xmlhttpR.responseText);

                        if (consulta.length > 0) {

                            var id_desafio = consulta[0].ID_DESAFIO;
                            console.log('Id desafío: ' + id_desafio);

                            // Consulta sobre cantidad de calificaciones según el id de desafio
                            var xmlhttpL = new XMLHttpRequest();
                            var urlL = 'http://localhost/juego/registroJuego.php/?opcion=34&id_desafio=' + id_desafio;

                            xmlhttpL.onreadystatechange = function () {
                                if (xmlhttpL.readyState == 4 && xmlhttpL.status == 200) {
                                    var calificaciones = JSON.parse(xmlhttpL.responseText);

                                    if (calificaciones.length > 0) {

                                        var numero_calificaciones = calificaciones[0].CALIFICACIONES;
                                        console.log('Número de calificaciones realizadas en el desafío: ' + numero_calificaciones);

                                        if (numero_calificaciones == 42) {
                                            Materialize.toast('El desafío ha sido completamente evaluado', 4000);

                                            // Obtención de los promedios y datos del desafio

                                            var xmlhttpZ = new XMLHttpRequest();
                                            var urlZ = 'http://localhost/juego/registroJuego.php/?opcion=35&id_desafio=' + id_desafio;

                                            xmlhttpZ.onreadystatechange = function () {
                                                if (xmlhttpZ.readyState == 4 && xmlhttpZ.status == 200) {
                                                    var promedios = JSON.parse(xmlhttpZ.responseText);

                                                    if (promedios.length > 0) {

                                                        document.getElementById("divCalificaciones").hidden = false;

                                                        document.getElementById("paso_resultado").hidden = true;

                                                        // Cargar resultados de desafío
                                                        // Carga de tabla de calificaciones por desafíos

                                                        var contenedor = document.getElementById('divCalificaciones');

                                                        contenedor.innerHTML = "";

                                                        contenedor.innerHTML += "\
                                                                            <div class='row'>\n\
                                                                                <h5 style='text-align: center;'>Artista: <b>" + promedios[0].NOMBRE_ARTISTA + "</b></h5>\n\
                                                                                <h5 style='text-align: center;'>Desafío: <b>" + promedios[0].DESAFIO + "</b></h5>\n\
                                                                            </div>";

                                                        for (i = 0; i < promedios.length; i++) {

                                                            if (i == 0) {
                                                                contenedor.innerHTML += "\
                                                                    <form style='margin-top: 10px; margin-bottom: 10px; margin-left: 20px; margin-right: 20px;'>\n\
                                                                        <div class='row'>\n\
                                                                            <h4 style='text-align: center;'><b>Primer Lugar</b></h4>\n\
                                                                            <h6 style='text-align: center;'><b>Equipo " + promedios[i].NUMERO_EQUIPO + "</b></h6>\n\
                                                                            <p style='text-align: center;'>Calificación obtenida: <b>" + promedios[i].PROMEDIO + "</b></p>\n\
                                                                            <input hidden='true' id='equipoEvaluadoForm' value=" + promedios[i].NUMERO_EQUIPO + ">\n\
                                                                        </div>\n\
                                                                    </form>";
                                                            } else if (i == 1) {
                                                                contenedor.innerHTML += "\
                                                                    <form style='margin-top: 10px; margin-bottom: 10px; margin-left: 20px; margin-right: 20px;'>\n\
                                                                        <div class='row'>\n\
                                                                            <h4 style='text-align: center;'><b>Segundo Lugar</b></h4>\n\
                                                                            <h6 style='text-align: center;'><b>Equipo " + promedios[i].NUMERO_EQUIPO + "</b></h6>\n\
                                                                            <p style='text-align: center;'>Calificación obtenida: <b>" + promedios[i].PROMEDIO + "</b></p>\n\
                                                                            <input hidden='true' id='equipoEvaluadoForm' value=" + promedios[i].NUMERO_EQUIPO + ">\n\
                                                                        </div>\n\
                                                                    </form>";
                                                            } else if (i == 2) {
                                                                contenedor.innerHTML += "\
                                                                    <form style='margin-top: 10px; margin-bottom: 10px; margin-left: 20px; margin-right: 20px;'>\n\
                                                                        <div class='row'>\n\
                                                                            <h4 style='text-align: center;'><b>Tercer Lugar</b></h4>\n\
                                                                            <h6 style='text-align: center;'><b>Equipo " + promedios[i].NUMERO_EQUIPO + "</b></h6>\n\
                                                                            <p style='text-align: center;'>Calificación obtenida: <b>" + promedios[i].PROMEDIO + "</b></p>\n\
                                                                            <input hidden='true' id='equipoEvaluadoForm' value=" + promedios[i].NUMERO_EQUIPO + ">\n\
                                                                        </div>\n\
                                                                    </form>";
                                                            } else {
                                                                contenedor.innerHTML += "\
                                                                    <form style='margin-top: 10px; margin-bottom: 10px; margin-left: 20px; margin-right: 20px;'>\n\
                                                                        <div class='row'>\n\
                                                                            <h6 style='text-align: center;'><b>Equipo " + promedios[i].NUMERO_EQUIPO + "</b></h6>\n\
                                                                            <p style='text-align: center;'>Calificación obtenida: <b>" + promedios[i].PROMEDIO + "</b></p>\n\
                                                                            <input hidden='true' id='equipoEvaluadoForm' value=" + promedios[i].NUMERO_EQUIPO + ">\n\
                                                                        </div>\n\
                                                                    </form>";
                                                            }
                                                        }

                                                        // Insertar calificaciones en respuestas
                                                        for (x = 0; x < promedios.length; x++) {

                                                            // Update de respuestas
                                                            var xmlhttpG = new XMLHttpRequest();
                                                            var urlG = 'http://localhost/juego/registroJuego.php/?opcion=36&promedio=' + promedios[x].PROMEDIO + '&id_respuesta=' + promedios[x].ID_RESPUESTA;

                                                            xmlhttpG.onreadystatechange = function () {
                                                                if (xmlhttpG.readyState == 4 && xmlhttpG.status == 200) {
                                                                    var control = JSON.parse(xmlhttpG.responseText);

                                                                    if (control == true) {

                                                                        console.log('Promedio insertado en respuesta');

                                                                    } else {

                                                                        console.log('Problema al insertar promedio en respuesta');

                                                                    }
                                                                }
                                                            }
                                                            xmlhttpG.open("GET", urlG, true);
                                                            xmlhttpG.send();
                                                        }


                                                        // Condicionar el paso desafío o paso nivel según el número de desafíos acumulados
                                                        // Los desafíos se deben eliminar según el número de ellos sea 2 (porque el tercero se cierra en la consumación de la acción)
                                                        // Si hay dos desafíos se debe se debe activar un botón 'paso_nivel'
                                                        // Agregar contador de desafios (0 - 2)
                                                        var xmlhttp = new XMLHttpRequest();
                                                        var url = 'http://localhost/juego/registroJuego.php/?opcion=40&id_sesion=' + id_sesion;

                                                        xmlhttp.onreadystatechange = function () {
                                                            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

                                                                var array = JSON.parse(xmlhttp.responseText);
                                                                if (array.length > 0) {

                                                                    contador_desafio = array[0].DESAFIOS;
                                                                    console.log('Número de desafios: ' + contador_desafio);

                                                                    if (contador_desafio == 2) {
                                                                        document.getElementById("paso_nivel").hidden = false;
                                                                    } else {
                                                                        document.getElementById("paso_desafio").hidden = false;
                                                                    }



                                                                } else {
                                                                    Materialize.toast('Problemas al contar el número de desafíos realizados', 4000);
                                                                }
                                                            }
                                                        }
                                                        xmlhttp.open("GET", url, true);
                                                        xmlhttp.send();

                                                    } else {
                                                        Materialize.toast('No se pudo obetener los promedios del desafío', 4000);
                                                    }
                                                }
                                            }
                                            xmlhttpZ.open("GET", urlZ, true);
                                            xmlhttpZ.send();

                                        } else {
                                            Materialize.toast('Debe esperar a que los equipo terminen de calificar las respuestas del desafío', 4000);
                                        }

                                    } else {
                                        Materialize.toast('Problema al obtener el número de calificaciones', 4000);
                                    }
                                }
                            }
                            xmlhttpL.open("GET", urlL, true);
                            xmlhttpL.send();


                        } else {
                            Materialize.toast('Problema al obtener el id de desafío', 4000);
                        }


                    }
                }
                xmlhttpR.open("GET", urlR, true);
                xmlhttpR.send();
            }

            function comprobacionValoracion() {
                console.log("Comprobando respuestas valoradas...");

                // Obtención de id desafío
                console.log('Id de artista: ' + id_artista);
                console.log('Id sesion: ' + id_sesion);

                var xmlhttpF = new XMLHttpRequest();
                var urlF = 'http://localhost/juego/registroJuego.php/?opcion=23&id_artista=' + id_artista + '&id_sesion=' + id_sesion;

                xmlhttpF.onreadystatechange = function () {
                    if (xmlhttpF.readyState == 4 && xmlhttpF.status == 200) {
                        var desafio = JSON.parse(xmlhttpF.responseText);

                        if (desafio.length > 0) {
                            console.log('Id desafio: ' + desafio[0].ID_DESAFIO);

                            var id_desafio = desafio[0].ID_DESAFIO;
                            var numero_equipo = 7;

                            // Consulta sobre calificaciones respecto al desafio (deben ser siete como máximo)
                            var xmlhttpR = new XMLHttpRequest();
                            var urlR = 'http://localhost/juego/registroJuego.php/?opcion=32&id_desafio=' + id_desafio + '&numero_equipo=' + numero_equipo;

                            xmlhttpR.onreadystatechange = function () {
                                if (xmlhttpR.readyState == 4 && xmlhttpR.status == 200) {
                                    var consulta = JSON.parse(xmlhttpR.responseText);

                                    console.log(consulta[0].CALIFICACIONES);

                                    if (consulta[0].CALIFICACIONES == 6) {

                                        console.log('Número de calificaciones: ' + consulta[0].CALIFICACIONES);

                                        Materialize.toast('Ya ha calificado a todos los equipo', 4000);

                                        // Visibilizar el botón de resultados
                                        document.getElementById("paso_resultado").hidden = false;

                                        // Esconder tabla de resultados y botón de repuesta
                                        document.getElementById("divResultados").hidden = true;
                                        document.getElementById("respuestas").hidden = true;

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
                console.log('id de respuesta: ' + id_respuesta);
                var valor = rango;
                console.log('Valor de calificación: ' + valor);
                var numero_equipo = 7;
                console.log('Número de evaluador: ' + numero_equipo);

                // Obtención de id desafío
                console.log('Id de artista: ' + id_artista);
                console.log('Id sesion: ' + id_sesion);

                var xmlhttpF = new XMLHttpRequest();
                var urlF = 'http://localhost/juego/registroJuego.php/?opcion=23&id_artista=' + id_artista + '&id_sesion=' + id_sesion;

                xmlhttpF.onreadystatechange = function () {
                    if (xmlhttpF.readyState == 4 && xmlhttpF.status == 200) {
                        var desafio = JSON.parse(xmlhttpF.responseText);

                        if (desafio.length > 0) {
                            console.log('Id desafio: ' + desafio[0].ID_DESAFIO);

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
                console.log(id_sesion);
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
                            console.log('Id sesion: ' + id_sesion);

                            // Obtención de id de artista
                            var xmlhttpW = new XMLHttpRequest();
                            var urlW = 'http://localhost/juego/registroJuego.php/?opcion=29&id_sesion=' + id_sesion;

                            xmlhttpW.onreadystatechange = function () {
                                if (xmlhttpW.readyState == 4 && xmlhttpW.status == 200) {
                                    var respuesta = JSON.parse(xmlhttpW.responseText);

                                    if (respuesta.length > 0) {

                                        var id_artista_consulta = respuesta[0].ID_ARTISTA;
                                        console.log("Id de artista" + id_artista_consulta);

                                        // Consulta de id desafio
                                        var xmlhttpF = new XMLHttpRequest();
                                        var urlF = 'http://localhost/juego/registroJuego.php/?opcion=23&id_artista=' + id_artista_consulta + '&id_sesion=' + id_sesion;

                                        xmlhttpF.onreadystatechange = function () {
                                            if (xmlhttpF.readyState == 4 && xmlhttpF.status == 200) {
                                                var desafio = JSON.parse(xmlhttpF.responseText);

                                                if (desafio.length > 0) {
                                                    console.log('Id desafio: ' + desafio[0].ID_DESAFIO);

                                                    var id_desafio = desafio[0].ID_DESAFIO;
                                                    var numero_equipo = 7;

                                                    // Consulta sobre calificaciones respecto al desafio (deben ser seis como máximo)
                                                    var xmlhttpR = new XMLHttpRequest();
                                                    var urlR = 'http://localhost/juego/registroJuego.php/?opcion=32&id_desafio=' + id_desafio + '&numero_equipo=' + numero_equipo;

                                                    xmlhttpR.onreadystatechange = function () {
                                                        if (xmlhttpR.readyState == 4 && xmlhttpR.status == 200) {
                                                            var consulta = JSON.parse(xmlhttpR.responseText);

                                                            console.log(consulta[0].CALIFICACIONES);

                                                            if (consulta[0].CALIFICACIONES == 6) {

                                                                console.log('Número de calificaciones: ' + consulta[0].CALIFICACIONES);

                                                                Materialize.toast('Ya ha calificado a todos los equipos', 4000);

                                                                /// Visibilizar el botón de resultados
                                                                document.getElementById("paso_resultado").hidden = false;

                                                                // Esconder tabla de resultados y botón de repuesta
                                                                document.getElementById("divResultados").hidden = true;
                                                                document.getElementById("respuestas").hidden = true;

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
                                                                xmlhttp.send();
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
                console.log('Cargando respuesta...')

                // Obtención de equipo a evaluar
                var equipoEvaluado = equipo;
                console.log('Equipo a evaluar: ' + equipoEvaluado);

                // Obtención de id de sesión
                console.log('Id de sesión' + id_sesion);

                // Obtener id de artista
                var xmlhttpDos = new XMLHttpRequest();
                var urlDos = 'http://localhost/juego/registroJuego.php/?opcion=29&id_sesion=' + id_sesion;

                xmlhttpDos.onreadystatechange = function () {
                    if (xmlhttpDos.readyState == 4 && xmlhttpDos.status == 200) {
                        var array = JSON.parse(xmlhttpDos.responseText);

                        if (array.length > 0) {

                            id_artista = array[0].ID_ARTISTA;
                            console.log('Id de artista: ' + id_artista);

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

            function fijarNivelSegunda() {
                var nuevoNivel = document.getElementById("nivelDos").selectedIndex;

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

                    Materialize.toast('Nivel fijado', 4000);

                    document.getElementById('menuOpcionesNivel').hidden = true;
                    document.getElementById('menu').hidden = true;
                    document.getElementById('botonLanzar').disabled = false;

                }

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
                console.log('Id sesión para preguntar por desafios: ' + id_sesion);
                // Obtención de numero de desafios
                // Agregar contador de desafios (0 - 2)
                var xmlhttp = new XMLHttpRequest();
                var url = 'http://localhost/juego/registroJuego.php/?opcion=40&id_sesion=' + id_sesion;

                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

                        var array = JSON.parse(xmlhttp.responseText);
                        if (array.length > 0) {

                            contador_desafio = array[0].DESAFIOS;
                            console.log('Número de desafios: ' + contador_desafio);
                            console.log('Estado de sesión: ' + estado_sesion);

                            if (estado_sesion == 'ABIERTA' && contador_desafio == 0) {

                                // Obteniendo valor de los dados del equipo impar (primero)
                                var xmlhttpW = new XMLHttpRequest();
                                var urlW = 'http://localhost/juego/registroJuego.php/?opcion=9&numero_equipo=' + 1 + '&id_sesion=' + id_sesion;

                                xmlhttpW.onreadystatechange = function () {
                                    if (xmlhttpW.readyState == 4 && xmlhttpW.status == 200) {
                                        var array = JSON.parse(xmlhttpW.responseText);

                                        // Filtro de carga de la bbdd
                                        if (array.length > 0) {

                                            // Filtro de valor superior a 0
                                            if (array[0].VALOR != 0) {

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

                                        } else {
                                            Materialize.toast('Los equipos aún no han realizado el lanzamiento de dados', 4000);
                                        }
                                    }
                                }
                                xmlhttpW.open("GET", urlW, true);
                                xmlhttpW.send();

                            } else if (estado_sesion == 'ABIERTA' && contador_desafio == 1) {

                                // Obteniendo valor de los dados del equipo impar (primero)
                                var xmlhttpW = new XMLHttpRequest();
                                var urlW = 'http://localhost/juego/registroJuego.php/?opcion=9&numero_equipo=' + 3 + '&id_sesion=' + id_sesion;

                                xmlhttpW.onreadystatechange = function () {
                                    if (xmlhttpW.readyState == 4 && xmlhttpW.status == 200) {
                                        var array = JSON.parse(xmlhttpW.responseText);

                                        // Filtro de carga de la bbdd
                                        if (array.length > 0) {

                                            // Filtro de valor superior a 0
                                            if (array[0].VALOR != 0) {

                                                premio = array[0].VALOR;

                                                // Obteniendo valor de los dados del equipo par (segundo)
                                                var xmlhttpDos = new XMLHttpRequest();
                                                var urlDos = 'http://localhost/juego/registroJuego.php/?opcion=9&numero_equipo=' + 4 + '&id_sesion=' + id_sesion;

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

                                        } else {
                                            Materialize.toast('Los equipos aún no han realizado el lanzamiento de dados', 4000);
                                        }
                                    }
                                }
                                xmlhttpW.open("GET", urlW, true);
                                xmlhttpW.send();

                            } else if (estado_sesion == 'ABIERTA' && contador_desafio == 2) {

                                // Obteniendo valor de los dados del equipo impar (primero)
                                var xmlhttpW = new XMLHttpRequest();
                                var urlW = 'http://localhost/juego/registroJuego.php/?opcion=9&numero_equipo=' + 5 + '&id_sesion=' + id_sesion;

                                xmlhttpW.onreadystatechange = function () {
                                    if (xmlhttpW.readyState == 4 && xmlhttpW.status == 200) {
                                        var array = JSON.parse(xmlhttpW.responseText);

                                        // Filtro de carga de la bbdd
                                        if (array.length > 0) {

                                            // Filtro de valor superior a 0
                                            if (array[0].VALOR != 0) {

                                                premio = array[0].VALOR;

                                                // Obteniendo valor de los dados del equipo par (segundo)
                                                var xmlhttpDos = new XMLHttpRequest();
                                                var urlDos = 'http://localhost/juego/registroJuego.php/?opcion=9&numero_equipo=' + 6 + '&id_sesion=' + id_sesion;

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

                                        } else {
                                            Materialize.toast('Los equipos aún no han realizado el lanzamiento de dados', 4000);
                                        }
                                    }
                                }
                                xmlhttpW.open("GET", urlW, true);
                                xmlhttpW.send();
                            } else if (estado_sesion == 'SEGUNDA' && contador_desafio == 3) {

                                // Obteniendo valor de los dados del equipo impar (primero)
                                var xmlhttpW = new XMLHttpRequest();
                                var urlW = 'http://localhost/juego/registroJuego.php/?opcion=9&numero_equipo=' + 1 + '&id_sesion=' + id_sesion;

                                xmlhttpW.onreadystatechange = function () {
                                    if (xmlhttpW.readyState == 4 && xmlhttpW.status == 200) {
                                        var array = JSON.parse(xmlhttpW.responseText);

                                        // Filtro de carga de la bbdd
                                        if (array.length > 0) {

                                            // Filtro de valor superior a 0
                                            if (array[0].VALOR != 0) {

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

                                        } else {
                                            Materialize.toast('Los equipos aún no han realizado el lanzamiento de dados', 4000);
                                        }
                                    }
                                }
                                xmlhttpW.open("GET", urlW, true);
                                xmlhttpW.send();

                            } else if (estado_sesion == 'SEGUNDA' && contador_desafio == 4) {

                                // Obteniendo valor de los dados del equipo impar (primero)
                                var xmlhttpW = new XMLHttpRequest();
                                var urlW = 'http://localhost/juego/registroJuego.php/?opcion=9&numero_equipo=' + 3 + '&id_sesion=' + id_sesion;

                                xmlhttpW.onreadystatechange = function () {
                                    if (xmlhttpW.readyState == 4 && xmlhttpW.status == 200) {
                                        var array = JSON.parse(xmlhttpW.responseText);

                                        // Filtro de carga de la bbdd
                                        if (array.length > 0) {

                                            // Filtro de valor superior a 0
                                            if (array[0].VALOR != 0) {

                                                premio = array[0].VALOR;

                                                // Obteniendo valor de los dados del equipo par (segundo)
                                                var xmlhttpDos = new XMLHttpRequest();
                                                var urlDos = 'http://localhost/juego/registroJuego.php/?opcion=9&numero_equipo=' + 4 + '&id_sesion=' + id_sesion;

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

                                        } else {
                                            Materialize.toast('Los equipos aún no han realizado el lanzamiento de dados', 4000);
                                        }
                                    }
                                }
                                xmlhttpW.open("GET", urlW, true);
                                xmlhttpW.send();

                            } else if (estado_sesion == 'SEGUNDA' && contador_desafio == 5) {

                                // Obteniendo valor de los dados del equipo impar (primero)
                                var xmlhttpW = new XMLHttpRequest();
                                var urlW = 'http://localhost/juego/registroJuego.php/?opcion=9&numero_equipo=' + 5 + '&id_sesion=' + id_sesion;

                                xmlhttpW.onreadystatechange = function () {
                                    if (xmlhttpW.readyState == 4 && xmlhttpW.status == 200) {
                                        var array = JSON.parse(xmlhttpW.responseText);

                                        // Filtro de carga de la bbdd
                                        if (array.length > 0) {

                                            // Filtro de valor superior a 0
                                            if (array[0].VALOR != 0) {

                                                premio = array[0].VALOR;

                                                // Obteniendo valor de los dados del equipo par (segundo)
                                                var xmlhttpDos = new XMLHttpRequest();
                                                var urlDos = 'http://localhost/juego/registroJuego.php/?opcion=9&numero_equipo=' + 6 + '&id_sesion=' + id_sesion;

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

                                        } else {
                                            Materialize.toast('Los equipos aún no han realizado el lanzamiento de dados', 4000);
                                        }
                                    }
                                }
                                xmlhttpW.open("GET", urlW, true);
                                xmlhttpW.send();
                            } else if (estado_sesion == 'TERCERA' && contador_desafio == 6) {

                                // Obteniendo valor de los dados del equipo impar (primero)
                                var xmlhttpW = new XMLHttpRequest();
                                var urlW = 'http://localhost/juego/registroJuego.php/?opcion=9&numero_equipo=' + 1 + '&id_sesion=' + id_sesion;

                                xmlhttpW.onreadystatechange = function () {
                                    if (xmlhttpW.readyState == 4 && xmlhttpW.status == 200) {
                                        var array = JSON.parse(xmlhttpW.responseText);

                                        // Filtro de carga de la bbdd
                                        if (array.length > 0) {

                                            // Filtro de valor superior a 0
                                            if (array[0].VALOR != 0) {

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

                                        } else {
                                            Materialize.toast('Los equipos aún no han realizado el lanzamiento de dados', 4000);
                                        }
                                    }
                                }
                                xmlhttpW.open("GET", urlW, true);
                                xmlhttpW.send();

                            } else if (estado_sesion == 'TERCERA' && contador_desafio == 7) {

                                // Obteniendo valor de los dados del equipo impar (primero)
                                var xmlhttpW = new XMLHttpRequest();
                                var urlW = 'http://localhost/juego/registroJuego.php/?opcion=9&numero_equipo=' + 3 + '&id_sesion=' + id_sesion;

                                xmlhttpW.onreadystatechange = function () {
                                    if (xmlhttpW.readyState == 4 && xmlhttpW.status == 200) {
                                        var array = JSON.parse(xmlhttpW.responseText);

                                        // Filtro de carga de la bbdd
                                        if (array.length > 0) {

                                            // Filtro de valor superior a 0
                                            if (array[0].VALOR != 0) {

                                                premio = array[0].VALOR;

                                                // Obteniendo valor de los dados del equipo par (segundo)
                                                var xmlhttpDos = new XMLHttpRequest();
                                                var urlDos = 'http://localhost/juego/registroJuego.php/?opcion=9&numero_equipo=' + 4 + '&id_sesion=' + id_sesion;

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

                                        } else {
                                            Materialize.toast('Los equipos aún no han realizado el lanzamiento de dados', 4000);
                                        }
                                    }
                                }
                                xmlhttpW.open("GET", urlW, true);
                                xmlhttpW.send();

                            } else if (estado_sesion == 'TERCERA' && contador_desafio == 8) {

                                // Obteniendo valor de los dados del equipo impar (primero)
                                var xmlhttpW = new XMLHttpRequest();
                                var urlW = 'http://localhost/juego/registroJuego.php/?opcion=9&numero_equipo=' + 5 + '&id_sesion=' + id_sesion;

                                xmlhttpW.onreadystatechange = function () {
                                    if (xmlhttpW.readyState == 4 && xmlhttpW.status == 200) {
                                        var array = JSON.parse(xmlhttpW.responseText);

                                        // Filtro de carga de la bbdd
                                        if (array.length > 0) {

                                            // Filtro de valor superior a 0
                                            if (array[0].VALOR != 0) {

                                                premio = array[0].VALOR;

                                                // Obteniendo valor de los dados del equipo par (segundo)
                                                var xmlhttpDos = new XMLHttpRequest();
                                                var urlDos = 'http://localhost/juego/registroJuego.php/?opcion=9&numero_equipo=' + 6 + '&id_sesion=' + id_sesion;

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

                                        } else {
                                            Materialize.toast('Los equipos aún no han realizado el lanzamiento de dados', 4000);
                                        }
                                    }
                                }
                                xmlhttpW.open("GET", urlW, true);
                                xmlhttpW.send();
                            }

                        } else {
                            Materialize.toast('Problemas al contar el número de desafíos realizados', 4000);
                        }
                    }
                }
                xmlhttp.open("GET", url, true);
                xmlhttp.send();
            }

            function cargarSubtematica() {
                //console.log('Carga de subtemática');
                document.getElementById("dado").style.height = "0px";
                obtenerSubtematicas(premio);
            }

            function cargarMapa(premio) {
                // console.log(posicion);
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
                //console.log('obteniendo subtemáticas');
                //console.log('premio: ' + premio);
                console.log(id_subtematica);

                var xmlhttp = new XMLHttpRequest();
                var url = 'http://localhost/juego/registroJuego.php/?opcion=24&id_subtematica=' + id_subtematica;

                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        var array = JSON.parse(xmlhttp.responseText);
                        //console.log(array);

                        document.getElementById('subtematica').innerHTML = array[0].DESCRIPCION_SUBTEMATICA;

                        // Carga de artistas según niveles de avance en el turno
                        obtenerArtistas(id_subtematica);
                    }
                }
                xmlhttp.open("GET", url, true);
                xmlhttp.send();
            }

            function obtenerArtistas(id_subtematica) {
                //console.log('obteniendo artistas');
                //console.log('id subtematica: ' + id_subtematica);

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
                                                //console.log(array);

                                                if (arrayPasado.length > 0) {
                                                    for (i = 0; i < arrayPasado.length; i++) {

                                                        for (x = 0; x < artistas_disponibles.length; x++) {

                                                            if (arrayPasado[i].ID_ARTISTA == artistas_disponibles[x].ID_ARTISTA) {
                                                                console.log('eliminando repetidos!');
                                                                console.log(artistas_disponibles.length);
                                                                artistas_disponibles.splice(x, 1);
                                                                console.log(artistas_disponibles.length);
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
                                console.log(artistas_disponibles);
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
                        //console.log(array);

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
                        //console.log(array);

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

            function desplegarMenuNivel() {
                var contenedor = document.getElementById('menu');
                contenedor.innerHTML += "<p style='color: white;'>Nivel Actual: <b>" + nivel_sesion + "</b></p>";
                contenedor.innerHTML += "<p style='color: white;'>Si desea otro nivel, selecciónelo en las siguientes opciones; si desea mantener el nivel actual, presione Cerrar</p>";
                contenedor.innerHTML += "<p style='color: white;'><b>Seleccione el nivel del siguiente ciclo:</b></p>";
                contenedor.innerHTML += "<div class='row' id='botonOpciones'><a style='margin: 10px auto;' class='btn waves-effect blue lighten-1 modal-trigger' onclick='habilitarOpcionesNivel()'>OPCIONES<i class='material-icons right'>settings</i></button></div>";
            }

            function cerrar() {
                document.getElementById('menu').hidden = true;
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

            function habilitarOpcionesNivel() {
                deshabilitarMenuNivel();

                document.getElementById('menuOpcionesNivel').hidden = false;
            }

            function deshabilitarMenu() {
                document.getElementById('botonInstrucciones').hidden = true;
                document.getElementById('botonOpciones').hidden = true;
                document.getElementById('botonCreditos').hidden = true;
                document.getElementById('botonJugar').hidden = true;
            }

            function deshabilitarMenuNivel() {
                document.getElementById('botonOpciones').hidden = true;
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
                console.log('estado_sesion: ' + estado_sesion);
                console.log('id_sesion: ' + id_sesion);
                console.log('nivel_sesion: ' + nivel_sesion);

                // Grabar datos en formulario de paso de desafío
                document.getElementById("estado_sesion").value = estado_sesion;
                document.getElementById("id_sesion").value = id_sesion;
                document.getElementById("nivel_sesion").value = nivel_sesion;

                // Grabar datos en formulario de paso de desafío final de nivel
                document.getElementById("estado_sesion_dos").value = estado_sesion;
                document.getElementById("id_sesion_dos").value = id_sesion;
                document.getElementById("nivel_sesion_dos").value = nivel_sesion;

                // Grabar datos en formulario de paso de desafío final de nivel final
                document.getElementById("estado_sesion_tres").value = estado_sesion;
                document.getElementById("id_sesion_tres").value = id_sesion;
                document.getElementById("nivel_sesion_tres").value = nivel_sesion;
                
                // Grabar datos en formulario de paso de desafío final de juego
                document.getElementById("estado_sesion_cuatro").value = estado_sesion;
                document.getElementById("id_sesion_cuatro").value = id_sesion;
                document.getElementById("nivel_sesion_cuatro").value = nivel_sesion;

                // Obtención de numero de desafios
                // Agregar contador de desafios (0 - 3)
                var xmlhttp = new XMLHttpRequest();
                var url = 'http://localhost/juego/registroJuego.php/?opcion=40&id_sesion=' + id_sesion;

                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

                        var array = JSON.parse(xmlhttp.responseText);
                        if (array.length > 0) {

                            contador_desafio = array[0].DESAFIOS;
                            console.log('Número de desafios: ' + contador_desafio);

                            // HABILITAR MENU DE FINAL DE NIVEL (IF SEGUNDA O TERCERA)

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

                                            // Condición de habilitar botón de inicio de partida, si es el tercer desafío cerrado
                                            console.log('Número de desafíos en carga de botón: ' + contador_desafio);

                                            if (contador_desafio == 3) {

                                                console.log('Cargando resultados de nivel...');

                                                // Carga de tabla de resultados finales


                                                console.log('Id de sesión para consulta de respuestas según id de sesion y estado (AVG(VALORACION)): ' + id_sesion);
                                                console.log('Estado de sesión para consulta de respuestas según id de sesion y estado (AVG(VALORACION)): ' + estado_sesion);

                                                // Obtención de los resultados de las respuestas de los equipos
                                                var xmlhttpDos = new XMLHttpRequest();
                                                var urlDos = 'http://localhost/juego/registroJuego.php/?opcion=42&id_sesion=' + id_sesion + '&estado=' + estado_sesion;

                                                xmlhttpDos.onreadystatechange = function () {
                                                    if (xmlhttpDos.readyState == 4 && xmlhttpDos.status == 200) {
                                                        var resultados = JSON.parse(xmlhttpDos.responseText);

                                                        console.log(resultados);

                                                        document.getElementById('divCalificacionesNivel').hidden = false;

                                                        var contenedor = document.getElementById('divCalificacionesNivel');

                                                        contenedor.innerHTML = "";

                                                        contenedor.innerHTML += "\
                                                                    <div class='row'>\n\
                                                                        <h5 style='text-align: center;'><b>RESULTADOS DE CIERRE DE NIVEL</b></h5>\n\
                                                                    </div>";

                                                        for (i = 0; i < resultados.length; i++) {

                                                            if (i == 0) {
                                                                contenedor.innerHTML += "\
                                                                <form style='margin-top: 10px; margin-bottom: 10px; margin-left: 20px; margin-right: 20px;'>\n\
                                                                    <div class='row'>\n\
                                                                        <h4 style='text-align: center;'><b>Primer Lugar</b></h4>\n\
                                                                        <h6 style='text-align: center;'><b>Equipo " + resultados[i].NUMERO_EQUIPO + "</b></h6>\n\
                                                                        <p style='text-align: center;'>Calificación obtenida: <b>" + resultados[i].PROMEDIO_NIVEL + "</b></p>\n\
                                                                        <input hidden='true' id='equipoEvaluadoForm' value=" + resultados[i].NUMERO_EQUIPO + ">\n\
                                                                    </div>\n\
                                                                </form>";
                                                            } else if (i == 1) {
                                                                contenedor.innerHTML += "\
                                                                <form style='margin-top: 10px; margin-bottom: 10px; margin-left: 20px; margin-right: 20px;'>\n\
                                                                    <div class='row'>\n\
                                                                        <h4 style='text-align: center;'><b>Segundo Lugar</b></h4>\n\
                                                                        <h6 style='text-align: center;'><b>Equipo " + resultados[i].NUMERO_EQUIPO + "</b></h6>\n\
                                                                        <p style='text-align: center;'>Calificación obtenida: <b>" + resultados[i].PROMEDIO_NIVEL + "</b></p>\n\
                                                                        <input hidden='true' id='equipoEvaluadoForm' value=" + resultados[i].NUMERO_EQUIPO + ">\n\
                                                                    </div>\n\
                                                                </form>";
                                                            } else if (i == 2) {
                                                                contenedor.innerHTML += "\
                                                                <form style='margin-top: 10px; margin-bottom: 10px; margin-left: 20px; margin-right: 20px;'>\n\
                                                                    <div class='row'>\n\
                                                                        <h4 style='text-align: center;'><b>Tercer Lugar</b></h4>\n\
                                                                        <h6 style='text-align: center;'><b>Equipo " + resultados[i].NUMERO_EQUIPO + "</b></h6>\n\
                                                                        <p style='text-align: center;'>Calificación obtenida: <b>" + resultados[i].PROMEDIO_NIVEL + "</b></p>\n\
                                                                        <input hidden='true' id='equipoEvaluadoForm' value=" + resultados[i].NUMERO_EQUIPO + ">\n\
                                                                    </div>\n\
                                                                </form>";
                                                            } else {
                                                                contenedor.innerHTML += "\
                                                                <form style='margin-top: 10px; margin-bottom: 10px; margin-left: 20px; margin-right: 20px;'>\n\
                                                                    <div class='row'>\n\
                                                                        <h6 style='text-align: center;'><b>Equipo " + resultados[i].NUMERO_EQUIPO + "</b></h6>\n\
                                                                        <p style='text-align: center;'>Calificación obtenida: <b>" + resultados[i].PROMEDIO_NIVEL + "</b></p>\n\
                                                                        <input hidden='true' id='equipoEvaluadoForm' value=" + resultados[i].NUMERO_EQUIPO + ">\n\
                                                                    </div>\n\
                                                                </form>";
                                                            }
                                                        }

                                                    }
                                                }
                                                xmlhttpDos.open("GET", urlDos, true);
                                                xmlhttpDos.send();

                                                // Carga de botón de cerrar nivel

                                                document.getElementById("paso_nivel_final").hidden = false;


                                            } else {

                                                document.getElementById('botonLanzar').disabled = false;

                                            }

                                        }
                                    }
                                }
                                xmlhttpTres.open("GET", urlTres, true);
                                xmlhttpTres.send();

                            } else if (estado_sesion == 'SEGUNDA' && contador_desafio == 3) {

                                desplegarMenuNivel();

                            } else if (estado_sesion == 'SEGUNDA' && contador_desafio == 4) {

                                document.getElementById('botonLanzar').disabled = false;

                            } else if (estado_sesion == 'SEGUNDA' && contador_desafio == 5) {

                                document.getElementById('botonLanzar').disabled = false;

                            } else if (estado_sesion == 'SEGUNDA' && contador_desafio == 6) {

                                // Condición de habilitar botón de inicio de partida, si es el tercer desafío cerrado
                                console.log('Número de desafíos en carga de botón: ' + contador_desafio);


                                // Carga de tabla de resultados finales


                                console.log('Id de sesión para consulta de respuestas según id de sesion y estado (AVG(VALORACION)): ' + id_sesion);
                                console.log('Estado de sesión para consulta de respuestas según id de sesion y estado (AVG(VALORACION)): ' + estado_sesion);

                                // Obtención de los resultados de las respuestas de los equipos
                                var xmlhttpDos = new XMLHttpRequest();
                                var urlDos = 'http://localhost/juego/registroJuego.php/?opcion=42&id_sesion=' + id_sesion + '&estado=' + estado_sesion;

                                xmlhttpDos.onreadystatechange = function () {
                                    if (xmlhttpDos.readyState == 4 && xmlhttpDos.status == 200) {
                                        var resultados = JSON.parse(xmlhttpDos.responseText);

                                        console.log(resultados);

                                        document.getElementById('divCalificacionesNivel').hidden = false;

                                        var contenedor = document.getElementById('divCalificacionesNivel');

                                        contenedor.innerHTML = "";

                                        contenedor.innerHTML += "\
                                                                    <div class='row'>\n\
                                                                        <h5 style='text-align: center;'><b>RESULTADOS DE CIERRE DE NIVEL</b></h5>\n\
                                                                    </div>";

                                        for (i = 0; i < resultados.length; i++) {

                                            if (i == 0) {
                                                contenedor.innerHTML += "\
                                                                <form style='margin-top: 10px; margin-bottom: 10px; margin-left: 20px; margin-right: 20px;'>\n\
                                                                    <div class='row'>\n\
                                                                        <h4 style='text-align: center;'><b>Primer Lugar</b></h4>\n\
                                                                        <h6 style='text-align: center;'><b>Equipo " + resultados[i].NUMERO_EQUIPO + "</b></h6>\n\
                                                                        <p style='text-align: center;'>Calificación obtenida: <b>" + resultados[i].PROMEDIO_NIVEL + "</b></p>\n\
                                                                        <input hidden='true' id='equipoEvaluadoForm' value=" + resultados[i].NUMERO_EQUIPO + ">\n\
                                                                    </div>\n\
                                                                </form>";
                                            } else if (i == 1) {
                                                contenedor.innerHTML += "\
                                                                <form style='margin-top: 10px; margin-bottom: 10px; margin-left: 20px; margin-right: 20px;'>\n\
                                                                    <div class='row'>\n\
                                                                        <h4 style='text-align: center;'><b>Segundo Lugar</b></h4>\n\
                                                                        <h6 style='text-align: center;'><b>Equipo " + resultados[i].NUMERO_EQUIPO + "</b></h6>\n\
                                                                        <p style='text-align: center;'>Calificación obtenida: <b>" + resultados[i].PROMEDIO_NIVEL + "</b></p>\n\
                                                                        <input hidden='true' id='equipoEvaluadoForm' value=" + resultados[i].NUMERO_EQUIPO + ">\n\
                                                                    </div>\n\
                                                                </form>";
                                            } else if (i == 2) {
                                                contenedor.innerHTML += "\
                                                                <form style='margin-top: 10px; margin-bottom: 10px; margin-left: 20px; margin-right: 20px;'>\n\
                                                                    <div class='row'>\n\
                                                                        <h4 style='text-align: center;'><b>Tercer Lugar</b></h4>\n\
                                                                        <h6 style='text-align: center;'><b>Equipo " + resultados[i].NUMERO_EQUIPO + "</b></h6>\n\
                                                                        <p style='text-align: center;'>Calificación obtenida: <b>" + resultados[i].PROMEDIO_NIVEL + "</b></p>\n\
                                                                        <input hidden='true' id='equipoEvaluadoForm' value=" + resultados[i].NUMERO_EQUIPO + ">\n\
                                                                    </div>\n\
                                                                </form>";
                                            } else {
                                                contenedor.innerHTML += "\
                                                                <form style='margin-top: 10px; margin-bottom: 10px; margin-left: 20px; margin-right: 20px;'>\n\
                                                                    <div class='row'>\n\
                                                                        <h6 style='text-align: center;'><b>Equipo " + resultados[i].NUMERO_EQUIPO + "</b></h6>\n\
                                                                        <p style='text-align: center;'>Calificación obtenida: <b>" + resultados[i].PROMEDIO_NIVEL + "</b></p>\n\
                                                                        <input hidden='true' id='equipoEvaluadoForm' value=" + resultados[i].NUMERO_EQUIPO + ">\n\
                                                                    </div>\n\
                                                                </form>";
                                            }
                                        }

                                    }
                                }
                                xmlhttpDos.open("GET", urlDos, true);
                                xmlhttpDos.send();

                                // Carga de botón de cerrar nivel

                                document.getElementById("paso_nivel_final").hidden = false;


                            } else if (estado_sesion == 'TERCERA' && contador_desafio == 6) {

                                desplegarMenuNivel();

                            } else if (estado_sesion == 'TERCERA' && contador_desafio == 7) {

                                document.getElementById('botonLanzar').disabled = false;

                            } else if (estado_sesion == 'TERCERA' && contador_desafio == 8) {

                                document.getElementById('botonLanzar').disabled = false;

                            } else if (estado_sesion == 'TERCERA' && contador_desafio == 9) {

                                // Condición de habilitar botón de inicio de partida, si es el tercer desafío cerrado
                                console.log('Número de desafíos en carga de botón: ' + contador_desafio);


                                // Carga de tabla de resultados finales


                                console.log('Id de sesión para consulta de respuestas según id de sesion y estado (AVG(VALORACION)): ' + id_sesion);
                                console.log('Estado de sesión para consulta de respuestas según id de sesion y estado (AVG(VALORACION)): ' + estado_sesion);

                                // Obtención de los resultados de las respuestas de los equipos
                                var xmlhttpDos = new XMLHttpRequest();
                                var urlDos = 'http://localhost/juego/registroJuego.php/?opcion=42&id_sesion=' + id_sesion + '&estado=' + estado_sesion;

                                xmlhttpDos.onreadystatechange = function () {
                                    if (xmlhttpDos.readyState == 4 && xmlhttpDos.status == 200) {
                                        var resultados = JSON.parse(xmlhttpDos.responseText);

                                        console.log(resultados);

                                        document.getElementById('divCalificacionesNivel').hidden = false;

                                        var contenedor = document.getElementById('divCalificacionesNivel');

                                        contenedor.innerHTML = "";

                                        contenedor.innerHTML += "\
                                                                    <div class='row'>\n\
                                                                        <h5 style='text-align: center;'><b>RESULTADOS DE CIERRE DE NIVEL</b></h5>\n\
                                                                    </div>";

                                        for (i = 0; i < resultados.length; i++) {

                                            if (i == 0) {
                                                contenedor.innerHTML += "\
                                                                <form style='margin-top: 10px; margin-bottom: 10px; margin-left: 20px; margin-right: 20px;'>\n\
                                                                    <div class='row'>\n\
                                                                        <h4 style='text-align: center;'><b>Primer Lugar</b></h4>\n\
                                                                        <h6 style='text-align: center;'><b>Equipo " + resultados[i].NUMERO_EQUIPO + "</b></h6>\n\
                                                                        <p style='text-align: center;'>Calificación obtenida: <b>" + resultados[i].PROMEDIO_NIVEL + "</b></p>\n\
                                                                        <input hidden='true' id='equipoEvaluadoForm' value=" + resultados[i].NUMERO_EQUIPO + ">\n\
                                                                    </div>\n\
                                                                </form>";
                                            } else if (i == 1) {
                                                contenedor.innerHTML += "\
                                                                <form style='margin-top: 10px; margin-bottom: 10px; margin-left: 20px; margin-right: 20px;'>\n\
                                                                    <div class='row'>\n\
                                                                        <h4 style='text-align: center;'><b>Segundo Lugar</b></h4>\n\
                                                                        <h6 style='text-align: center;'><b>Equipo " + resultados[i].NUMERO_EQUIPO + "</b></h6>\n\
                                                                        <p style='text-align: center;'>Calificación obtenida: <b>" + resultados[i].PROMEDIO_NIVEL + "</b></p>\n\
                                                                        <input hidden='true' id='equipoEvaluadoForm' value=" + resultados[i].NUMERO_EQUIPO + ">\n\
                                                                    </div>\n\
                                                                </form>";
                                            } else if (i == 2) {
                                                contenedor.innerHTML += "\
                                                                <form style='margin-top: 10px; margin-bottom: 10px; margin-left: 20px; margin-right: 20px;'>\n\
                                                                    <div class='row'>\n\
                                                                        <h4 style='text-align: center;'><b>Tercer Lugar</b></h4>\n\
                                                                        <h6 style='text-align: center;'><b>Equipo " + resultados[i].NUMERO_EQUIPO + "</b></h6>\n\
                                                                        <p style='text-align: center;'>Calificación obtenida: <b>" + resultados[i].PROMEDIO_NIVEL + "</b></p>\n\
                                                                        <input hidden='true' id='equipoEvaluadoForm' value=" + resultados[i].NUMERO_EQUIPO + ">\n\
                                                                    </div>\n\
                                                                </form>";
                                            } else {
                                                contenedor.innerHTML += "\
                                                                <form style='margin-top: 10px; margin-bottom: 10px; margin-left: 20px; margin-right: 20px;'>\n\
                                                                    <div class='row'>\n\
                                                                        <h6 style='text-align: center;'><b>Equipo " + resultados[i].NUMERO_EQUIPO + "</b></h6>\n\
                                                                        <p style='text-align: center;'>Calificación obtenida: <b>" + resultados[i].PROMEDIO_NIVEL + "</b></p>\n\
                                                                        <input hidden='true' id='equipoEvaluadoForm' value=" + resultados[i].NUMERO_EQUIPO + ">\n\
                                                                    </div>\n\
                                                                </form>";
                                            }
                                        }

                                    }
                                }
                                xmlhttpDos.open("GET", urlDos, true);
                                xmlhttpDos.send();

                                // Carga de botón de cerrar nivel

                                document.getElementById("paso_nivel_final").hidden = false;

                            } else if (estado_sesion == 'CIERRE') {
                                
                                // Última pantalla del juego
                                
                                // Obtención de los resultados de las respuestas de los equipos totales
                                var xmlhttpDos = new XMLHttpRequest();
                                var urlDos = 'http://localhost/juego/registroJuego.php/?opcion=44&id_sesion=' + id_sesion;

                                xmlhttpDos.onreadystatechange = function () {
                                    if (xmlhttpDos.readyState == 4 && xmlhttpDos.status == 200) {
                                        var resultados = JSON.parse(xmlhttpDos.responseText);

                                        console.log(resultados);

                                        document.getElementById('divCalificacionesNivel').hidden = false;

                                        var contenedor = document.getElementById('divCalificacionesNivel');

                                        contenedor.innerHTML = "";

                                        contenedor.innerHTML += "\
                                                                    <div class='row'>\n\
                                                                        <h5 style='text-align: center;'><b>RESULTADOS DE JUEGO</b></h5>\n\
                                                                    </div>";

                                        for (i = 0; i < resultados.length; i++) {

                                            if (i == 0) {
                                                contenedor.innerHTML += "\
                                                                <form style='margin-top: 10px; margin-bottom: 10px; margin-left: 20px; margin-right: 20px;'>\n\
                                                                    <div class='row'>\n\
                                                                        <h4 style='text-align: center;'><b>Primer Lugar</b></h4>\n\
                                                                        <h6 style='text-align: center;'><b>Equipo " + resultados[i].NUMERO_EQUIPO + "</b></h6>\n\
                                                                        <p style='text-align: center;'>Calificación obtenida: <b>" + resultados[i].PROMEDIO_JUEGO + "</b></p>\n\
                                                                        <input hidden='true' id='equipoEvaluadoForm' value=" + resultados[i].NUMERO_EQUIPO + ">\n\
                                                                    </div>\n\
                                                                </form>";
                                            } else if (i == 1) {
                                                contenedor.innerHTML += "\
                                                                <form style='margin-top: 10px; margin-bottom: 10px; margin-left: 20px; margin-right: 20px;'>\n\
                                                                    <div class='row'>\n\
                                                                        <h4 style='text-align: center;'><b>Segundo Lugar</b></h4>\n\
                                                                        <h6 style='text-align: center;'><b>Equipo " + resultados[i].NUMERO_EQUIPO + "</b></h6>\n\
                                                                        <p style='text-align: center;'>Calificación obtenida: <b>" + resultados[i].PROMEDIO_JUEGO + "</b></p>\n\
                                                                        <input hidden='true' id='equipoEvaluadoForm' value=" + resultados[i].NUMERO_EQUIPO + ">\n\
                                                                    </div>\n\
                                                                </form>";
                                            } else if (i == 2) {
                                                contenedor.innerHTML += "\
                                                                <form style='margin-top: 10px; margin-bottom: 10px; margin-left: 20px; margin-right: 20px;'>\n\
                                                                    <div class='row'>\n\
                                                                        <h4 style='text-align: center;'><b>Tercer Lugar</b></h4>\n\
                                                                        <h6 style='text-align: center;'><b>Equipo " + resultados[i].NUMERO_EQUIPO + "</b></h6>\n\
                                                                        <p style='text-align: center;'>Calificación obtenida: <b>" + resultados[i].PROMEDIO_JUEGO + "</b></p>\n\
                                                                        <input hidden='true' id='equipoEvaluadoForm' value=" + resultados[i].NUMERO_EQUIPO + ">\n\
                                                                    </div>\n\
                                                                </form>";
                                            } else {
                                                contenedor.innerHTML += "\
                                                                <form style='margin-top: 10px; margin-bottom: 10px; margin-left: 20px; margin-right: 20px;'>\n\
                                                                    <div class='row'>\n\
                                                                        <h6 style='text-align: center;'><b>Equipo " + resultados[i].NUMERO_EQUIPO + "</b></h6>\n\
                                                                        <p style='text-align: center;'>Calificación obtenida: <b>" + resultados[i].PROMEDIO_JUEGO + "</b></p>\n\
                                                                        <input hidden='true' id='equipoEvaluadoForm' value=" + resultados[i].NUMERO_EQUIPO + ">\n\
                                                                    </div>\n\
                                                                </form>";
                                            }
                                        }

                                    }
                                }
                                xmlhttpDos.open("GET", urlDos, true);
                                xmlhttpDos.send();

                                // Carga de botón de cerrar nivel

                                document.getElementById("paso_nivel_final_dos").hidden = false;
                                
                            }
                        } else {
                            Materialize.toast('Problemas al contar el número de desafíos realizados', 4000);
                        }
                    }
                }
                xmlhttp.open("GET", url, true);
                xmlhttp.send();
            }
        </script>
    </body>
</html>
