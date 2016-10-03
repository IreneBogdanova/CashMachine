package by.bsuir.adb.atm.service;

import by.bsuir.adb.atm.dao.AccountDao;
import by.bsuir.adb.atm.dao.ClientCardDao;
import by.bsuir.adb.atm.entity.AccountEntity;
import by.bsuir.adb.atm.entity.ClientCardEntity;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.transaction.Transactional;
import java.math.BigDecimal;

/**
 * Created by Airin on 08/12/2015.
 */
@Service
@Transactional
public class AccountService {

    public static final Long CASHBOX_ID = 1010000000002L;

    @Resource
    AccountDao accountDao;
    @Resource
    ClientCardDao clientCardDao;

    public boolean getMoney(String cardNum, String sum) {
        ClientCardEntity card = clientCardDao.getCardByNumber(cardNum);
        BigDecimal debit = card.getAccountByAccountId().getDebit();
        if (debit.compareTo(BigDecimal.valueOf(Double.parseDouble(sum))) >= 0) {
            card.getAccountByAccountId().setDebit(debit.subtract(BigDecimal.valueOf(Double.parseDouble(sum))));
            clientCardDao.update(card);
            AccountEntity cashbox = accountDao.getById(CASHBOX_ID);
            BigDecimal cashboxCredit = cashbox.getCredit();
            cashbox.setCredit(cashboxCredit.subtract(BigDecimal.valueOf(Double.parseDouble(sum))));
            accountDao.update(cashbox);
            return true;
        } else {
            return false;
        }
    }
}
