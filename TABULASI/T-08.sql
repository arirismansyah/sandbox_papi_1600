SELECT 
    kode_prov, kab, status_bekerja,
    SUM(CASE WHEN (r427=1) THEN 1 ELSE 0 END) as 'komuter',
    SUM(CASE WHEN (r427=2) THEN 1 ELSE 0 END) as 'tidak_komuter'
    
FROM 
    (
        SELECT 
            kode_prov, kode_kab as kab, r427,
            CASE WHEN (r432=1 or r433=1) THEN 'bekerja'
            WHEN (r432=2 and r433=2) THEN 'tidak_bekerja' END AS status_bekerja
        FROM [SP2020C2_Validasi].[dbo].[C2_t_art]
        where (r432 is not null and r433 is not null)
        
    )t1
GROUP BY
    kode_prov, t1.kab, status_bekerja
ORDER BY
    kode_prov, t1.kab, status_bekerja