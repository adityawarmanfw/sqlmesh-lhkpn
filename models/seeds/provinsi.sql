MODEL (
    name seeds.provinsi,
    kind SEED (
        path '../../seeds/provinsi.csv'
    ),
    columns (
        id_provinsi BIGINT,  
        nama_provinsi VARCHAR,
    )
);
