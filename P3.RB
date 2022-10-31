=begin
    
  1 ---------------------------------------------------1-------------------------------------------------------------1---------------------------------
   
    -Argument Error: Se genera cuando los argumentos son incorrectos y no hay una Exception mas espeficica. Ej: numero incorrecto de argumentos, enviar un argumento que no es aceptable
    ---------------------------------------------------------------
    -IOERROR: Levanta una excepcion cuando una operacion IO (in/out) falla
    ---------------------------------------------------------------
    -NameError: Se geenra cuando un nombre de pila no es valido o no esta definido. Ej: variable local no definida
    ---------------------------------------------------------------
    -NotImplementedError: Se genera cuando una característica no está implementada en la plataforma actual. 
    ---------------------------------------------------------------
    -RuntimeError: Una clase de error generia generada cuando se intenta una operacion no valida. El Kerner#raise enviara un RuntimeError si no hay un Exception definido. Ej: raise "hola" -> RuntimeError: hola

    ---------------------------------------------------------------
    -StandarError: Los tipos de error más estándar son subclases de StandardError.
    ---------------------------------------------------------------
    -StopIteration: Provocada para detener una iteracion, en particular por Enumerator#next. Ej: loop do puts "hola" raise StopIteration puts "Mundo" end; puts "Listo!" -> Hola Listo!
    ---------------------------------------------------------------
    -SystemExit: Genera un Exit cuando inicia el fin del script
    ---------------------------------------------------------------
    -SystemStackError: Se genera en caso de un desbordamiento de 
    pila. Ej: def method method end; method -> SystemStackError: stack level too deep
    ---------------------------------------------------------------
    -ZeroDivisionError: Se genera cuando se intenta dividir un numero entero por cero. Ej: 42/0 -> ZeroDivisionError: divided by 0
    ---------------------------------------------------------------
    -TypeError: Se genera una excepción cuando se encuentra a un objeto que no es del tipo esperado
    

  2 ---------------------------------------------------------2----------------------------------------------------------------------------------------------2

  . ¿Cuál es la diferencia entre raise y throw? ¿Para qué usarías una u otra opción?

  raise, fail, rescuey ensuremanejar errores , también conocidos como excepciones
  throw y catch son de control de flujo
  La terminación de un solo nivel de flujo de control, como un whilebucle, se puede hacer con un simple return.
  La terminación de muchos niveles de flujo de control, como un bucle anidado, se puede hacer con throw.

  catch/throw le permite salir rápidamente de los bloques a un punto donde se define una captura para un símbolo específico. 
  raise rescue es el verdadero manejo de excepciones que involucra el objeto Exception. Si su excepción no hereda de StandardError,
  ¡NO se detectará de forma predeterminada!

  # ------------ Ejercicio 3 ------------
=begin
    begin/rescue funcionan exactamente igual a un try/catch, en begin va todo el codigo a ejetucar y en rescue las excepciones que quieras capturar.
    Si rescue no tiene parametros captura todas las excepciones, si tiene uno o mas(separados por coma) capturara solo esas excepciones
    En el else va todo el codigo que se quiera ejecutrar si, pasado todo el codigo del begin, no salto ninguna excepcion
    El codigo dentro del ensure se ejecutara al final de todo sin importar si ocurrieron excepciones o no, es igual al finally
=end

# ----------------------------- EJERCICIO 4 --------------------------
=begin
    retry allows you to retry running a block of code
    Retry le prermite volve a correr un bloque de codigo, se usa principalmente en el contexto del manejo de excepciones en Ruby. Para evitar caer
    en un bucle, debemos utilizar algun tipo de condicion de corte para el loop
=end

#-----------------------------EJERCICIO 5----------------------------
=begin
    La palabra clave redo se utiliza, en bloques e iteradores para repetir el ciclo actual.
    La diferencia con retry, es que este reinicia la iteracion y redo repite la iteracion actual
=end

#----------------------------EJERCICIO 6-----------------------------
=begin
    -opcion_1: Ejecuta el rescue cuando itenta hacer nil*3
    -opcion_2: Ejecuta el rescue cuando intenta hacer nil*3 pero al final ejecta el puts devolviendo 0
    -opcion_3: Ejecuta el rescue cuando itenta hacer nil*3, seteando en c el valor del rescue, en este caso 0, y mostrandolo en pantalla cuando ejecuta el puts
    -opcion_4: Ejecuta el rescue cuando itenta hacer nil*3, pero el valor 0 se queda en la posicion del nil, entonces el puts al final muestra: [3, 0, 9, 0, 15, 0, 21, 0, 27, 0]
=end

