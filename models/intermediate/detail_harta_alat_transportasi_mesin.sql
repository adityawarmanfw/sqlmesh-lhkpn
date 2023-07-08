-- deskripsi_harta kotor banget.

MODEL (
  name intermediate.detail_harta_alat_transportasi_mesin,
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
        TRIM(SPLIT(deskripsi_harta, ',')[1]) AS bentuk_harta,
        SPLIT(deskripsi_harta, ',')[LEN(SPLIT(deskripsi_harta, ','))] AS asal_usul_harta
    FROM staging.harta_alat_transportasi_mesin
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
    asal_usul_harta::VARCHAR,
    nilai_harta::BIGINT
FROM stg
LEFT JOIN intermediate.nik_detail_laporan nik_detail_laporan 
  ON nik_detail_laporan.id_lhkpn = stg.id_data
