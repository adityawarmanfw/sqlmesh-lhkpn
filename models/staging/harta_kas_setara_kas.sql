-- Kas (Uang Tunai) adalah dana tunai yang dimiliki, dipegang/disimpan per tanggal pelaporan.
-- Setara Kas (Deposito, Giro, Tabungan, lainnya) adalah kepemilikan dana
-- dalam bentuk simpanan di lembaga keuangan yang sifatnya sangat liquid, 
-- berjangka pendek dan yang dengan cepat dapat dijadikan kas dalam jumlah tertentu.

MODEL (
  name staging.harta_kas_dan_setara_kas,
  dialect duckdb,
  kind VIEW,
  tags [staging]
);

SELECT * FROM source.harta
WHERE kategori_harta = 'DHK'