## Asignación 1 de Analisis de Datos en R
## -----------------------------------------------------------
# Correcciones: estaran escritas como comentarios usando un solo #
# y encerrados usando guiones (-)
##-----------------------------------------------------------
## Ejercicio 1.1
ej1 = 1 + (5/(15+8)) 
#   ^ no es igual. El operador de asgnacion es <-
# -----------------------------------------------------------
# Tambien se puede escribir como 
# 1 + 5 / (15 + 8)
# El segundo set de parentesis es obligatorio en este caso
# pero el primero no tanto, la precedencia se encarga de hacer el calculo bien.
# Tambien nota el estilo: siempre separa las operaciones con espacios en blanco.
# Eso facilita la lectura y el mantenimiento.
#------------------------------------------------------------
ej1

## Ejercicio 1.2
ej2 = sqrt((3^2)+(4^2))
#   ^ no es igual. El operador de asgnacion es <-
# -----------------------------------------------------------
# Tambien se puee escribir como 
# sqrt(3 ** 2 + 4 ** 2)
# La precededncia de operadores se encarga del orden.
# Usa para la potenciacion ** y no ^. La razon tiene que ver con protabilidad.
# -----------------------------------------------------------
ej2
## Ejercicio 1.3
ej3 = (10/(10+(exp(1)^(1.5*20))))
#   ^ no es igual. El operador de asgnacion es <-
#------------------------------------------------------------
# Este no es asi. Es:
# 10 / (10 + exp(1.5 * 20))
# El resultado es el mismo por propiedad de potencias.
# Pero se supone que el exponente de una exponencial se coloca dentro del argumento de la funcion exp
# Tambien nota como aprovechando la preccedencia puedo escribir menos. Esto ayuda a la legibilidad y 
# a corregir errores.
# -----------------------------------------------------------
ej3

##Ejercicio 2
## x se asigna como una variable aleatoria definida por la distribucion normal 
## con media 0 y desviacion estandar 1
x <- rnorm(1, mean = 0, sd = 1)
#------------------------------------------------------------
# COOL. Aprendiste esto por tu cuenta. 
# La funcion rnorm ya tiene como argumentos por omision mean=0 y sd=1
# asi que si usas esos argumentos simplemente no los escribas.
# rnorm(1)
#------------------------------------------------------------
a = 2
# ^ no es igual. El operador de asgnacion es <-
b = 3
# ^ no es igual. El operador de asgnacion es <-
ej4 = (x^a)^b
#   ^ no es igual. El operador de asgnacion es <-
# ----------------------------------------------------------
# Usa para la potenciacion ** y no ^. La razon tiene que ver con protabilidad.
# (x ** a) ** b 
# o
# x ** (a * b) por propiedad de potencia.
# Los parentesis son obligatorios. en este caso. 
#------------------------------------------------------------
ej4

##Ejercicio 3
##Se calcula el valor de cos(pi/2) y se compara el resultado con 0
ej5 = cos(pi/2)
#   ^ no es igual. El operador de asgnacion es <-
ej5
# ------------------------------------------------------------
# por que no son iguales?
# La computadora tiene una memoria de precision finita.
# En este caso, se deberia comparar si ambos son iguales para una precision dada
# usando all.equal
# all.equal(ej5, 0)
# que utiliza una funcion de la precision por omision de R 
#--------------------------------------------------------------
ej5 == 0

##Ejercicio 4
## Se calculan las raices del polinomio x^2 - 2x + 8
## Se puede ver el polinomio como un vector donde sus componentes son (1,-2,8)
polinomio <- c(1,-2,8)
#----------------------------------------------------------------
# No es usual dejar espacios enblanco entre el objeto y la apertura del operador de seleccion.
# Se ve raro y confundiras gente
#----------------------------------------------------------------
ap = polinomio [1]
#  ^ no es igual. El operador de asgnacion es <-
bp = polinomio [2]
#  ^ no es igual. El operador de asgnacion es <-
cp = polinomio [3]
#  ^ no es igual. El operador de asgnacion es <-
raizp = (-bp + sqrt((bp^2)-(4*ap*cp)))/(2*ap)
#     ^ no es igual. El operador de asgnacion es <-
raizn = (-bp - sqrt((bp^2)-(4*ap*cp)))/(2*ap)
#     ^ no es igual. El operador de asgnacion es <-
## Es notable como el programa devuelve una advertencia debido a que el valor de 
## la raiz no esta definido dentro de los numeros reales
## Usando la funcion polyroot se obtienen las raices del polinomio de forma directa
## este devuelve los valores complejos de las raices del polinomio
raiz_c <- polyroot(polinomio)
#-------------------------------------------------------------
# En general esto esta bien. Investigaste y encontraste una funcion que busca las 
# raices (reales o complejas) de forma directa. Pero date cuenta que con lo que histe
# antes podias lograrlo tambien asi:
#
# complex(real=-bp / (2 * ap), imaginary=sqrt(abs((bp ** 2) - (4 * ap * cp))) / (2 * ap))
# complex(real=-bp / (2 * ap), imaginary=-sqrt(abs((bp ** 2) - (4 * ap * cp))) / (2 * ap))
#
# Date cuenta que la respuesta que coloco es distinta que la que devuelve polyroot.
# La razon de eso es que la funcion polyroot sufre de inestabilidad numerica para 
# polinomios de grado pequeño. Eso dice la documentacion. 
#-------------------------------------------------------------
raiz_c

##Ejercicio 5
##Se define el objeto Frase y frase_dividida
Frase <- "Why?all?those?interrogation?symbols, eh?"
frase_dividida <- strsplit(Frase, "?", fixed = TRUE)
frase_dividida

##Ejercicio 6
#--------------------------------------------------------------
# Asi se hace correctamente:
# 
# cumpleanos <- as.Date("21/09/2023", format="%d/%m/%Y")
# fecha <- as.Date(Sys.Date())
# difftime(cumpleanos, fecha, units = "days") o cumpleanos - fecha
#
#--------------------------------------------------------------
cumpleanos = "2023/09/21"
#          ^ no es igual. El operador de asgnacion es <-
as.Date(cumpleanos, tryFormats = c("%Y/%m/%d"))
fecha = as.Date(Sys.Date(), tryFormats = c("%Y/%m/%d"))
#     ^ no es igual. El operador de asgnacion es <-
fecha
## Se calcula la diferencia entre la fecha de hoy y el cumpleanos usando la funcion difftime
difftime(cumpleanos, fecha, units = "days")

##Ejercicio 7
help.search("precedence")
#-----------------------------------------------------------------
# Espero hayas leido la documentacion.
# Te va a ahorrar algunas pesadillas.