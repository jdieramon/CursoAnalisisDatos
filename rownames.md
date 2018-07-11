---
title: "row.names"
author: "Jose V Die"
date: "11/7/2018"
output: 
  html_document: 
    keep_md: yes
---


En ocasiones puede interesarnos mantener, o no, el nombre de las 
observaciones (=filas) de un dataset. Para esto nos apoyaremos en el argumento
`row.names`.


Durante el curso hemos trabajado con el dataset `USArrests`. 

```r
head(USArrests)
```

```
##            Murder Assault UrbanPop Rape
## Alabama      13.2     236       58 21.2
## Alaska       10.0     263       48 44.5
## Arizona       8.1     294       80 31.0
## Arkansas      8.8     190       50 19.5
## California    9.0     276       91 40.6
## Colorado      7.9     204       78 38.7
```

Vemos que se trata de un dataset que contiene nombre de las observaciones. 




### Caso1.
Supongamos que en lugar de tratarse de un dataset pre-instalado en R fuera un 
archivo que tenemos en el ordenador y queremos leer manteniendo el nombre de las
filas. Para este ejercicio lo llamaremos `USAcurso`. 

Leemos el archivo y observamos las primeras observaciones:


```r
dat <- read.csv("USA_curso")
head(dat)
```

```
##            X Murder Assault UrbanPop Rape
## 1    Alabama   13.2     236       58 21.2
## 2     Alaska   10.0     263       48 44.5
## 3    Arizona    8.1     294       80 31.0
## 4   Arkansas    8.8     190       50 19.5
## 5 California    9.0     276       91 40.6
## 6   Colorado    7.9     204       78 38.7
```

Vemos que `read.csv` ha tomado la etiqueta de las filas como una variable y por 
tanto, coloca como columna lo que debe ser nombre de observaciones. 
Vamos a corregirlo indicando a `R` la columna que debe usar para etiquetar las 
observaciones:

```r
dat <- read.csv("USA_curso", row.names = 1)
head(dat)
```

```
##            Murder Assault UrbanPop Rape
## Alabama      13.2     236       58 21.2
## Alaska       10.0     263       48 44.5
## Arizona       8.1     294       80 31.0
## Arkansas      8.8     190       50 19.5
## California    9.0     276       91 40.6
## Colorado      7.9     204       78 38.7
```

### Caso2. 
Supongamos que hemos creado un dataset que contiene nombres de filas y queremos 
grabarlo como .csv para enviarlo a un colega. Sin enmbargo NO queremos conservar 
el nombre de las filas. 
La funcion `write.csv` por defecto conserva el nombre de las filas : 

```r
write.csv(USArrests, "usa_test1")
head(read.csv("usa_test1"))
```

```
##            X Murder Assault UrbanPop Rape
## 1    Alabama   13.2     236       58 21.2
## 2     Alaska   10.0     263       48 44.5
## 3    Arizona    8.1     294       80 31.0
## 4   Arkansas    8.8     190       50 19.5
## 5 California    9.0     276       91 40.6
## 6   Colorado    7.9     204       78 38.7
```
En este caso lo más practico es grabarlo **eliminando** el nombre de las filas

```r
write.csv(USArrests, "usa_test2", row.names = FALSE)
head(read.csv("usa_test2"))
```

```
##   Murder Assault UrbanPop Rape
## 1   13.2     236       58 21.2
## 2   10.0     263       48 44.5
## 3    8.1     294       80 31.0
## 4    8.8     190       50 19.5
## 5    9.0     276       91 40.6
## 6    7.9     204       78 38.7
```
