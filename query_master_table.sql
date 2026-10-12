-- =====================================================================
-- Final Task VIX Bank Muamalat - BI Analyst | PT Sejahtera Bersama
-- Soal 3: Membuat Master Table Penjualan
-- Tools : Google BigQuery (Standard SQL)
-- Ganti `nama-project-anda` dengan Project ID BigQuery Anda.
-- Dataset: bank_muamalat  |  Tabel: customers, orders, products, product_category
-- =====================================================================

-- ---------------------------------------------------------------------
-- (Opsional) Cek Primary Key - Soal 1
-- Jika jumlah_baris = jumlah_unik dan tidak ada NULL -> kolom layak jadi PK
-- ---------------------------------------------------------------------
SELECT 'customers' AS tabel, COUNT(*) AS jumlah_baris, COUNT(DISTINCT CustomerID) AS jumlah_unik
FROM `nama-project-anda.bank_muamalat.customers`
UNION ALL
SELECT 'products', COUNT(*), COUNT(DISTINCT ProdNumber)
FROM `nama-project-anda.bank_muamalat.products`
UNION ALL
SELECT 'orders', COUNT(*), COUNT(DISTINCT OrderID)
FROM `nama-project-anda.bank_muamalat.orders`
UNION ALL
SELECT 'product_category', COUNT(*), COUNT(DISTINCT CategoryID)
FROM `nama-project-anda.bank_muamalat.product_category`;


-- ---------------------------------------------------------------------
-- Soal 3: Master Table (jalankan query ini, lalu Save Results -> CSV)
-- ---------------------------------------------------------------------
SELECT
  o.Date                                       AS order_date,
  pc.CategoryName                              AS category_name,
  p.ProdName                                   AS product_name,
  p.Price                                      AS product_price,
  o.Quantity                                   AS order_qty,
  ROUND(o.Quantity * p.Price, 2)               AS total_sales,
  -- data email mentah berformat "nama@x.com#mailto:nama@x.com#",
  -- SPLIT mengambil bagian sebelum tanda '#' agar email bersih
  SPLIT(c.CustomerEmail, '#')[SAFE_OFFSET(0)]  AS cust_email,
  c.CustomerCity                               AS cust_city
FROM `nama-project-anda.bank_muamalat.orders`            AS o
JOIN `nama-project-anda.bank_muamalat.customers`         AS c
  ON o.CustomerID = c.CustomerID
JOIN `nama-project-anda.bank_muamalat.products`          AS p
  ON o.ProdNumber = p.ProdNumber
JOIN `nama-project-anda.bank_muamalat.product_category`  AS pc
  ON p.Category = pc.CategoryID
ORDER BY o.Date ASC, o.OrderID ASC;
-- Hasil yang benar: 3.339 baris | Total sales = 1.754.750,57 | Total qty = 11.654
