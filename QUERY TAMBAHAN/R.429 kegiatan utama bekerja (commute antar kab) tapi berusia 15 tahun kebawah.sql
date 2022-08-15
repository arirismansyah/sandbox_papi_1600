select kode_prov
kode_kab,
kode_kec,
kode_desa,
nbs,
no_rt,
r301 as no_art,
r302 as nama,
r306 as umur,
r429,
r432, r433
from [SP2020C2_Validasi].[dbo].[C2_t_art]
where r306<15 and (r432=1 or r433=1) and r429=1