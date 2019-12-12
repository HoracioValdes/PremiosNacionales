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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script>
            var array = '';
            var arrayAsignatura = '';
            var arrayComuna = '';
            var correoRegistrado = '';
            var claveRegistrada = '';
            var numeroSesion = '';

            function recibirData() {
                var dataSucia = '${msg}';
                var data = dataSucia.substring(36);
                correoRegistrado = '${correo}';
                claveRegistrada = '${clave}';
                numeroSesion = '${numeroSesion}';
                //alert(data);

                if (data.length > 0) {
                    agregarBotonSesionRojo(data);
                }
            }

            function agregarBotonSesionRojo(id_sesion) {
                var contenedor = document.getElementById('sesionesDocentes');
                contenedor.innerHTML += "<div class='row'><a style='margin: 10px auto;' class='btn waves-effect red lighten-1 modal-trigger' onclick='enviarSesion(" + id_sesion + ")' href='#modal1'>Sesión " + id_sesion + "<i class='material-icons right'>perm_identity</i></button></div>";

                var contenedorDos = document.getElementById('sesionesEstudiantes');
                contenedorDos.innerHTML += "<div class='row'><a style='margin: 10px auto;' class='btn waves-effect red lighten-1 modal-trigger' onclick='enviarSesionDos(" + id_sesion + ")' href='#modal2'>Sesión " + id_sesion + "<i class='material-icons right'>people_outline</i></button></div>";
            }


            function cargarSesiones() {
                // alert('cargando sesiones');

                var xmlhttp = new XMLHttpRequest();
                var url = 'http://localhost/juego/registroJuego.php/?opcion=1';

                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        array = JSON.parse(xmlhttp.responseText);
                        var i;

                        if (array.length > 0) {
                            for (i = 0; i < array.length; i++) {
                                // alert('Sesión ' + array[i].ID_SESION);
                                agregarBotonSesionAzul(array[i].ID_SESION);
                            }
                        } else {
                            noHaySesiones();
                        }
                    }
                }
                xmlhttp.open("GET", url, true);
                xmlhttp.send();
            }
            
            function cargarAsignatura() {
                // alert('cargando asignaturas');

                var xmlhttp = new XMLHttpRequest();
                var url = 'http://localhost/juego/registroJuego.php/?opcion=4';

                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        arrayAsignatura = JSON.parse(xmlhttp.responseText);
                        var i;

                        if (arrayAsignatura.length > 0) {
                            for (i = 0; i < arrayAsignatura.length; i++) {
                                // alert('Sesión ' + array[i].ID_SESION);
                                agregarAsignaturas(arrayAsignatura[i].ID_ASIGNATURA, arrayAsignatura[i].DESCRIPCION);
                            }
                        } else {
                            noHayAsignaturas();
                        }
                    }
                }
                xmlhttp.open("GET", url, true);
                xmlhttp.send();
            }
            
            function cargarComunas() {
                // alert('cargando asignaturas');

                var xmlhttp = new XMLHttpRequest();
                var url = 'http://localhost/juego/registroJuego.php/?opcion=5';

                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        arrayComuna = JSON.parse(xmlhttp.responseText);
                        var i;

                        if (arrayComuna.length > 0) {
                            for (i = 0; i < arrayComuna.length; i++) {
                                // alert('Sesión ' + array[i].ID_SESION);
                                agregarComunas(arrayComuna[i].CUT, arrayComuna[i].Nombre_Comuna);
                            }
                        } else {
                            noHayComunas();
                        }
                    }
                }
                xmlhttp.open("GET", url, true);
                xmlhttp.send();
            }
        </script>
    </head>
    <body onload="cargarSesiones(); recibirData(); cargarAsignatura(); cargarComunas();">
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
                                    <input id="nombre" type="text" class="validate" maxlength="200" placeholder="Ingrese su nombre"
                                           name="txtNombre"/>
                                    <label for="nombre">Nombre</label>
                                </div>  
                            </div>
                            <div class="row" style="margin-top: 15px;">          
                                <div class="input-field">
                                    <i class="material-icons prefix">contact_mail</i>
                                    <input id="mail" type="text" class="validate" maxlength="200" placeholder="Ingrese un correo de contacto"
                                           name="txtCorreo"/>
                                    <label for="mail">Correo</label>
                                </div>  
                            </div>
                            <div class="row" style="margin-top: 15px; margin-bottom: 15px;">
                                <div class="input-field col s12">
                                    <select name="cboAsignatura" id="asignatura" class="browser-default">
                                        <option  value="NULO" disabled selected>SELECCIONE LA ASIGNATURA</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row" style="margin-top: 50px;">          
                                <div class="input-field">
                                    <i class="material-icons prefix">account_balance</i>
                                    <input id="institucion" type="text" class="validate" maxlength="500" placeholder="Ingrese el nombre de la institución donde trabaja"
                                           name="txtInstitucion"/>
                                    <label for="institucion">Institución</label>
                                </div>  
                            </div>
                            <div class="row" style="margin-top: 15px; margin-bottom: 15px;">
                                <div class="input-field col s12">
                                    <select name="cboComuna" id="comuna" class="browser-default">
                                        <option  value="NULO" disabled selected>SELECCIONE LA COMUNA DE LA INSTITUCIÓN</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row" style="margin-top: 50px;">
                                <div class="input-field">
                                    <i class="material-icons prefix">lock_outline</i>
                                    <input id="clave" type="text" class="validate" maxlength="50" placeholder="Ingrese una clave para abrir a la sesión" name="txtClave"/>
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
                <blockquote>
                    Si el docente acaba de crear una sesión, presiona el botón 'Refrescar' para volver a cargar la página y que el botón de la sesión aparezca.
                </blockquote>
                <div class='center'>
                    <button style="margin-top: 10px; margin-bottom: 10px;" class="btn waves-effect blue lighten-1" type="submit" name="action" onclick="refrescar();">Refrescar
                        <i class="material-icons right">autorenew</i>
                    </button>
                </div>
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
                    <p>Ingrese su correo y la contraseña.</p>
                    <form class="cols10" action="entrar_profesor.do">
                        <input type="hidden" id="id_sesion_profesor" name="id_sesion_profesor"/> 
                        <input placeholder="Ingrese su correo" id="correoIngreso" type="text" class="validate">
                        <label for="rutIngreso">Correo</label>
                        <input placeholder="Ingrese su clave" id="claveIngreso" type="text" class="validate">
                        <label for="claveIngreso">Clave</label>
                        <div class="row" style="margin-top: 40px;">
                            <button class="btn waves-effect blue lighten-1" type="submit" name="action" onclick="return validandoIngreso();">Ingresar
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
                        <input type="hidden" id="id_sesion_estudiante" name="id_sesion_estudiante"/> 
                        <input placeholder="Ingrese la clave de la sesion" id="claveIngresoDos" type="text" class="validate">
                        <label for="claveIngresoDos">Clave</label>
                        <div class="row" style="margin-top: 40px;">
                            <button class="btn waves-effect blue lighten-1" type="submit" name="action" onclick="return validandoIngresoDos();">Ingresar
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
        <script type="text/javascript">
            function refrescar() {
                location.reload();
            }

            function validandoRegistro()
            {
                var campoNombre = document.getElementById("nombre").value;
                var campoCorreo = document.getElementById("mail").value;
                var asignatura = document.getElementById("asignatura").selectedIndex;
                var campoInstitucion = document.getElementById("institucion").value;
                var comuna = document.getElementById("comuna").selectedIndex;
                var campoClave = document.getElementById("clave").value;

                if (campoNombre == null || campoNombre.length == 0 || /^\s+$/.test(campoNombre)) {
                    Materialize.toast('El campo que indica su nombre no puede estar vacío', 4000);
                    return false;
                } else if (campoNombre.length > 200) {
                    Materialize.toast('El campo que indica su nombre no puede tener más de 200 caracteres', 4000);
                    return false;
                } else if (campoCorreo == null || campoCorreo.length == 0 || /^\s+$/.test(campoCorreo)) {
                    Materialize.toast('El campo que indica su correo electrónico no puede estar vacío', 4000);
                    return false;
                } else if (campoCorreo.length > 200) {
                    Materialize.toast('El campo que indica su correo electrónico no puede tener más de 200 caracteres', 4000);
                    return false;
                } else if (asignatura == null || asignatura == 0) {
                    Materialize.toast('Debe seleccionar una asignatura', 4000);
                    return false;
                } else if (campoInstitucion == null || campoInstitucion.length == 0 || /^\s+$/.test(campoInstitucion)) {
                    Materialize.toast('El campo que indica su institución no puede estar vacío', 4000);
                    return false;
                } else if (campoInstitucion.length > 500) {
                    Materialize.toast('El campo que indica su institución no puede tener más de 500 caracteres', 4000);
                    return false;
                } else if (comuna == null || comuna == 0) {
                    Materialize.toast('Debe seleccionar una comuna donde está ubicada su institución', 4000);
                    return false;
                } else if (campoClave == null || campoClave.length == 0 || /^\s+$/.test(campoClave)) {
                    Materialize.toast('El campo que indica la clave no puede estar vacío', 4000);
                    return false;
                }
                return true;
            }

            function validandoIngreso()
            {
                var correoIngreso = document.getElementById("correoIngreso").value;
                var claveIngreso = document.getElementById("claveIngreso").value;
                var id_sesion = document.getElementById("id_sesion_profesor").value;
                // alert(id_sesion + rutIngreso + claveIngreso);

                if (numeroSesion === id_sesion) {

                    if (correoIngreso == null || correoIngreso.length == 0 || /^\s+$/.test(correoIngreso)) {
                        Materialize.toast('El campo que indica el correo no puede estar vacío', 4000);
                        return false;
                    } else if (correoIngreso.length > 200) {
                        Materialize.toast('El campo que indica su correo no puede tener más de 200 caracteres', 4000);
                        return false;
                    } else if (claveIngreso == null || claveIngreso.length == 0 || /^\s+$/.test(claveIngreso)) {
                        Materialize.toast('El campo que indica la clave no puede estar vacío', 4000);
                        return false;
                    } else {
                        var i;
                        var igualdad = false;

                        if (numeroSesion == id_sesion && correoRegistrado == correoIngreso && claveRegistrada == claveIngreso) {
                            igualdad = true;
                            return true;
                        } else {
                            Materialize.toast('Los datos ingresados no coinciden', 4000);
                            return false;
                        }
                    }

                } else {
                    if (correoIngreso == null || correoIngreso.length == 0 || /^\s+$/.test(correoIngreso)) {
                        Materialize.toast('El campo que indica su correo no puede estar vacío', 4000);
                        return false;
                    } else if (correoIngreso.length > 200) {
                        Materialize.toast('El campo que indica su correo no puede tener más de 200 caracteres', 4000);
                        return false;
                    } else if (claveIngreso == null || claveIngreso.length == 0 || /^\s+$/.test(claveIngreso)) {
                        Materialize.toast('El campo que indica la clave no puede estar vacío', 4000);
                        return false;
                    } else {
                        var i;
                        var igualdad = false;

                        if (array.length > 0) {
                            //alert('paso al for')
                            //alert(array);
                            for (i = 0; i < array.length; i++) {
                                if (array[i].ID_SESION == id_sesion && array[i].CORREO == correoIngreso && array[i].CLAVE == claveIngreso) {
                                    igualdad = true;
                                    return true;
                                }
                            }
                            //alert(igualdad);
                        } else {
                            Materialize.toast('Problema al cargar los datos de las sesiones', 4000);
                            return false;
                        }

                        if (igualdad) {
                            // redireccionDocente(id_sesion);
                            return true;
                        } else {
                            Materialize.toast('Los datos ingresados no coinciden', 4000);
                            return false;
                        }
                    }
                }
            }

            function validandoIngresoDos() {
                var claveIngreso = document.getElementById("claveIngresoDos").value;
                var id_sesion = document.getElementById("id_sesion_estudiante").value;
                // alert('datos ingresados: ' + id_sesion + claveIngreso);

                if (numeroSesion === id_sesion) {
                    // alert('número de sesión recuperada :' + numeroSesion);

                    if (claveIngreso == null || claveIngreso.length == 0 || /^\s+$/.test(claveIngreso)) {
                        Materialize.toast('El campo que indica la clave no puede estar vacío', 4000);
                        return false;
                    } else {
                        var i;
                        var igualdad = false;

                        if (numeroSesion == id_sesion && claveRegistrada == claveIngreso) {
                            igualdad = true;
                            return true;
                        } else {
                            Materialize.toast('Los datos ingresados no coinciden', 4000);
                            return false;
                        }
                    }

                } else {

                    if (claveIngreso == null || claveIngreso.length == 0 || /^\s+$/.test(claveIngreso)) {
                        Materialize.toast('El campo que indica la clave no puede estar vacíoDos', 4000);
                        return false;
                    } else {
                        var i;
                        var igualdad = false;

                        if (array.length > 0) {
                            //alert('paso al for')
                            //alert(array);
                            for (i = 0; i < array.length; i++) {
                                if (array[i].ID_SESION == id_sesion && array[i].CLAVE == claveIngreso) {
                                    igualdad = true;
                                    return true;
                                }
                            }
                            //alert(igualdad);
                        } else {
                            Materialize.toast('Problema al cargar los datos de las sesiones', 4000);
                            return false;
                        }

                        if (igualdad) {
                            redireccionEstudiante(id_sesion);
                            return true;
                        } else {
                            Materialize.toast('Los datos ingresados no coinciden', 4000);
                            return false;
                        }
                    }

                }
            }
            
            function agregarBotonSesionAzul(id_sesion) {
                var contenedor = document.getElementById('sesionesDocentes');
                contenedor.innerHTML += "<div class='row'><a style='margin: 10px auto;' class='btn waves-effect blue lighten-1 modal-trigger' onclick='enviarSesion(" + id_sesion + ")' href='#modal1'>Sesión " + id_sesion + "<i class='material-icons right'>perm_identity</i></button></div>";

                var contenedorDos = document.getElementById('sesionesEstudiantes');
                contenedorDos.innerHTML += "<div class='row'><a style='margin: 10px auto;' class='btn waves-effect blue lighten-1 modal-trigger' onclick='enviarSesionDos(" + id_sesion + ")' href='#modal2'>Sesión " + id_sesion + "<i class='material-icons right'>people_outline</i></button></div>";
            }
            
            function agregarAsignaturas(id_asignatura, descripcion) {
                var contenedor = document.getElementById('asignatura');
                contenedor.innerHTML += "<option value="+id_asignatura+">"+descripcion+"</option>";
            }
            
            function agregarComunas(cut, nombre_comuna) {
                var contenedor = document.getElementById('comuna');
                contenedor.innerHTML += "<option value="+cut+">"+nombre_comuna+"</option>";
            }

            function enviarSesion(id_sesion) {
                document.getElementById("id_sesion_profesor").value = id_sesion;
            }

            function enviarSesionDos(id_sesion) {
                document.getElementById("id_sesion_estudiante").value = id_sesion;
            }

            function noHaySesiones() {
                var contenedor = document.getElementById('sesionesDocentes');
                contenedor.innerHTML = "<p><b>Aún no se han creado sesiones</b></p>";

                var contenedorDos = document.getElementById('sesionesEstudiantes');
                contenedorDos.innerHTML = "<p><b>Aún no se han creado sesiones</b></p>";
            }

            function noHayAsignaturas() {
                alert('Error al cargar las asignaturas');
            }
            
            function noHayComunas() {
                alert('Error al cargar las comunas');
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
