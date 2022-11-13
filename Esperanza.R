dir <- "C:/Users/santa/Desktop/COVID"
setwd(dir)

library(stringr)
library(dplyr)

mun_esp <- read.csv("municipios_esperanza.csv")

mun_esp <- str_sub(mun_esp[,], (str_locate(mun_esp[,1], "\\d+")[,2]+2))
entidad <- str_sub(mun_esp, end = (str_locate(mun_esp, "-\\s+")[,1]-1))
municipio <- str_sub(mun_esp, (str_locate(mun_esp, "-\\s+")[,2]+1))

esperanza <- data.frame(entidad, municipio)
esperanza$municipio <- as.character(esperanza$municipio)

esperanza$entidad[35] <- esperanza$entidad[34]
esperanza$municipio[35] <- "Bustamante"

proy_pob <- read.csv("proyeccion_pob_municipios.csv")

pob_2020 <- proy_pob %>%
  filter(proy_pob$AÑO == 2020) %>%
  group_by(NOM_ENT, MUN, CLAVE) %>%
  summarise(POB_TOT_2020  = sum(POB))

pob_2020$NOM_ENT <- str_replace(pob_2020$NOM_ENT, ".*-.*", "Oaxaca")

muni <- right_join(pob_2020, esperanza, by = c("NOM_ENT" = "entidad", "MUN" = "municipio"))
errores <- which(is.na(muni$pob_total_2020))
colnames(esperanza) <- c("NOM_ENT", "MUN")
pob_2020$MUN <- as.character(pob_2020$MUN)
esperanza$NOM_ENT <- as.character(esperanza$NOM_ENT)

municipios <- data.frame(ent = character(), mun = character(), poblacion_2020 = integer(), esp = logical(), stringsAsFactors = FALSE)
for (m in 1:nrow(pob_2020)) {
  if (pob_2020$MUN[m] %in% esperanza$MUN) {
    for (me in 1:nrow(esperanza)) {
      if (esperanza[me, 2] == as.character(pob_2020[str_which(pob_2020$MUN,as.character(esperanza[me,2])),][str_which((pob_2020[str_which(pob_2020$MUN,as.character(esperanza[me,2])),])$NOM_ENT, as.character(esperanza[me,1])),][2])
          && esperanza[me, 1] == as.character(pob_2020[str_which(pob_2020$MUN,as.character(esperanza[me,2])),][str_which((pob_2020[str_which(pob_2020$MUN,as.character(esperanza[me,2])),])$NOM_ENT, as.character(esperanza[me,1])),][1])) {
        municipios[m,] <- pob_2020[str_which(pob_2020$MUN,as.character(esperanza[me,2])),][str_which((pob_2020[str_which(pob_2020$MUN,as.character(esperanza[me,2])),])$NOM_ENT, as.character(esperanza[me,1])),]
        municipios$esp[m] <- as.logical(TRUE)
        break
      } else {
        next
      }
    }
  } else {
   municipios[m,] <- pob_2020[m,]
   municipios$esp[m] <- as.logical(FALSE)
  }
}

municipios <- data.frame(NOM_ENT = character(), NOM_MUN = character(), CVEGEO = integer(), POB_TOT_2020 = integer(), esp = logical(), stringsAsFactors = FALSE)
for (m in 1:nrow(pob_2020)) {
  if (pob_2020$MUN[m] %in% esperanza$municipio) {
    for (me in 1:nrow(esperanza)) {
      if (esperanza[me, 2] == pob_2020[m, 2] && esperanza[me, 1] == pob_2020[m,1]) {
        municipios[m,] <- pob_2020[m,]
        municipios$esp[m] <- as.logical(TRUE)
        break
      } else {
        municipios[m,] <- pob_2020[m,]
        municipios$esp[m] <- as.logical(FALSE)
        next
      }
    }
  } else {
    municipios[m,] <- pob_2020[m,]
    municipios$esp[m] <- as.logical(FALSE)
  }
}


write.csv(municipios, "municipios_esperanza.csv", row.names = FALSE, fileEncoding = "UTF-8")
