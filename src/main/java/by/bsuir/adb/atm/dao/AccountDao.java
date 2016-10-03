package by.bsuir.adb.atm.dao;

import by.bsuir.adb.atm.entity.AccountEntity;
import org.springframework.stereotype.Repository;

/**
 * Created by Airin on 08/12/2015.
 */
@Repository
public class AccountDao extends GeneralDao<AccountEntity> {

    AccountDao() {
        super(AccountEntity.class);
    }

}
