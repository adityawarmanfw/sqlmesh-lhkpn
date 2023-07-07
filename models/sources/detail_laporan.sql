MODEL (
  name source.detail_laporan,
  dialect duckdb,
  kind FULL,
  tags [source, parquet]
);

SELECT DISTINCT
    data_id::VARCHAR AS id_data,
    lhkpn_id::VARCHAR AS id_lhkpn,
    nhk::VARCHAR AS nhk,
    UPPER(lembaga)::VARCHAR AS lembaga,
    UPPER(unit_kerja)::VARCHAR AS unit_kerja,
    UPPER(sub_unit_kerja)::VARCHAR AS sub_unit_kerja,
    gelar_depan::VARCHAR AS gelar_depan,
    UPPER(nama)::VARCHAR AS nama,
    gelar_belakang::VARCHAR AS gelar_belakang,
    UPPER(jabatan_nama)::VARCHAR AS nama_jabatan,
    UPPER(jabatan_deskripsi)::VARCHAR AS deskripsi_jabatan,
    UPPER(jenis_laporan_deskripsi)::VARCHAR AS deskripsi_jenis_laporan,
    UPPER(jenis_laporan_id)::VARCHAR AS id_jenis_laporan,
    entry_via::VARCHAR AS entry_via,
    tgl_kirim::DATE AS tgl_kirim,
    tgl_lapor::DATE AS tgl_lapor,
    tgl_kirim_final::DATE AS tgl_kirim_final
FROM read_parquet('../data/detail_laporan.parquet')

