select  P.sg_partido,C.nr_partido as quantidade  from candidato c join partidos p on P.NR_PARTIDO = C.NR_PARTIDO group by C.nr_partido, P.sg_partido order by count(P.sg_partido)

select  count(g.ds_genero),g.ds_genero     from candidato c join genero g  on g.cd_genero  = C.cd_genero group by g.cd_genero , g.ds_genero  ;


select distinct cd_cor_raca from candidato  order by  cd_cor_raca desc ;

