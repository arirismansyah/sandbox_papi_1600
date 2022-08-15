SELECT 
    kode_prov, kab, umur_art,
    SUM(CASE WHEN (r402b is null and r402a is not null) THEN 1 ELSE 0 END)as 'punya',
    SUM(CASE WHEN r402b = 1 THEN 1 ELSE 0 END) as 'dokumen_hilang',
    SUM(CASE WHEN r402b = 2 THEN 1 ELSE 0 END) as 'belum_punya',
    SUM(CASE WHEN r402b = 3 THEN 1 ELSE 0 END) as 'kk_ktp_di_tempat_lain',
    SUM(CASE WHEN r402b = 4 THEN 1 ELSE 0 END) as 'lainnya'
    
FROM 
    (
        SELECT 
            kode_prov, kode_kab as kab, r306 as umur_art, r402a, r402b
        FROM [SP2020C2_Validasi].[dbo].[C2_t_art]
    )t1
GROUP BY
    kode_prov, t1.kab, umur_art
ORDER BY
    kode_prov, t1.kab, umur_art