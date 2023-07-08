-- Harta begerak di klasifikasikan kedalam 6 jenis, yaitu sebagai berikut:
--     1. Perabotan rumah tangga, contoh: meubelair, kompor gas, karpet, peralatan dapur, dll;
--     2. Barang elektronik, contoh: mesin pompa air, kulkas, AC, TV, sound system, komputer, gadget, mesin pemanas air, dll;
--     3. Perhiasan dan logam / batu mulia, contoh: emas batangan, gelang/kalung/cincin emas, berlian, batu mulia, batu akik, dll;
--     4. Barang seni/antik/koleksi, contoh: lukisan, keris antik, filateli, uang kuno, jam tangan, tas, mobil/motor antik, dll;
--     5. Persediaan, contoh: persediaan barang dagangan/barang jadi/barang setengah jadi, hewan ternak, ikan, dll; dan
--     6. Harta bergerak lainnya, contoh: peralatan olah raga, penunjang hobi, dll.

MODEL (
  name staging.harta_bergerak_lainnya,
  dialect duckdb,
  kind VIEW,
  tags [staging]
);

SELECT * FROM source.harta
WHERE kategori_harta = 'DHBL'