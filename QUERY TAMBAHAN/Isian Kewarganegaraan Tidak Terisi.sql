select 
kode_prov,
kode_kab,
kode_kec,
kode_desa,
nbs,
r301 as no_urut_art,
r302 as nama,
r402a as nik,
r403 as kewarganegaraan 
from [SP2020C2_Validasi].[dbo].[C2_t_art] 
where r403=2 and len(r402a)=16