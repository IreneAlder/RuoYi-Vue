package com.decision.product.controller;

import java.util.List;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.decision.product.domain.EngineCustProd;
import com.decision.product.service.IEngineCustProdService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 客户产品信息Controller
 * 
 * @author lyy
 * @date 2020-12-28
 */
@RestController
@RequestMapping("/product/prod")
public class EngineCustProdController extends BaseController
{
    @Autowired
    private IEngineCustProdService engineCustProdService;

    /**
     * 查询客户产品信息列表
     */
    @PreAuthorize("@ss.hasPermi('product:prod:list')")
    @GetMapping("/list")
    public TableDataInfo list(EngineCustProd engineCustProd)
    {
        startPage();
        List<EngineCustProd> list = engineCustProdService.selectEngineCustProdList(engineCustProd);
        return getDataTable(list);
    }

    /**
     * 导出客户产品信息列表
     */
    @PreAuthorize("@ss.hasPermi('product:prod:export')")
    @Log(title = "客户产品信息", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(EngineCustProd engineCustProd)
    {
        List<EngineCustProd> list = engineCustProdService.selectEngineCustProdList(engineCustProd);
        ExcelUtil<EngineCustProd> util = new ExcelUtil<EngineCustProd>(EngineCustProd.class);
        return util.exportExcel(list, "prod");
    }

    /**
     * 获取客户产品信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('product:prod:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") String id)
    {
        return AjaxResult.success(engineCustProdService.selectEngineCustProdById(id));
    }

    /**
     * 新增客户产品信息
     */
    @PreAuthorize("@ss.hasPermi('product:prod:add')")
    @Log(title = "客户产品信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody EngineCustProd engineCustProd)
    {
        return toAjax(engineCustProdService.insertEngineCustProd(engineCustProd));
    }

    /**
     * 修改客户产品信息
     */
    @PreAuthorize("@ss.hasPermi('product:prod:edit')")
    @Log(title = "客户产品信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody EngineCustProd engineCustProd)
    {
        return toAjax(engineCustProdService.updateEngineCustProd(engineCustProd));
    }

    /**
     * 删除客户产品信息
     */
    @PreAuthorize("@ss.hasPermi('product:prod:remove')")
    @Log(title = "客户产品信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable String[] ids)
    {
        return toAjax(engineCustProdService.deleteEngineCustProdByIds(ids));
    }
}
