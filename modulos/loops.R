
# =============================================================================
## Loops
# =============================================================================

## Data sets en paquete R 'datasets'
data(package='datasets')
data(package="datasets")
data()

## Ayuda  
help(trees)
?(trees)

## Leer data set trees
data(trees)

## Dimensiones del data set
dim(trees)

## Ver las primeras 6 filas
head(trees)

## Extraer valores de las columnas
trees$Girth


# Mediana de la columna diametro
median(trees$Girth)
median(trees [ , 1])
median(trees [[1]])

# Mediana de la columna altura
median(trees$Height)

# Mediana de la columna volumen
median(trees$Volume)

# Obtener la media de las columnas con 'for loop'
for(i in seq(trees)) {
  print(median(trees[[i]]))
}




# =============================================================================
## Otros loops
# =============================================================================

madrid <- list(pop = 3165541, 
               barrios = c("Chueca", "Latina", "Huertas",
                           "Centro", "Lavapies", "B. Salamanca"), 
               capital = TRUE)


### Determinar tipo datos de la lista madrid
# for loop
for(info in madrid) {
  print(typeof(info))
}

# lapply
lapply(madrid, typeof)

### Determinar n. caracteres del vector barrios
barrios <- madrid$barrios
barrios <- madrid[[2]]

# for loop
for(i in seq(length(barrios))) {
  print(nchar(barrios[[i]]))
}

# lapply
lapply(barrios, nchar)

# lapply + convertir a vector
unlist(lapply(barrios, nchar))



## sapply
sapply(barrios, nchar, USE.NAMES = FALSE)
sapply(madrid, class, USE.NAMES = FALSE)


# Clase de cada columna en el data set trees
sapply(trees, class)
#lapply(trees, class)

# Clase de cada columna en el data set PlantGrowth
sapply(PlantGrowth, class)

# Clase de cada columna en el data set USArrests
sapply(USArrests, class)

# Media de cada columna en el data set USArrests
sapply(USArrests, mean)

# Desviacion standard de cada columna en el data set USArrests
sapply(USArrests, sd)
