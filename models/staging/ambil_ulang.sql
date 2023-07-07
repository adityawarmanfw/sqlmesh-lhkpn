-- Tabel ini berisi daftar id_data yang gagal diambil
-- karena masalah koneksi dan tak memiliki ringkasan_harta

MODEL (
  name staging.ambil_ulang,
  dialect duckdb,
  kind VIEW,
  tags [staging]
);

WITH laporan_sebelumnya AS (
    SELECT 
        id_data AS id_data
    FROM source.laporan
    WHERE id_lhkpn IS NOT NULL
        AND id_lhkpn != 'QlF6c2hmYnJWTVIzM20wVjRXVkk4Zz09'
    UNION 
    SELECT
        id_lhkpn AS id_data
    FROM source.laporan
    WHERE id_lhkpn IS NOT NULL
        AND id_lhkpn != 'QlF6c2hmYnJWTVIzM20wVjRXVkk4Zz09'
    UNION
    SELECT
        id_lhkpn_sebelumnya AS id_data
    FROM source.laporan
    WHERE id_lhkpn IS NOT NULL
        AND id_lhkpn != 'QlF6c2hmYnJWTVIzM20wVjRXVkk4Zz09'
), laporan_gagal_ambil AS (
    SELECT id_data FROM source.gagal
), laporan_sebelumnya_dan_gagal_ambil AS (
    SELECT id_data FROM laporan_sebelumnya
    UNION
    SELECT id_data FROM laporan_gagal_ambil
)

SELECT laporan_sebelumnya_dan_gagal_ambil.id_data::VARCHAR AS id_data
FROM laporan_sebelumnya_dan_gagal_ambil
LEFT JOIN source.ringkasan_harta ringkasan_harta 
    ON laporan_sebelumnya_dan_gagal_ambil.id_data = ringkasan_harta.id_data
WHERE ringkasan_harta.id_data IS NULL
