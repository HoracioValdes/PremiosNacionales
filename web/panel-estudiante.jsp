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

        function recibirData() {
            estado_sesion = '${estado_sesion}';
            id_sesion = '${id_sesion}';
            numero_equipo = '${numero_equipo}';

            cargarDados(estado_sesion, numero_equipo, id_sesion);
        }

        function cargarDados(estado_sesion, numero_equipo, id_sesion) {

            if (estado_sesion == 'ABIERTA' && numero_equipo == 1) {
                alert('se cumple 1');
                var contenedor = document.getElementById('dado');
                contenedor.innerHTML += "<button id='botonLanzar' style='margin-top: 10px;' class='btn waves-effect blue lighten-1' type='submit' name='action' onclick='return lanzarDado();'>Lanzar dado<i class='material-icons right'>loop</i></button>";
            } else if (estado_sesion == 'ABIERTA' && numero_equipo == 2) {
                alert('se cumple 2');
                var contenedor = document.getElementById('dado');
                contenedor.innerHTML += "<button id='botonLanzar' style='margin-top: 10px;' class='btn waves-effect blue lighten-1' type='submit' name='action' onclick='return lanzarDado();'>Lanzar dado<i class='material-icons right'>loop</i></button>";
            } else if (estado_sesion == 'SEGUNDA' && numero_equipo == 3) {
                alert('se cumple 3');
                var contenedor = document.getElementById('dado');
                contenedor.innerHTML += "<button id='botonLanzar' style='margin-top: 10px;' class='btn waves-effect blue lighten-1' type='submit' name='action' onclick='return lanzarDado();'>Lanzar dado<i class='material-icons right'>loop</i></button>";
            } else if (estado_sesion == 'SEGUNDA' && numero_equipo == 4) {
                alert('se cumple 4');
                var contenedor = document.getElementById('dado');
                contenedor.innerHTML += "<button id='botonLanzar' style='margin-top: 10px;' class='btn waves-effect blue lighten-1' type='submit' name='action' onclick='return lanzarDado();'>Lanzar dado<i class='material-icons right'>loop</i></button>";
            } else if (estado_sesion == 'TERCERA' && numero_equipo == 5) {
                alert('se cumple 5');
                var contenedor = document.getElementById('dado');
                contenedor.innerHTML += "<button id='botonLanzar' style='margin-top: 10px;' class='btn waves-effect blue lighten-1' type='submit' name='action' onclick='return lanzarDado();'>Lanzar dado<i class='material-icons right'>loop</i></button>";
            } else if (estado_sesion == 'TERCERA' && numero_equipo == 5) {
                alert('se cumple 6');
                var contenedor = document.getElementById('dado');
                contenedor.innerHTML += "<button id='botonLanzar' style='margin-top: 10px;' class='btn waves-effect blue lighten-1' type='submit' name='action' onclick='return lanzarDado();'>Lanzar dado<i class='material-icons right'>loop</i></button>";
            }

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
                                if (arrayUno.length > 0) {

                                    Materialize.toast('Este equipo ya realizó su lanzamiento del dado', 4000);

                                } else {

                                    if (numero_equipo == 2 || numero_equipo == 4 || numero_equipo == 6) {

                                        numero_equipo_anterior = numero_equipo - 1;
                                        //Consultar por premio seleccionado en la primera tirada
                                        var xmlhttp = new XMLHttpRequest();
                                        var url = 'http://localhost/juego/registroJuego.php/?opcion=7&id_sesion=' + id_sesion + '&numero_equipo=' + numero_equipo_anterior;

                                        xmlhttp.onreadystatechange = function () {
                                            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                                                // alert('valor de dado insertado');
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
                        <button id="botonRespuestas" style="margin-top: 10px;" class="btn waves-effect blue lighten-1" type="submit" name="action" onclick="cargarResultados()">Actualizar
                            <i class="material-icons right">check_circle</i>
                        </button>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col s10 offset-s1" hidden="true" id="divResultados">
                    <label>Califica a tus compañeros</label>
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
                    <p><b>Valoración respuesta</b></p>
                    <p id="valoracionRespuesta">.</p>
                    <p><b>Calificación</b></p>

                    <form action="#">
                        <input type="hidden" id="id_respuesta">
                        <input type="hidden" id="equipoEvaluado">
                        <p class="range-field">
                            <input type="range" id="test5" min="0" max="10"/>
                        </p>
                    </form>

                    <div class="row" style="margin-top: 40px;">
                        <button class="btn waves-effect blue lighten-1" id="botonCalificacion" type="submit" name="action" onclick="calificar()">Calificar
                            <i class="material-icons right">send</i>
                        </button>
                    </div>

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

            function calificar() {
                alert("Calificando...");
                var id_respuesta = document.getElementById("id_respuesta").value;
                alert("Id de repuesta: " + id_respuesta);
                alert("Equipo evaluado número: " + equipo_evaluado);
            }

            function comprobacionValoracion() {
                alert("Comprobando respuestas valoradas...");
            }

            function cargarRespuesta(equipo) {
                alert('Cargando respuesta...')
                alert('Id artista: ' + id_artista);
                // Obtención de número de equipo a evaluar
                var equipoEvaluado = equipo;
                alert('Numero equipo: ' + equipoEvaluado);
                alert('Id de sesión: ' + id_sesion);

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
                            document.getElementById('valoracionRespuesta').innerHTML = respuesta[0].VALORACION;
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
                document.getElementById("divResultados").hidden = false;

                var xmlhttp = new XMLHttpRequest();
                var url = 'http://localhost/juego/registroJuego.php/?opcion=22&estado=' + estado_sesion + '&id_sesion=' + id_sesion;

                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        var array = JSON.parse(xmlhttp.responseText);

                        if (array.length > 0) {

                            var contenedor = document.getElementById('divResultados');
                            
                            contenedor.innerHTML = "";

                            for (i = 0; i < array.length; i++) {
                                contenedor.innerHTML += "\
                                <form>\n\
                                    <div class='row'>\n\
                                        <h4>Equipo " + array[i].NUMERO_EQUIPO + "</h4>\n\
                                        <input id='equipoEvaluadoForm' hidden='true' value=" + array[i].NUMERO_EQUIPO + ">\n\
                                        <a class='btn-floating blue' href='#modal3' onclick='cargarRespuesta(" + array[i].NUMERO_EQUIPO + ")'><i class='material-icons left'>add</i></a>\n\
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

            function habilitarRespuestas() {
                document.getElementById('respuestas').hidden = false;
            }

            function comprobacionRespuesta() {
                alert("id_sesión: " + id_sesion);
                alert("id_artista: " + id_artista);
                alert("id_desafio: " + id_desafio);
                alert("número de equipo: " + numero_equipo);

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
                        var urlDos = 'http://localhost/juego/registroJuego.php/?opcion=21&estado=' + estado_sesion + '&id_sesion=' + id_sesion + '&numero_equipo=' + numero_equipo;

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

                                        alert(id_artista);
                                        alert(id_sesion);
                                        alert(id_desafio);
                                        alert(estado_sesion);
                                        alert(numero_equipo);
                                        alert(respuesta);

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
                alert(numero_equipo);

                if (numero_equipo == 1 || numero_equipo == 3 || numero_equipo == 5) {
                    alert('paso primera condición');
                    var posicion = Math.floor((Math.random() * (5 - 1)) + 1);
                    alert(posicion);

                    if (posicion == 1) {
                        alert('primer resultado');
                        document.getElementById('texto_resultado').innerHTML = 'El dado arrojó uno';
                        Materialize.toast('El dado arrojó uno', 4000);
                    } else if (posicion == 2) {
                        alert('segundo resultado');
                        document.getElementById('texto_resultado').innerHTML = 'El dado arrojó dos';
                        Materialize.toast('El dado arrojó dos', 4000);
                    } else if (posicion == 3) {
                        alert('tecer resultado');
                        document.getElementById('texto_resultado').innerHTML = 'El dado arrojó tres';
                        Materialize.toast('El dado arrojó tres', 4000);
                    } else if (posicion == 4) {
                        alert('cuarto resultado');
                        document.getElementById('texto_resultado').innerHTML = 'El dado arrojó cuatro';
                        Materialize.toast('El dado arrojó cuatro', 4000);
                    }

                    // Carga a la base
                    insertarPrimerDado(numero_equipo, id_sesion, posicion);
                } else {
                    alert('pasó a segunda condición');
                    numero_equipo_anterior = numero_equipo - 1;
                    //Consultar por premio seleccionado en la primera tirada
                    var xmlhttp = new XMLHttpRequest();
                    var url = 'http://localhost/juego/registroJuego.php/?opcion=7&id_sesion=' + id_sesion + '&numero_equipo=' + numero_equipo_anterior;

                    xmlhttp.onreadystatechange = function () {
                        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                            // alert('valor de dado insertado');
                            var array = JSON.parse(xmlhttp.responseText);

                            if (array.length > 0) {
                                premio = array[0].VALOR;

                                alert('premio uno: ' + premio);
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
                        // alert('valor de dado insertado');
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
                // alert('cargando sesiones');

                var xmlhttp = new XMLHttpRequest();
                var url = 'http://localhost/juego/registroJuego.php/?opcion=6&numero_equipo=' + numero_equipo + '&id_sesion=' + id_sesion + '&valor=' + valor;

                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        // alert('valor de dado insertado');
                    }
                }
                xmlhttp.open("GET", url, true);
                xmlhttp.send();
            }

            var subtematica = '';
            var id_subtematica = 0;

            function obtenerSubtematicas(premio) {
                alert('obteniendo subtemáticas');
                alert('premio: ' + premio);

                var xmlhttp = new XMLHttpRequest();
                var url = 'http://localhost/juego/registroJuego.php/?opcion=2&id_premio=' + premio;

                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        var array = JSON.parse(xmlhttp.responseText);
                        //alert(array);

                        //Elección aleatoria de subtemática
                        var subtematicaAzar = Math.floor((Math.random() * (array.length - 1)) + 1);
                        //alert(subtematicaAzar);
                        //alert(array[subtematicaAzar - 1].DESCRIPCION_SUBTEMATICA);
                        subtematica = array[subtematicaAzar - 1].DESCRIPCION_SUBTEMATICA;
                        id_subtematica = array[subtematicaAzar - 1].ID_SUBTEMATICA;
                        alert('id_subtematica: ' + id_subtematica);
                        alert('subtematica: ' + subtematica);
                        document.getElementById('texto_resultado').innerHTML = 'El dado seleccionó la subtemática ' + subtematica;
                        Materialize.toast('La subtemática seleccionada es ' + subtematica, 4000);

                        insertarSegundoDado(numero_equipo, id_sesion, id_subtematica);
                    }
                }
                xmlhttp.open("GET", url, true);
                xmlhttp.send();
            }

            function insertarSegundoDado(numero_equipo, id_sesion, id_subtematica) {
                // alert('cargando sesiones');

                var xmlhttp = new XMLHttpRequest();
                var url = 'http://localhost/juego/registroJuego.php/?opcion=6&numero_equipo=' + numero_equipo + '&id_sesion=' + id_sesion + '&valor=' + id_subtematica;

                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        // alert('valor de dado insertado');
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
                                                //alert(array);

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
