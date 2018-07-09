## =============================================================================
# TEMA:   Cadenas de texto
## =============================================================================


## Limpiar el entorno de trabajo
rm(list=ls())


# ----------------------------------------------------------------------------
## Definiendo las cadenas de texto
# ----------------------------------------------------------------------------

cadena <- "esto es una cadena de texto"
bigL <- "esto no es Vietnam, en los bolos no hay reglas"

bigL <- "El Nota: esto no es Vietnam, en los bolos no hay reglas"
bigL <- "El Nota: "esto no es Vietnam, en los bolos no hay reglas""

# `R` no interpreta la ultima `"` como cierre de frase y da un error. 
#Para solucionar esto podemos usar la comilla simple `'`:  
bigL <- 'El Nota: "esto no es Vietnam, en los bolos no hay reglas"'

#En la salida de `R` hay dos ideas importantes:   
#1. aunque pongamos ', R siempre imprime la imprime como ""
#2. representa "" mediante una secuencia de escape \. 
#De igual forma, tambien podemos usarla nosotros.


# Es importante señalar que la representacion en la consola de una cadena de texto 
# no es exactamente la cadena de texto misma, ya que en la consola se muestra la 
# secuencia de escape. Para ver el contenido de la secuencia en si misma hay que 
# usar la funcion writeLines()

bigL
print(bigL)
bigL == print(bigL)
writeLines(bigL)


# Que sucede si necesito usar la propia secuencia de escape ? 
am = "Nuestras horas son minutos \\ cuando esperamos saber \\ y siglos cuando sabemos \\ lo que se puede aprender."
print(am)
writeLines(am)

#\n, newline
am = "Nuestras horas son minutos \\\n cuando esperamos saber \\\n y siglos cuando sabemos \\\n lo que se puede aprender."
print(am)
writeLines(am)

# Otros caracteres especiales (to know more...)
?'"'


# ----------------------------------------------------------------------------
## Funciones base R para limpieza de datos
# ----------------------------------------------------------------------------

# Mays <--> Mins
grito   <- c("MUCHOS USUARIOS DE INTERNET CONSIDERAN OFENSIVAS LAS MAYUSCULAS")
grito
tolower(grito)

susurro <- c("esto es un ligero susurro") 
susurro
toupper(susurro) 

# n. caracteres
nchar(grito) 
nchar(susurro) 

# Concatenar
paste(grito, susurro)
paste(grito, "pero", susurro)
paste(tolower(grito), "pero", susurro)

paste("Sequence", c(1:10))
paste("Sequence", c(1:10), sep = "") #string vacia

paste0("Sequence", c(1:10))
paste0("Sequence", c(1:10), c(".fasta"))


# Extraer substring de un vector caracter
srr = " SRR5927133.121.1     "
srr
substr(x = srr, start = 1, stop = 10)
substr(x = srr, start = 1, stop = 5)


# Sustituciones
# sustitucion de la primera coincidencia
srr
sub(pattern = " ", replacement = "", x = srr)
# sustitucion de  todas las coincidencias
gsub(" ", "", srr)


# Aplicación: 
# eliminar todo lo que aparezca despues de .
srr = "SRR5927133.121.1"
sub(".", "", srr)
sub("\.", "", srr)     # Error: punto es cualquier caracter
sub("\\.", "", srr)    # para usar punto literalmente : doble escape
sub("\\..*", "", srr)

gsub(".", "", srr)
gsub("\\.", "", srr)
gsub("\\..*", "", srr)

# Otra forma: determinando la posicion de un pattern
regexpr(pattern = "ZZ", text = srr)
regexpr(pattern = "R", text = srr)

regexpr("121", srr)
substr(x = srr, start = 12, stop = 14)

regexpr("\\.", srr) # determina posicion del .



# a veces queremos extraer todo entre 2 patterns --> necesitamos saber las coordenada
# da el mismo resultado que : gsub("\\..*", "", srr)
# pero la idea no es la misma
# Ej. extraer desde el princiio a una coordenada de interes (.)
pos = regexpr("\\.", srr)
substr(x = srr, start = 1, stop = pos[1])
substr(x = srr, start = 1, stop =  pos[1]-1)




## Ejercicio: variante alelica




# ----------------------------------------------------------------------------
## Funciones stringr para limpieza de datos
# ----------------------------------------------------------------------------

# Install the released version from CRAN:
#install.packages("stringr")
#library(stringr)


# 1. Formato de la cadena de texo
### str_trim
# Elimina espacios en blanco inicial / final ; 1 / multiples
str_trim(" esto tiene espacios en blanco")            
str_trim(" esto tiene espacios en blanco ")           
str_trim(" esto tiene espacios en blanco        ")    

### str_to_lower
### str_to_upper
### str_length
### str_c
# Mays <--> Mins; n. caracteres, concatenar strings 
grito
str_to_lower(grito)
susurro
str_to_upper(susurro)
str_length(grito)
str_length(susurro)
str_c(grito, "pero", susurro)
str_c(grito, "pero", susurro, sep = " ")

# Diferencia: manejo de valores missing
cod1 <- paste0("###", c("232454", "252261", NA, "125263"))   # NA --> en string
cod2 <- str_c("###", c("232454", "252261", NA, "125263"))    # propaga NA

# Es decir, combinar valor perdido (NA) con cualquier string 
# resulta en otro NA 
cod1
cod2

# Comprobar si hay NA en algun lugar 
any(is.na(cod1))
any(is.na(cod2))


### str_replace_na
# Otra funcion util cuando tenemos NA es str_replace_na() 
# Reemplaza los NA con cualquier otra string que se indique.
str_replace_na(cod2, "Missing Value")
str_replace_na(cod2, "")


# 2. Accediendo al contenido de la cadena de texto
### str_sub
#Extrae partes de la string basada en coordenadas 
str_sub("Gonzalo", start = 1, end = 5)
str_sub(c("Gonzalo", "Martinez"), 1, 5)
str_sub(c("Gonzalo", "Martinez"), -5, -1)



# 3. Buscando patron en la cadena de texto
### str_pad
# Añade un patrón derecha/izda segun una longitud establecida
str_pad("232454", width = 8, side = "left", pad = "0")
str_pad("232454", width = 8, side = "right", pad = "#")
str_pad("232454", width = 7, side = "right", pad = "€")


### str_replace
# Busca un patron en una cadena de texo y lo sustituye por algo
amigos = c('Pepe', 'Luis', 'Victoria', 'Maru')

str_replace(amigos, pattern = "Maru", replacement = "M Carmen")

### str_locate
srr = "SRR5927133.121.1"
str_locate(srr, "R")
str_locate(srr, ".")
str_locate(srr, "\\.")
str_locate_all(srr, "\\.")
str_locate_all(srr, "R")


# Buscan patrones (como argumento) pero difieren en el resultado que ofrecen:  
# `str_count`
# `str_detect`
# `str_subset`
# `str_extract`
  
### str_count
#Devuelve el numero de veces que aparece en patrón en la string
str_count(amigos, "Maru")

### str_detect
#Devuelve un vector logico que es Verdadero para cada string que contiene el
#patrón y Falso, en el caso contrario. 
str_detect(amigos, "Maru")

### str_subset
#Devuelve solo las strings que contiene el patrón
str_subset(amigos, "Maru")
str_subset(amigos, "M Carmen")

### str_extract
#Devuelve solo la parte de la string que hace match con el patrón
str_extract(amigos, "Maru")


### Ejercicio: top fans de R 

