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
public class SesionesJuego {
    
    private int id_sesion;
    private String nombre;
    private String correo;
    private String descripcion;
    private String institucion;
    private String comuna;
    private String estado;

    public SesionesJuego() {
    }

    public SesionesJuego(int id_sesion, String nombre, String correo, String descripcion, String institucion, String comuna, String estado) {
        this.id_sesion = id_sesion;
        this.nombre = nombre;
        this.correo = correo;
        this.descripcion = descripcion;
        this.institucion = institucion;
        this.comuna = comuna;
        this.estado = estado;
    }

    public int getId_sesion() {
        return id_sesion;
    }

    public void setId_sesion(int id_sesion) {
        this.id_sesion = id_sesion;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getInstitucion() {
        return institucion;
    }

    public void setInstitucion(String institucion) {
        this.institucion = institucion;
    }

    public String getComuna() {
        return comuna;
    }

    public void setComuna(String comuna) {
        this.comuna = comuna;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
    
}
