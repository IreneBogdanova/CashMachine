package by.bsuir.adb.atm.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;

/**
 * Created by Airin on 08/12/2015.
 */
@Entity
@Table(name = "account", schema = "", catalog = "bank")
public class AccountEntity implements Serializable {
    private long id;
    private Integer clientId;
    private int chartId;
    private Integer typeId;
    private BigDecimal debit;
    private BigDecimal credit;
    private BigDecimal balances;
    private String currencyCode;

    @Id
    @Column(name = "id", nullable = false, insertable = true, updatable = true)
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "client_id", nullable = true, insertable = true, updatable = true)
    public Integer getClientId() {
        return clientId;
    }

    public void setClientId(Integer clientId) {
        this.clientId = clientId;
    }

    @Basic
    @Column(name = "chart_id", nullable = false, insertable = true, updatable = true)
    public int getChartId() {
        return chartId;
    }

    public void setChartId(int chartId) {
        this.chartId = chartId;
    }

    @Basic
    @Column(name = "type_id", nullable = true, insertable = true, updatable = true)
    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    @Basic
    @Column(name = "debit", nullable = false, insertable = true, updatable = true, precision = 2)
    public BigDecimal getDebit() {
        return debit;
    }

    public void setDebit(BigDecimal debit) {
        this.debit = debit;
    }

    @Basic
    @Column(name = "credit", nullable = false, insertable = true, updatable = true, precision = 2)
    public BigDecimal getCredit() {
        return credit;
    }

    public void setCredit(BigDecimal credit) {
        this.credit = credit;
    }

    @Basic
    @Column(name = "balances", nullable = false, insertable = true, updatable = true, precision = 2)
    public BigDecimal getBalances() {
        return balances;
    }

    public void setBalances(BigDecimal balances) {
        this.balances = balances;
    }

    @Basic
    @Column(name = "currency_code", nullable = false, insertable = true, updatable = true, length = 3)
    public String getCurrencyCode() {
        return currencyCode;
    }

    public void setCurrencyCode(String currencyCode) {
        this.currencyCode = currencyCode;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        AccountEntity that = (AccountEntity) o;

        if (chartId != that.chartId) return false;
        if (id != that.id) return false;
        if (balances != null ? !balances.equals(that.balances) : that.balances != null) return false;
        if (clientId != null ? !clientId.equals(that.clientId) : that.clientId != null) return false;
        if (credit != null ? !credit.equals(that.credit) : that.credit != null) return false;
        if (currencyCode != null ? !currencyCode.equals(that.currencyCode) : that.currencyCode != null) return false;
        if (debit != null ? !debit.equals(that.debit) : that.debit != null) return false;
        if (typeId != null ? !typeId.equals(that.typeId) : that.typeId != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (clientId != null ? clientId.hashCode() : 0);
        result = 31 * result + chartId;
        result = 31 * result + (typeId != null ? typeId.hashCode() : 0);
        result = 31 * result + (debit != null ? debit.hashCode() : 0);
        result = 31 * result + (credit != null ? credit.hashCode() : 0);
        result = 31 * result + (balances != null ? balances.hashCode() : 0);
        result = 31 * result + (currencyCode != null ? currencyCode.hashCode() : 0);
        return result;
    }
}
