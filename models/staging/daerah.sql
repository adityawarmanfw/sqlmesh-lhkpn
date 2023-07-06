MODEL (
  name staging.daerah,
  dialect duckdb,
  kind FULL,
  tags [staging]
);

SELECT 
    id_provinsi,
    id_kota_kabupaten,
    id_kecamatan,
    id_desa,
    nama_provinsi,
    nama_kota_kabupaten,
    UPPER(nama_kecamatan) AS nama_kecamatan,
    UPPER(nama_desa) AS nama_desa
FROM seeds.desa
LEFT JOIN seeds.kecamatan USING (id_kecamatan)
LEFT JOIN seeds.kota_kabupaten USING (id_kota_kabupaten)
LEFT JOIN seeds.provinsi USING (id_provinsi)