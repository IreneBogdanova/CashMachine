package by.bsuir.adb.atm.service;

import by.bsuir.adb.atm.dao.ClientCardDao;
import by.bsuir.adb.atm.entity.ClientCardEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * Created by Airin on 08/12/2015.
 */
@Service
public class ClientCardService {

    @Resource
    ClientCardDao clientCardDao;

    public ClientCardEntity getCardByNumber(String cardNumber) {
        return clientCardDao.getCardByNumber(cardNumber);
    }

    public String getPassword(String cardNumber) {
        return clientCardDao.getPasswordByNumber(cardNumber);
    }

    @Transactional
    public void blockCard(String cardId){
        ClientCardEntity card =  getCardByNumber(cardId);
        card.setStatus((byte)0);
        clientCardDao.saveOrUpdate(card);
    }

}
