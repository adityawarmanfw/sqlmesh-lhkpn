MODEL (
  name source.tabel_situs,
  dialect duckdb,
  kind FULL,
  tags [source, parquet]
);

SELECT DISTINCT
    data_id::VARCHAR AS id_data,
    lhkpn::VARCHAR AS lhkpn,
    lhkpnori::VARCHAR AS lhkpn_ori,
    REGEXP_REPLACE(nik, '[^0-9]+', '', 'g')::VARCHAR AS nik,
    UPPER(nama)::VARCHAR AS nama,
    UPPER(lembaga)::VARCHAR AS lembaga,
    UPPER(unit_kerja)::VARCHAR AS unit_kerja,
    UPPER(jabatan)::VARCHAR AS jabatan,
    UPPER(tanggal_lapor)::VARCHAR AS tanggal_lapor,
    jenis_laporan::VARCHAR AS jenis_laporan,
    total_harta::BIGINT AS total_harta
FROM read_parquet('../data/tabel_situs.parquet')
