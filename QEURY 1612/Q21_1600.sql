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
	,'Cek ART yang KBJI nya sebagai petani namun tidak memiliki lahan lainnya yang berupa lahan pertanian.' /**ket dapat diganti **/
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
	
	SELECT 
	art.[kode_prov],
	art.[kode_kab],
	art.[kode_kec],
	art.[kode_desa],
	art.[nbs],
	art.[no_rt],
	art.kbli,
	art.kbji,
	art.status_bekerja_436,
	lahan.status_memiliki_lahan_lain
	FROM (
		SELECT 
		[kode_prov],
		[kode_kab],
		[kode_kec],
		[kode_desa],
		[nbs],
		[no_rt],
		[no],
		[r401] as nama,
		[r306] as umur,
		[r434_kode] as kbli,
		[r435_kode] as kbji,
		[r436] as status_bekerja_436
		FROM [SP2020C2_Validasi].[dbo].[C2_t_art]
		WHERE [r434_kode] = 1 and [r436] < 4  and ([kode_kab]='12')
	) art

	inner join(
		SELECT
		[kode_prov],
		[kode_kab],
		[kode_kec],
		[kode_desa],
		[nbs],
		[no_rt],
		[r808] as status_memiliki_lahan_lain
		FROM [SP2020C2_Validasi].[dbo].[C2_t_rt]
		WHERE [r808] = 2 and ([kode_kab]='12')
	) lahan on
		art.[kode_prov] = lahan.[kode_prov] and
		art.[kode_kab] = lahan.[kode_kab]and
		art.[kode_kec] = lahan.[kode_kec] and
		art.[kode_desa] = lahan.[kode_desa] and
		art.[nbs] = lahan.[nbs] and
		art.[no_rt] = lahan.[no_rt] 
	
	/** QUERY 1600 here **/
	
) art on 
	a.[kode_prov] = art.kode_prov and 
	a.[kode_kab]	= art.kode_kab and
	a.[kode_kec]	=  art.kode_kec and
	a.[kode_desa]	=  art.kode_desa and 
	a.[nbs]		=  art.nbs and
	a.no_rt		=  art.no_rt
	
) result