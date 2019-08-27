/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Horacio-Valdés
 */
public class Conectar {
    
    
    public static Connection getConexion() 
            throws ClassNotFoundException, SQLException{
        //Registro del Driver.
        Class.forName("com.mysql.jdbc.Driver");
        //Retornar al conexión
        return DriverManager.getConnection("jdbc:mysql://116.203.1.145:3306/premios_nacionales", "us_juego", "7P3qxp1XYalXFi16gv");
    }
    
    public void Desconectar(Connection cn){
        try{
            cn.close();
        }catch(Exception error){ 
        }
    }
}







