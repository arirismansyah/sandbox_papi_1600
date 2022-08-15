SELECT
	kode_prov, 
    kab, 
    SUM(CASE WHEN (r606b  = 0) THEN 1 ELSE 0 END) '0',
    SUM(CASE WHEN r606b = 1 THEN 1 ELSE 0 END) as '1',
    SUM(CASE WHEN r606b = 2 THEN 1 ELSE 0 END) as '2',
    SUM(CASE WHEN r606b = 3 THEN 1 ELSE 0 END) as '3',
    SUM(CASE WHEN r606b = 4 THEN 1 ELSE 0 END) as '4',
    SUM(CASE WHEN r606b = 5 THEN 1 ELSE 0 END) as '5',
    SUM(CASE WHEN r606b = 6 THEN 1 ELSE 0 END) as '6',
    SUM(CASE WHEN r606b = 7 THEN 1 ELSE 0 END) as '7',
    SUM(CASE WHEN r606b = 8 THEN 1 ELSE 0 END) as '8',
    SUM(CASE WHEN r606b = 9 THEN 1 ELSE 0 END) as '9',
    SUM(CASE WHEN r606b = 10 THEN 1 ELSE 0 END) as '10',
    SUM(CASE WHEN r606b = 11 THEN 1 ELSE 0 END) as '11',
    SUM(CASE WHEN r606b = 12 THEN 1 ELSE 0 END) as '12',
    SUM(CASE WHEN r606b = 13 THEN 1 ELSE 0 END) as '13',
    SUM(CASE WHEN r606b = 14 THEN 1 ELSE 0 END) as '14',
    SUM(CASE WHEN r606b = 15 THEN 1 ELSE 0 END) as '15',
    SUM(CASE WHEN r606b = 16 THEN 1 ELSE 0 END) as '16',
    SUM(CASE WHEN r606b = 17 THEN 1 ELSE 0 END) as '17',
    SUM(CASE WHEN r606b = 18 THEN 1 ELSE 0 END) as '18',
    SUM(CASE WHEN r606b = 19 THEN 1 ELSE 0 END) as '19',
    SUM(CASE WHEN r606b = 20 THEN 1 ELSE 0 END) as '20',
    SUM(CASE WHEN r606b = 21 THEN 1 ELSE 0 END) as '21',
    SUM(CASE WHEN r606b = 22 THEN 1 ELSE 0 END) as '22',
    SUM(CASE WHEN r606b = 23 THEN 1 ELSE 0 END) as '23',
    SUM(CASE WHEN CAST(r606b AS int) != r606b THEN 1 ELSE 0 END) as 'Lainnya (r606b desimal)',
    SUM(CASE WHEN r606b is null THEN 1 ELSE 0 END) as 'r606b null'
FROM 
    (
        SELECT 
			kode_prov,
            kode_kab as kab, 
            r606b_hari as r606b
        FROM
            [SP2020C2_Validasi].[dbo].[C2_t_r601]
        WHERE 
            r606b_hari is not null
    )t1
GROUP BY
    kode_prov, kab
ORDER BY
    kode_prov, kab