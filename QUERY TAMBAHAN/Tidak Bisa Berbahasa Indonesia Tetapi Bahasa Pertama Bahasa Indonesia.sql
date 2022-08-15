select 
kode_prov,
kode_kab,
kode_kec,
kode_desa,
nbs,
r301 as no_urut_art,
r302 as nama,
r306 as umur,
r422 as bisa_bahasa_indonesia,
r423 as bahasa_pertama
from [SP2020C2_Validasi].[dbo].[C2_t_art] 
where r423=1 and r422=2