########################################
# Análises - Censo da Educação Superior
# Prof. Neylson Crepalde
########################################

setwd("~/Documentos/Neylson Crepalde/microdados_censo_superior_2015/DADOS")
source("junta_bases_censo_superior_mg.R")
library(ggplot2)

###############################
#Variáveis disponíveis
names(censo_musica)

### Traçando o perfil do aluno
# sexo, idade, cor, escola ensino medio

freq(censo_musica$DS_SEXO_ALUNO[censo_musica$IN_CAPITAL_IES == 1], plot=F)
freq(censo_musica$DS_SEXO_ALUNO, plot=F)

summary(censo_musica$NU_IDADE_ALUNO[censo_musica$IN_CAPITAL_IES == 1])
summary(censo_musica$NU_IDADE_ALUNO)
ggplot(censo_musica, aes(x=factor(IN_CAPITAL_IES), y=NU_IDADE_ALUNO))+geom_boxplot()
ggplot(censo_musica, aes(x=factor(IN_CAPITAL_IES), y=NU_IDADE_ALUNO))+geom_violin()

freq(censo_musica$DS_COR_RACA_ALUNO[censo_musica$IN_CAPITAL_IES == 1], plot=F)
freq(censo_musica$DS_COR_RACA_ALUNO, plot=F)

#ggplot(censo_musica, aes(x=factor(DS_COR_RACA_ALUNO)))+geom_boxplot()+
#  facet_wrap(~IN_CAPITAL_IES)

censo_musica$CO_TIPO_ESCOLA_ENS_MEDIO[censo_musica$CO_TIPO_ESCOLA_ENS_MEDIO == 2] = NA
censo_musica$CO_TIPO_ESCOLA_ENS_MEDIO[censo_musica$CO_TIPO_ESCOLA_ENS_MEDIO == 0] = "Privada"
censo_musica$CO_TIPO_ESCOLA_ENS_MEDIO[censo_musica$CO_TIPO_ESCOLA_ENS_MEDIO == 1] = "Pública"


freq(censo_musica$CO_TIPO_ESCOLA_ENS_MEDIO[censo_musica$IN_CAPITAL_IES == 1], plot=F)
freq(censo_musica$CO_TIPO_ESCOLA_ENS_MEDIO, plot=F)
# !!!!!



