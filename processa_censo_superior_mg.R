#########################################
# Censo da Educação Superior
# Neylson Crepalde
#####################################

library(bit64)
library(data.table)
library(dplyr)
library(descr)
library(readr)

setwd("~/Documentos/microdados_censo_superior_2015/DADOS")
list.files()

ies = fread("DM_IES.CSV", encoding = "Latin-1")
names(ies)
ies_mg = ies[ies$CO_UF_IES == 31,]; rm(ies); gc()
names(ies_mg)
#manter 1:3, 6:15, 33:39
ies_mg = ies_mg[, c(1:3,6:15, 33:39)]

curso = fread("DM_CURSO.CSV", encoding = "Latin-1")
#manter 2, 14,92:95
curso = curso[,c(2,14,92:95)]
names(curso)

curso = left_join(curso, ies_mg, by="NO_IES")
freq(curso$CO_UF_IES, plot=F)
curso_mg = curso[is.na(curso$CO_UF_IES)==F, ]
write_csv(curso_mg, "censo_superior_mg_2015_curso.csv")

cod_uf = ies_mg[,c(2,10)]

###
#Lendo alunos
#manter 1:42, 56, 60:114
alunos = fread("DM_ALUNO.CSV", encoding = "Latin-1", select = c(1:42, 56, 60:114)); gc()

#names(alunos)
alunos = left_join(alunos, cod_uf, by="NO_IES")

alunos = alunos[is.na(alunos$CO_UF_IES)==F,] ; gc()

write_csv(alunos, "censo_superior_mg_2015_alunos.csv")

