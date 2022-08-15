select 
k.kode_prov,
k.kode_kab,
k.kode_kec,
k.kode_desa,
k.nbs,
k.no_rt,
k.r501,
b5.r502
from
(
 select *
 from [SP2020C2_Validasi].[dbo].[C2_t_rt]
 where r501=1
)k
inner join
(
select *
from [SP2020C2_Validasi].[dbo].[C2_t_r501]
 where r502 is null
) b5

on
k.kode_prov = b5.kode_prov and
k.kode_kab = b5.kode_kab and
k.kode_kec = b5.kode_kec and
k.kode_desa = b5.kode_desa and
k.nbs = b5.nbs and
k.no_rt = b5.no_rt