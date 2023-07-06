MODEL (
    name seeds.kota_kabupaten,
    kind SEED (
        path '../../seeds/kota_kabupaten.csv'
    ),
    columns (
        id_kota_kabupaten BIGINT,  
        id_provinsi BIGINT,
        nama_kota_kabupaten VARCHAR,
    )
);
