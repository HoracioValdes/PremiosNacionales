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
        return DriverManager.getConnection("jdbc:mysql://204.93.193.161:3306/fundacio_premios_nacionales", "fundacio_jugador", "OZZE52qOnebJoJIIxW");
    }
    
    public void Desconectar(Connection cn){
        try{
            cn.close();
        }catch(Exception error){ 
        }
    }
}







