# 项目运行说明（中文）

## 一、推荐的最简单运行方式
1. 安装并打开 DB Browser for SQLite。
2. 选择“打开数据库”，打开 `database/financial_analysis.db`。
3. 点击“执行 SQL”。
4. 用文本编辑器打开 `sql/` 文件夹中的 SQL 文件，将代码复制到 SQL 编辑窗口。
5. 点击运行，查看结果；可以将结果导出为 CSV。

## 二、如果想从 CSV 自己建库
1. 新建 SQLite 数据库。
2. 先执行 `sql/01_create_tables.sql`，创建四张表。
3. 通过 DB Browser 的“导入”功能，分别导入 `data/` 下的四个 CSV 文件。
4. 导入时确认 CSV 第一行是字段名，表名分别为 customers、orders、invoices、payments。
5. 按顺序执行 `sql/02` 至 `sql/06` 的分析脚本。

## 三、分析脚本对应的业务问题
- `02_monthly_sales.sql`：每月订单数量和订单金额。
- `03_order_invoice_reconciliation.sql`：识别未开票订单、少开票或多开票。
- `04_ar_aging.sql`：按 2026-06-30 计算未收回的应收账款及逾期账龄。
- `05_customer_concentration.sql`：计算客户订单金额占比和累计占比。
- `06_payment_reconciliation.sql`：识别未回款、部分回款、全额回款和超额回款。

## 四、注意事项
- 所有客户名称、订单、发票、回款、日期和金额均为虚构模拟数据。
- 金额单位为模拟金额单位，不代表真实币种或真实企业交易。
- 账龄基准日为 2026-06-30。
- 本项目用于学习和作品集展示，不构成真实审计结论。
