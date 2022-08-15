select 
k.kode_prov,
k.kode_kab,
k.kode_kec,
k.kode_desa,
k.nbs,
k.no_rt,
k.r701,
b7.r702
from
(select * 
from [SP2020C2_Validasi].[dbo].[C2_t_rt]
where r701=1) k
inner join (
select * from [SP2020C2_Validasi].[dbo].[C2_t_r701]
where r702 is null
) b7
on 
k.kode_prov = b7.kode_prov and
k.kode_kab = b7.kode_kab and
k.kode_kec = b7.kode_kec and
k.kode_desa = b7.kode_desa and
k.nbs = b7.nbs and
k.no_rt = b7.no_rt 