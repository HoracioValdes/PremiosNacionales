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
            String strSQL = "SELECT MAX(ID_DESAFIO) AS ID_DESAFIO FROM DESAFIO WHERE ID_SESION = " + id_sesion + ";";
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
    
    public int insertarNivelSegunda(String estado, int id_sesion, int nivel_sesion) {
        int cantFilas = 0;
        try {
            //Recuperar una conexión.
            Connection con = this.getConexion();
            //Se genera sentecia select
            String strSQL = "INSERT INTO NIVEL VALUES (NULL, '" + estado + "', "+ nivel_sesion +", " + id_sesion + ");";
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
    
    public int obtenerNumeroDesafios(int id_sesion) {
        int numero_desafios = 0;
        try {
            //Recuperar una conexión.
            Connection con = this.getConexion();
            //Se genera sentecia select
            String strSQL = "SELECT COUNT(*) AS DESAFIOS FROM DESAFIO WHERE ID_SESION = " + id_sesion + ";";
            //Se prepara la consulta.
            PreparedStatement ps = con.prepareStatement(strSQL);
            //ejecutar la consulta.
            ResultSet res = ps.executeQuery();
            //Se recorre el ResultSet.
            while (res.next()) {
                numero_desafios = Integer.parseInt(res.getString("DESAFIOS"));
            }
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DaoJuegoEstudiante.class.getName())
                    .log(Level.SEVERE, "Error en registro del Driver.", ex);
        } catch (SQLException ex) {
            Logger.getLogger(DaoJuegoEstudiante.class.getName())
                    .log(Level.SEVERE, "Error en SQL.", ex);
        }
        return numero_desafios;
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
    
    public boolean eliminarCalificaciones(int id_sesion) {
        boolean confirmacion = false;

        try {
            //Recuperar una conexión.
            Connection con = this.getConexion();
            PreparedStatement eliminarSocio;
            eliminarSocio = con.prepareStatement("DELETE CALIFICACION FROM CALIFICACION INNER JOIN DESAFIO ON CALIFICACION.`ID_DESAFIO` = DESAFIO.`ID_DESAFIO` WHERE DESAFIO.ID_SESION = " + id_sesion + ";");
            eliminarSocio.execute();
            confirmacion = true;
        } catch (ClassNotFoundException | SQLException error) {
            confirmacion = false;
        }

        return confirmacion;
    }
    
    public boolean eliminarDesafios(int id_sesion) {
        boolean confirmacion = false;

        try {
            //Recuperar una conexión.
            Connection con = this.getConexion();
            PreparedStatement eliminarSocio;
            eliminarSocio = con.prepareStatement("DELETE DESAFIO FROM DESAFIO WHERE ID_SESION = " + id_sesion + ";");
            eliminarSocio.execute();
            confirmacion = true;
        } catch (ClassNotFoundException | SQLException error) {
            confirmacion = false;
        }

        return confirmacion;
    }
    
    public boolean eliminarCalificacion(int id_sesion) {
        boolean confirmacion = false;

        try {
            //Recuperar una conexión.
            Connection con = this.getConexion();
            PreparedStatement eliminarSocio;
            eliminarSocio = con.prepareStatement("DELETE CALIFICACION FROM CALIFICACION INNER JOIN DESAFIO ON CALIFICACION.`ID_DESAFIO` = DESAFIO.`ID_DESAFIO` WHERE DESAFIO.ID_SESION = " + id_sesion + ";");
            eliminarSocio.execute();
            confirmacion = true;
        } catch (ClassNotFoundException | SQLException error) {
            confirmacion = false;
        }

        return confirmacion;
    }
    
    public boolean eliminarRespuesta(int id_sesion) {
        boolean confirmacion = false;

        try {
            //Recuperar una conexión.
            Connection con = this.getConexion();
            PreparedStatement eliminarSocio;
            eliminarSocio = con.prepareStatement("DELETE RESPUESTA FROM RESPUESTA WHERE ID_SESION = " + id_sesion +";");
            eliminarSocio.execute();
            confirmacion = true;
        } catch (ClassNotFoundException | SQLException error) {
            confirmacion = false;
        }

        return confirmacion;
    }
    
    public boolean eliminarDesafio(int id_sesion) {
        boolean confirmacion = false;

        try {
            //Recuperar una conexión.
            Connection con = this.getConexion();
            PreparedStatement eliminarSocio;
            eliminarSocio = con.prepareStatement("DELETE DESAFIO FROM DESAFIO WHERE ID_SESION = " + id_sesion + ";");
            eliminarSocio.execute();
            confirmacion = true;
        } catch (ClassNotFoundException | SQLException error) {
            confirmacion = false;
        }

        return confirmacion;
    }
    
    public boolean eliminarNivel(int id_sesion) {
        boolean confirmacion = false;

        try {
            //Recuperar una conexión.
            Connection con = this.getConexion();
            PreparedStatement eliminarSocio;
            eliminarSocio = con.prepareStatement("DELETE NIVEL FROM NIVEL WHERE ID_SESION = " + id_sesion + ";");
            eliminarSocio.execute();
            confirmacion = true;
        } catch (ClassNotFoundException | SQLException error) {
            confirmacion = false;
        }

        return confirmacion;
    }
    
    public boolean eliminarJugar(int id_sesion) {
        boolean confirmacion = false;

        try {
            //Recuperar una conexión.
            Connection con = this.getConexion();
            PreparedStatement eliminarSocio;
            eliminarSocio = con.prepareStatement("DELETE JUGAR FROM JUGAR WHERE ID_SESION = " + id_sesion + ";");
            eliminarSocio.execute();
            confirmacion = true;
        } catch (ClassNotFoundException | SQLException error) {
            confirmacion = false;
        }

        return confirmacion;
    }
    
    public boolean eliminarDados(int id_sesion) {
        boolean confirmacion = false;

        try {
            //Recuperar una conexión.
            Connection con = this.getConexion();
            PreparedStatement eliminarSocio;
            eliminarSocio = con.prepareStatement("DELETE DADOS FROM DADOS WHERE ID_SESION = " + id_sesion + ";");
            eliminarSocio.execute();
            confirmacion = true;
        } catch (ClassNotFoundException | SQLException error) {
            confirmacion = false;
        }

        return confirmacion;
    }
}
