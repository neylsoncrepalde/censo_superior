############################################
# Junta bases do Censo da Educação Superior
# Prof. Neylson Crepalde
############################################

library(bit64)
library(data.table)
library(dplyr)
library(descr)
library(readr)

setwd("~/Documentos/Neylson Crepalde/microdados_censo_superior_2015/DADOS")
list.files()

aluno = fread("censo_superior_mg_2015_alunos.csv", encoding = "UTF-8")
gc()

freq(aluno$NO_IES, plot=F)
freq(aluno$NO_CURSO, plot=F)

musica_so = aluno %>% filter(NO_CURSO == "MÚSICA")
musica_lic = aluno %>% filter(NO_CURSO == "MÚSICA - LICENCIATURA OU BACHARELADO")

musica = rbind(musica_so, musica_lic)
rm(musica_lic, musica_so)

freq(musica$NO_IES, plot=F)

index = grep("MÚSICA", aluno$NO_CURSO)

musica_geral = aluno[index,]
freq(musica_geral$NO_IES, plot=F)


freq(musica$CO_CURSO, plot=F)
# Juntando com base de cursos
# Chave: CO_CURSO

curso = fread("censo_superior_mg_2015_curso.csv", encoding = "Latin-1")

#UNIR AS BASES

censo = left_join(aluno, curso, by="CO_CURSO")
rm(aluno, curso)
#########################################################################

