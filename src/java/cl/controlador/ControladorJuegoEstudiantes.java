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
@WebServlet(name = "ControladorEncuesta", urlPatterns = {"/entrar.do", "/responder.do", "/modificar.do", "/manipular.do"})
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
            int id_sesion = Integer.parseInt(request.getParameter("sesion"));

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
                request.setAttribute("id_sesion", id_sesion);
                request.setAttribute("numero_equipo", numero_equipo);
                request.getRequestDispatcher("panel-estudiante.jsp").forward(request, response);
            } else {
                msg = "Ya existe el número máximo de grupos";
                request.setAttribute("msg", msg);
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }

        } else if (userPath.equals("/responder.do")) {

            String rut = String.valueOf(request.getParameter("rut"));

            if (!dao.verificarEncuesta(rut)) {

                socio_encuesta = new Socio_encuesta();

                socio_encuesta.setRut(rut);
                socio_encuesta.setNombre(request.getParameter("txtNombre"));
                socio_encuesta.setSexo(request.getParameter("optSexo"));
                socio_encuesta.setCentro_medico(Integer.parseInt(request.getParameter("cboCentro")));
                socio_encuesta.setCambio_centro(Integer.parseInt(request.getParameter("optCentroMedico")));
                socio_encuesta.setCut(Integer.parseInt(request.getParameter("cboComuna")));
                socio_encuesta.setFecha_nacimiento(request.getParameter("txtFecha_Nacimiento"));
                socio_encuesta.setEducacion(Integer.parseInt(request.getParameter("cboEducacion")));
                socio_encuesta.setEstudio_actual(Integer.parseInt(request.getParameter("optEducacionActual")));
                String carrera = String.valueOf(request.getParameter("txtEstudio"));
                if (!carrera.equalsIgnoreCase("null")) {
                    socio_encuesta.setCarrera_institucion(carrera);
                } else {
                    socio_encuesta.setCarrera_institucion("NO APLICA");
                }
                socio_encuesta.setEstado_civil(Integer.parseInt(request.getParameter("cboEstadoCivil")));
                socio_encuesta.setPersonas_hogar(Integer.parseInt(request.getParameter("cboMiembrosHogar")));
                socio_encuesta.setPersonas_ocupadas(Integer.parseInt(request.getParameter("cboMiembrosTrabajan")));
                socio_encuesta.setPersonas_buscando(Integer.parseInt(request.getParameter("cboMiembrosBuscan")));
                socio_encuesta.setPersonas_problema_salud(Integer.parseInt(request.getParameter("optEnfermedad")));
                String verificacion_problemas = (String.valueOf(request.getParameter("cboNumeroEnfermos")));
                if (verificacion_problemas.equals("null")) {
                    socio_encuesta.setPersonas_problema_salud_numero(0);
                } else {
                    socio_encuesta.setPersonas_problema_salud_numero(Integer.parseInt(request.getParameter("cboNumeroEnfermos")));
                }
                socio_encuesta.setPersonas_carga(Integer.parseInt(request.getParameter("cboCargas")));
                socio_encuesta.setProveedor_principal(Integer.parseInt(request.getParameter("optProvPrin")));
                socio_encuesta.setVivienda(Integer.parseInt(request.getParameter("cboVivienda")));
                socio_encuesta.setCargo_trabajo(Integer.parseInt(request.getParameter("cboCargo")));
                socio_encuesta.setPolifuncionalidad(Integer.parseInt(request.getParameter("optPolifuncionalidad")));
                socio_encuesta.setArea_funciones(Integer.parseInt(request.getParameter("cboArea")));
                socio_encuesta.setAnio_antiguedad(Integer.parseInt(request.getParameter("cboAnioAnt")));
                socio_encuesta.setMes_antiguedad(Integer.parseInt(request.getParameter("cboMesAnt")));
                socio_encuesta.setHoras_jornada(Integer.parseInt(request.getParameter("cboJornada")));
                socio_encuesta.setHoras_extra_habiles(Integer.parseInt(request.getParameter("optHorasHabiles")));
                socio_encuesta.setHoras_extra_sabado(Integer.parseInt(request.getParameter("optHorasSabado")));
                socio_encuesta.setHoras_extra_domingo(Integer.parseInt(request.getParameter("optHorasDomingo")));
                socio_encuesta.setTurnos(Integer.parseInt(request.getParameter("cboLlamado")));
                socio_encuesta.setTiempo_traslado_horas(Integer.parseInt(request.getParameter("cboHorasTr")));
                socio_encuesta.setTiempo_traslado_minutos(Integer.parseInt(request.getParameter("cboMinutosTr")));
                socio_encuesta.setSolicitud_traslado_centro(Integer.parseInt(request.getParameter("optTraslado")));
                String verificacion_traslado = (String.valueOf(request.getParameter("cboTraslado")));
                if (verificacion_traslado.equals("null")) {
                    socio_encuesta.setNumero_solicitud(0);
                } else {
                    socio_encuesta.setNumero_solicitud(Integer.parseInt(request.getParameter("cboTraslado")));
                }
                String otorgado = String.valueOf(request.getParameter("optOtorgado"));
                if (!otorgado.equalsIgnoreCase("null")) {
                    socio_encuesta.setOtorgamiento_traslado_centro(Integer.parseInt(request.getParameter("optOtorgado")));
                }
                String verificacion_otorgamiento = (String.valueOf(request.getParameter("cboTrasladoCon")));
                if (verificacion_otorgamiento.equals("null")) {
                    socio_encuesta.setNumero_otorgamiento(0);
                } else {
                    socio_encuesta.setNumero_otorgamiento(Integer.parseInt(request.getParameter("cboTrasladoCon")));
                }
                socio_encuesta.setPrestamo_marzo(Integer.parseInt(request.getParameter("optPrMarzo")));
                socio_encuesta.setServicio_dental(Integer.parseInt(request.getParameter("optSerDental")));
                if (socio_encuesta.getServicio_dental() == 0) {
                    socio_encuesta.setOtro_servicio_dental(Integer.parseInt(request.getParameter("optOtroServicio")));
                }
                socio_encuesta.setBono_nps(Integer.parseInt(request.getParameter("optBonoNPS")));
                socio_encuesta.setCriterios_bono_nps(Integer.parseInt(request.getParameter("optCriteriosNPS")));
                socio_encuesta.setCriterios_bono_produccion(Integer.parseInt(request.getParameter("optBonoRenta")));
                socio_encuesta.setTiempo_acreditacion(Integer.parseInt(request.getParameter("optAcreditacion")));
                if (socio_encuesta.getTiempo_acreditacion() == 1) {
                    socio_encuesta.setEstres_acreditacion(Integer.parseInt(request.getParameter("optEstresAcreditacion")));
                    socio_encuesta.setProblema_funciones_acreditacion(Integer.parseInt(request.getParameter("optDesempeñoAcreditacion")));

                }
                socio_encuesta.setSituacion_catastrofica(Integer.parseInt(request.getParameter("optApoyo")));
                socio_encuesta.setRetiro_voluntario(Integer.parseInt(request.getParameter("optIndemnizacion")));
                socio_encuesta.setSalida_social(Integer.parseInt(request.getParameter("optRetiro")));
                socio_encuesta.setSatisfaccion_empresa(Integer.parseInt(request.getParameter("cboSatisfaccionEmpresa")));
                socio_encuesta.setFiesta(Integer.parseInt(request.getParameter("cboFiesta")));
                socio_encuesta.setValoracion_sindicato(Integer.parseInt(request.getParameter("cboSindicatoMejora")));
                socio_encuesta.setOtro_sindicato(Integer.parseInt(request.getParameter("optOtroSind")));
                socio_encuesta.setAntiguedad_sindicato_anio(Integer.parseInt(request.getParameter("cboAnioSin")));
                socio_encuesta.setAntiguedad_sindicato_mes(Integer.parseInt(request.getParameter("cboMesSin")));
                socio_encuesta.setContrato_colectivo(Integer.parseInt(request.getParameter("optPartCont")));
                socio_encuesta.setConocimiento_contrato_colectivo(Integer.parseInt(request.getParameter("optConCont")));
                socio_encuesta.setEstatutos_sindicato(Integer.parseInt(request.getParameter("optEstCont")));

                int cantFilas = dao.registrarEncuesta(socio_encuesta);

                //Verificar la inserción y enviar mensajes.
                if (cantFilas > 0) {
                    msg = "Encuesta ingresada exitosamente";
                } else {
                    msg = "Error en el ingreso de la encuesta";
                }

                request.setAttribute("msg", msg);

            } else {
                msg = "Usted ya contestó una encuesta; puede modificarla o eliminarla para volver a contestarla";
                request.setAttribute("msg", msg);
            }

            //Se retorna el mensaje de vuelta al jsp.
            request.getRequestDispatcher("encuesta.do").forward(request, response);
        } else if (userPath.equals("/modificar.do")) {

            String rut = String.valueOf(request.getParameter("rut"));
            boolean confirmacion = false;

            if (dao.verificarEncuesta(rut)) {
                Busqueda_encuesta busqueda_encuesta = new Busqueda_encuesta();

                busqueda_encuesta = dao.Buscar_encuesta(rut);

                Encuesta_buscada encuesta_buscada = new Encuesta_buscada();

                encuesta_buscada.setRut(busqueda_encuesta.getRut());
                encuesta_buscada.setNombre(busqueda_encuesta.getNombre());
                encuesta_buscada.setSexo(busqueda_encuesta.getSexo());
                encuesta_buscada.setCentro_medico(busqueda_encuesta.getCentro_medico());
                if (busqueda_encuesta.getCambio_centro() == 1) {
                    encuesta_buscada.setCambio_centro("Sí");
                } else {
                    encuesta_buscada.setCambio_centro("No");
                }
                encuesta_buscada.setComuna(busqueda_encuesta.getComuna());
                encuesta_buscada.setFecha_nacimiento(busqueda_encuesta.getFecha_nacimiento());
                encuesta_buscada.setEducacion(busqueda_encuesta.getEducacion());
                if (busqueda_encuesta.getEstudio_actual() == 1) {
                    encuesta_buscada.setEstudio_actual("Sí");
                } else {
                    encuesta_buscada.setEstudio_actual("No");
                }
                encuesta_buscada.setCarrera_institucion(busqueda_encuesta.getCarrera_institucion());
                encuesta_buscada.setEstado_civil(busqueda_encuesta.getEstado_civil());
                encuesta_buscada.setPersonas_hogar(busqueda_encuesta.getPersonas_hogar());
                encuesta_buscada.setPersonas_ocupadas(busqueda_encuesta.getPersonas_ocupadas());
                encuesta_buscada.setPersonas_buscando(busqueda_encuesta.getPersonas_buscando());
                if (busqueda_encuesta.getPersonas_problema_salud() == 1) {
                    encuesta_buscada.setPersonas_problema_salud("Sí");
                } else {
                    encuesta_buscada.setPersonas_problema_salud("No");
                }
                encuesta_buscada.setPersonas_problema_salud_numero(busqueda_encuesta.getPersonas_problema_salud_numero());
                encuesta_buscada.setPersonas_carga(busqueda_encuesta.getPersonas_carga());
                if (busqueda_encuesta.getProveedor_principal() == 1) {
                    encuesta_buscada.setProveedor_principal("Sí");
                } else {
                    encuesta_buscada.setProveedor_principal("No");
                }
                encuesta_buscada.setVivienda(busqueda_encuesta.getVivienda());
                encuesta_buscada.setCargo_trabajo(busqueda_encuesta.getCargo_trabajo());
                if (busqueda_encuesta.getPolifuncionalidad() == 1) {
                    encuesta_buscada.setPolifuncionalidad("Sí");
                } else {
                    encuesta_buscada.setPolifuncionalidad("No");
                }
                encuesta_buscada.setArea_funciones(busqueda_encuesta.getArea_funciones());
                encuesta_buscada.setAnio_antiguedad(busqueda_encuesta.getAnio_antiguedad());
                encuesta_buscada.setMes_antiguedad(busqueda_encuesta.getMes_antiguedad());
                encuesta_buscada.setHoras_jornada(busqueda_encuesta.getHoras_jornada());
                if (busqueda_encuesta.getHoras_extra_habiles() == 1) {
                    encuesta_buscada.setHoras_extra_habiles("Sí");
                } else {
                    encuesta_buscada.setHoras_extra_habiles("No");
                }
                if (busqueda_encuesta.getHoras_extra_sabado() == 1) {
                    encuesta_buscada.setHoras_extra_sabado("Sí");
                } else {
                    encuesta_buscada.setHoras_extra_sabado("No");
                }
                if (busqueda_encuesta.getHoras_extra_domingo() == 1) {
                    encuesta_buscada.setHoras_extra_domingo("Sí");
                } else {
                    encuesta_buscada.setHoras_extra_domingo("No");
                }
                encuesta_buscada.setTurnos(busqueda_encuesta.getTurnos());
                encuesta_buscada.setTiempo_traslado_horas(busqueda_encuesta.getTiempo_traslado_horas());
                encuesta_buscada.setTiempo_traslado_minutos(busqueda_encuesta.getTiempo_traslado_minutos());
                if (busqueda_encuesta.getSolicitud_traslado_centro() == 1) {
                    encuesta_buscada.setSolicitud_traslado_centro("Sí");
                } else {
                    encuesta_buscada.setSolicitud_traslado_centro("No");
                }
                encuesta_buscada.setNumero_solicitud(busqueda_encuesta.getNumero_solicitud());
                if (busqueda_encuesta.getOtorgamiento_traslado_centro() == 1) {
                    encuesta_buscada.setOtorgamiento_traslado_centro("Sí");
                } else {
                    encuesta_buscada.setOtorgamiento_traslado_centro("No");
                }
                encuesta_buscada.setNumero_otorgamiento(busqueda_encuesta.getNumero_otorgamiento());
                if (busqueda_encuesta.getPrestamo_marzo() == 1) {
                    encuesta_buscada.setPrestamo_marzo("Sí");
                } else {
                    encuesta_buscada.setPrestamo_marzo("No");
                }
                if (busqueda_encuesta.getServicio_dental() == 1) {
                    encuesta_buscada.setServicio_dental("Sí");
                } else {
                    encuesta_buscada.setServicio_dental("No");
                }
                if (busqueda_encuesta.getOtro_servicio_dental() == 1) {
                    encuesta_buscada.setOtro_servicio_dental("Sí");
                } else {
                    encuesta_buscada.setOtro_servicio_dental("No");
                }
                if (busqueda_encuesta.getBono_nps() == 1) {
                    encuesta_buscada.setBono_nps("Sí");
                } else {
                    encuesta_buscada.setBono_nps("No");
                }
                if (busqueda_encuesta.getCriterios_bono_nps() == 1) {
                    encuesta_buscada.setCriterios_bono_nps("Sí");
                } else {
                    encuesta_buscada.setCriterios_bono_nps("No");
                }
                if (busqueda_encuesta.getCriterios_bono_produccion() == 1) {
                    encuesta_buscada.setCriterios_bono_produccion("Sí");
                } else {
                    encuesta_buscada.setCriterios_bono_produccion("No");
                }
                if (busqueda_encuesta.getTiempo_acreditacion() == 1) {
                    encuesta_buscada.setTiempo_acreditacion("Sí");
                } else {
                    encuesta_buscada.setTiempo_acreditacion("No");
                }
                if (busqueda_encuesta.getEstres_acreditacion() == 1) {
                    encuesta_buscada.setEstres_acreditacion("Sí");
                } else if (busqueda_encuesta.getEstres_acreditacion() == 0) {
                    encuesta_buscada.setEstres_acreditacion("No");
                } else {
                    encuesta_buscada.setEstres_acreditacion("No aplica");
                }
                if (busqueda_encuesta.getProblema_funciones_acreditacion() == 1) {
                    encuesta_buscada.setProblema_funciones_acreditacion("Sí");
                } else if (busqueda_encuesta.getProblema_funciones_acreditacion() == 0) {
                    encuesta_buscada.setProblema_funciones_acreditacion("No");
                } else {
                    encuesta_buscada.setProblema_funciones_acreditacion("No aplica");
                }
                if (busqueda_encuesta.getSituacion_catastrofica() == 1) {
                    encuesta_buscada.setSituacion_catastrofica("Sí");
                } else if (busqueda_encuesta.getSituacion_catastrofica() == 0) {
                    encuesta_buscada.setSituacion_catastrofica("No");
                } else {
                    encuesta_buscada.setSituacion_catastrofica("No aplica");
                }
                if (busqueda_encuesta.getRetiro_voluntario() == 1) {
                    encuesta_buscada.setRetiro_voluntario("Sí");
                } else {
                    encuesta_buscada.setRetiro_voluntario("No");
                }
                if (busqueda_encuesta.getSalida_social() == 1) {
                    encuesta_buscada.setSalida_social("Sí");
                } else {
                    encuesta_buscada.setSalida_social("No");
                }
                switch (busqueda_encuesta.getSatisfaccion_empresa()) {
                    case 1:
                        encuesta_buscada.setSatisfaccion_empresa("MUY DE ACUERDO");
                        break;
                    case 2:
                        encuesta_buscada.setSatisfaccion_empresa("DE ACUERDO");
                        break;
                    case 3:
                        encuesta_buscada.setSatisfaccion_empresa("NI DE ACUERDO NI EN DESACUERDO");
                        break;
                    case 4:
                        encuesta_buscada.setSatisfaccion_empresa("EN DESACUERDO");
                        break;
                    default:
                        encuesta_buscada.setSatisfaccion_empresa("MUY EN DESACUERDO");
                        break;
                }
                switch (busqueda_encuesta.getFiesta()) {
                    case 1:
                        encuesta_buscada.setFiesta("MUY DE ACUERDO");
                        break;
                    case 2:
                        encuesta_buscada.setFiesta("DE ACUERDO");
                        break;
                    case 3:
                        encuesta_buscada.setFiesta("NI DE ACUERDO NI EN DESACUERDO");
                        break;
                    case 4:
                        encuesta_buscada.setFiesta("EN DESACUERDO");
                        break;
                    default:
                        encuesta_buscada.setFiesta("MUY EN DESACUERDO");
                        break;
                }
                switch (busqueda_encuesta.getValoracion_sindicato()) {
                    case 1:
                        encuesta_buscada.setValoracion_sindicato("MUY DE ACUERDO");
                        break;
                    case 2:
                        encuesta_buscada.setValoracion_sindicato("DE ACUERDO");
                        break;
                    case 3:
                        encuesta_buscada.setValoracion_sindicato("NI DE ACUERDO NI EN DESACUERDO");
                        break;
                    case 4:
                        encuesta_buscada.setValoracion_sindicato("EN DESACUERDO");
                        break;
                    default:
                        encuesta_buscada.setValoracion_sindicato("MUY EN DESACUERDO");
                        break;
                }
                if (busqueda_encuesta.getOtro_sindicato() == 1) {
                    encuesta_buscada.setOtro_sindicato("Sí");
                } else {
                    encuesta_buscada.setOtro_sindicato("No");
                }
                encuesta_buscada.setAntiguedad_sindicato_anio(busqueda_encuesta.getAntiguedad_sindicato_anio());
                encuesta_buscada.setAntiguedad_sindicato_mes(busqueda_encuesta.getAntiguedad_sindicato_mes());
                if (busqueda_encuesta.getContrato_colectivo() == 1) {
                    encuesta_buscada.setContrato_colectivo("Sí");
                } else {
                    encuesta_buscada.setContrato_colectivo("No");
                }
                if (busqueda_encuesta.getConocimiento_contrato_colectivo() == 1) {
                    encuesta_buscada.setConocimiento_contrato_colectivo("Sí");
                } else {
                    encuesta_buscada.setConocimiento_contrato_colectivo("No");
                }
                if (busqueda_encuesta.getEstatutos_sindicato() == 1) {
                    encuesta_buscada.setEstatutos_sindicato("Sí");
                } else {
                    encuesta_buscada.setEstatutos_sindicato("No");
                }

                request.setAttribute("encuesta_buscada", encuesta_buscada);

            } else {
                confirmacion = true;
                msg = "Usted aún no ha contestado una encuesta; debe contestarla para acceder a la sección 'Modificar o eliminar encuesta'";
                request.setAttribute("msg", msg);
            }

            if (confirmacion) {

                request.getRequestDispatcher("encuesta.do").forward(request, response);

            } else {

                //Se recuperan los registros de los comboBox.
                listaCentroMedico = dao.listarCentroMedico();
                listaComuna = dao.listarComuna();
                listaEducacion = dao.listarEducacion();
                listaEstadoCivil = dao.listarEstadoCivil();
                listaVivienda = dao.listarVivienda();
                listaCargo = dao.listarCargo();
                listaFuncion = dao.listarFuncion();

                //Se envía información a jsp de salida.
                request.setAttribute("listaCentroMedico", listaCentroMedico);
                request.setAttribute("listaComuna", listaComuna);
                request.setAttribute("listaEducacion", listaEducacion);
                request.setAttribute("listaEstadoCivil", listaEstadoCivil);
                request.setAttribute("listaVivienda", listaVivienda);
                request.setAttribute("listaCargo", listaCargo);
                request.setAttribute("listaFuncion", listaFuncion);
                request.getRequestDispatcher("modificarEncuesta.jsp").forward(request, response);

            }

        } else if (userPath.equals("/manipular.do")) {

            String rut = String.valueOf(request.getParameter("rut"));
            boolean confirmacion = false;

            if (dao.verificarEncuesta(rut)) {

                String operacion = String.valueOf(request.getParameter("action"));

                if (operacion.equals("modificar")) {

                    socio_encuesta = new Socio_encuesta();

                    socio_encuesta.setRut(rut);
                    socio_encuesta.setNombre(request.getParameter("txtNombre"));
                    socio_encuesta.setSexo(request.getParameter("optSexo"));
                    socio_encuesta.setCentro_medico(Integer.parseInt(request.getParameter("cboCentro")));
                    socio_encuesta.setCambio_centro(Integer.parseInt(request.getParameter("optCentroMedico")));
                    socio_encuesta.setCut(Integer.parseInt(request.getParameter("cboComuna")));
                    socio_encuesta.setFecha_nacimiento(request.getParameter("txtFecha_Nacimiento"));
                    socio_encuesta.setEducacion(Integer.parseInt(request.getParameter("cboEducacion")));
                    socio_encuesta.setEstudio_actual(Integer.parseInt(request.getParameter("optEducacionActual")));
                    String carrera = String.valueOf(request.getParameter("txtEstudio"));
                    if (!carrera.equalsIgnoreCase("null")) {
                        socio_encuesta.setCarrera_institucion(carrera);
                    } else {
                        socio_encuesta.setCarrera_institucion("NO APLICA");
                    }
                    socio_encuesta.setEstado_civil(Integer.parseInt(request.getParameter("cboEstadoCivil")));
                    socio_encuesta.setPersonas_hogar(Integer.parseInt(request.getParameter("cboMiembrosHogar")));
                    socio_encuesta.setPersonas_ocupadas(Integer.parseInt(request.getParameter("cboMiembrosTrabajan")));
                    socio_encuesta.setPersonas_buscando(Integer.parseInt(request.getParameter("cboMiembrosBuscan")));
                    socio_encuesta.setPersonas_problema_salud(Integer.parseInt(request.getParameter("optEnfermedad")));
                    String verificacion_problemas = (String.valueOf(request.getParameter("cboNumeroEnfermos")));
                    if (verificacion_problemas.equals("null")) {
                        socio_encuesta.setPersonas_problema_salud_numero(0);
                    } else {
                        socio_encuesta.setPersonas_problema_salud_numero(Integer.parseInt(request.getParameter("cboNumeroEnfermos")));
                    }
                    socio_encuesta.setPersonas_carga(Integer.parseInt(request.getParameter("cboCargas")));
                    socio_encuesta.setProveedor_principal(Integer.parseInt(request.getParameter("optProvPrin")));
                    socio_encuesta.setVivienda(Integer.parseInt(request.getParameter("cboVivienda")));
                    socio_encuesta.setCargo_trabajo(Integer.parseInt(request.getParameter("cboCargo")));
                    socio_encuesta.setPolifuncionalidad(Integer.parseInt(request.getParameter("optPolifuncionalidad")));
                    socio_encuesta.setArea_funciones(Integer.parseInt(request.getParameter("cboArea")));
                    socio_encuesta.setAnio_antiguedad(Integer.parseInt(request.getParameter("cboAnioAnt")));
                    socio_encuesta.setMes_antiguedad(Integer.parseInt(request.getParameter("cboMesAnt")));
                    socio_encuesta.setHoras_jornada(Integer.parseInt(request.getParameter("cboJornada")));
                    socio_encuesta.setHoras_extra_habiles(Integer.parseInt(request.getParameter("optHorasHabiles")));
                    socio_encuesta.setHoras_extra_sabado(Integer.parseInt(request.getParameter("optHorasSabado")));
                    socio_encuesta.setHoras_extra_domingo(Integer.parseInt(request.getParameter("optHorasDomingo")));
                    socio_encuesta.setTurnos(Integer.parseInt(request.getParameter("cboLlamado")));
                    socio_encuesta.setTiempo_traslado_horas(Integer.parseInt(request.getParameter("cboHorasTr")));
                    socio_encuesta.setTiempo_traslado_minutos(Integer.parseInt(request.getParameter("cboMinutosTr")));
                    socio_encuesta.setSolicitud_traslado_centro(Integer.parseInt(request.getParameter("optTraslado")));
                    String verificacion_traslado = (String.valueOf(request.getParameter("cboTraslado")));
                    if (verificacion_traslado.equals("null")) {
                        socio_encuesta.setNumero_solicitud(0);
                    } else {
                        socio_encuesta.setNumero_solicitud(Integer.parseInt(request.getParameter("cboTraslado")));
                    }
                    String otorgado = String.valueOf(request.getParameter("optOtorgado"));
                    if (!otorgado.equalsIgnoreCase("null")) {
                        socio_encuesta.setOtorgamiento_traslado_centro(Integer.parseInt(request.getParameter("optOtorgado")));
                    }
                    String verificacion_otorgamiento = (String.valueOf(request.getParameter("cboTrasladoCon")));
                    if (verificacion_otorgamiento.equals("null")) {
                        socio_encuesta.setNumero_otorgamiento(0);
                    } else {
                        socio_encuesta.setNumero_otorgamiento(Integer.parseInt(request.getParameter("cboTrasladoCon")));
                    }
                    socio_encuesta.setPrestamo_marzo(Integer.parseInt(request.getParameter("optPrMarzo")));
                    socio_encuesta.setServicio_dental(Integer.parseInt(request.getParameter("optSerDental")));
                    if (socio_encuesta.getServicio_dental() == 0) {
                        socio_encuesta.setOtro_servicio_dental(Integer.parseInt(request.getParameter("optOtroServicio")));
                    }
                    socio_encuesta.setBono_nps(Integer.parseInt(request.getParameter("optBonoNPS")));
                    socio_encuesta.setCriterios_bono_nps(Integer.parseInt(request.getParameter("optCriteriosNPS")));
                    socio_encuesta.setCriterios_bono_produccion(Integer.parseInt(request.getParameter("optBonoRenta")));
                    socio_encuesta.setTiempo_acreditacion(Integer.parseInt(request.getParameter("optAcreditacion")));
                    if (socio_encuesta.getTiempo_acreditacion() == 1) {
                        socio_encuesta.setEstres_acreditacion(Integer.parseInt(request.getParameter("optEstresAcreditacion")));
                        socio_encuesta.setProblema_funciones_acreditacion(Integer.parseInt(request.getParameter("optDesempeñoAcreditacion")));

                    }
                    socio_encuesta.setSituacion_catastrofica(Integer.parseInt(request.getParameter("optApoyo")));
                    socio_encuesta.setRetiro_voluntario(Integer.parseInt(request.getParameter("optIndemnizacion")));
                    socio_encuesta.setSalida_social(Integer.parseInt(request.getParameter("optRetiro")));
                    socio_encuesta.setSatisfaccion_empresa(Integer.parseInt(request.getParameter("cboSatisfaccionEmpresa")));
                    socio_encuesta.setFiesta(Integer.parseInt(request.getParameter("cboFiesta")));
                    socio_encuesta.setValoracion_sindicato(Integer.parseInt(request.getParameter("cboSindicatoMejora")));
                    socio_encuesta.setOtro_sindicato(Integer.parseInt(request.getParameter("optOtroSind")));
                    socio_encuesta.setAntiguedad_sindicato_anio(Integer.parseInt(request.getParameter("cboAnioSin")));
                    socio_encuesta.setAntiguedad_sindicato_mes(Integer.parseInt(request.getParameter("cboMesSin")));
                    socio_encuesta.setContrato_colectivo(Integer.parseInt(request.getParameter("optPartCont")));
                    socio_encuesta.setConocimiento_contrato_colectivo(Integer.parseInt(request.getParameter("optConCont")));
                    socio_encuesta.setEstatutos_sindicato(Integer.parseInt(request.getParameter("optEstCont")));

                    int cantFilas = dao.modificarEncuesta(socio_encuesta, rut);
                    //Verificar la inserción y enviar mensajes.
                    if (cantFilas > 0) {
                        msg = "Encuesta modificada exitosamente";
                    } else {
                        msg = "Error en la modificación de la encuesta";
                    }
                    request.setAttribute("msg", msg);

                } else if (operacion.equals("eliminar")) {

                    confirmacion = dao.eliminarEncuesta(rut);

                    //Verificar la inserción y enviar mensajes.
                    if (confirmacion) {
                        msg = "Encuesta eliminada exitosamente";
                    } else {
                        msg = "Error en la eliminación de la encuesta";
                    }
                    request.setAttribute("msg", msg);
                }

            } else {
                msg = "Usted aún no ha contestado una encuesta; debe contestarla para modificarla o eliminarla";
                request.setAttribute("msg", msg);
            }

            if (confirmacion) {
                request.getRequestDispatcher("encuesta.do").forward(request, response);
            } else {
                //Se retorna el mensaje de vuelta al jsp.
                request.getRequestDispatcher("modificar.do").forward(request, response);
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
