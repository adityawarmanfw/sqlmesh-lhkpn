-- Termasuk dalam kelompok ini semua harta yang berbentuk:
--     1. Piutang,
--     Hak seseorang atas orang lain disebabkan adanya proses pinjam-meminjam
--     dimasa lampau, Piutang meliputi semua transaksi pembelian secara kredit
--     tetapi tidak membutuhkan suatu bentuk catatan atau surat formal yang
--     ditandatangani yang menyatakan kewajiban pihak pembeli kepada pihak
--     penjual.
--     2. Kerjasama Usaha Yang Tidak Berbadan Hukum/Usaha,
--     Penyertaan modal usaha pada CV atau persekutuan lainnya yang tidak
--     berbadan hukum atau usaha
--     3. Hak Kekayaan Intelektual,
--     Hak yang timbul bagi hasil olah pikir yang menghasikan suatu produk atau
--     proses yang berguna untuk manusia pada intinya HKI adalah hak untuk
--     menikmati secara ekonomis hasil dari suatu kreativitas intelektual. Objek
--     yang diatur dalam HKI adalah karya-karya yang timbul atau lahir karena
--     kemampuan intelektual manusia.
--     4. Dana Pensiun/Tunjangan Hari Tua,
--     Penghasilan yang dibayarkan sekaligus oleh badan penyelenggara tunjangan
--     hari tua kepada orang pribadi yang telah mencapai usia pensiun.
--     5. Unitlink (asuransi dengan tambahan investasi),
--     Hasil investasi dari premi yang ditempatkan pada dana investasi yang
--     dinyatakan dalam unit, kinerja imbal hasilnya tergantung pada kinerja
--     subdana investasi unit link yang dipilih nasabah sesuai dengan kondisi pasar
--     saham dan pasar uang.
--     6. Sewa Jangka Panjang Dibayar Dimuka,
--     Sewa pada awal atau saat terjadinya transaksi dan belum dirasakan manfaat
--     ekonominya.
--     7. Hak pengelolaan/pengusahaan yang dimiliki perseorangan
--     Hak yang dimiliki perseorangan dalam pengelolaan atau pengusahaan objek
--     tertentu dan periode waktu tertentu yang diberikan oleh instansi atau
--     perseorangan.

MODEL (
  name staging.harta_lainnya,
  dialect duckdb,
  kind VIEW,
  tags [staging]
);

SELECT * FROM source.harta
WHERE kategori_harta = 'DHL'