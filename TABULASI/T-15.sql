SELECT 
    kode_prov, kab,
    SUM(CASE WHEN r705a = 1 THEN 1 ELSE 0 END) as 'masa_kehamilan',
    SUM(CASE WHEN r705b = 1 THEN 1 ELSE 0 END) as 'keguguran',
    SUM(CASE WHEN r705c = 1 THEN 1 ELSE 0 END) as 'persalinan',
    SUM(CASE WHEN r705d = 1 THEN 1 ELSE 0 END) as 'nifas'
    
FROM 
    (
        SELECT 
            kode_prov, kode_kab as kab, r705a, r705b, r705c, r705d
        FROM [SP2020C2_Validasi].[dbo].[C2_t_r701]
    )t1
GROUP BY
    kode_prov, kab
ORDER BY
    kode_prov, kab