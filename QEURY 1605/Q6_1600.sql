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
	,'Jumlah anak laki-laki dan perempuan yang masih hidup dan tinggal bersama (R.439a dan R.439b) tidak sesuai dengan isian pada Blok III.' /**ket dapat diganti **/
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
	a.[kode_prov],
	a.[kode_kab],
	a.[kode_kec],
	a.[kode_desa],
	a.[nbs],
	a.[no_rt],
	a.[no],
	a.[r304],
	a.[r306],
	a.[r439a],
	a.[r439b], b.jml_anak_b3
	FROM [SP2020C2_Validasi].[dbo].[C2_t_art] a
	inner join (
	SELECT distinct
	[kode_prov],
	[kode_kab],
	[kode_kec],
	[kode_desa],
	[nbs],
	[no_rt],
	[no],
	[r308],
	COUNT(*) as jml_anak_b3
	FROM [SP2020C2_Validasi].[dbo].[C2_t_art] WITH(NOLOCK)
	group by
	[kode_prov],
	[kode_kab],
	[kode_kec],
	[kode_desa],
	[nbs],
	[no_rt],
	[no],
	[r308]
	
	) b on
	a.[kode_prov] = b.[kode_prov] and
	a.[kode_kab] = b.[kode_kab] and
	a.[kode_kec] = b.[kode_kec] and
	a.[kode_desa] = b.[kode_desa] and
	a.[nbs] = b.[nbs] and
	a.[no_rt] = a.[no_rt] and
	a.[no] = b.[r308]
	
	WHERE ((a.[r304] = 1) and (a.[r306] >= 10 and a.[r306]<=54) and (a.[r439a]+a.[r439b] != b.jml_anak_b3)) and (a.[kode_kab]='05')
	
	/** QUERY 1600 here **/
	
) art on 
	a.[kode_prov] = art.kode_prov and 
	a.[kode_kab]	= art.kode_kab and
	a.[kode_kec]	=  art.kode_kec and
	a.[kode_desa]	=  art.kode_desa and 
	a.[nbs]		=  art.nbs and
	a.no_rt		=  art.no_rt
	
) result	
	
	
	