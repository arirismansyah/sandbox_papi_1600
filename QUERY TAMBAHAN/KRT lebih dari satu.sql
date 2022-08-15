SELECT 
*

FROM (
	SELECT 
	[kode_prov],
	[kode_kab],
	[kode_kec],
	[kode_desa],
	[nbs],
	[no_rt],
	[no] as nomor_urut_art_v1,
	r301 as nomor_urut_art_v2,
	r302 as nama,
	[r303] as hubungan_krt
	FROM [SP2020C2_Validasi].[dbo].[C2_t_art]
	WHERE r303=1
) art1

inner join(
	SELECT
	[kode_prov],
	[kode_kab],
	[kode_kec],
	[kode_desa],
	[nbs],
	[no_rt],
	[no] as nomor_urut_art_v1,
	r301 as nomor_urut_art_v2,
	r302 as nama,
	[r303] as hubungan_krt
	FROM [SP2020C2_Validasi].[dbo].[C2_t_art]
	WHERE r303=1
) art2 on 
	art1.[kode_prov] = art2.[kode_prov] and
	art1.[kode_kab] = art2.[kode_kab] and
	art1.[kode_kec] = art2.[kode_kec] and
	art1.[kode_desa] = art2.[kode_desa] and
	art1.[nbs] = art2.[nbs] and
	art1.[no_rt] = art2.[no_rt]

where art1.nomor_urut_art_v1 != art2.nomor_urut_art_v1 and art1.nomor_urut_art_v2 != art2.nomor_urut_art_v2