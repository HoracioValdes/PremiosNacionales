/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.controlador;

import cl.dao.DaoRegistro;
import cl.modelo.Admin;
import cl.modelo.SesionesJuego;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Horacio
 */
@WebServlet(name = "ControladorRegistroLogin", urlPatterns = {"/registro.do", "/ingreso.do"})
public class ControladorRegistroLogin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Corrección de caracteres
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        //Se genera objetos para la implementación.
        DaoRegistro dao = new DaoRegistro();
        //Variables de mensajes
        String errores = "", msg = "", msgDos = "";
        //Se identifica la petición realizada.
        String userPath = request.getServletPath();

        if (userPath.equals("/registro.do")) {
            //Recuperamos los datos de la sesión a registrar
            String nombre = request.getParameter("txtNombre");
            String correo = request.getParameter("txtCorreo");
            int asignatura = Integer.parseInt(request.getParameter("cboAsignatura"));
            String institucion = request.getParameter("txtInstitucion");
            int comuna = Integer.parseInt(request.getParameter("cboComuna"));
            String clave = request.getParameter("txtClave");

            if (errores.isEmpty()) {

                int cantFilas = dao.registrarSesion(nombre, correo, asignatura, institucion, comuna, clave);

                //Verificar la inserción y enviar mensajes.
                if (cantFilas > 0) {
                    int numeroSesion = dao.obtenerSesion(correo, nombre);
                    if (numeroSesion > 0) {
                        msg = "Ya puedes jugar en la sesión número " + numeroSesion;
                         request.setAttribute("numeroSesion", numeroSesion);
                    } else {
                        msg = "Error al obtener el número de la sesión";
                    }
                    
                } else {
                    msg = "Error en el registro de la sesión";
                }

                request.setAttribute("msg", msg);
                request.setAttribute("correo", correo);
                request.setAttribute("clave", clave);
            } else {
                request.setAttribute("msg", errores);
            }

            //Se retorna el mensaje de vuelta al jsp.
            request.getRequestDispatcher("/index.jsp").forward(request, response);

        } else if (userPath.equals("/ingreso.do")) {

            //Se recuperan los parámetros desde la petición.
            String nombre_ingreso = request.getParameter("nombreIngreso");
            String clave_ingreso = request.getParameter("claveIngreso");

            //Recuperamos el listado de admin registrados
            ArrayList<Admin> lstAdmin = dao.listarAdmins();

            //Se verifica si el usuario es válido.
            Admin adminValido = null;
            
            for (Admin a : lstAdmin) {
                if (a.getNombre_usuario().equals(nombre_ingreso) && a.getClave().equals(clave_ingreso)) {
                    adminValido = a;
                    break;
                }
            }
            //Verirficar si se da acceso al usuario
            if (adminValido != null) {//Usuario autorizado
                                
                //Se genera una sesión para el usuario.
                request.getSession().setAttribute("adminValido", adminValido);  
                //Se le da acceso al formulario socio de la aplicación.
                request.getRequestDispatcher("listaSesiones.jsp").forward(request, response);
            } else {
                msgDos = "Nombre y/o clave inválidas";
                request.setAttribute("msgDos", msgDos);
                request.getRequestDispatcher("admin.jsp").forward(request, response);
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
