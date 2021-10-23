## ========================================================================
## Tema 2. Importando datos en R 
## ========================================================================

# Limpiar el entorno de trabajo
rm(list=ls())


# =============================================================================
## 1. Directorio de trabajo 
# =============================================================================

# Directorio de trabajo actual (wd)
getwd()

# Ver los archivos del directorio
list.files()
dir()

# Podemos usar la funcion que nos resulte mas sencilla porque 
# producen el mismo resultado
identical(list.files(), dir())

# Comprobar si existe un directorio
dir.exists("ejercicios")
dir.exists("datos")

# Crear un nuevo directorio
path = getwd()
nuevoDir = "datos"

# 1. Combinamos los 2 vectores para crear la path del nuevo directorio
file.path(path, nuevoDir)

# 2. Creamos el directorio con la funcion 'dir.create'
dir.create(file.path(path, nuevoDir))
dir.exists("datos")


# Cambiar el directorio de trabajo
setwd(".")
setwd("./datos")
setwd("..")

# list.files()



# =============================================================================
# 2. Leer fichero directamente desde Internet
# =============================================================================

url <- "https://raw.githubusercontent.com/jdieramon/CursoAnalisisDatos/master/datos/babynames.csv"

bebes <- read_csv(url)

remove(url)


# =============================================================================
# 2. Descargar un fichero desde internet
# =============================================================================

file.exists("datos/babynames.csv")

download.file(url, "./datos/babynames.csv")


# =============================================================================
# 3. Leer un archivo local
# =============================================================================

bebes <- read_csv("datos/babynames.csv")

# file.remove("datos/babynames.csv")



