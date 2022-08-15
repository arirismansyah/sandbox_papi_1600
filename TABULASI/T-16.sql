SELECT 
    kode_prov, kab, kepemilikan,
    SUM(CASE WHEN klasifikasi = 1 THEN 1 ELSE 0 END) as 'perkotaan',
    SUM(CASE WHEN klasifikasi = 2 THEN 1 ELSE 0 END) as 'pedesaan'
    
FROM 
    (
        SELECT 
            kode_prov, kode_kab as kab,klas as klasifikasi,
            CASE WHEN (r801=1) THEN 'milik_sendiri'
            WHEN (r801=2) THEN 'kontrak_sewa' 
            WHEN (r801=3) THEN 'bebas_sewa' 
            WHEN (r801=4) THEN 'dinas' 
            WHEN (r801=5) THEN 'lainnya' 
            END AS kepemilikan 
        FROM [SP2020C2_Validasi].[dbo].[C2_t_rt]
        where r801 is not null
    )t1
GROUP BY
    kode_prov, kab, kepemilikan
ORDER BY
    kode_prov, kab, kepemilikan