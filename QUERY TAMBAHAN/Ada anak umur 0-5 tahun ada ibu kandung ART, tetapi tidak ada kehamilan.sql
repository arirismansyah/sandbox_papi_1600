select 
k.kode_prov,
k.kode_kab,
k.kode_kec,
k.kode_desa,
k.nbs,
k.no_rt,
k.r701,
anak.r302 as nama_anak,
anak.r306 as umur_anak,
anak.r308 as no_ibu_kandung
from
(
 select *
 from [SP2020C2_Validasi].[dbo].[C2_t_rt]
 where r701=2
)k
inner join
(
select *
from [SP2020C2_Validasi].[dbo].[C2_t_art]
 where (r306>=0 and r306<6) and r308!=0
) anak

on
k.kode_prov = anak.kode_prov and
k.kode_kab = anak.kode_kab and
k.kode_kec = anak.kode_kec and
k.kode_desa = anak.kode_desa and
k.nbs = anak.nbs and
k.no_rt = anak.no_rt