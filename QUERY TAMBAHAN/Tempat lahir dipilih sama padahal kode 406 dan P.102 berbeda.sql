select *
from [SP2020C2_Validasi].[dbo].[C2_t_art]
where (kode_prov != r406a_kode) and (kode_kab!=r406b_kode) and r406d=1 and (r406a_kode is not null) and (r406b_kode is not null)