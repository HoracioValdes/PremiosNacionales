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

            function fijarNivel() {
                var nuevoNivel = document.getElementById("nivel").selectedIndex;

                if (nuevoNivel == null || nuevoNivel == 0) {

                    Materialize.toast('Debe seleccionar un nivel', 4000);

                } else {

                    var xmlhttp = new XMLHttpRequest();
                    var url = 'http://premios-nacionales.desarrollo-tecnologico.com/juego/registroJuego.php/?opcion=13&nivel=' + nuevoNivel + '&id_sesion=' + id_sesion + '&estado=' + estado_sesion;

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

                    var xmlhttp = new XMLHttpRequest();
                    var url = 'http://premios-nacionales.desarrollo-tecnologico.com/juego/registroJuego.php/?opcion=9&numero_equipo=' + 1 + '&id_sesion=' + id_sesion;

                    xmlhttp.onreadystatechange = function () {
                        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                            var array = JSON.parse(xmlhttp.responseText);

                            if (array.length > 0) {

                                premio = array[0].VALOR;


                                var xmlhttpDos = new XMLHttpRequest();
                                var urlDos = 'http://premios-nacionales.desarrollo-tecnologico.com/juego/registroJuego.php/?opcion=9&numero_equipo=' + 2 + '&id_sesion=' + id_sesion;

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

                } else if (estado_sesion == 'SEGUNDA') {

                    var xmlhttp = new XMLHttpRequest();
                    var url = 'http://premios-nacionales.desarrollo-tecnologico.com/juego/registroJuego.php/?opcion=9&numero_equipo=' + 3 + '&id_sesion=' + id_sesion;

                    xmlhttp.onreadystatechange = function () {
                        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                            var array = JSON.parse(xmlhttp.responseText);

                            if (array.length > 0) {

                                premio = array[0].VALOR;

                                var xmlhttpDos = new XMLHttpRequest();
                                var urlDos = 'http://premios-nacionales.desarrollo-tecnologico.com/juego/registroJuego.php/?opcion=9&numero_equipo=' + 4 + '&id_sesion=' + id_sesion;

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
                    var url = 'http://premios-nacionales.desarrollo-tecnologico.com/juego/registroJuego.php/?opcion=9&numero_equipo=' + 5 + '&id_sesion=' + id_sesion;

                    xmlhttp.onreadystatechange = function () {
                        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                            var array = JSON.parse(xmlhttp.responseText);

                            if (array.length > 0) {

                                premio = array[0].VALOR;

                                var xmlhttpDos = new XMLHttpRequest();
                                var urlDos = 'http://premios-nacionales.desarrollo-tecnologico.com/juego/registroJuego.php/?opcion=9&numero_equipo=' + 6 + '&id_sesion=' + id_sesion;

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

                        if (array.length > 0) {

                            var xmlhttpDos = new XMLHttpRequest();
                            var urlDos = 'http://premios-nacionales.desarrollo-tecnologico.com/juego/registroJuego.php/?opcion=10&id_sesion=' + id_sesion + '&nivel=' + nivel_sesion;

                            xmlhttpDos.onreadystatechange = function () {
                                if (xmlhttpDos.readyState == 4 && xmlhttpDos.status == 200) {
                                    var arrayPasado = JSON.parse(xmlhttpDos.responseText);
                                    //alert(array);

                                    if (arrayPasado.length > 0) {
                                        for (i = 0; i < arrayPasado.length; i++) {

                                            for (x = 0; x < array.length; x++) {

                                                if (arrayPasado[i].ID_ARTISTA == array[x].ID_ARTISTA) {
                                                    alert('eliminando repetidos!');
                                                    array.splice(x, 1);
                                                }

                                            }
                                        }
                                    }
                                }
                            }
                            xmlhttp.open("GET", urlDos, true);
                            xmlhttp.send();

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
                contenedor.innerHTML += "<div class='row'><a style='margin: 10px auto;' class='btn waves-effect blue lighten-1 modal-trigger' onclick='traerArtista(" + id_artista + ")' href='#modal2'>" + nombre_artista + "<i class='material-icons right'>assignment_ind</i></button></div>";
            }

            function traerArtista(id_artista) {
                var xmlhttp = new XMLHttpRequest();
                var url = 'http://premios-nacionales.desarrollo-tecnologico.com/juego/registroJuego.php/?opcion=11&id_artista=' + id_artista;

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
                var urlDos = 'http://premios-nacionales.desarrollo-tecnologico.com/juego/registroJuego.php/?opcion=12&id_artista=' + id_artista;

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
                var url = 'http://premios-nacionales.desarrollo-tecnologico.com/juego/registroJuego.php/?opcion=16&id_sesion=' + id_sesion;

                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        var array = JSON.parse(xmlhttp.responseText);

                        if (array[0].NUMERO_EQUIPOS == 6) {

                            var xmlhttpDos = new XMLHttpRequest();
                            var urlDos = 'http://premios-nacionales.desarrollo-tecnologico.com/juego/registroJuego.php/?opcion=15&id_sesion=' + id_sesion;

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
                    var urlTres = 'http://premios-nacionales.desarrollo-tecnologico.com/juego/registroJuego.php/?opcion=14&id_sesion=' + id_sesion;

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
