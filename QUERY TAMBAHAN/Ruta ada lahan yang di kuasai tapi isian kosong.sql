select 
k.kode_prov,
k.kode_kab,
k.kode_kec,
k.kode_desa,
k.nbs,
k.no_rt,
k.r808,
k.r809a


from
(
 select *
 from [SP2020C2_Validasi].[dbo].[C2_t_rt]
 where r808=1 and r809a is null
)k