SELECT
	art.[kode_prov],
	art.[kode_kab],
	art.umur,
	SUM(CASE WHEN art.perkawinan = 1 THEN 1 ELSE 0 END) as belum_kawin,
    SUM(CASE WHEN art.perkawinan = 2 THEN 1 ELSE 0 END) as kawin,
    SUM(CASE WHEN art.perkawinan = 3 THEN 1 ELSE 0 END) as cerai_hidup,
    SUM(CASE WHEN art.perkawinan = 4 THEN 1 ELSE 0 END) as cerai_mati
    
FROM(

SELECT 
	[kode_prov],
	[kode_kab],
	[r306] as umur,
	[r307] as perkawinan
FROM [SP2020C2_Validasi].[dbo].[C2_t_art]

) art
group by art.[kode_prov],art.[kode_kab], art.umur
order by art.[kode_prov],art.[kode_kab], art.umur