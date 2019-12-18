/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Horacio
 */
public class DaoJuegoEstudiante extends Conectar {

    public int asignarNumero(int numero_equipo, int id_sesion) {
        int cantFilas = 0;
        try {
            //Recuperar una conexión.
            Connection con = this.getConexion();
            //Se genera sentecia select
            String strSQL = "INSERT INTO EQUIPO VALUES (" + numero_equipo + "," + id_sesion + ");";
            //Se prepara la consulta.
            PreparedStatement ps = con.prepareStatement(strSQL);

            cantFilas = ps.executeUpdate();
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DaoJuegoEstudiante.class.getName()).log(Level.SEVERE, "Problema registro del Driver", ex);
        } catch (SQLException ex) {
            Logger.getLogger(DaoJuegoEstudiante.class.getName()).log(Level.SEVERE, "Error SQL.", ex);
        }
        return cantFilas;
    }

    public void comienzoJuego(int id_sesion) {
        try {
            //Recuperar una conexión.
            Connection con = this.getConexion();
            //Se genera sentecia select
            String strSQL = "INSERT INTO JUGAR VALUES (NULL, 0, " + id_sesion + ");";
            //Se prepara la consulta.
            PreparedStatement ps = con.prepareStatement(strSQL);
            ps.executeUpdate();
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DaoJuegoEstudiante.class.getName()).log(Level.SEVERE, "Problema registro del Driver", ex);
        } catch (SQLException ex) {
            Logger.getLogger(DaoJuegoEstudiante.class.getName()).log(Level.SEVERE, "Error SQL.", ex);
        }
    }

    public int idDesafio(int id_sesion) {
        int id_desafio = 0;
        try {
            //Recuperar una conexión.
            Connection con = this.getConexion();
            //Se genera sentecia select
            String strSQL = "SELECT ID_DESAFIO FROM DESAFIO WHERE ID_SESION = " + id_sesion + " AND ESTADO_DESAFIO = 'ABIERTO';";
            //Se prepara la consulta.
            PreparedStatement ps = con.prepareStatement(strSQL);
            //ejecutar la consulta.
            ResultSet res = ps.executeQuery();
            //Se recorre el ResultSet.
            while (res.next()) {
                id_desafio = (Integer.parseInt(res.getString("ID_DESAFIO")));
            }
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DaoJuegoEstudiante.class.getName())
                    .log(Level.SEVERE, "Error en registro del Driver.", ex);
        } catch (SQLException ex) {
            Logger.getLogger(DaoJuegoEstudiante.class.getName())
                    .log(Level.SEVERE, "Error en SQL.", ex);
        }
        return id_desafio;
    }

    public int obtenerNumeroGrupos(int id_sesion) {
        int numero_grupos = 0;
        try {
            //Recuperar una conexión.
            Connection con = this.getConexion();
            //Se genera sentecia select
            String strSQL = "SELECT COUNT(*) AS NUMERO FROM EQUIPO WHERE ID_SESION = " + id_sesion + ";";
            //Se prepara la consulta.
            PreparedStatement ps = con.prepareStatement(strSQL);
            //ejecutar la consulta.
            ResultSet res = ps.executeQuery();
            //Se recorre el ResultSet.
            while (res.next()) {
                numero_grupos = (Integer.parseInt(res.getString("NUMERO")));
            }
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DaoJuegoEstudiante.class.getName())
                    .log(Level.SEVERE, "Error en registro del Driver.", ex);
        } catch (SQLException ex) {
            Logger.getLogger(DaoJuegoEstudiante.class.getName())
                    .log(Level.SEVERE, "Error en SQL.", ex);
        }
        return numero_grupos;
    }

    public String obtenerEstadoSesion(int id_sesion) {
        String estado = "";
        try {
            //Recuperar una conexión.
            Connection con = this.getConexion();
            //Se genera sentecia select
            String strSQL = "SELECT ESTADO FROM SESION WHERE ID_SESION = " + id_sesion + ";";
            //Se prepara la consulta.
            PreparedStatement ps = con.prepareStatement(strSQL);
            //ejecutar la consulta.
            ResultSet res = ps.executeQuery();
            //Se recorre el ResultSet.
            while (res.next()) {
                estado = res.getString("ESTADO");
            }
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DaoJuegoEstudiante.class.getName())
                    .log(Level.SEVERE, "Error en registro del Driver.", ex);
        } catch (SQLException ex) {
            Logger.getLogger(DaoJuegoEstudiante.class.getName())
                    .log(Level.SEVERE, "Error en SQL.", ex);
        }
        return estado;
    }

    public boolean verificarNivel(int id_sesion, String estado) {
        boolean existencia = false;
        try {
            //Recuperar una conexión.
            Connection con = this.getConexion();
            //Se genera sentecia select
            String strSQL = "SELECT MAX(NIVEL) FROM NIVEL WHERE ID_SESION = " + id_sesion + " AND ESTADO = '" + estado + "'";
            //Se prepara la consulta.
            PreparedStatement ps = con.prepareStatement(strSQL);
            //ejecutar la consulta.
            ResultSet res = ps.executeQuery();
            //Se recorre el ResultSet.
            while (res.next()) {
                existencia = true;
            }
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DaoRegistro.class.getName())
                    .log(Level.SEVERE, "Error en registro del Driver.", ex);
        } catch (SQLException ex) {
            Logger.getLogger(DaoRegistro.class.getName())
                    .log(Level.SEVERE, "Error en SQL.", ex);
        }
        return existencia;
    }

    public boolean verificarNivelPrevio(int id_sesion, String estado) {
        boolean existencia = false;
        try {
            //Recuperar una conexión.
            Connection con = this.getConexion();
            //Se genera sentecia select
            String strSQL = "SELECT * FROM NIVEL WHERE ID_SESION = " + id_sesion + " AND ESTADO = '" + estado + "'";
            //Se prepara la consulta.
            PreparedStatement ps = con.prepareStatement(strSQL);
            //ejecutar la consulta.
            ResultSet res = ps.executeQuery();
            //Se recorre el ResultSet.
            while (res.next()) {
                existencia = true;
            }
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DaoRegistro.class.getName())
                    .log(Level.SEVERE, "Error en registro del Driver.", ex);
        } catch (SQLException ex) {
            Logger.getLogger(DaoRegistro.class.getName())
                    .log(Level.SEVERE, "Error en SQL.", ex);
        }
        return existencia;
    }

    public int insertarNivel(String estado, int id_sesion) {
        int cantFilas = 0;
        try {
            //Recuperar una conexión.
            Connection con = this.getConexion();
            //Se genera sentecia select
            String strSQL = "INSERT INTO NIVEL VALUES (NULL, '" + estado + "', 1, " + id_sesion + ");";
            //Se prepara la consulta.
            PreparedStatement ps = con.prepareStatement(strSQL);

            cantFilas = ps.executeUpdate();
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DaoJuegoEstudiante.class.getName()).log(Level.SEVERE, "Problema registro del Driver", ex);
        } catch (SQLException ex) {
            Logger.getLogger(DaoJuegoEstudiante.class.getName()).log(Level.SEVERE, "Error SQL.", ex);
        }
        return cantFilas;
    }

    public int obtenerNivel(int id_sesion, String estado) {
        int nivel = 0;
        try {
            //Recuperar una conexión.
            Connection con = this.getConexion();
            //Se genera sentecia select
            String strSQL = "SELECT NIVEL FROM NIVEL WHERE ID_SESION = " + id_sesion + " AND ESTADO = '" + estado + "';";
            //Se prepara la consulta.
            PreparedStatement ps = con.prepareStatement(strSQL);
            //ejecutar la consulta.
            ResultSet res = ps.executeQuery();
            //Se recorre el ResultSet.
            while (res.next()) {
                nivel = Integer.parseInt(res.getString("NIVEL"));
            }
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DaoJuegoEstudiante.class.getName())
                    .log(Level.SEVERE, "Error en registro del Driver.", ex);
        } catch (SQLException ex) {
            Logger.getLogger(DaoJuegoEstudiante.class.getName())
                    .log(Level.SEVERE, "Error en SQL.", ex);
        }
        return nivel;
    }

    public int cerrarDesafio(int id_desafio) {
        int cantFilas = 0;

        try {
            //Recuperar una conexión.
            Connection con = this.getConexion();
            //Se genera sentecia select
            String strSQL = "UPDATE DESAFIO SET ESTADO_DESAFIO = 'CERRADO' WHERE ID_DESAFIO = " + id_desafio + ";";
            //Se prepara la consulta.
            PreparedStatement ps = con.prepareStatement(strSQL);
            cantFilas = ps.executeUpdate();
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DaoJuegoEstudiante.class.getName()).log(Level.SEVERE, "Problema registro del Driver", ex);
        } catch (SQLException ex) {
            Logger.getLogger(DaoJuegoEstudiante.class.getName()).log(Level.SEVERE, "Error SQL.", ex);
        }
        return cantFilas;
    }
    
    public int resetearDados(int id_sesion) {
        int cantFilas = 0;

        try {
            //Recuperar una conexión.
            Connection con = this.getConexion();
            //Se genera sentecia select
            String strSQL = "UPDATE DADOS SET VALOR = 0 WHERE ID_SESION = " + id_sesion + ";";
            //Se prepara la consulta.
            PreparedStatement ps = con.prepareStatement(strSQL);
            cantFilas = ps.executeUpdate();
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DaoJuegoEstudiante.class.getName()).log(Level.SEVERE, "Problema registro del Driver", ex);
        } catch (SQLException ex) {
            Logger.getLogger(DaoJuegoEstudiante.class.getName()).log(Level.SEVERE, "Error SQL.", ex);
        }
        return cantFilas;
    }
    
    public int actualizarSesion(String estado_sesion, int id_sesion) {
        int cantFilas = 0;

        try {
            //Recuperar una conexión.
            Connection con = this.getConexion();
            //Se genera sentecia select
            String strSQL = "UPDATE SESION SET ESTADO = '" + estado_sesion + "' WHERE ID_SESION = " + id_sesion + ";";
            //Se prepara la consulta.
            PreparedStatement ps = con.prepareStatement(strSQL);
            cantFilas = ps.executeUpdate();
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DaoJuegoEstudiante.class.getName()).log(Level.SEVERE, "Problema registro del Driver", ex);
        } catch (SQLException ex) {
            Logger.getLogger(DaoJuegoEstudiante.class.getName()).log(Level.SEVERE, "Error SQL.", ex);
        }
        return cantFilas;
    }
