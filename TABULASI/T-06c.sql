
    select
    kode_prov,
    kode_kab as kab,
    r606c_hari as umur_meninggal_tahun, 
    COUNT(*) as jumlah
    from
        [SP2020C2_Validasi].[dbo].[C2_t_r601]
    where r606c_hari is not null
    group by kode_prov, kode_kab, r606c_hari
    order by kode_prov, kode_kab, r606c_hari