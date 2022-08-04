SELECT * FROM(
SELECT distinct  
/**tidak boleh dihapus **/
	a.[kode_prov]
	,a.[kode_kab]
	,a.[kode_kec]
	,a.[kode_desa]
	,a.[nbs]
	,a.no_rt as no_rt
	, a.status_dok
	,b.b3k6 nama
	,r114
	,case when a.path_image is not null then '1' else '0' end as scan
	/**tidak boleh dihapus **/
	,'Agama anak 10 tahun ke bawah berbeda dengan KRT dan pasangan KRT' /**ket dapat diganti **/
	as stringcase /**tidak boleh dihapus **/
  FROM [SP2020C2_Validasi].[dbo].[C2_t_rt] a WITH (NOLOCK)
  left join [SP2020C2_Validasi].[dbo].m_dsrt b   WITH (NOLOCK) 
  on 
	a.[kode_prov] = b.kode_prov and 
	a.[kode_kab]	= b.kode_kab and
	a.[kode_kec]	=  b.kode_kec and
	a.[kode_desa]	=  b.kode_desa and 
	a.[nbs]		=  b.nbs and
	a.no_rt		=  b.no_dsrt
	/** contoh join dengan art **/ 
	inner join (
	
	/** QUERY 1600 here  **/
	
	SELECT distinct
	anak.[kode_prov],
	anak.[kode_kab],
	anak.[kode_kec],
	anak.[kode_desa],
	anak.[nbs],
	anak.[no_rt],
	anak.[no],
	anak.nama,
	anak.umur,
	anak.agama,
	anak.agama_lainnya,
	krt.nama_krt,
	krt.umur_krt,
	krt.agama_krt,
	krt.agama_lainnya_krt,
	pasangan_krt.nama_p_krt,
	pasangan_krt.umur_p_krt,
	pasangan_krt.agama_p_krt,
	pasangan_krt.agama_lainnya_p_krt
	
FROM (
	SELECT 
	distinct
	[kode_prov],
	[kode_kab],
	[kode_kec],
	[kode_desa],
	[nbs],
	[no_rt],
	[no],
	[r401] as nama,
	[r306] as umur,
	[r405] as agama,
	[r405_lain] as agama_lainnya
	
	FROM [SP2020C2_Validasi].[dbo].[C2_t_art]
	WHERE ([r306]<10) and ([r303] = 4) and ([kode_kab]='12')
) anak

inner join(
	SELECT distinct
	[kode_prov],
	[kode_kab],
	[kode_kec],
	[kode_desa],
	[nbs],
	[no_rt],
	[no],
	[r401] as nama_krt,
	[r306] as umur_krt,
	[r405] as agama_krt,
	[r405_lain] as agama_lainnya_krt
	
	FROM [SP2020C2_Validasi].[dbo].[C2_t_art]
	WHERE [r303]=1 and ([kode_kab]='12')
) krt on 
	anak.[kode_prov] = krt.[kode_prov] and
	anak.[kode_kab] = krt.[kode_kab] and
	anak.[kode_kec] = krt.[kode_kec] and
	anak.[kode_desa] = krt.[kode_desa] and
	anak.[nbs] = krt.[nbs] and
	anak.[no_rt] = krt.[no_rt]
	
inner join (
	SELECT distinct
	[kode_prov],
	[kode_kab],
	[kode_kec],
	[kode_desa],
	[nbs],
	[no_rt],
	[no],
	[r401] as nama_p_krt,
	[r306] as umur_p_krt,
	[r405] as agama_p_krt,
	[r405_lain] as agama_lainnya_p_krt
	
	FROM [SP2020C2_Validasi].[dbo].[C2_t_art]
	WHERE ([r303]=2 or [r303]=3) and ([kode_kab]='12')
) pasangan_krt on
	pasangan_krt.[kode_prov] = krt.[kode_prov] and
	pasangan_krt.[kode_kab] = krt.[kode_kab] and
	pasangan_krt.[kode_kec] = krt.[kode_kec] and
	pasangan_krt.[kode_desa] = krt.[kode_desa] and
	pasangan_krt.[nbs] = krt.[nbs] and
	pasangan_krt.[no_rt] = krt.[no_rt]
	
	WHERE ((anak.agama != krt.agama_krt) and (anak.agama!=pasangan_krt.agama_p_krt)) and (anak.[kode_kab]='12')

	
	/** QUERY 1600 here **/
	
) art on 
	a.[kode_prov] = art.kode_prov and 
	a.[kode_kab]	= art.kode_kab and
	a.[kode_kec]	=  art.kode_kec and
	a.[kode_desa]	=  art.kode_desa and 
	a.[nbs]		=  art.nbs and
	a.no_rt		=  art.no_rt
	
) result