## ========================================================================
## Chapter 2. Fundamentos Basicos de R (I)
## ========================================================================

## Mi primer script
## -----------------------------------------------------------------------
# Load datasets library
library(datasets)

# Read data set 
mydata = ChickWeight

# Plot weight over diets
boxplot(mydata$weight ~ mydata$Diet, 
        xlab = "Diet", ylab = "chick weight (g)")

# Overlay points
colors = as.numeric(ChickWeight$Diet)
points(mydata$weight ~ jitter(as.numeric(mydata$Diet)), 
       col= alpha(colors, 0.4),
       pch=19) 



# =============================================================================
## Directorio de trabajo, Gonzalo por fa completa 
# =============================================================================


# =============================================================================
## Built-in functions, Gonzalo por fa completa 
# =============================================================================


# =============================================================================
## Fechas
# =============================================================================

## Cargar el paquete 'lubridate'
library(lubridate)


## Ver fecha y hora actual
today()
now()


## Crear fecha / hora: desde una string
ymd("2018-07-10")
mdy("July 10th, 2018")
dmy("10-Jul-2018")

# estas funciones tb funcionan sin "" cuando se sigue el orden
ymd(20180710)
mdy(07102018)
dmy(10072018)

# estas funciones tb pueden crean fechas - horas combinando la funcion con "_" y h,m,s 
ymd_hms("2018-07-10 18:10:45")
ymd_hm("2018-07-10 18:10")


## Crear fecha / hora: desde un vector
fechas <- c("1946-01-01", "1946-02-01", "1946-02-05", "1946-01-01", "1946-01-01",
            "1946-03-04", "1946-04-01", "1946-09-01", "1946-09-12", "1946-11-15")

# Extraer componentes individuales con las funciones:
year(fechas)
month(fechas)
day(fechas)

yday(fechas) # (day of the year)

month(fechas, label = TRUE)

wday(fechas) #(day of the week), 
wday(fechas, label = TRUE, abbr = TRUE)
wday(fechas, label = TRUE, abbr = FALSE)

