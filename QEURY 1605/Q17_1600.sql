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
	,'Cek Selisih umur anak dan ibu kandungnya < 10 tahun' /**ket dapat diganti **/
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
	
	SELECT anak.[kode_prov],
		anak.[kode_kab],
		anak.[kode_kec],
		anak.[kode_desa],
		anak.[nbs],
		anak.[no_rt],
		anak.[r306] as umur_anak,
		ibu.umur_ibu
		
	FROM [SP2020C2_Validasi].[dbo].[C2_t_art] anak
	inner join (
		SELECT 
		[kode_prov],
		[kode_kab],
		[kode_kec],
		[kode_desa],
		[nbs],
		[no_rt],
		[no],
		[r401] as nama_ibu,
		[r306] as umur_ibu
		FROM [SP2020C2_Validasi].[dbo].[C2_t_art]
	)ibu on
		anak.[kode_prov] = ibu.[kode_prov] and
		anak.[kode_kab] = ibu.[kode_kab] and
		anak.[kode_kec] = ibu.[kode_kec] and
		anak.[kode_desa] = ibu.[kode_desa] and
		anak.[nbs] = ibu.[nbs] and
		anak.[no_rt] = ibu.[no_rt] and
		anak.[r308] = ibu.[no]
	WHERE ((anak.[r308] is not null) and anak.[r308]!=0) and ibu.umur_ibu-anak.[r306] < 10 and (anak.[kode_kab]='05')
	
	/** QUERY 1600 here **/
	
) art on 
	a.[kode_prov] = art.kode_prov and 
	a.[kode_kab]	= art.kode_kab and
	a.[kode_kec]	=  art.kode_kec and
	a.[kode_desa]	=  art.kode_desa and 
	a.[nbs]		=  art.nbs and
	a.no_rt		=  art.no_rt
	
) result
