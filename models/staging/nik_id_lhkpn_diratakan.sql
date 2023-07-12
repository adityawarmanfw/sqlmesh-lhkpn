MODEL (
  name staging.nik_id_lhkpn_diratakan,
  dialect duckdb,
  kind FULL,
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
  id_data::VARCHAR,
  any_value(nik)::VARCHAR AS nik,
  any_value(nama_provinsi)::VARCHAR AS nama_provinsi,
  any_value(nama_kota_kabupaten)::VARCHAR AS nama_kota_kabupaten,
  any_value(nama_kecamatan)::VARCHAR AS nama_kecamatan 
FROM nik_id_lhkpn_diratakan
GROUP BY 1