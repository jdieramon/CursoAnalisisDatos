## =============================================================================
# TEMA:  Analisis Exploracion Datos (EDA)
## =============================================================================

## Limpiar el entorno de trabajo
rm(list=ls())

## Ver los datasets que contiene el package 'datasets'
data(package='datasets')
data(package="datasets")
data()

help(swiss)
?swiss



# ----------------------------------------------------------------------------
# 1. Estructura, Observacion y Visualizacion de Datos
# ----------------------------------------------------------------------------

# Lee datos swiss
data(swiss)

# Clase de los datos
class(swiss)

# Dimesión de los datos
dim(swiss)

# Nombre de las columnas en los datos
names(swiss)

# Estructura de los datos
str(swiss)

# Resumen de los datos
summary(swiss)

# Encabezado de los datos
head(swiss)
head(swiss, 10)

# Encabezado de los datos
tail(swiss)
tail(swiss, 10)

# Representar histograma
hist(swiss$Agriculture)

# Representar 2 variables: scatter-plot
plot(swiss$Education, swiss$Examination)



# ----------------------------------------------------------------------------
# 2. Principios 'Datos Limpios'
# ----------------------------------------------------------------------------

### Cargar packg. tidyr
library(tidyr)

### Agrupando columnas en pares key_values: gather
ancho_df <- data.frame(nombre = c('Pepe', 'Luis', 'Victoria', 'Maru'),
                       marron = c(1,0,0,1), verde = c(0,1,0,0), 
                       otros = c(0,0,1,0))

gather(ancho_df, color_ojos, medida, -nombre)
gather(ancho_df, color_ojos, medida, marron:otros)
# Al tener el color de ojos en una unica variable podremos aplicar las 
# herramientas de dplyr (por ej. filtrado) que veremos posteriormente 
#en el curso


### spread
mascotas <- data.frame(nombre = rep(c("Pepe", "Maru"), each = 3), 
                       medida = rep(c("n_perros", "n_gatos", "n_pajaros"), 2), 
                       valor = c(1, 0, 0, 0, 2, 1))

mascotas
spread(mascotas, key = medida, value = valor)


### separate
tratamientos <- data.frame(genotype = rep(c('A', 'B'),3), 
                           trat = rep(c("treat1", "treat2", "control"), each = 2), 
                           time_point = rep(c("2010-Oct", "2012-Nov", "2014-Oct"), each = 2),
                           expr = c(1,2,3,4,5,6))

tratamientos

# Separar time_point en 2 columnas
separate(tratamientos, time_point, c("year", "month"))
trats_by_year_month <- separate(tratamientos, time_point, c("year", "month"))


### Unir
# Unir year,month y formar la columna time_point
unite(trats_by_year_month, time_point, c("year", "month"))
unite(trats_by_year_month, time_point, c(year, month))
unite(trats_by_year_month, time_point, year:month)
unite(trats_by_year_month, time_point, c("year", "month"), sep = "--" )





## Ejercicios
personas <- data.frame(nombre = c('Pepe', 'Luis', 'Victoria', 'Maru'), 
                       sexo_edad = c('H.40', 'H.41', 'M.39', 'M.32'), 
                       marron = c(0,1,1,0),
                       azul = c(1,0,0,0),
                       otros = c(0,0,0,1),
                       altura = c(170, 176, 169, 162))


### Agrupando columnas en pares key_values: gather
gather(personas, key = color_ojos, value = valor, marron, azul, otros)
gather(personas, key = color_ojos, value = valor, marron:otros)


### Separar columna sexo_edad en dos columnas: 'sexo', 'edad'
separate(personas, sexo_edad, c("sexo", "edad"))








# ----------------------------------------------------------------------------
# 3. Valores perdidos y especiales
# ----------------------------------------------------------------------------

## Buscando valores perdidos
# Crear un pequeño data frame
df <- data.frame( A = c(1, NA, 8, NA), 
                  B = c(3, NA, 88, 23), 
                  C = c(2, 45, 3, 1))


# Comprobar si hay NA
is.na(df)

# Comprobar si hay NA en algun lugar 
any(is.na(df))


# Contar numero de NA
sum(is.na(df))

# Usar summary() para buscar NA
summary(df)


## Tratando los NA
# Encontrar filas que no contienen NA
complete.cases(df)

# Usar los casos completos para indexar el df sin NA
df[complete.cases(df),]

# Otra forma de eliminar filas con NA
na.omit(df)




