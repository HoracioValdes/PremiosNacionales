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
    <body>
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

            <div class="col s12">
                <h4 class="center-align"><b>Dado</b></h4>
            </div>
            <div class="col s6 offset-s4">
                <div class="blue-text center-align">
                    <p class="flow-text"><b>${requestScope.msg}</b></p>
                </div>
                <div class="row">
                    <form class="col s10 offset-s1 card-panel z-depth-5" action="registro.do" method="post">
                        <div class="row" style="margin-top: 15px;">
                            <div class="center-align">    
                                <button style="margin-top: 10px;" class="btn waves-effect blue lighten-1" type="submit" name="action" onclick="return validandoRegistro();">Lanzar dado
                                    <i class="material-icons right">send</i>
                                </button>
                            </div>    
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
                                    $(function () {

                                        $(".button-collapse").sideNav();
                                    });
        </script>
        <script>
            function validandoRegistro()
            {
                var campoClave = document.getElementById("txtClave").value;
                var campoRut = document.getElementById("rut").value;

                if (campoRut == null || campoRut.length == 0 || /^\s+$/.test(campoRut)) {
                    Materialize.toast('El campo que indica su rut no puede estar vacío', 4000);
                    return false;
                } else if (campoRut.length < 11) {
                    Materialize.toast('El campo que indica su rut no puede tener menos de 11 caracteres', 4000);
                    return false;
                } else if (campoRut.length > 12) {
                    Materialize.toast('El campo que indica su rut no puede tener más de 12 caracteres', 4000);
                    return false;
                } else if (valrut(campoRut) == false) {
                    Materialize.toast('El rut ingresado no es válido', 4000);
                    return false;
                } else if (campoClave == null || campoClave.length == 0 || /^\s+$/.test(campoClave)) {
                    Materialize.toast('El campo que indica la clave no puede estar vacío', 4000);
                    return false;
                }
                return true;
            }

            function validandoIngreso()
            {
                var campoCorreoIngreso = document.getElementById("correoIngreso").value;
                var campoClaveIngreso = document.getElementById("claveIngreso").value;

                if (campoCorreoIngreso == null || campoCorreoIngreso.length == 0 || /^\s+$/.test(campoCorreoIngreso)) {
                    Materialize.toast('El campo que indica su correo no puede estar vacío', 4000);
                    return false;
                } else if (valCorreo(campoCorreoIngreso) === false) {
                    Materialize.toast('El correo ingresado no es válido', 4000);
                    return false;
                } else if (campoClaveIngreso == null || campoClaveIngreso.length == 0 || /^\s+$/.test(campoClaveIngreso)) {
                    Materialize.toast('El campo que indica su clave no puede estar vacío', 4000);
                    return false;
                } else if (campoClaveIngreso.length > 20) {
                    Materialize.toast('El campo que indica su clave no puede tener más de 20 caracteres', 4000);
                    return false;
                }
                return true;
            }

            function valrut(campoRut) {

                var rut = campoRut;
                var crut;
                //limpieza
                var eliminar = ".-";
                //Los eliminamos
                for (var i = 0; i < eliminar.length; i++) {
                    rut = rut.replace(new RegExp("\\" + eliminar[i], 'gi'), '');
                }

                var tmpstr = "";
                var intlargo = rut;
                if (intlargo.length > 0)
                {
                    crut = rut;
                    var largo = crut.length;
                    if (largo < 2)
                    {
                        return false;
                    }
                    for (i = 0; i < crut.length; i++)
                        if (crut.charAt(i) != ' ' && crut.charAt(i) != '.' && crut.charAt(i) != '-')
                        {
                            tmpstr = tmpstr + crut.charAt(i);
                        }
                    var rutSuma = tmpstr;
                    crut = tmpstr;
                    largo = crut.length;
                    if (largo > 2)
                        rutSuma = crut.substring(0, largo - 1);
                    else
                        rutSuma = crut.charAt(0);
                    var dv = crut.charAt(largo - 1);
                    if (rutSuma == null || dv == null)
                        return false;
                    var dvr = '0';
                    var suma = 0;
                    var mul = 2;
                    for (i = rutSuma.length - 1; i >= 0; i--)
                    {
                        suma = suma + rutSuma.charAt(i) * mul;
                        if (mul == 7)
                            mul = 2;
                        else
                            mul++;
                    }

                    var res = suma % 11;
                    if (res == 1)
                        dvr = 'k';
                    else if (res == 0)
                        dvr = '0';
                    else
                    {
                        var dvi = 11 - res;
                        dvr = dvi + "";
                    }

                    if (dvr != dv.toLowerCase())
                    {
                        return false;
                    }
                    return true;
                }
            }

            function limpiar_rut(rut)
            {
                var rutLimpio = rut;
                //Definimos los caracteres a eliminar
                var eliminar = ".-";
                //Los eliminamos
                for (var i = 0; i < eliminar.length; i++) {
                    rutLimpio = rutLimpio.replace(new RegExp("\\" + eliminar[i], 'gi'), '');
                }
                //Pasamos al campo el valor limpio
                document.getElementById("rut").value = rutLimpio.toUpperCase();
            }

            function formato_rut(rut) {
                var sRut1 = rut; //Contador de posición
                var nPos = 0; //Guarda el rut invertido con los puntos y el guión agregado
                var sInvertido = ""; //Guarda el resultado final del rut como debe ser
                var sRut = "";
                for (var i = sRut1.length - 1; i >= 0; i--) {
                    sInvertido += sRut1.charAt(i);
                    if (i == sRut1.length - 1) {
                        sInvertido += "-";
                    } else if (nPos == 3) {
                        sInvertido += ".";
                        nPos = 0;
                    }
                    nPos++;
                }
                for (var j = sInvertido.length - 1; j >= 0; j--) {
                    if (sInvertido.charAt(sInvertido.length - 1) != ".") {
                        sRut += sInvertido.charAt(j);
                    } else if (j != sInvertido.length - 1) {
                        sRut += sInvertido.charAt(j);
                    }
                }
                //Pasamos al campo el valor formateado
                document.getElementById("rut").value = sRut.toUpperCase();
            }

            function cargarSesiones() {
                // alert('cargando sesiones');

                var xmlhttp = new XMLHttpRequest();
                var url = 'https://api-juego.feriasclick.com/juego/registroJuego.php/?opcion=1';

                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        var array = JSON.parse(xmlhttp.responseText);
                        var i;

                        if (array.length > 0) {
                            for (i = 0; i < array.length; i++) {
                                // alert('Sesión ' + array[i].ID_SESION);
                                agregarBotonSesion(array[i].ID_SESION);
                            }
                        } else {
                            noHaySesiones();
                        }
                    }
                }
                xmlhttp.open("GET", url, true);
                xmlhttp.send();
            }
        </script>
    </body>
</html>
