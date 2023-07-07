MODEL (
  name staging.nik_daerah,
  dialect duckdb,
  kind VIEW,
  tags [staging]
);

SELECT 
    id_data,
    nik,
    nama_provinsi,
    nama_kota_kabupaten,
    nama_kecamatan
FROM source.tabel_situs tabel_situs
LEFT JOIN staging.daerah daerah
  ON LEFT(tabel_situs.nik, 6) = daerah.id_kecamatan
