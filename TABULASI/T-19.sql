SELECT 
    kode_prov, kab, lantai,
    SUM(CASE WHEN klasifikasi = 1 THEN 1 ELSE 0 END) as 'perkotaan',
    SUM(CASE WHEN klasifikasi = 2 THEN 1 ELSE 0 END) as 'pedesaan'
    
FROM 
    (
        SELECT 
            kode_prov, kode_kab as kab, klas as klasifikasi,
            CASE WHEN (r807=1) THEN 'marmer'
            WHEN (r807=2) THEN 'keramik' 
            WHEN (r807=3) THEN 'parket' 
            WHEN (r807=4) THEN 'ubin' 
            WHEN (r807=5) THEN 'kayu/papan' 
            WHEN (r807=6) THEN 'semen'
            WHEN (r807=7) THEN 'bambu'
            WHEN (r807=8) THEN 'tanah'
            WHEN (r807=9) THEN 'lainnya' 
            END AS lantai 
        FROM [SP2020C2_Validasi].[dbo].[C2_t_rt]
        where r805 is not null
    )t1
GROUP BY
    kode_prov, t1.kab, lantai
ORDER BY
    kode_prov, t1.kab, lantai