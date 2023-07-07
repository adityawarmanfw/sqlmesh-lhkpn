MODEL (
  name intermediate.nik_detail_laporan,
  dialect duckdb,
  kind FULL,
  tags [intermediate],
  audits [tegaskan_jumlah_id_lhkpn_sama(kolom=id_lhkpn, tabel=source.detail_laporan)]
);

SELECT 
    nik, 
    nama_provinsi,
    nama_kota_kabupaten,
    nama_kecamatan,
    id_lhkpn,
    lembaga,
    unit_kerja,
    sub_unit_kerja,
    gelar_depan,
    nama,
    gelar_belakang,
    nama_jabatan,
    deskripsi_jabatan,
    deskripsi_jenis_laporan,
    tgl_kirim,
    tgl_lapor,
    tgl_kirim_final
FROM source.detail_laporan detail_laporan
LEFT JOIN staging.nik_id_lhkpn_diratakan nik_id_lhkpn_diratakan
    ON detail_laporan.id_data = nik_id_lhkpn_diratakan.id_data