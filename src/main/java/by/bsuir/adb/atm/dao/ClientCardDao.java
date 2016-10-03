package by.bsuir.adb.atm.dao;

import by.bsuir.adb.atm.entity.ClientCardEntity;
import org.hibernate.Criteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

/**
 * Created by Airin on 08/12/2015.
 */
@Repository
public class ClientCardDao extends GeneralDao<ClientCardEntity> {

    ClientCardDao() {
        super(ClientCardEntity.class);
    }

    public ClientCardEntity getCardByNumber(String cardNumber) {
        Criteria criteria = getCurrentSession().createCriteria(ClientCardEntity.class);
        criteria.add(Restrictions.eq("cardNumber", cardNumber));
        ClientCardEntity card = (ClientCardEntity) criteria.uniqueResult();
        return card;
    }
    public String getPasswordByNumber(String cardNumber) {
        Criteria criteria = getCurrentSession().createCriteria(ClientCardEntity.class);
        criteria.add(Restrictions.eq("cardNumber", cardNumber));
        criteria.setProjection(Projections.property("password"));
        String pass = (String)criteria.uniqueResult();
        return pass;
    }
}
