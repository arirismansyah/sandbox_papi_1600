SELECT 
kode_prov, kode_kab, kode_kec, kode_desa, nbs, no_rt, r301 as no_urut_art, r302 as nama, r306 as umur, 
CASE WHEN ([r431]=1) THEN 'belum_atau_tidak_pernah_sekolah'
            WHEN ([r431]=2) THEN 'belum_atau_tidak_tmat_sd' 
            WHEN ([r431]=3) THEN 'sd_paket_a' 
            WHEN ([r431]=4) THEN 'smp_paket_b' 
            WHEN ([r431]=5) THEN 'sma_paket_c'
            WHEN ([r431]=6) THEN 'diploma' 
            WHEN ([r431]=7) THEN 'div_s1' 
            WHEN ([r431]=8) THEN 'profesi'
            WHEN ([r431]=9) THEN 'lainnya'  
            END AS ijazah  
FROM [SP2020C2_Validasi].[dbo].[C2_t_art]
WHERE 
/** kasus tamat sd atau lebih usia < 6 tahun **/
([r306]<6 and [r431]>2) or
/** kasus tamat smp atau lebih usia < 12 tahun **/
([r306]<12 and [r431]>2) or
/** kasus tamat sma atau lebih usia < 15 tahun **/
([r306]<15 and [r431]>3) or
/** kasus tamat diploma atau lebih usia < 17 tahun **/
([r306]<17 and [r431]>4)