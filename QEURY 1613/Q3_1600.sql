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
	,'(R.303 = 5, 7, atau 8) namun (R.307) berisi 1 (belum kawin).' /**ket dapat diganti **/
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
	
	/** QUERY 1600 **/
	SELECT * FROM [SP2020C2_Validasi].[dbo].[C2_t_art] WHERE ([r303] = 5 or [r303] = 7 or [r303] = 8) and ([r307] = 1) and ([kode_kab]='13')
	/** QUERY 1600 **/
	
) art on 
	a.[kode_prov] = art.kode_prov and 
	a.[kode_kab]	= art.kode_kab and
	a.[kode_kec]	=  art.kode_kec and
	a.[kode_desa]	=  art.kode_desa and 
	a.[nbs]		=  art.nbs and
	a.no_rt		=  art.no_rt
	
) result