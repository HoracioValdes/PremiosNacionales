/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.controlador;

import cl.dao.DaoJuegoEstudiante;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Horacio
 */
@WebServlet(name = "ControladorEncuesta", urlPatterns = {"/entrar.do", "/entrar_dos.do", "/entrar_profesor.do", "/paso-docente.do", "/paso-estudiante.do", "/paso-docente-final-nivel.do", "/paso-docente-final-juego.do"})
public class ControladorJuegoEstudiantes extends HttpServlet {

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
        DaoJuegoEstudiante dao = new DaoJuegoEstudiante();
        //ArrayList<Centro_medico> listaCentroMedico;
        //Socio_encuesta socio_encuesta;
        int numero_equipo;

        //Variables de mensajes
        String errores = "", msg = "";

        //Se identifica la petición realizada.
        String userPath = request.getServletPath();

        if (userPath.equals("/entrar.do")) {

            //Se recupera la id de la sesión
            int id_sesion = Integer.parseInt(request.getParameter("id_sesion_estudiante"));

            String estado_sesion = dao.obtenerEstadoSesion(id_sesion);

            if (estado_sesion.equalsIgnoreCase("ABIERTA")) {
                int cantFilas = 0;
                //Asignacion de equipo en base de datos
                //Consulta sobre el número de grupos de sesión
                int numero_grupos = dao.obtenerNumeroGrupos(id_sesion);

                if (numero_grupos < 6) {
                    do {
                        //Asignacion de número de equipo
                        numero_equipo = (int) Math.floor(Math.random() * 6 + 1);
                        //Carga en base de datos
                        cantFilas = dao.asignarNumero(numero_equipo, id_sesion);

                    } while (cantFilas == 0);

                    //Se envía información a jsp de salida.
                    request.setAttribute("estado_sesion", estado_sesion);
                    request.setAttribute("id_sesion", id_sesion);
                    request.setAttribute("numero_equipo", numero_equipo);
                    request.getRequestDispatcher("panel-estudiante.jsp").forward(request, response);
                } else {
                    msg = "Ya existe el número máximo de grupos; seleccione el equipo en el cual estaba jugando";
                    request.setAttribute("id_sesion", id_sesion);
                    request.setAttribute("estado_sesion", estado_sesion);
                    request.setAttribute("msg", msg);
                    request.getRequestDispatcher("index_equipos.jsp").forward(request, response);
                }
            } else if (estado_sesion.equalsIgnoreCase("SEGUNDA")) {
                msg = "Ya existe el número máximo de grupos; seleccione el equipo en el cual estaba jugando";
                request.setAttribute("id_sesion", id_sesion);
                estado_sesion = "SEGUNDA";
                request.setAttribute("estado_sesion", estado_sesion);
                request.setAttribute("msg", msg);
                request.getRequestDispatcher("index_equipos.jsp").forward(request, response);
            } else if (estado_sesion.equalsIgnoreCase("TERCERA")) {
                msg = "Ya existe el número máximo de grupos; seleccione el equipo en el cual estaba jugando";
                request.setAttribute("id_sesion", id_sesion);
                estado_sesion = "TERCERA";
                request.setAttribute("estado_sesion", estado_sesion);
                request.setAttribute("msg", msg);
                request.getRequestDispatcher("index_equipos.jsp").forward(request, response);
            } else if (estado_sesion.equalsIgnoreCase("CIERRE")) {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }

        } else if (userPath.equals("/entrar_dos.do")) {

            //Se recupera los datos de la sesión y el equipo
            int id_sesion = Integer.parseInt(request.getParameter("id_sesion_estudiante"));
            String estado_sesion = (request.getParameter("estadoSesion"));
            int numero_equipo_dos = Integer.parseInt(request.getParameter("numeroEquipo"));

            if (estado_sesion.equalsIgnoreCase("ABIERTA")) {

                request.setAttribute("estado_sesion", estado_sesion);
                request.setAttribute("id_sesion", id_sesion);
                request.setAttribute("numero_equipo", numero_equipo_dos);
                request.getRequestDispatcher("panel-estudiante.jsp").forward(request, response);

            } else if (estado_sesion.equalsIgnoreCase("SEGUNDA")) {
                
                request.setAttribute("estado_sesion", estado_sesion);
                request.setAttribute("id_sesion", id_sesion);
                request.setAttribute("numero_equipo", numero_equipo_dos);
                request.getRequestDispatcher("panel-estudiante.jsp").forward(request, response);

            } else if (estado_sesion.equalsIgnoreCase("TERCERA")) {
                
                request.setAttribute("estado_sesion", estado_sesion);
                request.setAttribute("id_sesion", id_sesion);
                request.setAttribute("numero_equipo", numero_equipo_dos);
                request.getRequestDispatcher("panel-estudiante.jsp").forward(request, response);

            }

        } else if (userPath.equals("/entrar_profesor.do")) {

            //Se recupera la id de la sesión
            int id_sesion = Integer.parseInt(request.getParameter("id_sesion_profesor"));

            String estado_sesion = dao.obtenerEstadoSesion(id_sesion);

            int nivel_sesion = 0;

            if (estado_sesion.equalsIgnoreCase("ABIERTA")) {
                if (!dao.verificarNivelPrevio(id_sesion, estado_sesion)) {
                    dao.insertarNivel(estado_sesion, id_sesion);
                    dao.comienzoJuego(id_sesion);
                    nivel_sesion = 1;
                } else {
                    nivel_sesion = 1;
                }
            } else {
                nivel_sesion = dao.obtenerNivel(id_sesion, estado_sesion);
            }

            request.setAttribute("nivel_sesion", nivel_sesion);
            request.setAttribute("estado_sesion", estado_sesion);
            request.setAttribute("id_sesion", id_sesion);
            request.getRequestDispatcher("cartografia-profesor.jsp").forward(request, response);

        } else if (userPath.equals("/paso-docente.do")) {

            // Recepción de datos de sesión
            int id_sesion = Integer.parseInt(request.getParameter("id_sesion"));
            String estado_sesion = (request.getParameter("estado_sesion"));
            int nivel_sesion = Integer.parseInt(request.getParameter("nivel_sesion"));

            // Obtener id de desafío
            int id_desafio = dao.idDesafio(id_sesion);

            if (id_desafio != 0) {

                // Cerrar desafio
                if (dao.cerrarDesafio(id_desafio) > 0) {

                    // Resetear dados
                    dao.resetearDados(id_sesion);

                }

            }

            request.setAttribute("nivel_sesion", nivel_sesion);
            request.setAttribute("estado_sesion", estado_sesion);
            request.setAttribute("id_sesion", id_sesion);
            request.getRequestDispatcher("cartografia-profesor.jsp").forward(request, response);

        } else if (userPath.equals("/paso-estudiante.do")) {

            // Recepción de datos de sesión
            int id_sesion = Integer.parseInt(request.getParameter("id_sesion"));
            String estado_sesion = (request.getParameter("estado_sesion"));
            int numero_equipo_paso = Integer.parseInt(request.getParameter("numero_equipo"));
            
            estado_sesion = dao.obtenerEstadoSesion(id_sesion);

            request.setAttribute("estado_sesion", estado_sesion);
            request.setAttribute("id_sesion", id_sesion);
            request.setAttribute("numero_equipo", numero_equipo_paso);
            request.getRequestDispatcher("panel-estudiante.jsp").forward(request, response);

        } else if (userPath.equals("/paso-docente-final-nivel.do")) {

            // Recepción de datos de sesión
            int id_sesion = Integer.parseInt(request.getParameter("id_sesion"));
            String estado_sesion = (request.getParameter("estado_sesion"));
            int nivel_sesion = Integer.parseInt(request.getParameter("nivel_sesion"));
            
            // Obtener id de desafío
            int id_desafio = dao.idDesafio(id_sesion);

            if (id_desafio != 0) {

                // Cerrar desafio
                if (dao.cerrarDesafio(id_desafio) > 0) {

                    // Resetear dados
                    dao.resetearDados(id_sesion);

                }

            }

            // Cambiar el estado de la sesión
            if (estado_sesion.equalsIgnoreCase("ABIERTA")) {
                estado_sesion = "SEGUNDA";

                // Fijar nivel
                nivel_sesion = nivel_sesion + 1;

                if (nivel_sesion > 3) {
                    nivel_sesion = 3;
                }
                dao.insertarNivelSegunda(estado_sesion, id_sesion, nivel_sesion);

                dao.actualizarSesion(estado_sesion, id_sesion);

            } else if (estado_sesion.equalsIgnoreCase("SEGUNDA")) {
                estado_sesion = "TERCERA";

                //Fijar nivel
                // Fijar nivel
                nivel_sesion = nivel_sesion + 1;

                if (nivel_sesion > 3) {
                    nivel_sesion = 3;
                }
                dao.insertarNivelSegunda(estado_sesion, id_sesion, nivel_sesion);

                dao.actualizarSesion(estado_sesion, id_sesion);

            } else if (estado_sesion.equalsIgnoreCase("TERCERA")) {
                // Terminar el juego
                estado_sesion = "CIERRE";
                dao.actualizarSesion(estado_sesion, id_sesion);
            }

            request.setAttribute("nivel_sesion", nivel_sesion);
            request.setAttribute("estado_sesion", estado_sesion);
            request.setAttribute("id_sesion", id_sesion);
            request.getRequestDispatcher("cartografia-profesor.jsp").forward(request, response);
            
        } else if (userPath.equals("/paso-docente-final-juego.do")) {

            // Recepción de datos de sesión
            int id_sesion = Integer.parseInt(request.getParameter("id_sesion"));
            String estado_sesion = (request.getParameter("estado_sesion"));
            int nivel_sesion = Integer.parseInt(request.getParameter("nivel_sesion"));
            
            if (estado_sesion.equalsIgnoreCase("TERCERA")) {
                // Terminar el juego
                estado_sesion = "CIERRE";
                dao.actualizarSesion(estado_sesion, id_sesion);
            }
            
            // Eliminar datos
            
            if (dao.eliminarCalificacion(id_sesion)) {
                if (dao.eliminarRespuesta(id_sesion)) {
                    if(dao.eliminarDesafio(id_sesion)) {
                        if(dao.eliminarNivel(id_sesion)) {
                            if(dao.eliminarJugar(id_sesion)) {
                                if(dao.eliminarDados(id_sesion)) {
                                    // Envío al index
                                    
                                    request.getRequestDispatcher("index.jsp").forward(request, response);
                                }
                            }
                        }
                    }
                }
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
