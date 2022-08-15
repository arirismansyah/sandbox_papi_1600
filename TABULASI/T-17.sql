SELECT 
    kode_prov, kab, atap,
    SUM(CASE WHEN klasifikasi = 1 THEN 1 ELSE 0 END) as 'perkotaan',
    SUM(CASE WHEN klasifikasi = 2 THEN 1 ELSE 0 END) as 'pedesaan'
    
FROM 
    (
        SELECT 
            kode_prov, kode_kab as kab, klas as klasifikasi,
            CASE WHEN (r805=1) THEN 'beton'
            WHEN (r805=2) THEN 'genteng' 
            WHEN (r805=3) THEN 'seng' 
            WHEN (r805=4) THEN 'asbes' 
            WHEN (r805=5) THEN 'bambu' 
            WHEN (r805=6) THEN 'kayu' 
            WHEN (r805=7) THEN 'jerami' 
            WHEN (r805=8) THEN 'lainnya' 
            END AS atap 
        FROM [SP2020C2_Validasi].[dbo].[C2_t_rt]
        where r805 is not null
    )t1
GROUP BY
    kode_prov, kab, atap
ORDER BY
    kode_prov, kab, atap