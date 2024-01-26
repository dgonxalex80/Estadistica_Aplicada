# TALLER MUESTREO   
# ESTADISTICA APLICADA 

# El siguente código documentado tienen como objetivo
# introducir a los estudiante el manejo de R en 
# los procesos de muestreo 
# Posteriormentre se emplearán estos conceptos para
# detarminar las propiedades de estimadores 


# Librerias requeridas ---------------------------------
# tidyverse (Manipulación y grafico de datos)
# TeachingSampling (conjunto de datos)
# SamplingBook (calculo de tamaños de muestras y muestreo)
# samplingUtil (calculo de tamaños de muestras)
# suervey (Inferencias para muestras complejas) 

# Todas las librerías se encuentran en el repositoria oficial de R 
# excepto la librería SamplingUtil, necesitará installar 
# la librería devTools para posteriormente utilizar el 
# comando install_github() para poder obtenerla.


# 1. Instalación y carga de las librerias ---------------
# install.packages("TeachingSampling")
# install.packages("tidyverse")
# install.packages("dslabs")
library(tidyverse)
library(TeachingSampling)
library(dslabs)

#------------------------------------------------------
# 2. Importar la base de datos

data(BigLucy)   # carga de datos BigLucy
str(BigLucy)  # estructura de la data
# Nota : Supondremos que estos datos 
#        corresponden a una población
#        Explora la data - indicadores / graficas


# 3. Cálculo de algunos de los parámetros de interés

mean(BigLucy$Income)   # media de Income - ingresos
prop.table(table(BigLucy$SPAM)) # proporción de SPAM


# MUESTREO ALEATORIOS

## Muestreo aleatorio simple -------------------------
# install.packages("dslabs")
library(dslabs)
set.seed(123)  # fijar semilla
#-----------------------------------------------------
# 4. Muestreo Probabilístico Simple
n= 20  # tamaño de la muestra 
muestra_simple <- BigLucy[sample(nrow(BigLucy), n), ] 
muestra_simple


# 5. Muestreo Estratificado --------------------------
library(dplyr)
muestra_estratificada <- BigLucy %>% 
  group_by(ISO) %>% 
  sample_n(10)
muestra_estratificada


# 6. Muestreo por Conglomerados ----------------------

# Elegir un conglomerado al azar
conglomerado_elegido <- sample(unique(BigLucy$Zone), 1)

# Extraer una muestra de tamaño n=20 del conglomerado 
# seleccionado
muestra_conglomerado_especifico <- BigLucy %>% 
  filter(Zone == conglomerado_elegido) %>%
  sample_n(20, replace = TRUE)  
muestra_conglomerado_especifico

#---------------------------------------------------
# MUESTREOS NO PROBABILISATICOS 

# Muestreo por conveniencia ------------------------
muestra_conveniencia <- BigLucy[1:20, ] # 20  primeras del listado
muestra_conveniencia


# Muestreo por juicio -----------------------------
muestra_juicio <- BigLucy[c(1, 5, 10, 15, 20), ] # seleccionadas a ojo
muestra_juicio

# Muestreo Bola de Nieve  ------------------------
# se requiere información previa

#---------------------------------------------
write.csv(BigLucy, file = "data/BigLucy.csv", row.names = FALSE) # guarda la base en formato .csv
BigLucy1 <- read.csv("data/BigLucy.csv") # lee la data de la misma carpeta
#------------------------------------------------