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
        <link rel="shortcut icon" type="image/x-icon" href="img/phpThumb_generated_thumbnailico" />
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Juego de Premios Nacionales</title>
    </head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
            // Consulta de lanzamiento realizado
            var xmlhttpUno = new XMLHttpRequest();
            var urlUno = 'http://premios-nacionales.desarrollo-tecnologico.com/juego/registroJuego.php/?opcion=8&id_sesion=' + id_sesion + '&numero_equipo=' + numero_equipo;

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
                            var url = 'http://premios-nacionales.desarrollo-tecnologico.com/juego/registroJuego.php/?opcion=7&id_sesion=' + id_sesion + '&numero_equipo=' + numero_equipo_anterior;

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
            <div class="col s12">
                <h4 class="center-align"><b>Dado</b></h4>
            </div>
            <div class="row">
                <div class="col s10 offset-s1">
                    <div class="center" id="dado" style="margin-top: 45px; margin-bottom: 45px;">

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
                    var url = 'http://premios-nacionales.desarrollo-tecnologico.com/juego/registroJuego.php/?opcion=7&id_sesion=' + id_sesion + '&numero_equipo=' + numero_equipo_anterior;

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
                var url = 'http://premios-nacionales.desarrollo-tecnologico.com/juego/registroJuego.php/?opcion=7&id_sesion=' + id_sesion + '&numero_equipo=' + numero_equipo_anterior;

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
                var url = 'http://premios-nacionales.desarrollo-tecnologico.com/juego/registroJuego.php/?opcion=6&numero_equipo=' + numero_equipo + '&id_sesion=' + id_sesion + '&valor=' + valor;

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
                var url = 'http://premios-nacionales.desarrollo-tecnologico.com/juego/registroJuego.php/?opcion=2&id_premio=' + premio;

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
                var url = 'http://premios-nacionales.desarrollo-tecnologico.com/juego/registroJuego.php/?opcion=6&numero_equipo=' + numero_equipo + '&id_sesion=' + id_sesion + '&valor=' + id_subtematica;

                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        // alert('valor de dado insertado');
                    }
                }
                xmlhttp.open("GET", url, true);
                xmlhttp.send();
            }
        </script>
    </body>
</html>
