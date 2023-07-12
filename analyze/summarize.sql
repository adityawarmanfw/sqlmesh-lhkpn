
-- sources

SELECT 
  'source.detail_laporan' AS tbl, 
  COUNT(*) AS row_count, 
  COUNT(DISTINCT id_data) AS id_data_unique, 
  COUNT(DISTINCT id_lhkpn) AS id_lhkpn_unique 
FROM source.detail_laporan
UNION
SELECT 
  'source.gagal' AS tbl, 
  COUNT(*) AS row_count, 
  COUNT(DISTINCT id_data) AS id_data_unique, 
  NULL AS id_lhkpn_unique 
FROM source.detail_laporan
UNION
SELECT 
  'source.harta' AS tbl, 
  COUNT(*) AS row_count, 
  COUNT(DISTINCT id_data) AS id_data_unique, 
  NULL AS id_lhkpn_unique 
FROM source.harta
UNION
SELECT 
  'source.laporan' AS tbl, 
  COUNT(*) AS row_count, 
  COUNT(DISTINCT id_data) AS id_data_unique, 
  COUNT(DISTINCT id_lhkpn) AS id_lhkpn_unique 
FROM source.laporan
UNION
SELECT 
  'source.ringkasan_harta' AS tbl, 
  COUNT(*) AS row_count, 
  COUNT(DISTINCT id_data) AS id_data_unique, 
  NULL AS id_lhkpn_unique 
FROM source.ringkasan_harta
UNION
SELECT 
  'source.tabel_situs' AS tbl, 
  COUNT(*) AS row_count, 
  COUNT(DISTINCT id_data) AS id_data_unique, 
  NULL AS id_lhkpn_unique 
FROM source.tabel_situs

-- staging

UNION
SELECT 
  'staging.nik_id_lhkpn_diratakan' AS tbl, 
  COUNT(*) AS row_count, 
  COUNT(DISTINCT id_data) AS id_data_unique, 
  NULL AS id_lhkpn_unique 
FROM staging.nik_id_lhkpn_diratakan

-- intermediate

UNION
SELECT 
  'intermediate.nik_detail_laporan' AS tbl, 
  COUNT(*) AS row_count, 
  NULL AS id_data_unique, 
  COUNT(DISTINCT id_lhkpn) AS id_lhkpn_unique 
FROM intermediate.nik_detail_laporan