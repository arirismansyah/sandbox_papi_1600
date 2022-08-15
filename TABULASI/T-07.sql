SELECT 
    kode_prov, kab, umur_art,
    SUM(CASE WHEN (r432=1 or r433=1) THEN 1 ELSE 0 END) as 'bekerja',
    SUM(CASE WHEN (r432=2 and r433=2) THEN 1 ELSE 0 END) as 'tidak_bekerja'
    
FROM 
    (
        SELECT 
            kode_prov, kode_kab as kab, r306 as umur_art, r432, r433
        FROM [SP2020C2_Validasi].[dbo].[C2_t_art]
    )t1
GROUP BY
    kode_prov, t1.kab, umur_art
ORDER BY
    kode_prov, t1.kab, umur_art