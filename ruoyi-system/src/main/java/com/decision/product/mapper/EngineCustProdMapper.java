package com.decision.product.mapper;

import java.util.List;
import com.decision.product.domain.EngineCustProd;

/**
 * 客户产品信息Mapper接口
 * 
 * @author lyy
 * @date 2020-12-25
 */
public interface EngineCustProdMapper 
{
    /**
     * 查询客户产品信息
     * 
     * @param prodCode 客户产品信息ID
     * @return 客户产品信息
     */
    public EngineCustProd selectEngineCustProdById(String prodCode);

    /**
     * 查询客户产品信息列表
     * 
     * @param engineCustProd 客户产品信息
     * @return 客户产品信息集合
     */
    public List<EngineCustProd> selectEngineCustProdList(EngineCustProd engineCustProd);

    /**
     * 新增客户产品信息
     * 
     * @param engineCustProd 客户产品信息
     * @return 结果
     */
    public int insertEngineCustProd(EngineCustProd engineCustProd);

    /**
     * 修改客户产品信息
     * 
     * @param engineCustProd 客户产品信息
     * @return 结果
     */
    public int updateEngineCustProd(EngineCustProd engineCustProd);

    /**
     * 删除客户产品信息
     * 
     * @param prodCode 客户产品信息ID
     * @return 结果
     */
    public int deleteEngineCustProdById(String prodCode);

    /**
     * 批量删除客户产品信息
     * 
     * @param prodCodes 需要删除的数据ID
     * @return 结果
     */
    public int deleteEngineCustProdByIds(String[] prodCodes);
}
