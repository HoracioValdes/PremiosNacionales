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
    <script>
        var estado_sesion;
        var id_sesion;
        var numero_equipo;
        var contador_desafio;

        function recibirData() {
            estado_sesion = '${estado_sesion}';
            id_sesion = '${id_sesion}';
            numero_equipo = '${numero_equipo}';

            // Agregar contador de desafios (0 - 5)
            var xmlhttp = new XMLHttpRequest();
            var url = 'http://localhost/juego/registroJuego.php/?opcion=40&id_sesion=' + id_sesion;

            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

                    var array = JSON.parse(xmlhttp.responseText);
                    if (array.length > 0) {

                        contador_desafio = array[0].DESAFIOS;
                        console.log('Número de desafios: ' + contador_desafio);

                        if (contador_desafio == 3 || contador_desafio == 4 || contador_desafio == 5) {
                            if (estado_sesion == 'ABIERTA') {
                                estado_sesion = 'SEGUNDA';
                            }
                        } else if (contador_desafio == 6 || contador_desafio == 7 || contador_desafio == 8) {
                            if (estado_sesion == 'SEGUNDA') {
                                estado_sesion = 'TERCERA';
                            }
                        } else if (contador_desafio == 9) {
                            if (estado_sesion == 'TERCERA') {
                                estado_sesion = 'CIERRE';
                            }
                        }
                    } else {
                        Materialize.toast('Problemas al contar el número de desafíos realizados', 4000);
                    }
                }
            }
            xmlhttp.open("GET", url, true);
            xmlhttp.send();

            console.log('Estado sesión: ' + estado_sesion);
            // Grabar datos en formulario de paso de desafío
            document.getElementById("estado_sesion").value = estado_sesion;
            document.getElementById("id_sesion").value = id_sesion;
            document.getElementById("numero_equipo").value = numero_equipo;

            cargarDados(estado_sesion, numero_equipo, id_sesion);
        }

        function cargarDados(estado_sesion, numero_equipo, id_sesion) {

            // Agregar contador de desafios (0 - 5)
            var xmlhttp = new XMLHttpRequest();
            var url = 'http://localhost/juego/registroJuego.php/?opcion=40&id_sesion=' + id_sesion;

            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

                    var array = JSON.parse(xmlhttp.responseText);
                    if (array.length > 0) {

                        contador_desafio = array[0].DESAFIOS;
                        console.log('Número de desafios: ' + contador_desafio);

                        if (contador_desafio == 3 || contador_desafio == 4 || contador_desafio == 5) {
                            if (estado_sesion == 'ABIERTA') {
                                estado_sesion = 'SEGUNDA';
                            }
                        } else if (contador_desafio == 6 || contador_desafio == 7 || contador_desafio == 8) {
                            if (estado_sesion == 'SEGUNDA') {
                                estado_sesion = 'TERCERA';
                            }
                        } else if (contador_desafio == 9) {
                            if (estado_sesion == 'TERCERA') {
                                estado_sesion = 'CIERRE';
                            }
                        }

                        console.log('Estado_sesion: ' + estado_sesion);

                        if (estado_sesion == 'ABIERTA' && numero_equipo == 1 && contador_desafio == 0) {

                            console.log('se cumple 1');
                            var contenedor = document.getElementById('dado');
                            contenedor.innerHTML += "<button id='botonLanzar' style='margin-top: 10px;' class='btn waves-effect blue lighten-1' type='submit' name='action' onclick='return lanzarDado();'>Lanzar dado<i class='material-icons right'>loop</i></button>";

                        } else if (estado_sesion == 'ABIERTA' && numero_equipo == 2 && contador_desafio == 0) {

                            console.log('se cumple 2');
                            var contenedor = document.getElementById('dado');
                            contenedor.innerHTML += "<button id='botonLanzar' style='margin-top: 10px;' class='btn waves-effect blue lighten-1' type='submit' name='action' onclick='return lanzarDado();'>Lanzar dado<i class='material-icons right'>loop</i></button>";

                        } else if (estado_sesion == 'ABIERTA' && numero_equipo == 3 && contador_desafio == 1) {

                            console.log('se cumple 3');
                            var contenedor = document.getElementById('dado');
                            contenedor.innerHTML += "<button id='botonLanzar' style='margin-top: 10px;' class='btn waves-effect blue lighten-1' type='submit' name='action' onclick='return lanzarDado();'>Lanzar dado<i class='material-icons right'>loop</i></button>";

                        } else if (estado_sesion == 'ABIERTA' && numero_equipo == 4 && contador_desafio == 1) {

                            console.log('se cumple 4');
                            var contenedor = document.getElementById('dado');
                            contenedor.innerHTML += "<button id='botonLanzar' style='margin-top: 10px;' class='btn waves-effect blue lighten-1' type='submit' name='action' onclick='return lanzarDado();'>Lanzar dado<i class='material-icons right'>loop</i></button>";

                        } else if (estado_sesion == 'ABIERTA' && numero_equipo == 5 && contador_desafio == 2) {

                            console.log('se cumple 5');
                            var contenedor = document.getElementById('dado');
                            contenedor.innerHTML += "<button id='botonLanzar' style='margin-top: 10px;' class='btn waves-effect blue lighten-1' type='submit' name='action' onclick='return lanzarDado();'>Lanzar dado<i class='material-icons right'>loop</i></button>";

                        } else if (estado_sesion == 'ABIERTA' && numero_equipo == 6 && contador_desafio == 2) {

                            console.log('se cumple 6');
                            var contenedor = document.getElementById('dado');
                            contenedor.innerHTML += "<button id='botonLanzar' style='margin-top: 10px;' class='btn waves-effect blue lighten-1' type='submit' name='action' onclick='return lanzarDado();'>Lanzar dado<i class='material-icons right'>loop</i></button>";

                        } else if (estado_sesion == 'SEGUNDA' && numero_equipo == 1 && contador_desafio == 3) {

                            console.log('se cumple 1');
                            var contenedor = document.getElementById('dado');
                            contenedor.innerHTML += "<button id='botonLanzar' style='margin-top: 10px;' class='btn waves-effect blue lighten-1' type='submit' name='action' onclick='return lanzarDado();'>Lanzar dado<i class='material-icons right'>loop</i></button>";

                        } else if (estado_sesion == 'SEGUNDA' && numero_equipo == 2 && contador_desafio == 3) {

                            console.log('se cumple 2');
                            var contenedor = document.getElementById('dado');
                            contenedor.innerHTML += "<button id='botonLanzar' style='margin-top: 10px;' class='btn waves-effect blue lighten-1' type='submit' name='action' onclick='return lanzarDado();'>Lanzar dado<i class='material-icons right'>loop</i></button>";

                        } else if (estado_sesion == 'SEGUNDA' && numero_equipo == 3 && contador_desafio == 4) {

                            console.log('se cumple 3');
                            var contenedor = document.getElementById('dado');
                            contenedor.innerHTML += "<button id='botonLanzar' style='margin-top: 10px;' class='btn waves-effect blue lighten-1' type='submit' name='action' onclick='return lanzarDado();'>Lanzar dado<i class='material-icons right'>loop</i></button>";

                        } else if (estado_sesion == 'SEGUNDA' && numero_equipo == 4 && contador_desafio == 4) {

                            console.log('se cumple 4');
                            var contenedor = document.getElementById('dado');
                            contenedor.innerHTML += "<button id='botonLanzar' style='margin-top: 10px;' class='btn waves-effect blue lighten-1' type='submit' name='action' onclick='return lanzarDado();'>Lanzar dado<i class='material-icons right'>loop</i></button>";

                        } else if (estado_sesion == 'SEGUNDA' && numero_equipo == 5 && contador_desafio == 5) {

                            console.log('se cumple 5');
                            var contenedor = document.getElementById('dado');
                            contenedor.innerHTML += "<button id='botonLanzar' style='margin-top: 10px;' class='btn waves-effect blue lighten-1' type='submit' name='action' onclick='return lanzarDado();'>Lanzar dado<i class='material-icons right'>loop</i></button>";

                        } else if (estado_sesion == 'SEGUNDA' && numero_equipo == 6 && contador_desafio == 5) {

                            console.log('se cumple 6');
                            var contenedor = document.getElementById('dado');
                            contenedor.innerHTML += "<button id='botonLanzar' style='margin-top: 10px;' class='btn waves-effect blue lighten-1' type='submit' name='action' onclick='return lanzarDado();'>Lanzar dado<i class='material-icons right'>loop</i></button>";

                        } else if (estado_sesion == 'TERCERA' && numero_equipo == 1 && contador_desafio == 6) {

                            console.log('se cumple 1');
                            var contenedor = document.getElementById('dado');
                            contenedor.innerHTML += "<button id='botonLanzar' style='margin-top: 10px;' class='btn waves-effect blue lighten-1' type='submit' name='action' onclick='return lanzarDado();'>Lanzar dado<i class='material-icons right'>loop</i></button>";

                        } else if (estado_sesion == 'TERCERA' && numero_equipo == 2 && contador_desafio == 6) {

                            console.log('se cumple 2');
                            var contenedor = document.getElementById('dado');
                            contenedor.innerHTML += "<button id='botonLanzar' style='margin-top: 10px;' class='btn waves-effect blue lighten-1' type='submit' name='action' onclick='return lanzarDado();'>Lanzar dado<i class='material-icons right'>loop</i></button>";

                        } else if (estado_sesion == 'TERCERA' && numero_equipo == 3 && contador_desafio == 7) {

                            console.log('se cumple 3');
                            var contenedor = document.getElementById('dado');
                            contenedor.innerHTML += "<button id='botonLanzar' style='margin-top: 10px;' class='btn waves-effect blue lighten-1' type='submit' name='action' onclick='return lanzarDado();'>Lanzar dado<i class='material-icons right'>loop</i></button>";

                        } else if (estado_sesion == 'TERCERA' && numero_equipo == 4 && contador_desafio == 7) {

                            console.log('se cumple 4');
                            var contenedor = document.getElementById('dado');
                            contenedor.innerHTML += "<button id='botonLanzar' style='margin-top: 10px;' class='btn waves-effect blue lighten-1' type='submit' name='action' onclick='return lanzarDado();'>Lanzar dado<i class='material-icons right'>loop</i></button>";

                        } else if (estado_sesion == 'TERCERA' && numero_equipo == 5 && contador_desafio == 8) {

                            console.log('se cumple 5');
                            var contenedor = document.getElementById('dado');
                            contenedor.innerHTML += "<button id='botonLanzar' style='margin-top: 10px;' class='btn waves-effect blue lighten-1' type='submit' name='action' onclick='return lanzarDado();'>Lanzar dado<i class='material-icons right'>loop</i></button>";

                        } else if (estado_sesion == 'TERCERA' && numero_equipo == 6 && contador_desafio == 8) {

                            console.log('se cumple 6');
                            var contenedor = document.getElementById('dado');
                            contenedor.innerHTML += "<button id='botonLanzar' style='margin-top: 10px;' class='btn waves-effect blue lighten-1' type='submit' name='action' onclick='return lanzarDado();'>Lanzar dado<i class='material-icons right'>loop</i></button>";

                        } else if (estado_sesion == 'CIERRE' && contador_desafio == 9) {

                            console.log('se cumple el cierre');
                            var contenedor = document.getElementById('dado');
                            contenedor.innerHTML += "<a id='botonCerrar' style='margin-top: 10px;' class='btn waves-effect blue lighten-1' type='submit' name='action' href='index.jsp'>Cerrar el juego<i class='material-icons right'>loop</i></a>";
                            document.getElementById('divDesafio').hidden = true;

                        }

                    } else {
                        Materialize.toast('Problemas al contar el número de desafíos realizados', 4000);
                    }
                }
            }
            xmlhttp.open("GET", url, true);
            xmlhttp.send();

        }

        function lanzarDado()
        {
            // Consulta de inicio de partida

            var xmlhttpTres = new XMLHttpRequest();
            var urlTres = 'http://localhost/juego/registroJuego.php/?opcion=14&id_sesion=' + id_sesion;

            xmlhttpTres.onreadystatechange = function () {
                if (xmlhttpTres.readyState == 4 && xmlhttpTres.status == 200) {
                    var arrayTres = JSON.parse(xmlhttpTres.responseText);

                    if (arrayTres[0].PLAY == 1) {

                        // Consulta de lanzamiento realizado
                        var xmlhttpUno = new XMLHttpRequest();
                        var urlUno = 'http://localhost/juego/registroJuego.php/?opcion=8&id_sesion=' + id_sesion + '&numero_equipo=' + numero_equipo;

                        xmlhttpUno.onreadystatechange = function () {
                            if (xmlhttpUno.readyState == 4 && xmlhttpUno.status == 200) {
                                var arrayUno = JSON.parse(xmlhttpUno.responseText);
                                if (arrayUno[0].VALOR != 0) {

                                    Materialize.toast('Este equipo ya realizó su lanzamiento del dado', 4000);

                                } else {

                                    if (numero_equipo == 2 || numero_equipo == 4 || numero_equipo == 6) {

                                        numero_equipo_anterior = numero_equipo - 1;
                                        //Consultar por premio seleccionado en la primera tirada
                                        var xmlhttp = new XMLHttpRequest();
                                        var url = 'http://localhost/juego/registroJuego.php/?opcion=7&id_sesion=' + id_sesion + '&numero_equipo=' + numero_equipo_anterior;

                                        xmlhttp.onreadystatechange = function () {
                                            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                                                // console.log('valor de dado insertado');
                                                var array = JSON.parse(xmlhttp.responseText);
                                                if (array.length > 0) {

                                                    document.getElementById("dadoDos").style.height = "150px";
                                                    setTimeout(function () {
                                                        cargarDado();
                                                    }, 5000); // 5000ms = 5s

                                                } else {
                                                    Materialize.toast('El equipo anterior aún no ha lanzado el dado', 4000);
                                                }
                                            }
                                        }
                                        xmlhttp.open("GET", url, true);
                                        xmlhttp.send();
                                    } else if (numero_equipo == 1 || numero_equipo == 3 || numero_equipo == 5) {

                                        document.getElementById("dadoDos").style.height = "150px";
                                        setTimeout(function () {
                                            cargarDado();
                                        }, 5000); // 5000ms = 5s

                                    }
                                }
                            }
                        }
                        xmlhttpUno.open("GET", urlUno, true);
                        xmlhttpUno.send();

                    } else {
                        Materialize.toast('El juego aún no ha sido iniciado', 4000);
                    }
                }
            }
            xmlhttpTres.open("GET", urlTres, true);
            xmlhttpTres.send();
        }
    </script>
    <body onload="recibirData();">
        <div class="container">

            <nav>
                <div class="nav-wrapper blue darken-3">
                    <a href="#" class="brand-logo" style="margin-left: 10px;">Premios Nacionales</a>
                </div>
            </nav>

            <div class="row">
                <div class="col s10 offset-s1">
                    <div class="center">
                        <h2><b>Equipo ${requestScope.numero_equipo}</b></h2>
                    </div>  
                    <p class="flow-text" align="justify">Deberás responder las preguntas que deberás obtener con el botón 'Obtener pregunta' y enviar las respuestas para la evaluación colectiva con el botón 'Enviar respuesta'.</p>

                </div>
            </div>

            <div class="blue-text center-align">
                <p class="flow-text" id="texto_resultado"></p>
            </div>

            <div class="col s6 offset-s4" style="align-content: center">
                <img id="dadoDos" src="img/dado.gif" style="height: 0px; display:block; margin:auto;">
            </div>

            <div class="row">
                <div class="col s10 offset-s1">
                    <div class="center" id="dado" style="margin-top: 45px; margin-bottom: 45px;">

                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col s10 offset-s1">
                    <div class="center" id="respuestas" hidden="true" style="margin-top: 45px; margin-bottom: 45px;">
                        <button id="botonRespuestas" style="margin-top: 10px;" class="btn waves-effect blue lighten-1" type="submit" name="action" onclick="cargarResultados()">Obtener respuestas
                            <i class="material-icons right">check_circle</i>
                        </button>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col s10 offset-s1">
                    <div class="center" id="paso_resultado" hidden="true" style="margin-top: 45px; margin-bottom: 45px;">
                        <form action="paso-estudiante.do">
                            <input type="hidden" id="estado_sesion" name="estado_sesion">
                            <input type="hidden" id="id_sesion" name="id_sesion">
                            <input type="hidden" id="numero_equipo" name="numero_equipo">
                            <input type="hidden" id="respuesta_desafio" value="false">
                            <button id="botonPasoResultado" style="margin-top: 10px;" class="btn waves-effect blue lighten-1" type="submit" name="action" onclick="return pasarDesafio();">Pasar de desafío
                                <i class="material-icons right">check_circle</i>
                            </button>
                        </form>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col s10 offset-s1" hidden="true" id="divResultados">
                </div>
            </div>

            <div class="col s6 offset-s4">
                <div id="divDesafio" class="blue-text" style="position:fixed; bottom:0; margin-bottom: 50px; margin-left: 50px;">
                    <a id="botonDesafio" style="margin-top: 10px;" class="btn waves-effect blue lighten-1 modal-trigger" type="submit" name="action" onclick="obtenerDesafio();" href='#modal2'>Obtener Desafío
                        <i class="material-icons right">loop</i>
                    </a>
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
                    <p><b>Respuesta de Equipo</b></p>
                    <textarea id="respuesta" class="materialize-textarea" maxlength="1000" placeholder="Escriban acá su respuesta al desafío"></textarea>
                    <div class="row" style="margin-top: 40px;">
                        <button class="btn waves-effect blue lighten-1" id="botonRespuesta" type="submit" name="action" onclick="responder()">Responder
                            <i class="material-icons right">send</i>
                        </button>
                    </div>

                    <div class="modal-footer">
                        <a href="#!" onclick="comprobacionRespuesta()" class="modal-close waves-effect waves-green btn-flat">Cerrar</a>
                    </div>
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
            var contador_valoraciones = 0;

            function pasarDesafio() {
                console.log('hola desde pasar desafio');

                // Obtener id de desafío
                // Obtención de id desafío
                console.log('Id de artista: ' + id_artista);

                var respuesta = true;


                var xmlhttpF = new XMLHttpRequest();
                var urlF = 'http://localhost/juego/registroJuego.php/?opcion=23&id_artista=' + id_artista + '&id_sesion=' + id_sesion;

                xmlhttpF.onreadystatechange = function () {
                    if (xmlhttpF.readyState == 4 && xmlhttpF.status == 200) {
                        var desafio = JSON.parse(xmlhttpF.responseText);

                        if (desafio.length > 0) {
                            console.log('Id desafio: ' + desafio[0].ID_DESAFIO);

                            var id_desafio = desafio[0].ID_DESAFIO;

                            console.log('Id desafio: ' + id_desafio);

                            // Preguntar si el docente ya cerro el desafío
                            var xmlhttpL = new XMLHttpRequest();
                            var urlL = 'http://localhost/juego/registroJuego.php/?opcion=41&id_desafio=' + id_desafio;

                            xmlhttpL.onreadystatechange = function () {
                                if (xmlhttpL.readyState == 4 && xmlhttpL.status == 200) {
                                    var comprobacion = JSON.parse(xmlhttpL.responseText);

                                    if (comprobacion.length > 0) {

                                        var respuesta = comprobacion[0].ESTADO_DESAFIO;

                                        console.log(respuesta);

                                        if (respuesta == 'ABIERTO') {

                                            Materialize.toast('El docente no ha cerrado el desafío actual', 4000);
                                            document.getElementById("respuesta_desafio").value = false;


                                        } else {

                                            document.getElementById("respuesta_desafio").value = true;

                                        }

                                    } else {
                                        Materialize.toast('Problema al obtener el desafio y su estado', 4000);
                                    }
                                }
                            }
                            xmlhttpL.open("GET", urlL, true);
                            xmlhttpL.send();

                        } else {
                            Materialize.toast('Problemas para obtener el id del desafío', 4000);
                        }
                    }
                }
                xmlhttpF.open("GET", urlF, true);
                xmlhttpF.send();

                var resp = document.getElementById("respuesta_desafio").value;
                console.log(resp);

                if (resp == "true") {
                    return true;
                } else {
                    return false;
                }
            }

            function calificar(id_respuesta, rango) {
                var id_respuesta = id_respuesta;
                console.log('id de respuesta: ' + id_respuesta);
                var valor = rango;
                console.log('Valor de calificación: ' + valor);
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

                            // Consulta sobre calificaciones respecto al desafio (deben ser siete como máximo)
                            var xmlhttpR = new XMLHttpRequest();
                            var urlR = 'http://localhost/juego/registroJuego.php/?opcion=32&id_desafio=' + id_desafio + '&numero_equipo=' + numero_equipo;

                            xmlhttpR.onreadystatechange = function () {
                                if (xmlhttpR.readyState == 4 && xmlhttpR.status == 200) {
                                    var consulta = JSON.parse(xmlhttpR.responseText);

                                    console.log(consulta[0].CALIFICACIONES);

                                    if (consulta[0].CALIFICACIONES == 6) {

                                        console.log('Número de calificaciones: ' + consulta[0].CALIFICACIONES);

                                        Materialize.toast('Ya ha calificado a todos los equipos', 4000);

                                        // Borrar botón respuestas y tabla de resultados
                                        document.getElementById("respuestas").hidden = true;
                                        document.getElementById("divResultados").hidden = true;

                                        // Visibilizar botón de cierre de desafío
                                        document.getElementById("paso_resultado").hidden = false;

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

            function cargarRespuesta(equipo) {
                console.log('Cargando respuesta...')
                console.log('Id artista: ' + id_artista);
                // Obtención de número de equipo a evaluar
                var equipoEvaluado = equipo;
                console.log('Numero equipo: ' + equipoEvaluado);
                console.log('Id de sesión: ' + id_sesion);

                // Obtención de la respuesta a calificar
                var xmlhttp = new XMLHttpRequest();
                var url = 'http://localhost/juego/registroJuego.php/?opcion=28&id_artista=' + id_artista + '&numero_equipo=' + equipoEvaluado + '&id_sesion=' + id_sesion;

                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        var respuesta = JSON.parse(xmlhttp.responseText);

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
                xmlhttp.open("GET", url, true);
                xmlhttp.send();
            }

            function cargarResultados() {
                // Comprobar se hay 7 calificaciones
                // Obtención de id desafío
                console.log('Id sesion: ' + id_sesion);

                console.log('Id_artista: ' + id_artista);

                // Consulta de id desafio
                var xmlhttpF = new XMLHttpRequest();
                var urlF = 'http://localhost/juego/registroJuego.php/?opcion=23&id_artista=' + id_artista + '&id_sesion=' + id_sesion;

                xmlhttpF.onreadystatechange = function () {
                    if (xmlhttpF.readyState == 4 && xmlhttpF.status == 200) {
                        var desafio = JSON.parse(xmlhttpF.responseText);

                        if (desafio.length > 0) {
                            console.log('Id desafio: ' + desafio[0].ID_DESAFIO);

                            var id_desafio = desafio[0].ID_DESAFIO;

                            console.log('Id de desafío: ' + id_desafio);
                            console.log('Número de equipo: ' + numero_equipo);

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

                                        // Borrar botón respuestas y tabla de resultados
                                        document.getElementById("respuestas").hidden = true;
                                        document.getElementById("divResultados").hidden = true;

                                        // Visibilizar botón de cierre de desafío
                                        document.getElementById("paso_resultado").hidden = false;

                                    } else {

                                        Materialize.toast('Aún le quedan equipos por calificar', 4000);

                                        document.getElementById("divResultados").hidden = false;

                                        var xmlhttp = new XMLHttpRequest();
                                        var url = 'http://localhost/juego/registroJuego.php/?opcion=33&estado=' + estado_sesion + '&id_sesion=' + id_sesion + '&id_artista=' + id_artista;

                                        xmlhttp.onreadystatechange = function () {
                                            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                                                var array = JSON.parse(xmlhttp.responseText);

                                                if (array.length > 0) {

                                                    var contenedor = document.getElementById('divResultados');

                                                    contenedor.innerHTML = "";

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
            }

            function habilitarRespuestas() {
                document.getElementById('respuestas').hidden = false;
            }

            function comprobacionRespuesta() {
                console.log("id_sesión: " + id_sesion);
                console.log("id_artista: " + id_artista);
                console.log("número de equipo: " + numero_equipo);

                var xmlhttp = new XMLHttpRequest();
                var url = 'http://localhost/juego/registroJuego.php/?opcion=27&id_artista=' + id_artista + '&numero_equipo=' + numero_equipo + '&id_sesion=' + id_sesion;

                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        var array = JSON.parse(xmlhttp.responseText);

                        if (array[0].RESPUESTAS > 0) {

                            document.getElementById("botonDesafio").style.height = "0px";
                            habilitarRespuestas();

                        } else {
                            Materialize.toast('Aún no hay respuestas ingresadas de su equipo', 4000);
                        }
                    }
                }
                xmlhttp.open("GET", url, true);
                xmlhttp.send();

            }

            var id_artista = 0;
            var id_desafio = 0;

            function responder() {
                // Obtener id_desafio
                var xmlhttpZeta = new XMLHttpRequest();
                var urlZeta = 'http://localhost/juego/registroJuego.php/?opcion=23&id_artista=' + id_artista + '&id_sesion=' + id_sesion;

                xmlhttpZeta.onreadystatechange = function () {
                    if (xmlhttpZeta.readyState == 4 && xmlhttpZeta.status == 200) {
                        var desafio = JSON.parse(xmlhttpZeta.responseText);

                        id_desafio = desafio[0].ID_DESAFIO;

                        //Registros previos de respuestas
                        var xmlhttpDos = new XMLHttpRequest();
                        var urlDos = 'http://localhost/juego/registroJuego.php/?opcion=21&estado=' + estado_sesion + '&id_sesion=' + id_sesion + '&numero_equipo=' + numero_equipo + '&id_desafio=' + id_desafio;

                        xmlhttpDos.onreadystatechange = function () {
                            if (xmlhttpDos.readyState == 4 && xmlhttpDos.status == 200) {
                                var array = JSON.parse(xmlhttpDos.responseText);

                                if (array.length > 0) {
                                    Materialize.toast('Este equipo ya realizó su respuesta', 4000);
                                } else {

                                    //Validación
                                    var respuesta = document.getElementById("respuesta").value;

                                    if (respuesta == null || respuesta.length == 0 || /^\s+$/.test(respuesta)) {
                                        Materialize.toast('El campo que recoge su respuesta no puede estar vacío', 4000);
                                        return false;
                                    } else if (respuesta.length > 1000) {
                                        Materialize.toast('El campo que indica su respuesta no puede tener más de 1000 caracteres', 4000);
                                        return false;
                                    } else {

                                        console.log(id_artista);
                                        console.log(id_sesion);
                                        console.log(id_desafio);
                                        console.log(estado_sesion);
                                        console.log(numero_equipo);
                                        console.log(respuesta);

                                        var xmlhttp = new XMLHttpRequest();
                                        var url = 'http://localhost/juego/registroJuego.php/?opcion=20&id_artista=' + id_artista + '&id_sesion=' + id_sesion + '&id_desafio=' + id_desafio + '&estado=' + estado_sesion + '&numero_equipo=' + numero_equipo + '&respuesta=' + respuesta;

                                        xmlhttp.onreadystatechange = function () {
                                            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

                                                document.getElementById("botonRespuesta").disabled = true;
                                                Materialize.toast('Respuesta insertada', 4000);
                                                document.getElementById("botonDesafio").style.height = "0px";
                                                habilitarRespuestas();
                                            }
                                        }
                                        xmlhttp.open("GET", url, true);
                                        xmlhttp.send();
                                    }

                                }
                            }
                        }
                        xmlhttpDos.open("GET", urlDos, true);
                        xmlhttpDos.send();

                    }
                }
                xmlhttpZeta.open("GET", urlZeta, true);
                xmlhttpZeta.send();
            }

            var premio = 0;
            function cargarDado() {
                document.getElementById("dadoDos").style.height = "0px";
                document.getElementById("botonLanzar").style.height = "0px";
                console.log(numero_equipo);

                if (numero_equipo == 1 || numero_equipo == 3 || numero_equipo == 5) {
                    console.log('paso primera condición');
                    var posicion = Math.floor((Math.random() * (5 - 1)) + 1);
                    console.log(posicion);

                    if (posicion == 1) {
                        console.log('primer resultado');
                        document.getElementById('texto_resultado').innerHTML = 'El dado arrojó uno';
                        Materialize.toast('El dado arrojó uno', 4000);
                    } else if (posicion == 2) {
                        console.log('segundo resultado');
                        document.getElementById('texto_resultado').innerHTML = 'El dado arrojó dos';
                        Materialize.toast('El dado arrojó dos', 4000);
                    } else if (posicion == 3) {
                        console.log('tecer resultado');
                        document.getElementById('texto_resultado').innerHTML = 'El dado arrojó tres';
                        Materialize.toast('El dado arrojó tres', 4000);
                    } else if (posicion == 4) {
                        console.log('cuarto resultado');
                        document.getElementById('texto_resultado').innerHTML = 'El dado arrojó cuatro';
                        Materialize.toast('El dado arrojó cuatro', 4000);
                    }

                    // Carga a la base
                    insertarPrimerDado(numero_equipo, id_sesion, posicion);
                } else {
                    console.log('pasó a segunda condición');
                    numero_equipo_anterior = numero_equipo - 1;
                    console.log('Equipo anterior: ' + numero_equipo_anterior);
                    console.log('Id de sesión: ' + id_sesion);
                    //Consultar por premio seleccionado en la primera tirada
                    var xmlhttp = new XMLHttpRequest();
                    var url = 'http://localhost/juego/registroJuego.php/?opcion=7&id_sesion=' + id_sesion + '&numero_equipo=' + numero_equipo_anterior;

                    xmlhttp.onreadystatechange = function () {
                        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                            // console.log('valor de dado insertado');
                            var array = JSON.parse(xmlhttp.responseText);

                            if (array.length > 0) {
                                premio = array[0].VALOR;

                                console.log('premio uno: ' + premio);
                                obtenerSubtematicas(premio);
                            } else {
                                Materialize.toast('El equipo anterior aún no lanza el dado', 4000);
                            }

                        }
                    }
                    xmlhttp.open("GET", url, true);
                    xmlhttp.send();

                }
            }

            function obtenerLanzamientoAnterior(id_sesion, numero_equipo) {
                numero_equipo_anterior = numero_equipo - 1;
                //Consultar por premio seleccionado en la primera tirada
                var xmlhttp = new XMLHttpRequest();
                var url = 'http://localhost/juego/registroJuego.php/?opcion=7&id_sesion=' + id_sesion + '&numero_equipo=' + numero_equipo_anterior;

                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        // console.log('valor de dado insertado');
                        var array = JSON.parse(xmlhttp.responseText);
                        if (array.length > 0) {
                            return true;
                        } else {
                            return false;
                        }
                    }
                }
                xmlhttp.open("GET", url, true);
                xmlhttp.send();
            }

            function insertarPrimerDado(numero_equipo, id_sesion, valor) {
                // console.log('cargando sesiones');

                var xmlhttp = new XMLHttpRequest();
                var url = 'http://localhost/juego/registroJuego.php/?opcion=6&numero_equipo=' + numero_equipo + '&id_sesion=' + id_sesion + '&valor=' + valor;

                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        // console.log('valor de dado insertado');
                    }
                }
                xmlhttp.open("GET", url, true);
                xmlhttp.send();
            }

            var subtematica = '';
            var id_subtematica = 0;

            function obtenerSubtematicas(premio) {
                console.log('obteniendo subtemáticas');
                console.log('premio: ' + premio);

                var xmlhttp = new XMLHttpRequest();
                var url = 'http://localhost/juego/registroJuego.php/?opcion=2&id_premio=' + premio;

                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        var array = JSON.parse(xmlhttp.responseText);
                        //console.log(array);

                        //Elección aleatoria de subtemática
                        var subtematicaAzar = Math.floor((Math.random() * (array.length - 1)) + 1);
                        //console.log(subtematicaAzar);
                        //console.log(array[subtematicaAzar - 1].DESCRIPCION_SUBTEMATICA);
                        subtematica = array[subtematicaAzar - 1].DESCRIPCION_SUBTEMATICA;
                        id_subtematica = array[subtematicaAzar - 1].ID_SUBTEMATICA;
                        console.log('id_subtematica: ' + id_subtematica);
                        console.log('subtematica: ' + subtematica);
                        document.getElementById('texto_resultado').innerHTML = 'El dado seleccionó la subtemática ' + subtematica;
                        Materialize.toast('La subtemática seleccionada es ' + subtematica, 4000);

                        insertarSegundoDado(numero_equipo, id_sesion, id_subtematica);
                    }
                }
                xmlhttp.open("GET", url, true);
                xmlhttp.send();
            }

            function insertarSegundoDado(numero_equipo, id_sesion, id_subtematica) {
                // console.log('cargando sesiones');

                var xmlhttp = new XMLHttpRequest();
                var url = 'http://localhost/juego/registroJuego.php/?opcion=6&numero_equipo=' + numero_equipo + '&id_sesion=' + id_sesion + '&valor=' + id_subtematica;

                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        // console.log('valor de dado insertado');
                    }
                }
                xmlhttp.open("GET", url, true);
                xmlhttp.send();
            }

            function obtenerDesafio() {
                // Consulta de inicio de partida
                var xmlhttpTres = new XMLHttpRequest();
                var urlTres = 'http://localhost/juego/registroJuego.php/?opcion=14&id_sesion=' + id_sesion;

                xmlhttpTres.onreadystatechange = function () {
                    if (xmlhttpTres.readyState == 4 && xmlhttpTres.status == 200) {
                        var arrayTres = JSON.parse(xmlhttpTres.responseText);

                        if (arrayTres[0].PLAY == 1) {
                            console.log('id sesión' + id_sesion);
                            console.log('estado' + estado_sesion);

                            var xmlhttpCuatro = new XMLHttpRequest();
                            var urlCuatro = 'http://localhost/juego/registroJuego.php/?opcion=17&id_sesion=' + id_sesion + '&estado=' + estado_sesion;

                            xmlhttpCuatro.onreadystatechange = function () {
                                if (xmlhttpCuatro.readyState == 4 && xmlhttpCuatro.status == 200) {
                                    var arrayCuatro = JSON.parse(xmlhttpCuatro.responseText);

                                    if (arrayCuatro.length > 0) {

                                        id_artista = arrayCuatro[0].ID_ARTISTA;

                                        var xmlhttp = new XMLHttpRequest();
                                        var url = 'http://localhost/juego/registroJuego.php/?opcion=11&id_artista=' + id_artista;

                                        xmlhttp.onreadystatechange = function () {
                                            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                                                var array = JSON.parse(xmlhttp.responseText);

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

                                    } else {
                                        Materialize.toast('El docente aún no ha seleccionado un artista', 4000);
                                    }
                                }
                            }
                            xmlhttpCuatro.open("GET", urlCuatro, true);
                            xmlhttpCuatro.send();

                        } else {
                            Materialize.toast('El juego aún no ha sido iniciado', 4000);
                        }
                    }
                }
                xmlhttpTres.open("GET", urlTres, true);
                xmlhttpTres.send();
            }
        </script>
    </body>
</html>
