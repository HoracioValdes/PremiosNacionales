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
public class Sesion {
    private int id_sesion;
    private String rut;
    private String clave;
    private String estado;

    public Sesion() {
    }

    public Sesion(int id_sesion, String rut, String clave, String estado) {
        this.id_sesion = id_sesion;
        this.rut = rut;
        this.clave = clave;
        this.estado = estado;
    }

    public int getId_sesion() {
        return id_sesion;
    }

    public void setId_sesion(int id_sesion) {
        this.id_sesion = id_sesion;
    }

    public String getRut() {
        return rut;
    }

    public void setRut(String rut) {
        this.rut = rut;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
    
}
