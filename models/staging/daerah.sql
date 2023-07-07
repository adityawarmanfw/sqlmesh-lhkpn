MODEL (
  name staging.daerah,
  dialect duckdb,
  kind FULL,
  tags [staging]
);

SELECT 
    id_provinsi::BIGINT AS id_provinsi,
    id_kota_kabupaten::BIGINT AS id_kota_kabupaten,
    id_kecamatan::BIGINT AS id_kecamatan,
    nama_provinsi::VARCHAR,
    nama_kota_kabupaten::VARCHAR,
    UPPER(nama_kecamatan)::VARCHAR AS nama_kecamatan
FROM seeds.kecamatan 
LEFT JOIN seeds.kota_kabupaten USING (id_kota_kabupaten)
LEFT JOIN seeds.provinsi USING (id_provinsi)
