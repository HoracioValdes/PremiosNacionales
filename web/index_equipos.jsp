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

        <!-- Hoja propia-->
        <link rel="STYLESHEET" type="text/css" href="css/estilos.css">

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
            var estadoSesion = '';

            function recibirData() {
                var dataSucia = '${msg}';
                var data = dataSucia.substring(36);
                numeroSesion = '${id_sesion}';
                estadoSesion = '${estado_sesion}';
                //alert(data);
                document.getElementById("estadoSesion").value = estadoSesion;
                document.getElementById("id_sesion_estudiante").value = numeroSesion;
            }
        </script>
    </head>
    <%
        java.util.Calendar fecha = java.util.Calendar.getInstance();
    %>
    <body onload="recibirData();">
        <div class="container">

            <nav style="height: 230px;">
                <div class="nav-wrapper teal">
                </div>
            </nav>

            <div class="col s12">
                <h4 class="center-align" style="color: #1a237e; margin-top: 50px;"><b>Crear Sesión</b></h4>
            </div>
            <div class="col s6 offset-s4">
                <div class="blue-text center-align">
                    <p class="flow-text" style="color: #1a237e;"><b>${requestScope.msg}</b></p>
                </div>
                <div class="row">
                    <form class="col s10 offset-s1 card-panel z-depth-5" action="entrar_dos.do" method="post" style="margin-bottom: 100px;">
                        <input type="hidden" id="id_sesion_estudiante" name="id_sesion_estudiante"/>
                        <input type="hidden" id="estadoSesion" name="estadoSesion"/>
                        <input type="hidden" id="numeroEquipo" name="numeroEquipo"/>
                        <div class="col s8 offset-s2">
                            <div class="row">
                                <div class="center" style="position: relative; margin: 10px;">    
                                    <button style="margin-top: 10px;" class="btn waves-effect red lighten-2" type="submit" name="action" onclick="primero();">Equipo 1
                                        <i class="material-icons right">send</i>
                                    </button>
                                </div>  
                            </div>
                            <div class="row">
                                <div class="center" style="position: relative; margin: 10px;">    
                                    <button style="margin-top: 10px;" class="btn waves-effect red lighten-2" type="submit" name="action" onclick="segundo();">Equipo 2
                                        <i class="material-icons right">send</i>
                                    </button>
                                </div>  
                            </div>
                            <div class="row">
                                <div class="center" style="position: relative; margin: 10px;">    
                                    <button style="margin-top: 10px;" class="btn waves-effect red lighten-2" type="submit" name="action" onclick="tercero();">Equipo 3
                                        <i class="material-icons right">send</i>
                                    </button>
                                </div>  
                            </div>
                            <div class="row">
                                <div class="center" style="position: relative; margin: 10px;">    
                                    <button style="margin-top: 10px;" class="btn waves-effect red lighten-2" type="submit" name="action" onclick="cuarto();">Equipo 4
                                        <i class="material-icons right">send</i>
                                    </button>
                                </div>  
                            </div>
                            <div class="row">
                                <div class="center" style="position: relative; margin: 10px;">    
                                    <button style="margin-top: 10px;" class="btn waves-effect red lighten-2" type="submit" name="action" onclick="quinto();">Equipo 5
                                        <i class="material-icons right">send</i>
                                    </button>
                                </div>  
                            </div>
                            <div class="row">
                                <div class="center" style="position: relative; margin: 10px;">    
                                    <button style="margin-top: 10px;" class="btn waves-effect red lighten-2" type="submit" name="action" onclick="sexto();">Equipo 6
                                        <i class="material-icons right">send</i>
                                    </button>
                                </div>  
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!--Import jQuery before materialize.js-->
        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script type="text/javascript">
                                        function primero() {
                                            document.getElementById("numeroEquipo").value = 1;
                                        }
                                        function segundo() {
                                            document.getElementById("numeroEquipo").value = 2;
                                        }
                                        function tercero() {
                                            document.getElementById("numeroEquipo").value = 3;
                                        }
                                        function cuarto() {
                                            document.getElementById("numeroEquipo").value = 4;
                                        }
                                        function quinto() {
                                            document.getElementById("numeroEquipo").value = 5;
                                        }
                                        function sexto() {
                                            document.getElementById("numeroEquipo").value = 6;
                                        }
        </script>
    </body>
</html>
