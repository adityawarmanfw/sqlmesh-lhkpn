-- Hutang adalah kewajiban yang timbul dari transaksi masa lalu yang penyelesaiannya
-- di masa yang akan datang menuntut pengorbanan sumber daya ekonomi baik berupa
-- uang atau barang.

MODEL (
  name staging.hutang,
  dialect duckdb,
  kind VIEW,
  tags [staging]
);

SELECT * FROM source.harta
WHERE kategori_harta = 'DH'