//    
//    public ArrayList<Comuna> listarComuna() {
//        ArrayList<Comuna> lstComuna = new ArrayList();
//        Comuna comuna;
//        try {
//            //Recuperar una conexión.
//            Connection con = this.getConexion();
//            //Se genera sentecia select
//            String strSQL = "SELECT * FROM COMUNA ORDER BY Nombre_Comuna";
//            //Se prepara la consulta.
//            PreparedStatement ps = con.prepareStatement(strSQL);
//            //ejecutar la consulta.
//            ResultSet res = ps.executeQuery();
//            //Se recorre el ResultSet.
//            while (res.next()) {
//                comuna = new Comuna();
//                comuna.setCut(Integer.parseInt(res.getString("CUT")));
//                comuna.setDescripcion(res.getString("Nombre_Comuna"));
//                //Se agrega el INGRESO a la lista.
//                lstComuna.add(comuna);
//            }
//            con.close();
//        } catch (ClassNotFoundException ex) {
//            Logger.getLogger(DaoJuegoEstudiante.class.getName())
//                    .log(Level.SEVERE, "Error en registro del Driver.", ex);
//        } catch (SQLException ex) {
//            Logger.getLogger(DaoJuegoEstudiante.class.getName())
//                    .log(Level.SEVERE, "Error en SQL.", ex);
//        }
//        return lstComuna;
//    }
//
//    public ArrayList<Educacion_socio> listarEducacion() {
//        ArrayList<Educacion_socio> lstEducacion = new ArrayList();
//        Educacion_socio educacion_socio;
//        try {
//            //Recuperar una conexión.
//            Connection con = this.getConexion();
//            //Se genera sentecia select
//            String strSQL = "SELECT * FROM NIVEL_EDUCACIONAL";
//            //Se prepara la consulta.
//            PreparedStatement ps = con.prepareStatement(strSQL);
//            //ejecutar la consulta.
//            ResultSet res = ps.executeQuery();
//            //Se recorre el ResultSet.
//            while (res.next()) {
//                educacion_socio = new Educacion_socio();
//                educacion_socio.setEducacion(Integer.parseInt(res.getString("EDUCACION")));
//                educacion_socio.setDescripcion(res.getString("DESCRIPCION"));
//                //Se agrega el INGRESO a la lista.
//                lstEducacion.add(educacion_socio);
//            }
//            con.close();
//        } catch (ClassNotFoundException ex) {
//            Logger.getLogger(DaoJuegoEstudiante.class.getName())
//                    .log(Level.SEVERE, "Error en registro del Driver.", ex);
//        } catch (SQLException ex) {
//            Logger.getLogger(DaoJuegoEstudiante.class.getName())
//                    .log(Level.SEVERE, "Error en SQL.", ex);
//        }
//        return lstEducacion;
//    }
//
//    public ArrayList<Estado_civil_socio> listarEstadoCivil() {
//        ArrayList<Estado_civil_socio> lstEstadoCivil = new ArrayList();
//        Estado_civil_socio estado_civil_socio;
//        try {
//            //Recuperar una conexión.
//            Connection con = this.getConexion();
//            //Se genera sentecia select
//            String strSQL = "SELECT * FROM ESTADO_CIVIL";
//            //Se prepara la consulta.
//            PreparedStatement ps = con.prepareStatement(strSQL);
//            //ejecutar la consulta.
//            ResultSet res = ps.executeQuery();
//            //Se recorre el ResultSet.
//            while (res.next()) {
//                estado_civil_socio = new Estado_civil_socio();
//                estado_civil_socio.setEstado_civil(Integer.parseInt(res.getString("ESTADO_CIVIL")));
//                estado_civil_socio.setDescripcion(res.getString("DESCRIPCION"));
//                //Se agrega el INGRESO a la lista.
//                lstEstadoCivil.add(estado_civil_socio);
//            }
//            con.close();
//        } catch (ClassNotFoundException ex) {
//            Logger.getLogger(DaoJuegoEstudiante.class.getName())
//                    .log(Level.SEVERE, "Error en registro del Driver.", ex);
//        } catch (SQLException ex) {
//            Logger.getLogger(DaoJuegoEstudiante.class.getName())
//                    .log(Level.SEVERE, "Error en SQL.", ex);
//        }
//        return lstEstadoCivil;
//    } 
//
//    public ArrayList<Vivienda_socio> listarVivienda() {
//        ArrayList<Vivienda_socio> lstVivienda = new ArrayList();
//        Vivienda_socio vivienda_socio;
//        try {
//            //Recuperar una conexión.
//            Connection con = this.getConexion();
//            //Se genera sentecia select
//            String strSQL = "SELECT * FROM TIPO_VIVIENDA";
//            //Se prepara la consulta.
//            PreparedStatement ps = con.prepareStatement(strSQL);
//            //ejecutar la consulta.
//            ResultSet res = ps.executeQuery();
//            //Se recorre el ResultSet.
//            while (res.next()) {
//                vivienda_socio = new Vivienda_socio();
//                vivienda_socio.setVivienda(Integer.parseInt(res.getString("VIVIENDA")));
//                vivienda_socio.setDescripcion(res.getString("DESCRIPCION"));
//                //Se agrega el INGRESO a la lista.
//                lstVivienda.add(vivienda_socio);
//            }
//            con.close();
//        } catch (ClassNotFoundException ex) {
//            Logger.getLogger(DaoJuegoEstudiante.class.getName())
//                    .log(Level.SEVERE, "Error en registro del Driver.", ex);
//        } catch (SQLException ex) {
//            Logger.getLogger(DaoJuegoEstudiante.class.getName())
//                    .log(Level.SEVERE, "Error en SQL.", ex);
//        }
//        return lstVivienda;
//    }
//
//    public ArrayList<Tipo_cargo> listarCargo() {
//        ArrayList<Tipo_cargo> lstCargo = new ArrayList();
//        Tipo_cargo tipo_cargo;
//        try {
//            //Recuperar una conexión.
//            Connection con = this.getConexion();
//            //Se genera sentecia select
//            String strSQL = "SELECT * FROM TIPO_CARGO";
//            //Se prepara la consulta.
//            PreparedStatement ps = con.prepareStatement(strSQL);
//            //ejecutar la consulta.
//            ResultSet res = ps.executeQuery();
//            //Se recorre el ResultSet.
//            while (res.next()) {
//                tipo_cargo = new Tipo_cargo();
//                tipo_cargo.setCargo_trabajo(Integer.parseInt(res.getString("CARGO_TRABAJO")));
//                tipo_cargo.setDescripcion(res.getString("DESCRIPCION"));
//                //Se agrega el INGRESO a la lista.
//                lstCargo.add(tipo_cargo);
//            }
//            con.close();
//        } catch (ClassNotFoundException ex) {
//            Logger.getLogger(DaoJuegoEstudiante.class.getName())
//                    .log(Level.SEVERE, "Error en registro del Driver.", ex);
//        } catch (SQLException ex) {
//            Logger.getLogger(DaoJuegoEstudiante.class.getName())
//                    .log(Level.SEVERE, "Error en SQL.", ex);
//        }
//        return lstCargo;
//    }
//
//    public ArrayList<Area_funcion> listarFuncion() {
//        ArrayList<Area_funcion> lstFuncion = new ArrayList();
//        Area_funcion area_funcion;
//        try {
//            //Recuperar una conexión.
//            Connection con = this.getConexion();
//            //Se genera sentecia select
//            String strSQL = "SELECT * FROM AREA_FUNCION";
//            //Se prepara la consulta.
//            PreparedStatement ps = con.prepareStatement(strSQL);
//            //ejecutar la consulta.
//            ResultSet res = ps.executeQuery();
//            //Se recorre el ResultSet.
//            while (res.next()) {
//                area_funcion = new Area_funcion();
//                area_funcion.setArea_funciones(Integer.parseInt(res.getString("AREA_FUNCIONES")));
//                area_funcion.setDescripcion(res.getString("DESCRIPCION"));
//                //Se agrega el INGRESO a la lista.
//                lstFuncion.add(area_funcion);
//            }
//            con.close();
//        } catch (ClassNotFoundException ex) {
//            Logger.getLogger(DaoJuegoEstudiante.class.getName())
//                    .log(Level.SEVERE, "Error en registro del Driver.", ex);
//        } catch (SQLException ex) {
//            Logger.getLogger(DaoJuegoEstudiante.class.getName())
//                    .log(Level.SEVERE, "Error en SQL.", ex);
//        }
//        return lstFuncion;
//    }
//
//
//    public int registrarEncuesta(Socio_encuesta socio_encuesta) {
//        int cantFilas = 0;
//
//        try {
//            //Recuperar una conexión.
//            Connection con = this.getConexion();
//            //Se genera sentecia select
//            String strSQL = "INSERT INTO ENCUESTA VALUES(NEXT VALUE FOR ID_ENCUESTA_SEC,'" + socio_encuesta.getRut() + "'"
//                    + ",'"+ socio_encuesta.getNombre() +"','" + socio_encuesta.getSexo() + "',"
//                    + " "+ socio_encuesta.getCentro_medico() +", " + socio_encuesta.getCambio_centro() + ", "
//                    + " "+ socio_encuesta.getCut() +", '" + socio_encuesta.getFecha_nacimiento() + "'," + socio_encuesta.getEducacion() + ""
//                    + "," + socio_encuesta.getEstudio_actual() + ", '" + socio_encuesta.getCarrera_institucion() + ""
//                    + "'," + socio_encuesta.getEstado_civil() + ""
//                    + "," + socio_encuesta.getPersonas_hogar() + "," + socio_encuesta.getPersonas_ocupadas() + ""
//                    + "," + socio_encuesta.getPersonas_buscando() + "," + socio_encuesta.getPersonas_problema_salud() + ""
//                    + "," + socio_encuesta.getPersonas_problema_salud_numero() + "," + socio_encuesta.getPersonas_carga() + ""
//                    + "," + socio_encuesta.getProveedor_principal() + "," + socio_encuesta.getVivienda() + ""
//                    + "," + socio_encuesta.getCargo_trabajo() + "," + socio_encuesta.getPolifuncionalidad() + ""
//                    + "," + socio_encuesta.getArea_funciones() + "," + socio_encuesta.getAnio_antiguedad() + ""
//                    + "," + socio_encuesta.getMes_antiguedad() + "," + socio_encuesta.getHoras_jornada() + ""
//                    + "," + socio_encuesta.getHoras_extra_habiles() + "," + socio_encuesta.getHoras_extra_sabado() + ""
//                    + "," + socio_encuesta.getHoras_extra_domingo() + "," + socio_encuesta.getTurnos() + ""
//                    + "," + socio_encuesta.getTiempo_traslado_horas() + "," + socio_encuesta.getTiempo_traslado_minutos() + ""
//                    + "," + socio_encuesta.getSolicitud_traslado_centro() + "," + socio_encuesta.getNumero_solicitud() + ""
//                    + "," + socio_encuesta.getOtorgamiento_traslado_centro() + "," + socio_encuesta.getNumero_otorgamiento() + ""
//                    + "," + socio_encuesta.getPrestamo_marzo() + "," + socio_encuesta.getServicio_dental() + ""
//                    + "," + socio_encuesta.getOtro_servicio_dental() + "," + socio_encuesta.getBono_nps() + ""
//                    + "," + socio_encuesta.getCriterios_bono_nps() + "," + socio_encuesta.getCriterios_bono_produccion() + ""
//                    + "," + socio_encuesta.getTiempo_acreditacion() + "," + socio_encuesta.getEstres_acreditacion() + ""
//                    + "," + socio_encuesta.getProblema_funciones_acreditacion() + "," + socio_encuesta.getSituacion_catastrofica()+ ""
//                    + "," + socio_encuesta.getRetiro_voluntario() + ",'" + socio_encuesta.getSalida_social() + "',"
//                    + "" + socio_encuesta.getSatisfaccion_empresa() + "," + socio_encuesta.getFiesta() + ","
//                    + "" + socio_encuesta.getValoracion_sindicato() + "," + socio_encuesta.getOtro_sindicato()+ ","
//                    + "" + socio_encuesta.getAntiguedad_sindicato_anio() + "," + socio_encuesta.getAntiguedad_sindicato_mes() + ""
//                    + "," + socio_encuesta.getContrato_colectivo() + "," + socio_encuesta.getConocimiento_contrato_colectivo()+ ""
//                    + ", " + socio_encuesta.getEstatutos_sindicato() + ")";
//            //Se prepara la consulta.
//            PreparedStatement ps = con.prepareStatement(strSQL);
//
//            cantFilas = ps.executeUpdate();
//            con.close();
//        } catch (ClassNotFoundException ex) {
//            Logger.getLogger(DaoJuegoEstudiante.class.getName()).log(Level.SEVERE, "Problema registro del Driver", ex);
//        } catch (SQLException ex) {
//            Logger.getLogger(DaoJuegoEstudiante.class.getName()).log(Level.SEVERE, "Error SQL.", ex);
//        }
//        return cantFilas;
//    }
//
//    public Busqueda_encuesta Buscar_encuesta(String rut) {
//        Busqueda_encuesta busqueda_encuesta = new Busqueda_encuesta();
//        try {
//            //Recuperar una conexión.
//            Connection con = this.getConexion();
//            //Se genera sentecia select
//            String strSQL = "SELECT SE.RUT AS 'RUT', SE.NOMBRE AS 'NOMBRE', SE.SEXO AS 'SEXO', CENTRO.DESCRIPCION AS 'CENTRO_MEDICO', SE.CAMBIO_CENTRO AS 'CAMBIO_CENTRO', COM.Nombre_Comuna AS 'COMUNA', SE.FECHA_NACIMIENTO AS 'FECHA_NACIMIENTO', EDU.DESCRIPCION AS 'EDUCACION', SE.ESTUDIO_ACTUAL AS 'ESTUDIO_ACTUAL', SE.CARRERA_INSTITUCIÓN AS 'CARRERA_INSTITUCION', EST.DESCRIPCION AS 'ESTADO_CIVIL', SE.PERSONAS_HOGAR AS 'PERSONAS_HOGAR', SE.PERSONAS_OCUPADAS AS 'PERSONAS_OCUPADAS', SE.PERSONAS_BUSCANDO AS 'PERSONAS_BUSCANDO', SE.PERSONAS_PROBLEMA_SALUD AS 'PERSONAS_PROBLEMA_SALUD', SE.PERSONAS_PROBLEMA_SALUD_NUMERO AS 'PERSONAS_PROBLEMA_SALUD_NUMERO', SE.PERSONAS_CARGA AS 'PERSONAS_CARGA', SE.PROVEEDOR_PRINCIPAL AS 'PROVEEDOR_PRINCIPAL', VI.DESCRIPCION AS 'VIVIENDA', CAR.DESCRIPCION AS 'CARGO_TRABAJO', SE.POLIFUNCIONALIDAD AS 'POLIFUNCIONALIDAD', AREA.DESCRIPCION AS 'AREA_FUNCIONES', SE.ANIO_ANTIGUEDAD AS 'ANIO_ANTIGUEDAD', SE.MES_ANTIGUEDAD AS 'MES_ANTIGUEDAD', SE.HORAS_JORNADA AS 'HORAS_JORNADA', SE.HORAS_EXTRA_HABILES AS 'HORAS_EXTRA_HABILES', SE.HORAS_EXTRA_SABADO AS 'HORAS_EXTRA_SABADO', SE.HORAS_EXTRA_DOMINGO AS 'HORAS_EXTRA_DOMINGO', SE.TURNOS AS 'TURNOS', SE.TIEMPO_TRASLADO_HORAS AS 'TIEMPO_TRASLADO_HORAS', SE.TIEMPO_TRASLADO_MINUTOS AS 'TIEMPO_TRASLADO_MINUTOS', SE.SOLICITUD_TRASLADO_CENTRO AS 'SOLICITUD_TRASLADO_CENTRO', SE.NUMERO_SOLICITUD AS 'NUMERO_SOLICITUD', SE.OTORGAMIENTO_TRASLADO_CENTRO AS 'OTORGAMIENTO_TRASLADO_CENTRO', SE.NUMERO_OTORGAMIENTO AS 'NUMERO_OTORGAMIENTO', SE.PRESTAMO_MARZO AS 'PRESTAMO_MARZO', SE.SERVICIO_DENTAL AS 'SERVICIO_DENTAL', SE.OTRO_SERVICIO_DENTAL AS 'OTRO_SERVICIO_DENTAL', SE.BONO_NPS AS 'BONO_NPS', SE.CRITERIOS_BONO_NPS AS 'CRITERIOS_BONO_NPS', SE.CRITERIOS_BONO_PRODUCCION AS 'CRITERIOS_BONO_PRODUCCION', SE.TIEMPO_ACREDITACION AS 'TIEMPO_ACREDITACION', SE.ESTRES_ACREDITACION AS 'ESTRES_ACREDITACION', SE.PROBLEMA_FUNCIONES_ACREDITACION AS 'PROBLEMA_FUNCIONES_ACREDITACION', SE.SITUACION_CATASTROFICA AS 'SITUACIÓN_CATASTROFICA', SE.RETIRO_VOLUNTARIO AS 'RETIRO_VOLUNTARIO', SE.SALIDA_SOCIAL AS 'SALIDA_SOCIAL', SE.SATISFACCION_EMPRESA AS 'SATISFACCION_EMPRESA', SE.FIESTA AS 'FIESTA', SE.VALORACION_SINDICATO AS 'VALORACION_SINDICATO', SE.OTRO_SINDICATO AS 'OTRO_SINDICATO', SE.ANTIGUEDAD_SINDICATO_ANIO AS 'ANTIGUEDAD_SINDICATO_ANIO', SE.ANTIGUEDAD_SINDICATO_MES AS 'ANTIGUEDAD_SINDICATO_MES', SE.CONTRATO_COLECTIVO AS 'CONTRATO_COLECTIVO', SE.CONOCIMIENTO_CONTRATO_COLECTIVO AS 'CONOCIMIENTO_CONTRATO_COLECTIVO', SE.ESTATUTOS_SINDICATO AS 'ESTATUTOS_SINDICATO' FROM CENTRO_MEDICO CENTRO, ENCUESTA SE, NIVEL_EDUCACIONAL EDU, ESTADO_CIVIL EST, TIPO_VIVIENDA VI, TIPO_CARGO CAR, COMUNA COM, AREA_FUNCION AREA WHERE SE.EDUCACION = EDU.EDUCACION AND SE.ESTADO_CIVIL = EST.ESTADO_CIVIL AND SE.VIVIENDA = VI.VIVIENDA AND SE.CARGO_TRABAJO = CAR.CARGO_TRABAJO AND SE.CUT = COM.CUT AND SE.AREA_FUNCIONES = AREA.AREA_FUNCIONES AND CENTRO.CENTRO_MEDICO = SE.CENTRO_MEDICO AND SE.RUT LIKE '"+rut+"';";
//            //Se prepara la consulta.
//            PreparedStatement ps = con.prepareStatement(strSQL);
//            //ejecutar la consulta.
//            ResultSet res = ps.executeQuery();
//            //Se recorre el ResultSet.
//            while (res.next()) {
//                busqueda_encuesta.setRut(res.getString("RUT"));
//                busqueda_encuesta.setNombre(res.getString("NOMBRE"));
//                busqueda_encuesta.setSexo(res.getString("SEXO"));
//                busqueda_encuesta.setCentro_medico(res.getString("CENTRO_MEDICO"));
//                busqueda_encuesta.setCambio_centro(Integer.parseInt(res.getString("CAMBIO_CENTRO")));
//                busqueda_encuesta.setComuna(res.getString("COMUNA"));
//                busqueda_encuesta.setFecha_nacimiento(res.getString("FECHA_NACIMIENTO"));
//                busqueda_encuesta.setEducacion(res.getString("EDUCACION"));
//                busqueda_encuesta.setEstudio_actual(Integer.parseInt(res.getString("ESTUDIO_ACTUAL")));
//                busqueda_encuesta.setCarrera_institucion(res.getString("CARRERA_INSTITUCION"));
//                busqueda_encuesta.setEstado_civil(res.getString("ESTADO_CIVIL"));
//                busqueda_encuesta.setPersonas_hogar(Integer.parseInt(res.getString("PERSONAS_HOGAR")));
//                busqueda_encuesta.setPersonas_ocupadas(Integer.parseInt(res.getString("PERSONAS_OCUPADAS")));
//                busqueda_encuesta.setPersonas_buscando(Integer.parseInt(res.getString("PERSONAS_BUSCANDO")));
//                busqueda_encuesta.setPersonas_problema_salud(Integer.parseInt(res.getString("PERSONAS_PROBLEMA_SALUD")));
//                busqueda_encuesta.setPersonas_problema_salud_numero(Integer.parseInt(res.getString("PERSONAS_PROBLEMA_SALUD_NUMERO")));
//                busqueda_encuesta.setPersonas_carga(Integer.parseInt(res.getString("PERSONAS_CARGA")));
//                busqueda_encuesta.setProveedor_principal(Integer.parseInt(res.getString("PROVEEDOR_PRINCIPAL")));
//                busqueda_encuesta.setVivienda(res.getString("VIVIENDA"));
//                busqueda_encuesta.setCargo_trabajo(res.getString("CARGO_TRABAJO"));
//                busqueda_encuesta.setPolifuncionalidad(Integer.parseInt(res.getString("POLIFUNCIONALIDAD")));
//                busqueda_encuesta.setArea_funciones(res.getString("AREA_FUNCIONES"));
//                busqueda_encuesta.setAnio_antiguedad(Integer.parseInt(res.getString("ANIO_ANTIGUEDAD")));
//                busqueda_encuesta.setMes_antiguedad(Integer.parseInt(res.getString("MES_ANTIGUEDAD")));
//                busqueda_encuesta.setHoras_jornada(Integer.parseInt(res.getString("HORAS_JORNADA")));
//                busqueda_encuesta.setHoras_extra_habiles(Integer.parseInt(res.getString("HORAS_EXTRA_HABILES")));
//                busqueda_encuesta.setHoras_extra_sabado(Integer.parseInt(res.getString("HORAS_EXTRA_SABADO")));
//                busqueda_encuesta.setHoras_extra_domingo(Integer.parseInt(res.getString("HORAS_EXTRA_DOMINGO")));
//                busqueda_encuesta.setTurnos(Integer.parseInt(res.getString("TURNOS")));
//                busqueda_encuesta.setTiempo_traslado_horas(Integer.parseInt(res.getString("TIEMPO_TRASLADO_HORAS")));
//                busqueda_encuesta.setTiempo_traslado_minutos(Integer.parseInt(res.getString("TIEMPO_TRASLADO_MINUTOS")));
//                busqueda_encuesta.setSolicitud_traslado_centro(Integer.parseInt(res.getString("SOLICITUD_TRASLADO_CENTRO")));
//                busqueda_encuesta.setNumero_solicitud(Integer.parseInt(res.getString("NUMERO_SOLICITUD")));
//                busqueda_encuesta.setOtorgamiento_traslado_centro(Integer.parseInt(res.getString("OTORGAMIENTO_TRASLADO_CENTRO")));
//                busqueda_encuesta.setNumero_otorgamiento(Integer.parseInt(res.getString("NUMERO_OTORGAMIENTO")));
//                busqueda_encuesta.setPrestamo_marzo(Integer.parseInt(res.getString("PRESTAMO_MARZO")));
//                busqueda_encuesta.setServicio_dental(Integer.parseInt(res.getString("SERVICIO_DENTAL")));
//                busqueda_encuesta.setOtro_servicio_dental(Integer.parseInt(res.getString("OTRO_SERVICIO_DENTAL")));
//                busqueda_encuesta.setBono_nps(Integer.parseInt(res.getString("BONO_NPS")));
//                busqueda_encuesta.setCriterios_bono_nps(Integer.parseInt(res.getString("CRITERIOS_BONO_NPS")));
//                busqueda_encuesta.setCriterios_bono_produccion(Integer.parseInt(res.getString("CRITERIOS_BONO_PRODUCCION")));
//                busqueda_encuesta.setTiempo_acreditacion(Integer.parseInt(res.getString("TIEMPO_ACREDITACION")));
//                busqueda_encuesta.setEstres_acreditacion(Integer.parseInt(res.getString("ESTRES_ACREDITACION")));
//                busqueda_encuesta.setProblema_funciones_acreditacion(Integer.parseInt(res.getString("PROBLEMA_FUNCIONES_ACREDITACION")));
//                busqueda_encuesta.setSituacion_catastrofica(Integer.parseInt(res.getString("SITUACIÓN_CATASTROFICA")));
//                busqueda_encuesta.setRetiro_voluntario(Integer.parseInt(res.getString("RETIRO_VOLUNTARIO")));
//                busqueda_encuesta.setSalida_social(Integer.parseInt(res.getString("SALIDA_SOCIAL")));
//                busqueda_encuesta.setSatisfaccion_empresa(Integer.parseInt(res.getString("SATISFACCION_EMPRESA")));
//                busqueda_encuesta.setFiesta(Integer.parseInt(res.getString("FIESTA")));
//                busqueda_encuesta.setValoracion_sindicato(Integer.parseInt(res.getString("VALORACION_SINDICATO")));
//                busqueda_encuesta.setOtro_sindicato(Integer.parseInt(res.getString("OTRO_SINDICATO")));
//                busqueda_encuesta.setAntiguedad_sindicato_anio(Integer.parseInt(res.getString("ANTIGUEDAD_SINDICATO_ANIO")));
//                busqueda_encuesta.setAntiguedad_sindicato_mes(Integer.parseInt(res.getString("ANTIGUEDAD_SINDICATO_MES")));
//                busqueda_encuesta.setContrato_colectivo(Integer.parseInt(res.getString("CONTRATO_COLECTIVO")));
//                busqueda_encuesta.setConocimiento_contrato_colectivo(Integer.parseInt(res.getString("CONOCIMIENTO_CONTRATO_COLECTIVO")));
//                busqueda_encuesta.setEstatutos_sindicato(Integer.parseInt(res.getString("ESTATUTOS_SINDICATO")));
//            }
//            con.close();
//        } catch (ClassNotFoundException ex) {
//            Logger.getLogger(DaoJuegoEstudiante.class.getName())
//                    .log(Level.SEVERE, "Error en registro del Driver.", ex);
//        } catch (SQLException ex) {
//            Logger.getLogger(DaoJuegoEstudiante.class.getName())
//                    .log(Level.SEVERE, "Error en SQL.", ex);
//        }
//        return busqueda_encuesta;
//    }
//
//    public int modificarEncuesta(Socio_encuesta socio_encuesta, String rut) {
//        int cantFilas = 0;
//
//        try {
//            //Recuperar una conexión.
//            Connection con = this.getConexion();
//            //Se genera sentecia select
//            String strSQL = "UPDATE ENCUESTA SET NOMBRE = '"+socio_encuesta.getNombre()+"', "
//                    + "SEXO = '" + socio_encuesta.getSexo() + "', "
//                    + "CENTRO_MEDICO = "+socio_encuesta.getCentro_medico()+", "
//                    + "CAMBIO_CENTRO = "+socio_encuesta.getCambio_centro()+", "
//                    + "CUT = "+socio_encuesta.getCut()+", "
//                    + "FECHA_NACIMIENTO = '" + socio_encuesta.getFecha_nacimiento() + "', "
//                    + "EDUCACION = " + socio_encuesta.getEducacion() + ", "
//                    + "ESTUDIO_ACTUAL = " + socio_encuesta.getEstudio_actual() + ", "
//                    + "CARRERA_INSTITUCIÓN = '"+socio_encuesta.getCarrera_institucion()+"', "
//                    + "ESTADO_CIVIL = " + socio_encuesta.getEstado_civil() + ", "
//                    + "PERSONAS_HOGAR = "+socio_encuesta.getPersonas_hogar()+", "
//                    + "PERSONAS_OCUPADAS = "+socio_encuesta.getPersonas_ocupadas()+", "
//                    + "PERSONAS_BUSCANDO = "+socio_encuesta.getPersonas_buscando()+", "
//                    + "PERSONAS_PROBLEMA_SALUD = "+socio_encuesta.getPersonas_problema_salud()+", "
//                    + "PERSONAS_PROBLEMA_SALUD_NUMERO = "+socio_encuesta.getPersonas_problema_salud_numero()+", "
//                    + "PERSONAS_CARGA = "+socio_encuesta.getPersonas_carga()+", "
//                    + "PROVEEDOR_PRINCIPAL = "+socio_encuesta.getProveedor_principal()+", "
//                    + "VIVIENDA = " + socio_encuesta.getVivienda() + ", "
//                    + "CARGO_TRABAJO = "+socio_encuesta.getCargo_trabajo()+", "
//                    + "POLIFUNCIONALIDAD = "+socio_encuesta.getPolifuncionalidad()+", "
//                    + "AREA_FUNCIONES = "+socio_encuesta.getArea_funciones()+", "
//                    + "ANIO_ANTIGUEDAD = "+socio_encuesta.getAnio_antiguedad()+", "
//                    + "MES_ANTIGUEDAD = "+socio_encuesta.getMes_antiguedad()+", "
//                    + "HORAS_JORNADA = "+socio_encuesta.getHoras_jornada()+","
//                    + "HORAS_EXTRA_HABILES = "+socio_encuesta.getHoras_extra_habiles()+", "
//                    + "HORAS_EXTRA_SABADO = "+socio_encuesta.getHoras_extra_sabado()+", "
//                    + "HORAS_EXTRA_DOMINGO = "+socio_encuesta.getHoras_extra_domingo()+", "
//                    + "TURNOS = "+socio_encuesta.getTurnos()+", "
//                    + "TIEMPO_TRASLADO_HORAS = "+socio_encuesta.getTiempo_traslado_horas()+", "
//                    + "TIEMPO_TRASLADO_MINUTOS = "+socio_encuesta.getTiempo_traslado_minutos()+", "
//                    + "SOLICITUD_TRASLADO_CENTRO = "+socio_encuesta.getSolicitud_traslado_centro()+", "
//                    + "NUMERO_SOLICITUD = "+socio_encuesta.getNumero_solicitud()+", "
//                    + "OTORGAMIENTO_TRASLADO_CENTRO = "+socio_encuesta.getOtorgamiento_traslado_centro()+", "
//                    + "NUMERO_OTORGAMIENTO = "+socio_encuesta.getNumero_otorgamiento()+", "
//                    + "PRESTAMO_MARZO = "+socio_encuesta.getPrestamo_marzo()+", "
//                    + "SERVICIO_DENTAL = "+socio_encuesta.getServicio_dental()+", "
//                    + "OTRO_SERVICIO_DENTAL = "+socio_encuesta.getOtro_servicio_dental()+", "
//                    + "BONO_NPS = "+socio_encuesta.getBono_nps()+", "
//                    + "CRITERIOS_BONO_NPS = "+socio_encuesta.getCriterios_bono_nps()+", "
//                    + "CRITERIOS_BONO_PRODUCCION = "+socio_encuesta.getCriterios_bono_produccion()+", "
//                    + "TIEMPO_ACREDITACION = "+socio_encuesta.getTiempo_acreditacion()+", "
//                    + "ESTRES_ACREDITACION = "+socio_encuesta.getEstres_acreditacion()+", "
//                    + "PROBLEMA_FUNCIONES_ACREDITACION = "+socio_encuesta.getProblema_funciones_acreditacion()+", "
//                    + "SITUACION_CATASTROFICA = "+socio_encuesta.getSituacion_catastrofica()+", "
//                    + "RETIRO_VOLUNTARIO = "+socio_encuesta.getRetiro_voluntario()+", "
//                    + "SALIDA_SOCIAL = "+socio_encuesta.getSalida_social()+", "
//                    + "SATISFACCION_EMPRESA = "+socio_encuesta.getSatisfaccion_empresa()+", "
//                    + "FIESTA = "+socio_encuesta.getFiesta()+", "
//                    + "VALORACION_SINDICATO = "+socio_encuesta.getValoracion_sindicato()+", "
//                    + "OTRO_SINDICATO = "+socio_encuesta.getOtro_sindicato()+", "
//                    + "ANTIGUEDAD_SINDICATO_ANIO = "+socio_encuesta.getAntiguedad_sindicato_anio()+", "
//                    + "ANTIGUEDAD_SINDICATO_MES = "+socio_encuesta.getAntiguedad_sindicato_mes()+", "
//                    + "CONTRATO_COLECTIVO = "+socio_encuesta.getContrato_colectivo()+", "
//                    + "CONOCIMIENTO_CONTRATO_COLECTIVO = "+socio_encuesta.getConocimiento_contrato_colectivo()+", "
//                    + "ESTATUTOS_SINDICATO = "+socio_encuesta.getEstatutos_sindicato()+" WHERE RUT LIKE '" + rut + "'";
//            //Se prepara la consulta.
//            PreparedStatement ps = con.prepareStatement(strSQL);
//            cantFilas = ps.executeUpdate();
//            con.close();
//        } catch (ClassNotFoundException ex) {
//            Logger.getLogger(DaoJuegoEstudiante.class.getName()).log(Level.SEVERE, "Problema registro del Driver", ex);
//        } catch (SQLException ex) {
//            Logger.getLogger(DaoJuegoEstudiante.class.getName()).log(Level.SEVERE, "Error SQL.", ex);
//        }
//        return cantFilas;
//    }
//
//    public boolean eliminarEncuesta(String rut) {
//        boolean confirmacion = false;
//
//        try {
//            //Recuperar una conexión.
//            Connection con = this.getConexion();
//            PreparedStatement eliminarSocio;
//            eliminarSocio = con.prepareStatement("DELETE ENCUESTA FROM ENCUESTA WHERE RUT LIKE '" + rut + "';");
//            eliminarSocio.execute();
//            confirmacion = true;
//        } catch (ClassNotFoundException | SQLException error) {
//            confirmacion = false;
//        }
//
//        return confirmacion;
//    }
}
