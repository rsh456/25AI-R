install.packages("dplyr")
library(dplyr)

# Tarea 1: Exploración inicial del dataset
# Cargar el dataset mtcars
# Mostrar las primeras 7 filas  del dataset. (usa help)
# Mostrar la estructura del dataset (str())
# Obtener un resumen estadístico de las variables numéricas.(utiliza la función skim del paquete skimr)
# Identificar cuántas filas y columnas tiene el dataset.
# Calcula la desviación estándar de al menos 3 variables (usa la función sd())

data(mtcars)
head(mtcars, n=7)
str(mtcars)

install.packages("skimr", dependencies = TRUE)
library(skimr)
skim(mtcars)

num_rows <- nrow(mtcars)
num_cols <- ncol(mtcars)
cat("Numero de columnas:",num_cols,"\nNumero de filas:", num_rows)

mpg_sd <- sd(mtcars$mpg)
hp_sd <- sd(mtcars$hp)
qsec_sd <- sd(mtcars$qsec)

cat(mpg_sd, hp_sd, qsec_sd)
# Tarea 2: Filtrado y selección de datos
# Filtrar los autos que tienen más de 10 millas por galón (mpg > 10).
# Seleccionar solo las columnas mpg, cyl, hp y wt.

autos_mpg_mayor_10 <- mtcars %>%
  filter(mpg>10) %>%
  select(mpg, cyl, hp, wt)

head(autos_mpg_mayor_10)

# Tarea 3: Creación de nuevas variables
# Crear una nueva columna llamada relacion_peso_potencia, que sea la relación entre 
# el peso (wt) y los caballos de fuerza (hp).
autos_relacion <- mtcars %>%
  mutate(relacion_peso_potencia = wt/ hp)

# Tarea 4: Visualización
# Crear un histograma de mpg (Rendimiento del combustible) usa la funcion hist
hist(autos_relacion$mpg, main=paste("Histograma de Millas por Galon (mpg)"))


# Tarea 5
#Crear una función simple que convierta el rendimiento de millas por galón (mpg) a 
#kilómetros por litro (kml = mpg * 0.425144)

mpg_a_kml<-function(x){
  return (x*0.425144)
}

# Primera forma usando el operador $
mtcars$kml<-mpg_a_kml(mtcars$mpg)
head(mtcars)

# Segunda forma: usar mutate de la libreria dplyr
data_autos = mtcars %>% 
mutate(kml = mpg_a_kml(mpg))

head(data_autos)
