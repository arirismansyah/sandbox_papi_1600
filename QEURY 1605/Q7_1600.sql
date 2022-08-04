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
	,'Jumlah kejadian kematian di Blok VI < Blok VII (jumlah kejdaian kematian akibat kehamilan).' /**ket dapat diganti **/
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
	blok_6.[kode_prov],
	blok_6.[kode_kab],
	blok_6.[kode_kec],
	blok_6.[kode_desa],
	blok_6.[nbs],
	blok_6.[no_rt], 
	blok_6.[r602] as jml_kematian_total,
	blok_7.jml_kematian_kehamilan

	FROM [SP2020C2_Validasi].[dbo].[C2_t_rt] blok_6 

	inner join (

		SELECT
		[kode_prov],
		[kode_kab],
		[kode_kec],
		[kode_desa],
		[nbs],
		[no_rt], 
		COUNT(*) as jml_kematian_kehamilan

		FROM [SP2020C2_Validasi].[dbo].[C2_t_r701]

		WHERE ([r703] = 2) and ([kode_kab]='05')
		GROUP BY [kode_prov],
		[kode_kab],
		[kode_kec],
		[kode_desa],
		[nbs],
		[no_rt] 


	) blok_7 on
		blok_6.[kode_prov] = blok_7.[kode_prov] and
		blok_6.[kode_kab] = blok_7.[kode_kab] and
		blok_6.[kode_kec] = blok_7.[kode_kec] and
		blok_6.[kode_desa] = blok_7.[kode_desa] and
		blok_6.[nbs] = blok_7.[nbs] and
		blok_6.[no_rt] = blok_7.[no_rt]
		
		WHERE blok_6.[r602] < blok_7.jml_kematian_kehamilan and (blok_7.[kode_kab]='05')

	
	/** QUERY 1600 here **/
	
) art on 
	a.[kode_prov] = art.kode_prov and 
	a.[kode_kab]	= art.kode_kab and
	a.[kode_kec]	=  art.kode_kec and
	a.[kode_desa]	=  art.kode_desa and 
	a.[nbs]		=  art.nbs and
	a.no_rt		=  art.no_rt
	
) result	
	
	