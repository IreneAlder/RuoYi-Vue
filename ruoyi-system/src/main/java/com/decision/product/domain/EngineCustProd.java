package com.decision.product.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 客户产品信息对象 engine_cust_prod
 * 
 * @author lyy
 * @date 2020-12-28
 */
public class EngineCustProd extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private String id;

    /** 产品CODE */
    @Excel(name = "产品CODE")
    private String prodCode;

    /** 产品名称 */
    @Excel(name = "产品名称")
    private String prodName;

    /** 还款方式 */
    @Excel(name = "还款方式")
    private String paymentWay;

    /** 产品额度有效期 */
    @Excel(name = "产品额度有效期")
    private String creditTerm;

    /** 产品日利率 */
    @Excel(name = "产品日利率")
    private Double prodRate;

    /** 生效日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "生效日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date effectDate;

    /** 失效日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "失效日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date endDate;

    /** 创建日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "创建日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createDate;

    /** 最后一次修改时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "最后一次修改时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date lastUpdateDate;

    public void setId(String id) 
    {
        this.id = id;
    }

    public String getId() 
    {
        return id;
    }
    public void setProdCode(String prodCode) 
    {
        this.prodCode = prodCode;
    }

    public String getProdCode() 
    {
        return prodCode;
    }
    public void setProdName(String prodName) 
    {
        this.prodName = prodName;
    }

    public String getProdName() 
    {
        return prodName;
    }
    public void setPaymentWay(String paymentWay) 
    {
        this.paymentWay = paymentWay;
    }

    public String getPaymentWay() 
    {
        return paymentWay;
    }
    public void setCreditTerm(String creditTerm) 
    {
        this.creditTerm = creditTerm;
    }

    public String getCreditTerm() 
    {
        return creditTerm;
    }
    public void setProdRate(Double prodRate) 
    {
        this.prodRate = prodRate;
    }

    public Double getProdRate() 
    {
        return prodRate;
    }
    public void setEffectDate(Date effectDate) 
    {
        this.effectDate = effectDate;
    }

    public Date getEffectDate() 
    {
        return effectDate;
    }
    public void setEndDate(Date endDate) 
    {
        this.endDate = endDate;
    }

    public Date getEndDate() 
    {
        return endDate;
    }
    public void setCreateDate(Date createDate) 
    {
        this.createDate = createDate;
    }

    public Date getCreateDate() 
    {
        return createDate;
    }
    public void setLastUpdateDate(Date lastUpdateDate) 
    {
        this.lastUpdateDate = lastUpdateDate;
    }

    public Date getLastUpdateDate() 
    {
        return lastUpdateDate;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("prodCode", getProdCode())
            .append("prodName", getProdName())
            .append("paymentWay", getPaymentWay())
            .append("creditTerm", getCreditTerm())
            .append("prodRate", getProdRate())
            .append("effectDate", getEffectDate())
            .append("endDate", getEndDate())
            .append("createDate", getCreateDate())
            .append("lastUpdateDate", getLastUpdateDate())
            .toString();
    }
}
