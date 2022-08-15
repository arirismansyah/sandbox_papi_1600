select 
ibu.kode_prov,
ibu.kode_kab,
ibu.kode_kec,
ibu.kode_desa,
ibu.nbs,
ibu.no_rt,
ibu.r301 no_art_ibu,
ibu.r302 as nama_ibu,
ibu.r444,
anak.r302 as nama_anak,
anak.r306 as umur_anak,
anak.r308 as no_ibu_kandung
from
(
 select *
 from [SP2020C2_Validasi].[dbo].[C2_t_art]
 where r444=2
)ibu
inner join
(
select *
from [SP2020C2_Validasi].[dbo].[C2_t_art]
 where (r306>=0 and r306<2) and r308!=0
) anak

on
ibu.kode_prov = anak.kode_prov and
ibu.kode_kab = anak.kode_kab and
ibu.kode_kec = anak.kode_kec and
ibu.kode_desa = anak.kode_desa and
ibu.nbs = anak.nbs and
ibu.no_rt = anak.no_rt and
ibu.r301 = anak.r308 and
ibu.no = anak.r308 