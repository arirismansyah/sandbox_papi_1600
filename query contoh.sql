
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
	  ,'mencoba mencari warning' /**ket dapat diganti **/
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
  left join (
   SELECT distinct  
       art.[kode_prov]
      ,art.[kode_kab]
      ,art.[kode_kec]
      ,art.[kode_desa]
      ,art.[nbs]
	  ,no_rt
	  FROM [SP2020C2_Validasi].[dbo].[C2_t_art] art WITH (NOLOCK)
	  group by  art.[kode_prov]
      ,art.[kode_kab]
      ,art.[kode_kec]
      ,art.[kode_desa]
      ,art.[nbs]
	  ,no_rt
  
  ) c on 
      a.[kode_prov] =  c.kode_prov and 
      a.[kode_kab]	=  c.kode_kab and
      a.[kode_kec]	=  c.kode_kec and
      a.[kode_desa]	=  c.kode_desa and 
      a.[nbs]		=  c.nbs and
	  a.no_rt		=  c.no_rt
	  WHERE status_dok = 'w'
)UTAMA
