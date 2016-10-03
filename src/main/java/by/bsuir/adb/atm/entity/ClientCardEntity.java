package by.bsuir.adb.atm.entity;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by Airin on 08/12/2015.
 */
@Entity
@Table(name = "client_card", schema = "", catalog = "bank")
public class ClientCardEntity implements Serializable{
    private int id;
    private int clientId;
    private String password;
    private String cardNumber;
    private AccountEntity accountByAccountId;
    private byte status;

    @Id
    @Column(name = "id", nullable = false, insertable = true, updatable = true)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "client_id", nullable = false, insertable = true, updatable = true)
    public int getClientId() {
        return clientId;
    }

    public void setClientId(int clientId) {
        this.clientId = clientId;
    }

    @Basic
    @Column(name = "password", nullable = false, insertable = true, updatable = true, length = 4)
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Basic
    @Column(name = "card_number", nullable = false, insertable = true, updatable = true, length = 16)
    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cartNumber) {
        this.cardNumber = cartNumber;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ClientCardEntity that = (ClientCardEntity) o;

        if (clientId != that.clientId) return false;
        if (id != that.id) return false;
        if (cardNumber != null ? !cardNumber.equals(that.cardNumber) : that.cardNumber != null) return false;
        if (password != null ? !password.equals(that.password) : that.password != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + clientId;
        result = 31 * result + (password != null ? password.hashCode() : 0);
        result = 31 * result + (cardNumber != null ? cardNumber.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "account_id", referencedColumnName = "id", nullable = false)
    public AccountEntity getAccountByAccountId() {
        return accountByAccountId;
    }

    public void setAccountByAccountId(AccountEntity accountByAccountId) {
        this.accountByAccountId = accountByAccountId;
    }

    @Basic
    @Column(name = "status", nullable = false, insertable = true, updatable = true)
    public byte getStatus() {
        return status;
    }

    public void setStatus(byte status) {
        this.status = status;
    }
}
