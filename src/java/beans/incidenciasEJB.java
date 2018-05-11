/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import entities.Empleado;
import entities.Historial;
import entities.Incidencia;
import exceptions.MisExcepciones;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.persistence.Query;

/**
 *
 * @author DAM
 */
@Stateless
public class incidenciasEJB {

    @PersistenceUnit EntityManagerFactory emf;
    
    public void altaEmpleado(Empleado e) throws MisExcepciones {
        EntityManager em = emf.createEntityManager();
        Empleado aux = em.find(Empleado.class, e.getNombreusuario());
        if (aux != null) {
            em.close();
            throw new MisExcepciones("Ya existe un empleado con ese nombre");
        }
        em.persist(e);
        em.close();
    }
    
    public List<Empleado> empleadoVerificado(String nomusuario, String password){
        EntityManager em = emf.createEntityManager();
        
        Query query = em.createQuery("Select e from Empleado e where e.nombreusuario = :nombreusuario AND e.password = :password");
        query.setParameter("nombreusuario", nomusuario);
        query.setParameter("password", password);
        return query.getResultList();
        
        }
 
    public void deleteEmpleado(Empleado e){
        EntityManager em = emf.createEntityManager();
        Empleado empleado = em.find(Empleado.class, e.getNombreusuario());
        em.remove(empleado);
        em.close();
    }

    public Incidencia getIncidenciaById(int idincidencia) throws MisExcepciones{
        EntityManager em = emf.createEntityManager();
        Incidencia in = em.find(Incidencia.class, idincidencia);
        if (in == null) {
            throw new MisExcepciones("No hay incidencia registrados con ese id");
        }
        return in;
    }
     
    public List<Incidencia> getAllIncidencia(){
        EntityManager em = emf.createEntityManager();
        Query q = em.createNamedQuery("Incidencia.findAll");
        return q.getResultList();
    }
    
    public List<Empleado> getAllEmpleado(){
        return emf.createEntityManager().createNamedQuery("Empleado.findAll").getResultList();
    }
    
    public List<Empleado> getAllEmpleadoWithoutUser(String empleado){
        EntityManager em = emf.createEntityManager();
        Query q = em.createQuery("SELECT e FROM Empleado e WHERE e.nombreusuario != :empleado");
        q.setParameter("empleado", empleado);
        return q.getResultList();
    }

    public List<Incidencia> getIncidenciaByOrigen(String empleado){
        EntityManager em = emf.createEntityManager();
        Query q = em.createQuery("SELECT i from Incidencia i WHERE i.origen.nombreusuario = :origen");
        q.setParameter("origen", empleado);
        return q.getResultList();
    }
    
    public List<Incidencia> getIncidenciaOrderByFechaHora(){
        EntityManager em = emf.createEntityManager();
        Query q = em.createQuery("SELECT i FROM Incidencia i WHERE i.tipo = 'urgente' ORDER BY i.fechahora ASC");
        return q.getResultList();
    }
    
    public Empleado getEmpleadoByNombreUsuario(String nombreUsuario) throws MisExcepciones{
        EntityManager em = emf.createEntityManager();
        Empleado empleado = em.find(Empleado.class, nombreUsuario);
   
        if(empleado==null){
           throw new MisExcepciones("No hay empleado registrado con ese nombre");
        }
        return empleado;
    }
    
    public Empleado getEmpleadoByUser(String nombreUsuario) {
        EntityManager em = emf.createEntityManager();
        Empleado empleado = em.find(Empleado.class, nombreUsuario);
        return empleado;
    }
    
    public List<Incidencia> getIncidenciaByEmpleado(Empleado e){
        EntityManager em = emf.createEntityManager();
        Query q = em.createQuery("SELECT i FROM Incidencia i WHERE i.origen = :origen ");
        q.setParameter("origen", e);
        return q.getResultList();
    }

    public void newIncidencia(Incidencia i) throws MisExcepciones{
        EntityManager em = emf.createEntityManager();
        Incidencia aux = em.find(Incidencia.class, i.getIdincidencia());
        if(aux!=null){
            em.close();
            throw new MisExcepciones("Ya existe ese id de empleado");
        }
        em.persist(i);
        em.close();
    }
    
    public List<String> getLastLogin(String empleado){
        EntityManager em = emf.createEntityManager();
        Query q = em.createQuery("SELECT h.fechahora FROM Historial h WHERE h.empleado.nombreusuario = :empleado ORDER BY h.fechahora DESC");
        q.setParameter("empleado",empleado);
        return q.getResultList();
    }
    
    public List<Empleado> getRankingEmpleados(){
        EntityManager em = emf.createEntityManager();
        Query q = em.createQuery("SELECT e FROM Incidencia i, Empleado e GROUP BY i.origen ORDER BY COUNT(i.origen) DESC");
        return q.getResultList();
    }
         
    public void newHistorial(Historial h){
        EntityManager em = emf.createEntityManager();
        em.persist(h);
        em.close();
    }

    public void editarPerfil(Empleado empleado,String nombrecompleto, String telefono, String ciudad){
        EntityManager em = emf.createEntityManager();
        Empleado e = em.find(Empleado.class, empleado.getNombreusuario());
        e.setNombrecompleto(nombrecompleto);
        e.setTelefono(telefono);
        e.setCiudad(ciudad);
        em.persist(e);
        em.close();
        
    }
    
    public void changePassword(Empleado empleado,String newPassword){
        EntityManager em = emf.createEntityManager();
        Empleado e = em.find(Empleado.class, empleado.getNombreusuario());
        e.setPassword(newPassword);
        em.persist(e);
        em.close();
    }
    
    
}
