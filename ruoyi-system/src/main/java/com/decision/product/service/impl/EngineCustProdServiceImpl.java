package com.decision.product.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.decision.product.mapper.EngineCustProdMapper;
import com.decision.product.domain.EngineCustProd;
import com.decision.product.service.IEngineCustProdService;

/**
 * 客户产品信息Service业务层处理
 * 
 * @author lyy
 * @date 2020-12-25
 */
@Service
public class EngineCustProdServiceImpl implements IEngineCustProdService 
{
    @Autowired
    private EngineCustProdMapper engineCustProdMapper;

    /**
     * 查询客户产品信息
     * 
     * @param prodCode 客户产品信息ID
     * @return 客户产品信息
     */
    @Override
    public EngineCustProd selectEngineCustProdById(String prodCode)
    {
        return engineCustProdMapper.selectEngineCustProdById(prodCode);
    }

    /**
     * 查询客户产品信息列表
     * 
     * @param engineCustProd 客户产品信息
     * @return 客户产品信息
     */
    @Override
    public List<EngineCustProd> selectEngineCustProdList(EngineCustProd engineCustProd)
    {
        return engineCustProdMapper.selectEngineCustProdList(engineCustProd);
    }

    /**
     * 新增客户产品信息
     * 
     * @param engineCustProd 客户产品信息
     * @return 结果
     */
    @Override
    public int insertEngineCustProd(EngineCustProd engineCustProd)
    {
        return engineCustProdMapper.insertEngineCustProd(engineCustProd);
    }

    /**
     * 修改客户产品信息
     * 
     * @param engineCustProd 客户产品信息
     * @return 结果
     */
    @Override
    public int updateEngineCustProd(EngineCustProd engineCustProd)
    {
        return engineCustProdMapper.updateEngineCustProd(engineCustProd);
    }

    /**
     * 批量删除客户产品信息
     * 
     * @param prodCodes 需要删除的客户产品信息ID
     * @return 结果
     */
    @Override
    public int deleteEngineCustProdByIds(String[] prodCodes)
    {
        return engineCustProdMapper.deleteEngineCustProdByIds(prodCodes);
    }

    /**
     * 删除客户产品信息信息
     * 
     * @param prodCode 客户产品信息ID
     * @return 结果
     */
    @Override
    public int deleteEngineCustProdById(String prodCode)
    {
        return engineCustProdMapper.deleteEngineCustProdById(prodCode);
    }
}
