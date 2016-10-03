package by.bsuir.adb.atm.dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.List;

/**
 * Date: 04.12.2015
 * Time: 15:49
 *
 * @author i.bogdanova
 */
public class GeneralDao< T extends Serializable> {

    @Autowired
    SessionFactory sessionFactory;
    private Class<T> type;

    public Session getCurrentSession(){
        Session session = null;
        try {
            if(sessionFactory.getCurrentSession().isOpen()){
                session = sessionFactory.getCurrentSession();
            }else{
                session = sessionFactory.openSession();
            }
        } catch ( HibernateException he ) {
            session = sessionFactory.openSession();
        }
        return session;
    }

    public GeneralDao(Class<T> type) {
        this.type = type;
    }

    public void save( T object ){
        getCurrentSession().save(object);
    }

    public void update( T object ){
        getCurrentSession().merge(object);
    }

    public void saveOrUpdate( T object ){
        getCurrentSession().saveOrUpdate(object);
    }

    public void delete( T object ){
        getCurrentSession().delete(object);
    }

    public List<T> getAll(){
        try{
            return getCurrentSession().createCriteria(type).list();
        }catch (HibernateException ex){
            ex.printStackTrace();
        }
        return null;
    }
    @Transactional
    public T getById(long id){
            return (T)getCurrentSession().get(type, id);
    }

}
