<%-- 
    Document   : nav
    Created on : 21-07-2017, 11:56:08
    Author     : Horacio
--%>

<%@page import="cl.modelo.Socio_corporativo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<nav>
    <div class="nav-wrapper blue darken-3">
        <a href="#" class="brand-logo">&nbsp;<img class="responsive-img" src="img/logo.png" width="120px" style="margin-top: 5px">&nbsp;</a>
        <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
        <ul class="right hide-on-med-and-down">
            <li><a href="encuesta.do"><b>Encuesta</b></a></li>
            <li><a href="modificar.do?rut=${sessionScope.socioValido.rut}"><b>Modificar o eliminar encuesta</b></a></li>
            <li><a href="cerrar.jsp"><b>Salir</b></a></li>
        </ul>
        <ul class="side-nav blue darken-3" id="mobile-demo">
            <li><a href="encuesta.do" style="color: white"><b>Encuesta</b></a></li>
            <li><a href="modificar.do?rut=${sessionScope.socioValido.rut}" style="color: white"><b>Modificar o eliminar encuesta</b></a></li>
            <li><a href="cerrar.jsp" style="color: white"><b>Salir</b></a></li>
        </ul>
    </div>
</nav>
