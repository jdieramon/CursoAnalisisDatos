## =============================================================================
###  TEMA:    Introduccion a tidyverse
## =============================================================================

## Limpiar el entorno de trabajo
rm(list=ls())

## Cargar los paquetes necesarios para este tema
library(gapminder)
library(dplyr)
library(ggplot2)

# Ver el contenidpo de gapminder
gapminder



## FILTER
## -----------------------------------------------------------------------------
## Filtrar por una o varias condiciones
gapminder %>% 
  filter(year == 2007)

gapminder %>% 
  filter(country == "Spain")

gapminder %>% 
  filter(year == 2007, country == "Spain")



## ARRANGE
## -----------------------------------------------------------------------------
gapminder %>% 
  arrange(gdpPercap)

gapminder %>% 
  arrange(desc(gdpPercap))

# Combinar filter + arrange
gapminder %>% 
  filter(year == 2007) %>% 
  arrange(desc(gdpPercap))



## MUTATE
## -----------------------------------------------------------------------------
# Crear nueva variable
gapminder %>% 
  mutate(gdp = gdpPercap * pop)


# Manipular variable existente
gapminder %>% 
  mutate(pop = pop/1e6) 


# Combinar 3 verbos: filter + arrange + mutate
gapminder %>% 
  mutate(gdp = gdpPercap * pop) %>%
  filter(year == 2007) %>% 
  arrange(desc(gdp))



## SUMMARIZE
## -----------------------------------------------------------------------------
# Resumir 1 variable
gapminder %>%
  summarize(meanLifeExp = mean(lifeExp))


# Resumir 1 variable para un año
gapminder %>% 
  filter(year == 2007) %>% 
  summarize(meanLifeExp = mean(lifeExp))


# Resumir varias variables para un año
gapminder %>% 
  filter(year == 2007) %>% 
  summarize(meanLifeExp = mean(lifeExp), 
            totalPop = sum(as.numeric(pop)))


# Resumir varias variables para un año con el total de observaciones: n()
gapminder %>% 
  filter(year == 2007) %>% 
  summarize(totalCase = n(), 
            meanLifeExp = mean(lifeExp), 
            totalPop = sum(as.numeric(pop)))



## GROUP_BY
## -----------------------------------------------------------------------------
# Agrupando por year
gapminder %>% 
  group_by(year)  %>% 
  summarize(meanLifeExp = mean(lifeExp),totalPop = sum(as.numeric(pop)), 
            maxGdpPercap = max(gdpPercap))


# Agrupando por year con numero de casos n()
gapminder %>% 
  group_by(year)  %>% 
  summarize(totalcase = n(), 
            meanLifeExp = mean(lifeExp),totalPop = sum(as.numeric(pop)), 
            maxGdpPercap = max(gdpPercap))


# Agrupando por continente en 2007
gapminder %>% 
  filter(year == 2007) %>% 
  group_by(continent)  %>% 
  summarize(meanLifeExp = mean(lifeExp),
            totalPop = sum(as.numeric(pop)),
            maxGdpPercap = max(gdpPercap))


# Agrupando por continente, year
gapminder %>% 
  group_by(year, continent)  %>% 
  summarize(meanLifeExp = mean(lifeExp),
            totalPop = sum(as.numeric(pop)),
            maxGdpPercap = max(gdpPercap))




## -----------------------------------------------------------------------------
## VISUALIZACION DATOS: ggplot2
## -----------------------------------------------------------------------------

## Crear dataset año 2007 y asignarlo a 'gapminder_2007'
gapminder_2007 <- gapminder %>% 
  filter(year == 2007)


## Scatter - plot
## -----------------------------------------------------------------------------
ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp)) + 
  geom_point()


# Escala logaritmica
ggplot(gapminder_2007,  aes(x = gdpPercap, y = lifeExp)) +
  geom_point() + 
  scale_x_log10()


# Estetica adicional : color + tamaño
## -----------------------------------------------------------------------------
# variable categorica: color
ggplot(gapminder_2007,  aes(x = gdpPercap, y = lifeExp, color = continent)) +
  geom_point() + 
  scale_x_log10()


# variable numerica: tamaño
ggplot(gapminder_2007,  
       aes(x = gdpPercap, y = lifeExp, color = continent, size = pop)) +
  geom_point() + 
  scale_x_log10()


# Paneles
## -----------------------------------------------------------------------------
ggplot(gapminder_2007,  aes(x = gdpPercap, y = lifeExp)) +
  geom_point() + 
  scale_x_log10() + 
  facet_wrap(~ continent)


# Datos resumidos
## -----------------------------------------------------------------------------
# Agrupando por continente, year
by_year_continent <- gapminder %>% 
  group_by(year, continent)  %>% 
  summarize(meanLifeExp = mean(lifeExp),
            totalPop = sum(as.numeric(pop)),
            maxGdpPercap = max(gdpPercap))
  

ggplot(by_year_continent, 
       aes(x = year, y= totalPop, color = continent)) +
  geom_point()


ggplot(by_year_continent, aes(x = year, y= totalPop, color = continent)) +
  geom_point() + 
  expand_limits(y = 0) # ejeY comienza desde 0


## Line plot
## -----------------------------------------------------------------------------
gapminder %>% 
  group_by(year) %>% 
  summarise(totalPop = sum(as.numeric(pop))) %>%
  ggplot(aes(x = year, y= totalPop)) + 
           geom_line()


# Datos resumidos
ggplot(by_year_continent, 
       aes(x = year, y= totalPop, color = continent)) +
  geom_line()


## Bar plot
## -----------------------------------------------------------------------------
# Agrupando por continente en 2007
by_continent2007 <- gapminder %>% 
  filter(year == 2007) %>% 
  group_by(continent)  %>% 
  summarize(meanLifeExp = mean(lifeExp),
            totalPop = sum(as.numeric(pop)),
            maxGdpPercap = max(gdpPercap))


ggplot(by_continent2007, aes(x = continent, y = meanLifeExp)) + 
  geom_col()


## Histogramas
## -----------------------------------------------------------------------------
gapminder %>% 
  filter(year %in% 1990:2000, continent %in% c("Asia", "Africa", "Europe")) %>%
  ggplot(aes(x = lifeExp)) + 
  geom_histogram(binwidth = 2)

gapminder %>% 
  filter(year %in% 1990:2000, 
         continent %in% c("Asia", "Africa", "Europe")) %>%
  ggplot(aes(x = lifeExp)) + 
  geom_histogram(binwidth = 5)


## Boxplots
## -----------------------------------------------------------------------------
gapminder %>% 
  filter(year %in% 1990:2000, 
         continent %in% c("Asia", "Africa", "Europe")) %>%
  ggplot(aes(x = continent, y = lifeExp)) + 
  geom_boxplot()


gapminder %>% 
  filter(year %in% 1990:2000) %>%
  ggplot(aes(x = continent, y = lifeExp)) + 
  geom_boxplot()


