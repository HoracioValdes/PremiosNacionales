/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.modelo;

/**
 *
 * @author horac
 */
public class Admin {
    
    private int id_admin;
    private String nombre_usuario;
    private String clave;

    public Admin() {
    }

    public Admin(int id_admin, String nombre_usuario, String clave) {
        this.id_admin = id_admin;
        this.nombre_usuario = nombre_usuario;
        this.clave = clave;
    }

    public int getId_admin() {
        return id_admin;
    }

    public void setId_admin(int id_admin) {
        this.id_admin = id_admin;
    }

    public String getNombre_usuario() {
        return nombre_usuario;
    }

    public void setNombre_usuario(String nombre_usuario) {
        this.nombre_usuario = nombre_usuario;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }
    
}
