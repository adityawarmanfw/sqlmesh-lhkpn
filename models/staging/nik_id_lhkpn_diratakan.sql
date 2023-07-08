MODEL (
  name staging.nik_id_lhkpn_diratakan,
  dialect duckdb,
  kind VIEW,
  tags [staging]
);

WITH nik_id_data AS (
  SELECT
      nik,
      nama_provinsi,
      nama_kota_kabupaten,
      nama_kecamatan,
      id_data, 
      id_lhkpn, 
      id_lhkpn_sebelumnya
  FROM source.laporan
  LEFT JOIN staging.nik_daerah USING (id_data)
), nik_id_lhkpn_diratakan AS (
  SELECT 
      nik,
      nama_provinsi,
      nama_kota_kabupaten,
      nama_kecamatan,
      id_data AS id_data
  FROM nik_id_data
  UNION
  SELECT 
      nik, 
      nama_provinsi,
      nama_kota_kabupaten,
      nama_kecamatan,
      id_lhkpn AS id_data
  FROM nik_id_data
  UNION
  SELECT 
      nik,
      nama_provinsi,
      nama_kota_kabupaten,
      nama_kecamatan,
      id_lhkpn_sebelumnya AS id_data
  FROM nik_id_data
)

SELECT 
  nik::VARCHAR,
  nama_provinsi::VARCHAR,
  nama_kota_kabupaten::VARCHAR,
  nama_kecamatan::VARCHAR, 
  id_data::VARCHAR 
FROM nik_id_lhkpn_diratakan