# =============================================================================
## Ejercicios Fundamentos Basicos de R (II)
# =============================================================================

## Ejercicio Vectores
# Usar la funcion c( ) para crear un vector con las temperaturas medias de las 
# m??ximas en enero para Beijing, Lagos, Paris, Rio, Toronto y Cordoba que en 
# ??Celsius son 1.67, 31.11, 5.56, 28.89, -1.11, y 15. Asignar el vector a la 
# variable temp
temp <- c(1.67, 31.11, 5.56, 28.89, -1.11,  15)

# Crear un vector con el nombre de las ciudades y asignarlo a la variable ciudad. 
# Para tener un buen funcionamiento, no hay que introducir tildes. 
ciudad <- c("Beijing", "Lagos", "Paris", "Rio", "Toronto", "Cordoba")

# Determina el tipo de vector de temp y ciudad
typeof(ciudad)
typeof(temp)

# Determina la media de temp
mean(temp)

# Determina la max media (en ??C)
max(temp)

# Extraer las temperaturas de las tres primeras ciudades
temp[1:3]

# Extraer las tres primeras ciudades 
ciudad[1:3]

# Determina la ciudad con la max media
ciudad[which.max(temp)]

# Determina la ciudad con la min media
ciudad[which.min(temp)]

# Ordena ciudad alfabeticamente
sort(ciudad)

# Ordena ciudad por orden creciente de temperatura media
ciudad[order(temp)]

# Ordena ciudad por orden decreciente de temperatura media
ciudad[order(-temp)]

# Determinar cuantas ciudades hay con temperaturas > 20 ??C
which(temp > 20)

# Determinar el nombre de las ciudades con temperaturas > 20 ??C
ciudad[which(temp > 20)]

# Determinar cuantas ciudades hay con temperaturas < 10 ??C
which(temp < 10)

# Determinar el nombre de las ciudades con temperaturas < 10 ??C
ciudad[which(temp < 10)]

# Determinar cuantas ciudades hay con temperaturas entre 10 y 20 ??C
which(temp >= 10 & temp < 20)

# Determinar el nombre de las ciudades con temperaturas entre 10 y 20 ??C
ciudad[which(temp >= 10 & temp < 20)]



## -----------------------------------------------------------------------------
## Ejercicio Listas
## -----------------------------------------------------------------------------
# Crear la lista medias_enero con dos elementos. 
# El primer elemento (a) es el vector de temperaturas creado anteriormente 'temp'. 
# El elemento segundo de la lista (b) es el vector 'ciudad'
medias_enero <- list(a = temp, b = ciudad)

# Comprobar el tipo de vector 'medias_enero'
typeof(medias_enero)
class(medias_enero)

# Longitud de medias_enero
length(medias_enero)

# Indexar el primer elemento de la lista
medias_enero$a
medias_enero[1]

# Media del primer elemento 
mean(medias_enero[[1]])

# M??xima del primer elemento 
max(medias_enero[[1]])

# Ciudad con la temperatura max
which.max(medias_enero[[1]])
medias_enero$b[which.max(medias_enero[[1]])]
medias_enero[[2]][which.max(medias_enero[[1]])]



## -----------------------------------------------------------------------------
## Ejercicio Data frames
## -----------------------------------------------------------------------------
# Leer el data sets predefinido en R : PlantGrowth
data("PlantGrowth")

# Ver la clase de datos del data set
class(PlantGrowth)

# Leer la ayuda del data set
help("PlantGrowth")

# N??mero filas y columnas del data set
dim(PlantGrowth)
nrow(PlantGrowth)
ncol(PlantGrowth)

# Ver las primers seis filas del data set
head(PlantGrowth)

# Clase de las 2 variables del data set
class(PlantGrowth$weight)
class(PlantGrowth$group)

# Nombre de las 2 variables del dataset
names(PlantGrowth)
colnames(PlantGrowth)

# Extraer la media de la primera variable
mean(PlantGrowth$weight)
mean(PlantGrowth[[1]])
mean(PlantGrowth[,1])

# Crear una nueva columna (altura) con valores 3.2 veces el correspondiente
# peso
PlantGrowth$altura <- PlantGrowth$weight * 3.2

# Mostrar solo el data set para el grupo control
PlantGrowth[PlantGrowth$group == "ctrl", ]

# Altura media de las plantas correspondientes al tratamiento 2
mean(PlantGrowth[PlantGrowth$group == "trt2",3])

# Grupo de la planta con la max altura 
PlantGrowth[which.max(PlantGrowth$weight),]

# Grupo de la planta con la min altura 
PlantGrowth[which.min(PlantGrowth$weight),]


## -----------------------------------------------------------------------------
## Ejercicios for loops
## -----------------------------------------------------------------------------
# Determinar el tipo de cada columna en el data set trees
for(i in seq(trees)) {
  print(class(trees[[i]]))
}

# Determinar el tipo de cada columna en el data set PlantGrowth
for(i in seq(PlantGrowth)) {
  print(class(PlantGrowth[[i]]))
}


# Determinar el tipo de cada columna en el data set USArrests
for(i in seq(USArrests)) {
  print(class(USArrests[[i]]))
}

# Determinar la desvicacion standard de cada columna en el data set USArrests
for(i in seq(USArrests)) {
  print(sd(USArrests[[i]]))
}


# Escribir un for loop que complete el vector letras para imprimir
# el estribillo de la cancion de Miliki 'En el coche de papa"
letras = c("Vamos de paseo", "en un coche feo", "pero no me importa", 
           "porque llevo torta")

for(i in seq(length(letras))) {
  print(paste(letras[i], "pi, pi, pi"))
}