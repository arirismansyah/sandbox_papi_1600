SELECT 
	kode_prov,
    kab, 
    SUM(CASE WHEN (r606a  = 0) THEN 1 ELSE 0 END) as '0',
    SUM(CASE WHEN r606a = 1 THEN 1 ELSE 0 END) as '1',
    SUM(CASE WHEN r606a = 2 THEN 1 ELSE 0 END) as '2',
    SUM(CASE WHEN r606a = 3 THEN 1 ELSE 0 END) as '3',
    SUM(CASE WHEN r606a = 4 THEN 1 ELSE 0 END) as '4',
    SUM(CASE WHEN r606a = 5 THEN 1 ELSE 0 END) as '5',
    SUM(CASE WHEN r606a = 6 THEN 1 ELSE 0 END) as '6',
    SUM(CASE WHEN r606a = 7 THEN 1 ELSE 0 END) as '7',
    SUM(CASE WHEN r606a = 8 THEN 1 ELSE 0 END) as '8',
    SUM(CASE WHEN r606a = 9 THEN 1 ELSE 0 END) as '9',
    SUM(CASE WHEN r606a = 10 THEN 1 ELSE 0 END) as '10',
    SUM(CASE WHEN r606a = 11 THEN 1 ELSE 0 END) as '11',
    SUM(CASE WHEN r606a = 12 THEN 1 ELSE 0 END) as '12',
    SUM(CASE WHEN r606a = 13 THEN 1 ELSE 0 END) as '13',
    SUM(CASE WHEN r606a = 14 THEN 1 ELSE 0 END) as '14',
    SUM(CASE WHEN r606a = 15 THEN 1 ELSE 0 END) as '15',
    SUM(CASE WHEN r606a = 16 THEN 1 ELSE 0 END) as '16',
    SUM(CASE WHEN r606a = 17 THEN 1 ELSE 0 END) as '17',
    SUM(CASE WHEN r606a = 18 THEN 1 ELSE 0 END) as '18',
    SUM(CASE WHEN r606a = 19 THEN 1 ELSE 0 END) as '19',
    SUM(CASE WHEN r606a = 20 THEN 1 ELSE 0 END) as '20',
    SUM(CASE WHEN r606a = 21 THEN 1 ELSE 0 END) as '21',
    SUM(CASE WHEN r606a = 22 THEN 1 ELSE 0 END) as '22',
    SUM(CASE WHEN r606a = 23 THEN 1 ELSE 0 END) as '23',
    SUM(CASE WHEN r606a = 24 THEN 1 ELSE 0 END) as '24',
    SUM(CASE WHEN r606a = 25 THEN 1 ELSE 0 END) as '25',
    SUM(CASE WHEN r606a = 26 THEN 1 ELSE 0 END) as '26',
    SUM(CASE WHEN r606a = 27 THEN 1 ELSE 0 END) as '27',
    SUM(CASE WHEN r606a = 28 THEN 1 ELSE 0 END) as '28',
    SUM(CASE WHEN r606a = 29 THEN 1 ELSE 0 END) as '29',
    SUM(CASE WHEN CAST(r606a AS int) != r606a THEN 1 ELSE 0 END) 'Lainnya (r606a desimal)',
    SUM(CASE WHEN r606a is null THEN 1 ELSE 0 END) 'r606a null'
FROM 
    (
        SELECT 
			kode_prov,
            kode_kab as kab, 
            r606a_hari as r606a
        FROM
            [SP2020C2_Validasi].[dbo].[C2_t_r601]
        WHERE 
            r606a_hari is not null
    )t1
GROUP BY
    kode_prov, kab
ORDER BY
    kode_prov, kab