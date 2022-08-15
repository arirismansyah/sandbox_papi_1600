SELECT
	art.[kode_prov],
	art.[kode_kab],
	art.umur,
	SUM(CASE WHEN art.ijazah = 1 THEN 1 ELSE 0 END) as belum_sekolah,
    SUM(CASE WHEN art.ijazah = 2 THEN 1 ELSE 0 END) as belum_tamat_sd,
    SUM(CASE WHEN art.ijazah = 3 THEN 1 ELSE 0 END) as sd_paket_a,
    SUM(CASE WHEN art.ijazah = 4 THEN 1 ELSE 0 END) as smp_paket_b,
    SUM(CASE WHEN art.ijazah = 5 THEN 1 ELSE 0 END) as sma_paket_c,
    SUM(CASE WHEN art.ijazah = 6 THEN 1 ELSE 0 END) as diploma,
    SUM(CASE WHEN art.ijazah = 7 THEN 1 ELSE 0 END) as sarjana,
    SUM(CASE WHEN art.ijazah = 8 THEN 1 ELSE 0 END) as Profesi,
    SUM(CASE WHEN art.ijazah = 9 THEN 1 ELSE 0 END) as S2_S3

FROM(

SELECT 
	[kode_prov],
	[kode_kab],
	[r306] as umur,
	[r431] as ijazah
FROM [SP2020C2_Validasi].[dbo].[C2_t_art]

) art
group by art.[kode_prov],art.[kode_kab], art.umur
order by art.[kode_prov],art.[kode_kab], art.umur