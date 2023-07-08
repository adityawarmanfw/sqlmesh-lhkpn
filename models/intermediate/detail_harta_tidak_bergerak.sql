MODEL (
  name intermediate.detail_harta_tidak_bergerak,
  dialect duckdb,
  kind VIEW,
  tags [intermediate]
);


WITH stg AS (
    SELECT
        id_data,
        id_harta,
        kategori_harta,
        nilai_harta,
        deskripsi_harta,
        TRIM(SPLIT(deskripsi_harta, 'SELUAS')[1]) AS bentuk_harta,
        TRIM(SPLIT(SPLIT(deskripsi_harta, 'SELUAS')[2], 'DI')[1]) AS luas_harta,
        CASE WHEN REGEXP_MATCHES(deskripsi_harta, 'DI NEGARA') 
          THEN TRIM(SPLIT(SPLIT(deskripsi_harta, 'DI NEGARA')[2], ',')[1])
          ELSE TRIM(SPLIT(SPLIT(deskripsi_harta, 'DI KAB / KOTA')[2], ',')[1])
        END AS lokasi_harta,
        CASE WHEN REGEXP_MATCHES(deskripsi_harta, 'DI NEGARA')
          THEN TRIM(SPLIT(SPLIT(deskripsi_harta, 'DI NEGARA')[2], ',')[2])
          ELSE TRIM(SPLIT(SPLIT(deskripsi_harta, 'DI KAB / KOTA')[2], ',')[2])
        END AS asal_usul_harta
    FROM staging.harta_tidak_bergerak 
), split_luas_harta AS (
    SELECT
        *,
        CASE WHEN REGEXP_MATCHES(bentuk_harta, 'TANAH')
          THEN TRIM(SPLIT(SPLIT(luas_harta, '/')[1], ' ')[1])
          ELSE NULL
        END AS luas_tanah,
        CASE WHEN REGEXP_MATCHES(bentuk_harta, 'TANAH')
          THEN TRIM(SPLIT(SPLIT(luas_harta, '/')[2], ' ')[1])
          ELSE TRIM(SPLIT(SPLIT(luas_harta, '/')[1], ' ')[1])
        END AS luas_bangunan
    FROM stg
)

SELECT
    id_data::VARCHAR,
    nik::VARCHAR,
    nama_provinsi::VARCHAR,
    nama_kota_kabupaten::VARCHAR,
    nama_kecamatan::VARCHAR,
    id_lhkpn::VARCHAR,
    lembaga::VARCHAR,
    unit_kerja::VARCHAR,
    sub_unit_kerja::VARCHAR,
    gelar_depan::VARCHAR,
    nama::VARCHAR,
    gelar_belakang::VARCHAR,
    nama_jabatan::VARCHAR,
    deskripsi_jabatan::VARCHAR,
    deskripsi_jenis_laporan::VARCHAR,
    tgl_kirim::DATE,
    tgl_lapor::DATE,
    tgl_kirim_final::DATE,
    id_harta::BIGINT,
    kategori_harta::VARCHAR,
    deskripsi_harta::VARCHAR,
    bentuk_harta::VARCHAR,
    luas_harta::VARCHAR,
    lokasi_harta::VARCHAR,
    asal_usul_harta::VARCHAR,
    TRY_CAST(luas_tanah AS DOUBLE) AS luas_tanah,
    TRY_CAST(luas_bangunan AS DOUBLE) AS luas_bangunan,
    nilai_harta::BIGINT
FROM split_luas_harta
LEFT JOIN intermediate.nik_detail_laporan nik_detail_laporan 
  ON nik_detail_laporan.id_lhkpn = split_luas_harta.id_data