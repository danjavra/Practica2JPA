/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import entities.Empleado;
import exceptions.MisExcepciones;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;

/**
 *
 * @author DAM
 */
@Stateless
public class incidenciasEJB {

    @PersistenceUnit EntityManagerFactory emf;
    
    public void altaEmpleado(Empleado e) throws MisExcepciones {
        EntityManager em = emf.createEntityManager();
        // Comprobamos si ya existe un cocinero 
        Empleado aux = em.find(Empleado.class, e.getNombreusuario());
        if (aux != null) {
            em.close();
            throw new MisExcepciones("Ya existe un empleado con ese nombre");
        }
        em.persist(e);
        em.close();
    }
    
    
}
