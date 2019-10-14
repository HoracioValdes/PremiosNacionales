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
@WebServlet(name = "ControladorEncuesta", urlPatterns = {"/entrar.do", "/entrar_dos.do", "/entrar_profesor.do", "/manipular.do"})
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

            } else if (estado_sesion.equalsIgnoreCase("TERCERA")) {

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

        } else if (userPath.equals("/manipular.do")) {

//            String rut = String.valueOf(request.getParameter("rut"));
//            boolean confirmacion = false;
//
//            if (dao.verificarEncuesta(rut)) {
//
//                String operacion = String.valueOf(request.getParameter("action"));
//
//                if (operacion.equals("modificar")) {
//
//                    socio_encuesta = new Socio_encuesta();
//
//                    socio_encuesta.setRut(rut);
//                    socio_encuesta.setNombre(request.getParameter("txtNombre"));
//                    socio_encuesta.setSexo(request.getParameter("optSexo"));
//                    socio_encuesta.setCentro_medico(Integer.parseInt(request.getParameter("cboCentro")));
//                    socio_encuesta.setCambio_centro(Integer.parseInt(request.getParameter("optCentroMedico")));
//                    socio_encuesta.setCut(Integer.parseInt(request.getParameter("cboComuna")));
//                    socio_encuesta.setFecha_nacimiento(request.getParameter("txtFecha_Nacimiento"));
//                    socio_encuesta.setEducacion(Integer.parseInt(request.getParameter("cboEducacion")));
//                    socio_encuesta.setEstudio_actual(Integer.parseInt(request.getParameter("optEducacionActual")));
//                    String carrera = String.valueOf(request.getParameter("txtEstudio"));
//                    if (!carrera.equalsIgnoreCase("null")) {
//                        socio_encuesta.setCarrera_institucion(carrera);
//                    } else {
//                        socio_encuesta.setCarrera_institucion("NO APLICA");
//                    }
//                    socio_encuesta.setEstado_civil(Integer.parseInt(request.getParameter("cboEstadoCivil")));
//                    socio_encuesta.setPersonas_hogar(Integer.parseInt(request.getParameter("cboMiembrosHogar")));
//                    socio_encuesta.setPersonas_ocupadas(Integer.parseInt(request.getParameter("cboMiembrosTrabajan")));
//                    socio_encuesta.setPersonas_buscando(Integer.parseInt(request.getParameter("cboMiembrosBuscan")));
//                    socio_encuesta.setPersonas_problema_salud(Integer.parseInt(request.getParameter("optEnfermedad")));
//                    String verificacion_problemas = (String.valueOf(request.getParameter("cboNumeroEnfermos")));
//                    if (verificacion_problemas.equals("null")) {
//                        socio_encuesta.setPersonas_problema_salud_numero(0);
//                    } else {
//                        socio_encuesta.setPersonas_problema_salud_numero(Integer.parseInt(request.getParameter("cboNumeroEnfermos")));
//                    }
//                    socio_encuesta.setPersonas_carga(Integer.parseInt(request.getParameter("cboCargas")));
//                    socio_encuesta.setProveedor_principal(Integer.parseInt(request.getParameter("optProvPrin")));
//                    socio_encuesta.setVivienda(Integer.parseInt(request.getParameter("cboVivienda")));
//                    socio_encuesta.setCargo_trabajo(Integer.parseInt(request.getParameter("cboCargo")));
//                    socio_encuesta.setPolifuncionalidad(Integer.parseInt(request.getParameter("optPolifuncionalidad")));
//                    socio_encuesta.setArea_funciones(Integer.parseInt(request.getParameter("cboArea")));
//                    socio_encuesta.setAnio_antiguedad(Integer.parseInt(request.getParameter("cboAnioAnt")));
//                    socio_encuesta.setMes_antiguedad(Integer.parseInt(request.getParameter("cboMesAnt")));
//                    socio_encuesta.setHoras_jornada(Integer.parseInt(request.getParameter("cboJornada")));
//                    socio_encuesta.setHoras_extra_habiles(Integer.parseInt(request.getParameter("optHorasHabiles")));
//                    socio_encuesta.setHoras_extra_sabado(Integer.parseInt(request.getParameter("optHorasSabado")));
//                    socio_encuesta.setHoras_extra_domingo(Integer.parseInt(request.getParameter("optHorasDomingo")));
//                    socio_encuesta.setTurnos(Integer.parseInt(request.getParameter("cboLlamado")));
//                    socio_encuesta.setTiempo_traslado_horas(Integer.parseInt(request.getParameter("cboHorasTr")));
//                    socio_encuesta.setTiempo_traslado_minutos(Integer.parseInt(request.getParameter("cboMinutosTr")));
//                    socio_encuesta.setSolicitud_traslado_centro(Integer.parseInt(request.getParameter("optTraslado")));
//                    String verificacion_traslado = (String.valueOf(request.getParameter("cboTraslado")));
//                    if (verificacion_traslado.equals("null")) {
//                        socio_encuesta.setNumero_solicitud(0);
//                    } else {
//                        socio_encuesta.setNumero_solicitud(Integer.parseInt(request.getParameter("cboTraslado")));
//                    }
//                    String otorgado = String.valueOf(request.getParameter("optOtorgado"));
//                    if (!otorgado.equalsIgnoreCase("null")) {
//                        socio_encuesta.setOtorgamiento_traslado_centro(Integer.parseInt(request.getParameter("optOtorgado")));
//                    }
//                    String verificacion_otorgamiento = (String.valueOf(request.getParameter("cboTrasladoCon")));
//                    if (verificacion_otorgamiento.equals("null")) {
//                        socio_encuesta.setNumero_otorgamiento(0);
//                    } else {
//                        socio_encuesta.setNumero_otorgamiento(Integer.parseInt(request.getParameter("cboTrasladoCon")));
//                    }
//                    socio_encuesta.setPrestamo_marzo(Integer.parseInt(request.getParameter("optPrMarzo")));
//                    socio_encuesta.setServicio_dental(Integer.parseInt(request.getParameter("optSerDental")));
//                    if (socio_encuesta.getServicio_dental() == 0) {
//                        socio_encuesta.setOtro_servicio_dental(Integer.parseInt(request.getParameter("optOtroServicio")));
//                    }
//                    socio_encuesta.setBono_nps(Integer.parseInt(request.getParameter("optBonoNPS")));
//                    socio_encuesta.setCriterios_bono_nps(Integer.parseInt(request.getParameter("optCriteriosNPS")));
//                    socio_encuesta.setCriterios_bono_produccion(Integer.parseInt(request.getParameter("optBonoRenta")));
//                    socio_encuesta.setTiempo_acreditacion(Integer.parseInt(request.getParameter("optAcreditacion")));
//                    if (socio_encuesta.getTiempo_acreditacion() == 1) {
//                        socio_encuesta.setEstres_acreditacion(Integer.parseInt(request.getParameter("optEstresAcreditacion")));
//                        socio_encuesta.setProblema_funciones_acreditacion(Integer.parseInt(request.getParameter("optDesempeñoAcreditacion")));
//
//                    }
//                    socio_encuesta.setSituacion_catastrofica(Integer.parseInt(request.getParameter("optApoyo")));
//                    socio_encuesta.setRetiro_voluntario(Integer.parseInt(request.getParameter("optIndemnizacion")));
//                    socio_encuesta.setSalida_social(Integer.parseInt(request.getParameter("optRetiro")));
//                    socio_encuesta.setSatisfaccion_empresa(Integer.parseInt(request.getParameter("cboSatisfaccionEmpresa")));
//                    socio_encuesta.setFiesta(Integer.parseInt(request.getParameter("cboFiesta")));
//                    socio_encuesta.setValoracion_sindicato(Integer.parseInt(request.getParameter("cboSindicatoMejora")));
//                    socio_encuesta.setOtro_sindicato(Integer.parseInt(request.getParameter("optOtroSind")));
//                    socio_encuesta.setAntiguedad_sindicato_anio(Integer.parseInt(request.getParameter("cboAnioSin")));
//                    socio_encuesta.setAntiguedad_sindicato_mes(Integer.parseInt(request.getParameter("cboMesSin")));
//                    socio_encuesta.setContrato_colectivo(Integer.parseInt(request.getParameter("optPartCont")));
//                    socio_encuesta.setConocimiento_contrato_colectivo(Integer.parseInt(request.getParameter("optConCont")));
//                    socio_encuesta.setEstatutos_sindicato(Integer.parseInt(request.getParameter("optEstCont")));
//
//                    int cantFilas = dao.modificarEncuesta(socio_encuesta, rut);
//                    //Verificar la inserción y enviar mensajes.
//                    if (cantFilas > 0) {
//                        msg = "Encuesta modificada exitosamente";
//                    } else {
//                        msg = "Error en la modificación de la encuesta";
//                    }
//                    request.setAttribute("msg", msg);
//
//                } else if (operacion.equals("eliminar")) {
//
//                    confirmacion = dao.eliminarEncuesta(rut);
//
//                    //Verificar la inserción y enviar mensajes.
//                    if (confirmacion) {
//                        msg = "Encuesta eliminada exitosamente";
//                    } else {
//                        msg = "Error en la eliminación de la encuesta";
//                    }
//                    request.setAttribute("msg", msg);
//                }
//
//            } else {
//                msg = "Usted aún no ha contestado una encuesta; debe contestarla para modificarla o eliminarla";
//                request.setAttribute("msg", msg);
//            }
//
//            if (confirmacion) {
//                request.getRequestDispatcher("encuesta.do").forward(request, response);
//            } else {
//                //Se retorna el mensaje de vuelta al jsp.
//                request.getRequestDispatcher("modificar.do").forward(request, response);
//            }
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
