<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="产品CODE" prop="prodCode">
        <el-input
          v-model="queryParams.prodCode"
          placeholder="请输入产品CODE"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="产品名称" prop="prodName">
        <el-input
          v-model="queryParams.prodName"
          placeholder="请输入产品名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="生效日期" prop="effectDate">
        <el-date-picker clearable size="small" style="width: 200px"
          v-model="queryParams.effectDate"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="选择生效日期">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="失效日期" prop="endDate">
        <el-date-picker clearable size="small" style="width: 200px"
          v-model="queryParams.endDate"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="选择失效日期">
        </el-date-picker>
      </el-form-item>
      <el-form-item>
        <el-button type="cyan" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['product:prod:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['product:prod:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['product:prod:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['product:prod:export']"
        >导出</el-button>
      </el-col>
	  <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="prodList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="产品CODE" align="center" prop="prodCode" />
      <el-table-column label="产品名称" align="center" prop="prodName" />
      <el-table-column label="还款方式" align="center" prop="paymentWay" :formatter="paymentWayFormat" />
      <el-table-column label="产品额度有效期" align="center" prop="creditTerm" :formatter="creditTermFormat" />
      <el-table-column label="产品日利率" align="center" prop="prodRate" />
      <el-table-column label="生效日期" align="center" prop="effectDate" />
      <el-table-column label="失效日期" align="center" prop="endDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.endDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="创建日期" align="center" prop="createDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="最后一次修改时间" align="center" prop="lastUpdateDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.lastUpdateDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['product:prod:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['product:prod:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改客户产品信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="产品名称" prop="prodName">
          <el-input v-model="form.prodName" placeholder="请输入产品名称" />
        </el-form-item>
        <el-form-item label="还款方式">
          <el-checkbox-group v-model="form.paymentWay">
            <el-checkbox
              v-for="dict in paymentWayOptions"
              :key="dict.dictValue"
              :label="dict.dictValue">
              {{dict.dictLabel}}
            </el-checkbox>
          </el-checkbox-group>
        </el-form-item>
        <el-form-item label="产品额度有效期" prop="creditTerm">
          <el-select v-model="form.creditTerm" placeholder="请选择产品额度有效期">
            <el-option
              v-for="dict in creditTermOptions"
              :key="dict.dictValue"
              :label="dict.dictLabel"
              :value="dict.dictValue"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="产品日利率" prop="prodRate">
          <el-input v-model="form.prodRate" placeholder="请输入产品日利率" />
        </el-form-item>
        <el-form-item label="失效日期" prop="endDate">
          <el-date-picker clearable size="small" style="width: 200px"
            v-model="form.endDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="选择失效日期">
          </el-date-picker>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listProd, getProd, delProd, addProd, updateProd, exportProd } from "@/api/product/prod";

export default {
  name: "Prod",
  components: {
  },
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 客户产品信息表格数据
      prodList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 还款方式字典
      paymentWayOptions: [],
      // 产品额度有效期字典
      creditTermOptions: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        prodCode: null,
        prodName: null,
        paymentWay: null,
        effectDate: null,
        endDate: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        prodCode: [
          { required: true, message: "产品CODE不能为空", trigger: "blur" }
        ],
        prodName: [
          { required: true, message: "产品名称不能为空", trigger: "blur" }
        ],
        paymentWay: [
          { required: true, message: "还款方式不能为空", trigger: "blur" }
        ],
        creditTerm: [
          { required: true, message: "产品额度有效期不能为空", trigger: "change" }
        ],
        prodRate: [
          { required: true, message: "产品日利率不能为空", trigger: "blur" }
        ],
        effectDate: [
          { required: true, message: "生效日期不能为空", trigger: "blur" }
        ],
        endDate: [
          { required: true, message: "失效日期不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
    this.getDicts("engine_prod_payment_way").then(response => {
      this.paymentWayOptions = response.data;
    });
    this.getDicts("engine_prod_credit_term").then(response => {
      this.creditTermOptions = response.data;
    });
  },
  methods: {
    /** 查询客户产品信息列表 */
    getList() {
      this.loading = true;
      listProd(this.queryParams).then(response => {
        this.prodList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 还款方式字典翻译
    paymentWayFormat(row, column) {
      return this.selectDictLabels(this.paymentWayOptions, row.paymentWay);
    },
    // 产品额度有效期字典翻译
    creditTermFormat(row, column) {
      return this.selectDictLabel(this.creditTermOptions, row.creditTerm);
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        prodCode: null,
        prodName: null,
        paymentWay: [],
        creditTerm: null,
        prodRate: null,
        effectDate: null,
        endDate: null,
        createDate: null,
        lastUpdateDate: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.prodCode)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加客户产品信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const prodCode = row.prodCode || this.ids
      getProd(prodCode).then(response => {
        this.form = response.data;
        this.form.paymentWay = this.form.paymentWay.split(",");
        this.open = true;
        this.title = "修改客户产品信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.form.paymentWay = this.form.paymentWay.join(",");
          if (this.form.prodCode != null) {
            updateProd(this.form).then(response => {
              this.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addProd(this.form).then(response => {
              this.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const prodCodes = row.prodCode || this.ids;
      this.$confirm('是否确认删除客户产品信息编号为"' + prodCodes + '"的数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return delProd(prodCodes);
        }).then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        })
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$confirm('是否确认导出所有客户产品信息数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return exportProd(queryParams);
        }).then(response => {
          this.download(response.msg);
        })
    }
  }
};
</script>
