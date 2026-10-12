# Final Task — Bank Muamalat Business Intelligence Analyst (Rakamin VIX)

Studi kasus analisis penjualan **PT Sejahtera Bersama** periode Januari 2020 – Desember 2021 menggunakan **Google BigQuery** dan **Looker Studio**.

**Author:** Fakhri Afid Abdullah

## Dataset
| Tabel | Primary key | Baris |
|---|---|---|
| customers | CustomerID | 2.123 |
| products | ProdNumber | 70 |
| orders | OrderID | 3.339 |
| product_category | CategoryID | 7 |

## Relationship
- `customers.CustomerID` → `orders.CustomerID` (one-to-many)
- `products.ProdNumber` → `orders.ProdNumber` (one-to-many)
- `product_category.CategoryID` → `products.Category` (one-to-many)

## Isi repository
| File | Keterangan |
|---|---|
| `query_master_table.sql` | Query cek primary key (Soal 1) dan master table (Soal 3) |
| `master_table_penjualan.csv` | Hasil master table: 3.339 baris, diurutkan berdasarkan tanggal order |
| `data/` | Empat tabel sumber dalam format CSV |
| `FinalTask_BankMuamalat_BI Analyst_Fakhri Afid Abdullah.pdf` | File final submission |

## Ringkasan hasil
- Total sales **$1.754.750,57**, total qty **11.654**, 3.339 order, rata-rata **$525,53** per order.
- Robots ($743.505) dan Drones ($477.447) menyumbang hampir 70% sales; eBooks memimpin volume (3.123 unit).
- Sales 2021 turun 7,8% dibanding 2020, terutama Robots (−15,4%).
- 57% pelanggan aktif hanya membeli produk murah → peluang upsell dan bundling.

## Dashboard
Looker Studio: https://datastudio.google.com/reporting/efd6728e-e18c-4e25-9bf8-e5d91902bfa8

## Rekomendasi
1. Upsell bertahap dari produk murah ke Kit lalu Robot/Drone.
2. Bundling Robot/Drone + Training Video + eBook.
3. Pemulihan kategori Robots (stok, harga, promo trade-in).
4. Program loyalitas untuk 20% pelanggan teratas dan aktivasi 452 pelanggan pasif.
5. Kampanye lokal di CA, TX, FL, NY, PA (40% sales).
