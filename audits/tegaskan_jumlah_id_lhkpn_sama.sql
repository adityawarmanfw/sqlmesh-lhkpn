AUDIT (
  name tegaskan_jumlah_id_lhkpn_sama,
  dialect duckdb
);

SELECT x-y
FROM (SELECT COUNT(DISTINCT @kolom) AS x FROM @this_model)
CROSS JOIN (SELECT COUNT(DISTINCT @kolom) AS y FROM @tabel)
WHERE x-y > 0
