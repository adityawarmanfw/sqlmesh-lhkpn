-- Termasuk dalam kelompok ini adalah setiap jenis alat transportasi dan mesin lainnya
-- yang dimiliki, baik untuk keperluan pribadi atau untuk keperluan usaha.

MODEL (
  name staging.harta_alat_transportasi_mesin,
  dialect duckdb,
  kind VIEW,
  tags [staging]
);

SELECT * FROM source.harta
WHERE kategori_harta = 'DHB'