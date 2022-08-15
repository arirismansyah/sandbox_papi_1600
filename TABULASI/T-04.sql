SELECT
	art.[kode_prov],
	art.[kode_kab],
	art.umur,
	SUM(art.[r438]) as jml_anak_dilahirkan
    
FROM(

SELECT 
	[kode_prov],
	[kode_kab],
	[r306] as umur,
	[r438]
FROM [SP2020C2_Validasi].[dbo].[C2_t_art]
WHERE ([r306] between 15 and 49 ) and [r304]=2

) art
group by art.[kode_prov],art.[kode_kab], art.umur
order by art.[kode_prov],art.[kode_kab], art.umur