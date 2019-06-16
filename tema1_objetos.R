# =============================================================================
## Tema :   Objetos en R
# =============================================================================

## -----------------------------------------------------------------------
# Vectores
## -----------------------------------------------------------------------

## Definiendo vectores
## ----------------------------------------------------------------------
saludo <- "Hola Mundo!"

saludo
print(saludo)

x <- 3
x 

## Las lineas que comienzan con # no son evaluadas. 
# Se usan para hacer comentarios como este.  

# Elevar al cuadrado
x**2

# Elevar x a su valor 
x**x


# Definir vector numerico 
poblacion <-  c(690, 234, 98, 326)
is.vector(poblacion)
poblacion

# Definir el vector caracter 'ciudades' 
ciudades <- c("Sevilla", "Granada", "Lugo", "Cordoba")
is.vector(ciudades)
ciudades


# Etiquetar los elementos de un vector 
names(poblacion) <- ciudades
poblacion
unname(poblacion)  #supress names when printing a named vector

poblacion <- c(Sevilla = 690, Granada = 234, Lugo = 98)
poblacion


# Definir vectores numericos con la funcion seq()
seq(5)

# consecutivos
help(seq)
seq(from = 5, to = 15) 
seq(5,10) 
5:10 # atajo

# tomados en varios elementos
seq(from = 1, to = 15, by = 3)
seq(1, 15, 3)
seq(1, 3, 0.5)


## Propiedades de vectores: clase, longitud
## ----------------------------------------------------------------------
# clase
class(saludo)
class(x)
class(poblacion)
class(ciudades)

# length
length(saludo)
length(x)
length(poblacion)
length(ciudades)


# Existen varias casos agrupados bajo la clase 'numeric'. Los 2 mas
# comunes son: 'doble' y 'integer'. Estos casos tienen que ver con el 
# formato interno que R usa para almecenar los datos. R intercambia 
# el formato en estos dos grupos cuando lo necesita para realizar 
# calculos matematicos. 

is.numeric(35.4) 
is.integer(35.4)
is.double(35.4)

is.numeric(24)
is.integer(24)
is.double(24)

is.numeric(24L)
is.integer(24L)
is.double(24L)


## Manipulando vectores
## ----------------------------------------------------------------------

# Indexing : [ ]
poblacion[2]
poblacion[1:3]
poblacion[seq(1,3)]
poblacion["Sevilla"]

ciudades[2]
ciudades[1:3]
ciudades[seq(1,3)]
ciudades[c(1,4)]

poblacion[-2]
ciudades[-2]
poblacion[-c(1,3,4)]
ciudades[-c(1,3,4)]


# Sorting, Ordering
sort(poblacion)
sort(poblacion, decreasing = TRUE)
order(poblacion)
poblacion[order(poblacion)]

identical(poblacion[order(poblacion)], sort(poblacion))

sort(ciudades)
sort(ciudades, decreasing = TRUE)
order(ciudades)
ciudades[order(ciudades)]


# Conditioning, built-in functions
numeros > 50
numeros[numeros > 50]
max(numeros)
min(numeros)

which(numeros > 50)

which.max(numeros)
numeros[which.max(numeros)]

which.min(numeros)

mean(numeros)
sd(numeros)
median(numeros)
boxplot(numeros)




## -----------------------------------------------------------------------
## Data frames: tablas de datos
## -----------------------------------------------------------------------

## Documentacion de ayuda de un paquete
help(package = datasets)
help(datasets)              #version corta
library(help = "datasets")  #version completa 


## Data sets en paquete R 'datasets'
data(package = 'datasets' )
data(package = "datasets" )
data()

##  Documentacion de ayuda de un set de datos concreto: trees 
help(trees)
?(trees)

## Leer data set trees
data(trees)

## Dimensiones del data set
dim(trees)

## Ver las primeras 6 filas
head(trees)

## Nombres de las columnas
colnames(trees)
names(trees)

## Extraer valores de las columnas
trees$Girth

## Crear nueva columna
trees$GirthSI  = trees$Girth*2.54


