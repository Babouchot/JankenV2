/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package janken.session;

import java.util.List;
import javax.ejb.Stateless;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;
import javax.persistence.EntityManager;
import janken.persistence.Gamer;
import java.util.ArrayList;
import javax.persistence.Query;

/**
 *
 * @author babouchot
 */
@Stateless
public class GamerSession implements GamerSessionLocal {

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
    @javax.persistence.PersistenceContext(unitName = "Janken-ejbPU")
    private EntityManager em;

    //This is the default; here as an example of @TransactionAttribute
    @TransactionAttribute(TransactionAttributeType.REQUIRED)
    @Override
    public void remove(Object obj) {
        Object mergedObj = em.merge(obj);
        em.remove(mergedObj);
    }

    /**
     *
     * @param obj
     */
    @Override
    public void persist(Object obj) {
        em.persist(obj);
    }

    @Override
    public Gamer searchForGamer(String id, String mdp) {
        try {

            Query query = em.createNamedQuery("searchForGamer");
            query.setParameter("mail", id);
            query.setParameter("mdp", mdp);
            
            String test = query.toString();

            List<Gamer> gamer = query.getResultList();

            if (gamer.size() != 0) {
                return gamer.get(0);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List findAllConnected() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public List findGamerByFirstName(String firstName) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public List findAllGamers() {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}
