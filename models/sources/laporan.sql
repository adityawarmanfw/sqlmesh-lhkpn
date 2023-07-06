MODEL (
  name source.laporan,
  dialect duckdb,
  kind FULL,
  tags [source, parquet]
);

SELECT     
    data_id::VARCHAR AS id_data,
    lhkpn_id::VARCHAR AS id_lhkpn,
    lhkpn_prev_id::VARCHAR AS id_lhkpn_sebelumnya,
    pn_id::VARCHAR AS id_penyelenggara_negara,
    jenis_laporan::VARCHAR AS jenis_laporan,
    status::VARCHAR AS status_laporan,
    entry_via::VARCHAR AS entry_via,
    is_active::VARCHAR AS is_active,
    selected_1::BIGINT AS selected_1,
    selected_2::BIGINT AS selected_2,
    tgl_kirim::DATE AS tgl_kirim,
    tgl_kirim_final::DATE AS tgl_kirim_final,
    tgl_lapor::DATE AS tgl_lapor
FROM read_parquet('../data/laporan.parquet')
