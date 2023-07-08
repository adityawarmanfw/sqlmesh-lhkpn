-- Surat Berharga adalah harta berupa hak kepemilikan atau hak kekayaan atas suatu
-- penyertaan modal atau investasi. Surat Berharga dalam laporan LHKPN ini
-- diklasifikasikan menjadi dua jenis, yaitu efek yang diperdagangkan di bursa (listing)
-- dan kepemilikan/penyertaan di Perusahaan non-listing.
-- 1. Efek yang diperdagangkan di bursa (listing).
--     a. Saham
--     Saham merupakan tanda penyertaan atau pemilikan seseorang atau
--     badan dalam suatu perusahaan atau Perseroan terbatas.
--     b. Bond (Obligasi)
--     Surat hutang yang menyatakan bahwa penerbitnya akan membayar
--     kembali utang pokoknya pada waktu tertentu, dan secara berkala akan
--     membayar kupon/bunga kepada pemegang obligasi.
--     c. Mutual Fund (Reksadana)
--     Wadah dan pola pengelolaan dana/modal bagi sekumpulan investor
--     untuk berinvestasi dalam instrumen-instrumen investasi yang tersedia
--     di Pasar dengan cara membeli unit penyertaan reksadana
--     d. Right
--     Surat berharga di mana pemodal diberi hak untuk membeli saham baru
--     yang dikeluarkan emiten. Kebijakan ini dilakukan untuk menambah
--     saham yang beredar guna menambah modal perusahaan.
--     e. Waran
--     Hak untuk membeli saham pada waktu dan harga yang sudah
--     ditentukan sebelumnya.
-- 2. Kepemilikan atau penyertaan di perusaan non listing.
-- Penyertaan atau pemilikan seseorang atau badan dalam suatu perusahaan
-- atau Perseroan terbatas yang tidak tercatat di bursa. (Saham pada PT non Tbk,
-- Simpanan pokok dan wajib pada koperasi, penyertaan modal pada
-- perusahaan persekutuan, firma, persekutuan komanditer atau badan hukum
-- lainnya non Tbk.)

MODEL (
  name staging.harta_surat_berharga,
  dialect duckdb,
  kind VIEW,
  tags [staging]
);

SELECT * FROM source.harta
WHERE kategori_harta = 'DHSB'