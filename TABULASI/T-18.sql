SELECT 
    kode_prov, kab, dinding,
    SUM(CASE WHEN klasifikasi = 1 THEN 1 ELSE 0 END) as 'perkotaan',
    SUM(CASE WHEN klasifikasi = 2 THEN 1 ELSE 0 END) as 'pedesaan'
    
FROM 
    (
        SELECT 
            kode_prov, kode_kab as kab, klas as klasifikasi,
            CASE WHEN (r806=1) THEN 'tembok'
            WHEN (r806=2) THEN 'plesteran anyaman' 
            WHEN (r806=3) THEN 'kayu' 
            WHEN (r806=4) THEN 'anyaman bambu' 
            WHEN (r806=5) THEN 'batang kayu' 
            WHEN (r806=6) THEN 'bambu' 
            WHEN (r806=7) THEN 'lainnya' 
            END AS dinding 
        FROM [SP2020C2_Validasi].[dbo].[C2_t_rt]
        where r805 is not null
    )t1
GROUP BY
    kode_prov, t1.kab, dinding
ORDER BY
    kode_prov, t1.kab, dinding