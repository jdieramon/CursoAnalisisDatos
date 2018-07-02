## ----------------------------------------------------------------------------
## Chapter 3. Fundamentos Basicos de R (II)
## ----------------------------------------------------------------------------

# =============================================================================
## Vectores
# =============================================================================

saludo <- "Hola Mundo!"
saludo

print(saludo)

a <- 3
a

### Las lineas que comienzan con # no son evaluadas. 
# Se usan para hacer comentarios como este  

# Elevar al cuadrado
x <- 3
x**2
# Elevar x a su valor 
x**x

### Definir vector numerico 
mi_vector<-  c(30, 400, 50, 100)
mi_vector

### Definir el vector caracter 'ciudades' 
ciudades <- c("Sevilla", "Granada", "Lugo")
ciudades

### Definir vectores numericos con la funcion seq()
seq(5)
#consecutivos
seq(from = 5, to = 10) 
seq(5,10) 
5:10 # atajo
# tomados en varios elementos
seq(from = 1, to = 10, by = 3)


### Propiedades de vectores: tipo y length
# Tipo, se obtiene con 'typeof()'
typeof('gonzalo')
typeof(1:10)

# Longitud, se obtiene con 'length()'
length('gonzalo')

x <- list('a', 'b', 1:10 )
length(x)

### NA
x <- c(1, 2, 3, NA, 5)
is.na(x)

### Indexando vectores
ciudades[2]
ciudades[c(2,3)]
ciudades[c(1,3)]

### Orden creciente: sort ()
sort(ciudades)
sort(ciudades, decreasing = T)

### Extraer indice que usa la funcion sort()
mi_vector
sort(mi_vector)
order(mi_vector)

### Extraer indice para valores max _ min
which.max(mi_vector)
mi_vector[which.max(mi_vector)]
which.min(mi_vector)



# =============================================================================
## Listas 
# =============================================================================

a <- list(
  a = 1:3,
  b = 'esto es una string',
  c = pi,
  d = list(-1, -5)
)

typeof(a)
str(a[4])





# =============================================================================
## Data frames
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

## Crear nueva columna
trees$GirthSI  = trees$Girth*2.54

## Indexar valores
trees[1:3, 1:3]
trees[1:3, c(1,4)]

## Indexar con condiciones
# Observaciones con di??metro > 45 cm
trees[trees$GirthSI > 45, ]
# Observaciones con di??metro > 45 cm; mostrar solo columnas altura/volumen
trees[trees$GirthSI > 45, c(2:3)]
# Mostrar solo columnas altura/volumen para las primeras 10 observaciones
trees [c(1:10), c(2:3)]



# =============================================================================
## Loops
# =============================================================================

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
