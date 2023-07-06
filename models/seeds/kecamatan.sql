MODEL (
    name seeds.kecamatan,
    kind SEED (
        path '../../seeds/kecamatan.csv'
    ),
    columns (
        id_kecamatan BIGINT,  
        id_kota_kabupaten BIGINT,
        nama_kecamatan VARCHAR,
    )
);
