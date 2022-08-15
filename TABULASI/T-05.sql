SELECT
	art.[kode_prov],
	art.[kode_kab],
	art.umur,
	SUM(art.alh_tinggal_bersama) as alh_tinggal_bersama,
	SUM(art.alh_tidak_tinggal_bersama) as alh_tidak_tinggal_bersama
    
FROM(

SELECT 
	[kode_prov],
	[kode_kab],
	[r306] as umur,
	(r439a+r439b) as alh_tinggal_bersama,
	(r440a+r440b) as alh_tidak_tinggal_bersama
FROM [SP2020C2_Validasi].[dbo].[C2_t_art]
WHERE ([r306] between 15 and 49 ) and [r304]=2

) art
group by art.[kode_prov],art.[kode_kab], art.umur
order by art.[kode_prov],art.[kode_kab], art.umur