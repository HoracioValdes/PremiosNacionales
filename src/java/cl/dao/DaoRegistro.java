/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.dao;

import cl.modelo.Admin;
import cl.modelo.Sesion;
import cl.modelo.SesionesJuego;
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
public class DaoRegistro extends Conectar{
    
    public int registrarSesion(String nombre, String correo, int asignatura, String institucion, int comuna, String clave) {
        int cantFilas = 0;

        try {
            //Recuperar una conexión.
            Connection con = this.getConexion();
            //Se genera sentecia select
            String strSQL = "INSERT INTO SESION VALUES (NULL,?,?,?,?,?,?,'ABIERTA');";
            //Se prepara la consulta
            PreparedStatement ps = con.prepareStatement(strSQL);
            //Definir el valor de los parámetros ("?")
            ps.setString(1, nombre);
            ps.setString(2, correo);
            ps.setInt(3, asignatura);
            ps.setString(4, institucion);
            ps.setInt(5, comuna);
            ps.setString(6, clave);
            cantFilas = ps.executeUpdate();
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DaoRegistro.class.getName()).log(Level.SEVERE, "Problema registro del Driver", ex);
        } catch (SQLException ex) {
            Logger.getLogger(DaoRegistro.class.getName()).log(Level.SEVERE, "Error SQL.", ex);
        }
        return cantFilas;
    }
    
    public int obtenerSesion(String correo, String nombre) {
        int numeroSesion = 0;
        try {
            //Recuperar una conexión.
            Connection con = this.getConexion();
            //Se genera sentecia select
            String strSQL = "SELECT MAX(ID_SESION) AS SESION FROM SESION WHERE CORREO = '"+ correo +"' AND NOMBRE = '"+ nombre +"';";
            //Se prepara la consulta.
            PreparedStatement ps = con.prepareStatement(strSQL);
            //ejecutar la consulta.
            ResultSet res = ps.executeQuery();
            //Se recorre el ResultSet.
            while (res.next()) {
                numeroSesion = Integer.parseInt(res.getString("SESION"));
            }
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DaoRegistro.class.getName())
                    .log(Level.SEVERE, "Error en registro del Driver.", ex);
        } catch (SQLException ex) {
            Logger.getLogger(DaoRegistro.class.getName())
                    .log(Level.SEVERE, "Error en SQL.", ex);
        }
        return numeroSesion;
    }
    
    public ArrayList<Sesion> listarSesiones() {
        ArrayList<Sesion> lstSesiones = new ArrayList<>();
        Sesion sesion;
        try {
            //Recuperar una conexión.
            Connection con = this.getConexion();
            //Se genera sentecia select
            String strSQL = "SELECT * FROM SESION WHERE ESTADO = 'ABIERTA';";
            //Se prepara la consulta.
            PreparedStatement ps = con.prepareStatement(strSQL);
            //ejecutar la consulta.
            ResultSet res = ps.executeQuery();
            //Se recorre el ResultSet.
            while (res.next()) {
                sesion = new Sesion();
                sesion.setId_sesion(Integer.parseInt(res.getString("ID_SESION")));
                sesion.setRut(res.getString("RUT"));
                sesion.setClave(res.getString("CLAVE"));
                sesion.setEstado(res.getString("ESTADO"));
                //Se agrega la sesión a la lista.
                lstSesiones.add(sesion);
            }
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DaoRegistro.class.getName())
                    .log(Level.SEVERE, "Error en registro del Driver.", ex);
        } catch (SQLException ex) {
            Logger.getLogger(DaoRegistro.class.getName())
                    .log(Level.SEVERE, "Error en SQL.", ex);
        }
        return lstSesiones;
    }
    
    public ArrayList<Admin> listarAdmins() {
        ArrayList<Admin> lstAdmins = new ArrayList<>();
        Admin admin;
        try {
            //Recuperar una conexión.
            Connection con = this.getConexion();
            //Se genera sentecia select
            String strSQL = "SELECT * FROM ADMINISTRADOR;";
            //Se prepara la consulta.
            PreparedStatement ps = con.prepareStatement(strSQL);
            //ejecutar la consulta.
            ResultSet res = ps.executeQuery();
            //Se recorre el ResultSet.
            while (res.next()) {
                admin = new Admin();
                admin.setId_admin(Integer.parseInt(res.getString("ID_ADMIN")));
                admin.setNombre_usuario(res.getString("NOMBRE_USUARIO"));
                admin.setClave(res.getString("CLAVE"));
                //Se agrega la sesión a la lista.
                lstAdmins.add(admin);
            }
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DaoRegistro.class.getName())
                    .log(Level.SEVERE, "Error en registro del Driver.", ex);
        } catch (SQLException ex) {
            Logger.getLogger(DaoRegistro.class.getName())
                    .log(Level.SEVERE, "Error en SQL.", ex);
        }
        return lstAdmins;
    }
    
}
