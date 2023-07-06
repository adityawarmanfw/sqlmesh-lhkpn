MODEL (
    name seeds.desa,
    kind SEED (
        path '../../seeds/desa.csv'
    ),
    columns (
        id_desa BIGINT,  
        id_kecamatan BIGINT,
        nama_desa VARCHAR,
    )
);
