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
# suervey (Inferencias para muestras complejas) Todas las librerías se encuentran en el repositoria oficial de R excepto la librería SamplingUtil, necesitará installar la librería devTools para posteriormente utilizar el comando install_github() para poder obtenerla.

# 1. Instalación y carga de las librerias -------------
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

# Nota : Supondremos que estos datos corresponden a una población


# 3. Cálculo de algunos de los parámetros de interés
mean(BigLucy$Income)   # media de Income - ingresos
prop.table(table(BigLucy$SPAM)) # proporción de SPAM


# MUESTREO ALEATORIO SIMPLE
library(TeachingSampling)
data(BigLucy)    # Cargamos el conjunto de datos
set.seed(123) # Definimos el valor de la semilla para obterner resultos reproducibles.
tamaño = 10

Lucy  %>% 
  slice_sample(n = tamaño) -> muestra
muestra
# Calculo de estimadores
mean(muestra$Income)
prop.table(table(muestra$SPAM))

# -------------------------------------

# Cargar el paquete dslabs 
install.packages("dslabs")
library(dslabs)


# Mostrar la estructura de la data
str(BigLucy)

# Ejemplos de muestreo con el conjunto de datos (adapta según tus datos)
set.seed(123)
#-----------------------------------------------------
# Muestreo Probabilístico Simple
n= 20
muestra_simple <- BigLucy[sample(nrow(BigLucy), n), ]
print(muestra_simple)
# -----------------------------------------------------
# Muestreo Estratificado
library(dplyr)
muestra_estratificada <- BigLucy %>% 
  group_by(ISO) %>% 
  sample_n(10)
print(muestra_estratificada)

#-----------------------------------------------------
# Muestreo por Conglomerados

# Elegir un conglomerado al azar
conglomerado_elegido <- sample(unique(BigLucy$Zone), 1)

# Extraer una muestra de tamaño n=10 del conglomerado seleccionado
muestra_conglomerado_especifico <- BigLucy %>% 
  filter(Zone == conglomerado_elegido) %>%
  sample_n(20, replace = TRUE)  # Puedes ajustar replace según tus necesidades

# Imprimir la muestra del conglomerado seleccionado
print(muestra_conglomerado_especifico)
#---------------------------------------------------
# Muestreo No 
# Muestreo por conveniencia
# muestra de los primeros n registros
muestra_conveniencia <- BigLucy[1:20, ]
print(muestra_conveniencia)

# -------------------------------------------------
# Muestreo por juicio
muestra_juicio <- BigLucy[c(1, 5, 10, 15, 20), ]
print(muestra_juicio)m

# Muestreo Bola de Nieve 

#---------------------------------------------
write.csv(BigLucy, file = "data/BigLucy.csv", row.names = FALSE)
BigLucy1 <- read.csv("data/BigLucy.csv")
