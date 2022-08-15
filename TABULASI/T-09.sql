SELECT 
    kode_prov, kab, umur_art,
    SUM(CASE WHEN r304 = 1 THEN 1 ELSE 0 END) as 'laki-laki',
    SUM(CASE WHEN r304 = 2 THEN 1 ELSE 0 END) as 'perempuan',
    SUM(CASE WHEN (r304 != 1 and r304 != 2) THEN 1 ELSE 0 END) as 'di_luar_range'
    
FROM 
    (
        SELECT 
            kode_prov, kode_kab as kab, r306 as umur_art, r304
           FROM [SP2020C2_Validasi].[dbo].[C2_t_art]
    )t1
GROUP BY
    kode_prov, t1.kab, umur_art
ORDER BY
    kode_prov, t1.kab, umur_art