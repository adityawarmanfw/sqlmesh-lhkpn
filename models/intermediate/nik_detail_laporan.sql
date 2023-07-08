MODEL (
  name intermediate.nik_detail_laporan,
  dialect duckdb,
  kind FULL,
  tags [intermediate],
  audits [tegaskan_jumlah_id_lhkpn_sama(kolom=id_lhkpn, tabel=source.detail_laporan)]
);

SELECT 
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
FROM source.detail_laporan detail_laporan
LEFT JOIN staging.nik_id_lhkpn_diratakan nik_id_lhkpn_diratakan
    ON detail_laporan.id_data = nik_id_lhkpn_diratakan.id_data