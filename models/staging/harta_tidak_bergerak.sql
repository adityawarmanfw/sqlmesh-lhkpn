-- Harta Tidak Bergerak yang dilaporkan adalah tanah dan atau bangunan serta segala
-- sesuatu yang berwujud yang didirikan/diadakan dan melekat di atas bumi serta 
-- seluruh sumber daya alam yang terkandung di dalam tanah yang memiliki nilai
-- komersil.
-- Termasuk dalam kelompok ini adalah tanah dan atau bangunan yang dimiliki, baik
-- yang ada di dalam negeri maupun di luar negeri.

MODEL (
  name staging.harta_tidak_bergerak,
  dialect duckdb,
  kind VIEW,
  tags [staging]
);

SELECT * FROM source.harta
WHERE kategori_harta = 'DHTB'