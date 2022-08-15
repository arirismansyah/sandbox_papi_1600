select 
k.kode_prov,
k.kode_kab,
k.kode_kec,
k.kode_desa,
k.nbs,
k.no_rt,
k.r601,
b6.r604
from
(select * 
from [SP2020C2_Validasi].[dbo].[C2_t_rt]
where r601=1) k
inner join (
select * from [SP2020C2_Validasi].[dbo].[C2_t_r601]
where r604 is not null
) b6
on 
k.kode_prov = b6.kode_prov and
k.kode_kab = b6.kode_kab and
k.kode_kec = b6.kode_kec and
k.kode_desa = b6.kode_desa and
k.nbs = b6.nbs and
k.no_rt = b6.no_rt 