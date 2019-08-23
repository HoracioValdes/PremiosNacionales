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
    <body onload="cargarSesiones()">
        <div class="container">

            <nav>
                <div class="nav-wrapper blue darken-3">
                    <a href="#" class="brand-logo" style="margin-left: 10px;">Premios Nacionales</a>
                </div>
            </nav>

            <div class="row">
                <div class="col s10 offset-s1">
                    <div class="center">
                        <h2><b>Como jugar</b></h2>
                    </div>  
                    <p class="flow-text" align="justify">Para jugar en esta aplicación, el o la profesora deberá crear una sesión.</p>
                    <p class="flow-text" align="justify">Las y los estudiantes deberán seleccionar la sesión disponible previamente creada por el o la profesora.</p>
                    <p class="flow-text" align="justify">Una vez que las y los estudiantes seleccionen la sección, así como el o la profesora, la aplicación les asignará uno de los seis grupos que constituyen este juego.</p>
                    <p class="flow-text" align="justify">¡Deben dejar fluir su creatividad para jugar este juego!</p>

                </div>
            </div>

            <div class="col s12">
                <h4 class="center-align"><b>Crear Sesión</b></h4>
            </div>
            <div class="col s6 offset-s4">
                <div class="blue-text center-align">
                    <p class="flow-text"><b>${requestScope.msg}</b></p>
                </div>
                <div class="row">
                    <form class="col s10 offset-s1 card-panel z-depth-5" action="registro.do" method="post">
                        <div class="col s8 offset-s2" style="margin-top: 50px;">
                            <div class="row" style="margin-top: 15px;">          
                                <div class="input-field">
                                    <i class="material-icons prefix">assignment_ind</i>
                                    <input id="rut" type="text" class="validate" maxlength="12" placeholder="Ingrese el rut sin puntos ni guión"
                                           name="txtRut" onblur="limpiar_rut(this.value);formato_rut(this.value);"/>
                                    <label for="rut">Rut</label>
                                </div>  
                            </div>
                            <div class="row">
                                <div class="input-field">
                                    <i class="material-icons prefix">lock_outline</i>
                                    <input id="clave" type="text" class="validate" maxlength="20" placeholder="Ingrese una clave para abrir a la sesión" name="txtClave"/>
                                    <label for="clave">Clave</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="center" style="position: relative; margin: 10px;">    
                                    <button style="margin-top: 10px;" class="btn waves-effect blue lighten-1" type="submit" name="action" onclick="return validandoRegistro();">Crear
                                        <i class="material-icons right">send</i>
                                    </button>
                                </div>  
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <div class="col s12">
                <h4 class="center-align"><b>Lista de Sesiones Disponibles (Docentes)</b></h4>
            </div>
            <div class="col s6 offset-s4">
                <div class="row">
                    <div class="col s10 offset-s1 card-panel z-depth-5">
                        <div class="center" id="sesionesDocentes" style="margin-top: 45px; margin-bottom: 45px;">

                        </div>
                    </div>
                </div>
            </div>

            <div class="col s12">
                <h4 class="center-align"><b>Lista de Sesiones Disponibles (Estudiantes)</b></h4>
            </div>
            <div class="col s6 offset-s4">
                <div class="row">
                    <div class="col s10 offset-s1 card-panel z-depth-5">
                        <div class="center" id="sesionesEstudiantes" style="margin-top: 45px; margin-bottom: 45px;">

                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal Structure -->
            <div id="modal1" class="modal">
                <div class="modal-content">
                    <h4>Datos de ingreso necesarios</h4>
                    <p>Ingrese su rut y la contraseña.</p>
                    <form class="cols10" action="cartografia-profesor.jsp">
                        <input type="hidden" id="hiddenField" name="hiddenField"/> 
                        <input placeholder="Ingrese su rut" id="rutIngreso" type="text" class="validate" onblur="limpiar_rutDos(this.value); formato_rutDos(this.value)">
                        <label for="rutIngreso">Rut</label>
                        <input placeholder="Ingrese su clave" id="claveIngreso" type="text" class="validate">
                        <label for="claveIngreso">Clave</label>
                        <div class="row" style="margin-top: 40px;">
                            <button class="btn waves-effect blue lighten-1" type="submit" name="action" onclick="validandoIngreso();">Ingresar
                                <i class="material-icons right">send</i>
                            </button>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <a href="#!" class="modal-close waves-effect waves-green btn-flat">Cerrar</a>
                </div>
            </div>

            <!-- Modal Structure -->
            <div id="modal2" class="modal">
                <div class="modal-content">
                    <h4>Datos de ingreso necesarios</h4>
                    <p>Ingrese la contraseña de la sesión.</p>
                    <form class="cols10" action="entrar.do">
                        <input type="hidden" id="hiddenFieldDos" name="hiddenFieldDos"/> 
                        <input placeholder="Ingrese la clave de la sesion" id="claveIngresoDos" type="text" class="validate">
                        <label for="claveIngresoDos">Clave</label>
                        <div class="row" style="margin-top: 40px;">
                            <button class="btn waves-effect blue lighten-1" type="submit" name="action" onclick="validandoIngresoDos();">Ingresar
                                <i class="material-icons right">send</i>
                            </button>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <a href="#!" class="modal-close waves-effect waves-green btn-flat">Cerrar</a>
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
            $(document).ready(function () {
                $('.modal').modal();
            });
        </script>
        <script>
            var array = '';
            
            function validandoRegistro()
            {
                var campoClave = document.getElementById("clave").value;
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
                var rutIngreso = document.getElementById("rutIngreso").value;
                var claveIngreso = document.getElementById("claveIngreso").value;
                var id_sesion = document.getElementById("hiddenField").value;
                // alert(id_sesion + rutIngreso + claveIngreso);
                if (rutIngreso == null || rutIngreso.length == 0 || /^\s+$/.test(rutIngreso)) {
                    Materialize.toast('El campo que indica su rut no puede estar vacío', 4000);
                } else if (rutIngreso.length < 11) {
                    Materialize.toast('El campo que indica su rut no puede tener menos de 11 caracteres', 4000);
                } else if (rutIngreso.length > 12) {
                    Materialize.toast('El campo que indica su rut no puede tener más de 12 caracteres', 4000);
                } else if (valrut(rutIngreso) == false) {
                    Materialize.toast('El rut ingresado no es válido', 4000);
                } else if (claveIngreso == null || claveIngreso.length == 0 || /^\s+$/.test(claveIngreso)) {
                    Materialize.toast('El campo que indica la clave no puede estar vacío', 4000);
                } else {
                    var i;
                    var igualdad = false;

                    if (array.length > 0) {
                        //alert('paso al for')
                        //alert(array);
                        for (i = 0; i < array.length; i++) {
                            if (array[i].ID_SESION == id_sesion && array[i].RUT == rutIngreso && array[i].CLAVE == claveIngreso) {
                                igualdad = true;
                            }
                        }
                        //alert(igualdad);
                    } else {
                        Materialize.toast('Problema al cargar los datos de las sesiones', 4000);
                    }
                    
                    if(igualdad) {
                        redireccionDocente(id_sesion);
                    } else {
                        Materialize.toast('Los datos ingresados no coinciden', 4000);
                    }
                } 
            }
            
            function validandoIngresoDos() {
                var claveIngreso = document.getElementById("claveIngresoDos").value;
                var id_sesion = document.getElementById("hiddenFieldDos").value;
                
                if (claveIngreso == null || claveIngreso.length == 0 || /^\s+$/.test(claveIngreso)) {
                    Materialize.toast('El campo que indica la clave no puede estar vacío', 4000);
                } else {
                    var i;
                    var igualdad = false;

                    if (array.length > 0) {
                        //alert('paso al for')
                        //alert(array);
                        for (i = 0; i < array.length; i++) {
                            if (array[i].ID_SESION == id_sesion && array[i].CLAVE == claveIngreso) {
                                igualdad = true;
                            }
                        }
                        //alert(igualdad);
                    } else {
                        Materialize.toast('Problema al cargar los datos de las sesiones', 4000);
                    }
                    
                    if(igualdad) {
                        redireccionEstudiante(id_sesion);
                    } else {
                        Materialize.toast('Los datos ingresados no coinciden', 4000);
                    }
                }
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
            
            function limpiar_rutDos(rut)
            {
                var rutLimpio = rut;
                //Definimos los caracteres a eliminar
                var eliminar = ".-";
                //Los eliminamos
                for (var i = 0; i < eliminar.length; i++) {
                    rutLimpio = rutLimpio.replace(new RegExp("\\" + eliminar[i], 'gi'), '');
                }
                //Pasamos al campo el valor limpio
                document.getElementById("rutIngreso").value = rutLimpio.toUpperCase();
            }

            function formato_rutDos(rut) {
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
                document.getElementById("rutIngreso").value = sRut.toUpperCase();
            }

            function cargarSesiones() {
                // alert('cargando sesiones');

                var xmlhttp = new XMLHttpRequest();
                var url = 'http://www.premiosNacionales.escuela-fundacion-sol.cl/juego/registroJuego.php/?opcion=1';

                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        array = JSON.parse(xmlhttp.responseText);
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

            function agregarBotonSesion(id_sesion) {
                var contenedor = document.getElementById('sesionesDocentes');
                contenedor.innerHTML += "<div class='row'><a style='margin: 10px auto;' class='btn waves-effect blue lighten-1 modal-trigger' onclick='enviarSesion("+ id_sesion + ")' href='#modal1'>Sesión " + id_sesion + "<i class='material-icons right'>perm_identity</i></button></div>";

                var contenedorDos = document.getElementById('sesionesEstudiantes');
                contenedorDos.innerHTML += "<div class='row'><a style='margin: 10px auto;' class='btn waves-effect blue lighten-1 modal-trigger' onclick='enviarSesionDos("+ id_sesion + ")' href='#modal2'>Sesión " + id_sesion + "<i class='material-icons right'>people_outline</i></button></div>";
            }
            
            function enviarSesion(id_sesion) {
                document.getElementById("hiddenField").value = id_sesion;
            }
            
            function enviarSesionDos(id_sesion) {
                document.getElementById("hiddenFieldDos").value = id_sesion;
            }

            function noHaySesiones() {
                var contenedor = document.getElementById('sesionesDocentes');
                contenedor.innerHTML = "<p><b>Aún no se han creado sesiones</b></p>";

                var contenedorDos = document.getElementById('sesionesEstudiantes');
                contenedorDos.innerHTML = "<p><b>Aún no se han creado sesiones</b></p>";
            }

            function redireccionDocente(id_sesion) {
                //alert('Sesión ' + id_sesion);
                window.location = 'cartografia-profesor.jsp?sesion=' + id_sesion;
            }

            function redireccionEstudiante(id_sesion) {
                window.location = 'entrar.do?sesion=' + id_sesion;
            }
        </script>
    </body>
</html>
