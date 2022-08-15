SELECT 
art.[kode_prov],
art.[kode_kab],
art.umur,
SUM(CASE WHEN rt.[klas]=1 THEN 1 ELSE 0 END) as perkotaan,
SUM(CASE WHEN rt.[klas]=2 THEN 1 ELSE 0 END) as pedesaan

FROM (
	SELECT 
	[kode_prov],
	[kode_kab],
	[kode_kec],
	[kode_desa],
	[nbs],
	[no_rt],
	[no],
	[r306] as umur
	FROM [SP2020C2_Validasi].[dbo].[C2_t_art]
) art

inner join(
	SELECT distinct
	[kode_prov],
	[kode_kab],
	[kode_kec],
	[kode_desa],
	[nbs],
	[no_rt],
	[klas]
	
	FROM [SP2020C2_Validasi].[dbo].[C2_t_rt]
) rt on 
	art.[kode_prov] = rt.[kode_prov] and
	art.[kode_kab] = rt.[kode_kab] and
	art.[kode_kec] = rt.[kode_kec] and
	art.[kode_desa] = rt.[kode_desa] and
	art.[nbs] = rt.[nbs] and
	art.[no_rt] = rt.[no_rt]

group by art.[kode_prov], art.[kode_kab], art.umur
order by art.[kode_prov], art.[kode_kab], art.umur