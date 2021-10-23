## =============================================================================
# TEMA:  Funciones en R
## =============================================================================

## Limpiar el entorno de trabajo
rm(list=ls())

# Anatomia de la funcion
# ------------------------------------------------------------------------------
my_function <- function(arg1, arg2) {
  body
}

# Definir la funcion 'add'
add <- function(x, y = 1) {
  x + y
}

# Check formals de la funcion
formals(add)

# Check body de la funcion
body(add)



# Definir valor abosulto 'f'
f <- function(x) {
  if (x < 0) {
    -x
  } else { 
    x
  }
}

# Llamar 'f'
f(-5)
f(5)



# Asignar 10 al vector x 
x <- 10 


# Definir a gonzalo
gonzalo <- function() {
  
  x = 1
  y = 2
  c(x, y)
}


# Llamar a gonzalo
gonzalo()


# Definir uco
uco <- function() {
  
  y = 2
  
  c(x,y)
}

# Llamar a uco
uco()


# Eliminar x 
rm(x)

# Llamar uco
uco()


# Scoping de la funcion
# ------------------------------------------------------------------------------
# Definir f
f <- function() x

# Definir x 
x <- 15

# Llamar f
f()

# Definir x 
x <- 100

# Llamar f
f()


# Definir add100
add100 <- function(x) {
  
  a = 100
  
  x + a
  
}

#Llamar add100 con argumento = 1
add100(1)

# Llamar 
a

# Escribir funciones
# ------------------------------------------------------------------------------

# Definir df1
df1 <- data.frame(
  a = rnorm(10), 
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10))


# Mediana de las columnas
median(df1[[1]])
median(df1[,1])
median(df1$a)
# idem para el resto de columnas

# Mediana de las columnas (usando loop)
for (i in seq_along(df1)) {
  print(median(df1[[i]]))
}


# Mediana de las columnas (funcion)
col_median = function(df) {
  
  # ''' Toma 1 argumento (df)
  # ''' Devuelve un vector con la mediana de las columnas 
  
  output <- vector("numeric", ncol(df))  
  for (i in seq_along(df)) {            
    output[i] <- median(df[[i]])      
  }
  
  output
}


# Llamar a la funcion
col_median(df1)

# Media de las columnas (funcion)
col_mean = function(df) {
  
  # ''' Toma 1 argumento (df)
  # ''' Devuelve un vector con la media de las columnas 
  
  output <- vector("numeric", ncol(df))  
  for (i in seq_along(df)) {            
    output[i] <- mean(df[[i]])      
  }
  
  output
}

# Llamar a la funcion
col_mean(df1)


# Std. dev. de las columnas (funcion)
col_sd = function(df) {
  
  # ''' Toma 1 argumento (df)
  # ''' Devuelve un vector con la media de las columnas 
  
  output <- vector("numeric", ncol(df))  
  for (i in seq_along(df)) {            
    output[i] <- sd(df[[i]])      
  }
  
  output
}

# Llamar a la funcion
col_sd(df1)




# Funciones como argumentos
# ------------------------------------------------------------------------------
col_multi_fun <- function(df, fun) {
  
  # ''' Toma 2 argumentos (df y funcion)
  # ''' Devuelve un vector con la función 
  # ''' que se quiera aplicar sobre las columnas 
  
  output <- vector("numeric", ncol(df)) 
  
  for (i in seq_along(df)) {
    output[[i]] <- fun(df[[i]])
  }
  
  output
}

col_multi_fun(df1, fun = median)
col_multi_fun(df1, fun = mean)
col_multi_fun(df1, fun = sd)
