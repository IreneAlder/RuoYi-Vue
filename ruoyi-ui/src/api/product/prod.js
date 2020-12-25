import request from '@/utils/request'

// 查询客户产品信息列表
export function listProd(query) {
  return request({
    url: '/product/prod/list',
    method: 'get',
    params: query
  })
}

// 查询客户产品信息详细
export function getProd(prodCode) {
  return request({
    url: '/product/prod/' + prodCode,
    method: 'get'
  })
}

// 新增客户产品信息
export function addProd(data) {
  return request({
    url: '/product/prod',
    method: 'post',
    data: data
  })
}

// 修改客户产品信息
export function updateProd(data) {
  return request({
    url: '/product/prod',
    method: 'put',
    data: data
  })
}

// 删除客户产品信息
export function delProd(prodCode) {
  return request({
    url: '/product/prod/' + prodCode,
    method: 'delete'
  })
}

// 导出客户产品信息
export function exportProd(query) {
  return request({
    url: '/product/prod/export',
    method: 'get',
    params: query
  })
}