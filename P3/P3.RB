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


#---------------------------EJERCICIO 11-----------------------------
=begin
      Las gemas de Ruby son paquetes de librerías para Ruby que se instalan en el sistema
      y quedan listas para ser usadas, con un simple require o con mecanismos que aporta el propio sistema de gemas para Ruby.
      Todas las gemas tienen como estructura un nombre, una version y una plataforma.
      Las plataformas estan basadas en la arquitectura del CPU
=end

## ------------ Ejercicio 12 ------------
=begin
    El comando gem se utiliza para instalar gemas "a mano" de a una
    El comando blunder se utiliza para instalar varias gemas a la vez, utilizando un Gemfile declarado con aterioridad
=end



#-------------------------EJERCICIO 13------------------------------
=begin
    Las gemas utilizando el comando install, son instaladas en /home/username/ruby/gems
    Las gemas intaladas utilizando la gema bundler, se alojan en /var/bundle/ruby/2.1.0/gems/rake-10.4.2

=end


# ------------ Ejercicio 14 ------------
=begin
    El comando gem server inicia un servidor local con la informacion de las gemas
    Ademas se le pueden añadir opciones al comando para obtener ciertos datos:
        . -h, --help – Obtener ayuda sobre este comando
        . -V, --[no-]verbose – Establecer el nivel detallado de salida
        . -q, --quiet – Medidor de progreso del comando de silencio
        . --silent – Silenciar la salida de RubyGems
        . --config-file FILE – Use este archivo de configuración en lugar del predeterminado
        . --backtrace – Mostrar seguimiento de pila en errores
        . --debug – Activar la depuración de Ruby
        . --norc – Evite cargar cualquier archivo .gemrc
=end

# ------------ Ejercicio 15 ------------
=begin
    Como solución a este problema, proponemos un conjunto simple de reglas y requisitos que dictan cómo se asignan e incrementan los números de versión. Estas reglas se basan, pero no necesariamente se limitan a, prácticas comunes generalizadas preexistentes en uso tanto en software de código abierto como cerrado
    
    Una version se compone de 3 numeros estos son: MAYOR.MENOR.PARCHE y se deben aumentar cuando:
    1. Versión PRINCIPAL cuando realiza cambios de API incompatibles
    2. Versión MENOR cuando agrega funcionalidad de manera compatible con versiones anteriores
    3. Versión PATCH cuando realiza correcciones de errores compatibles con versiones anteriores
=end

#------------ Ejercicio 16 ----------
require 'colorputs'

puts "hola", :rainbow_bl

Bundler.require
puts "Chau!", :red

#------------ Ejercicio 17--------------

=begin
      1- La finalidad del archivo gemfile es tener un registro de las gemas que son utilizadas dentro del proyecto
      2- source indica de donde descargara las gemas que se encuentran en Gemfile.Hasta antes de Bundler 1.13 se podia agregar multiples source pero ya no
      3- Cuando instale la gema colorputs, automaticamente se instalo la ultima version existente de la gema, si mañana sale una version nueva, debere 
         instalarla a mano o utilizar el comando "bundler update", el mismo actualiza todas las gemas dentro del archivo "gemfile"
      4- Salto un error ya que intento buscar un archivo de nombre "colorputs" y como no existe devuelve error
      5- Cuando se utilizo el comando  "bundle install", la gema bundler instalo todas las gemas dentro de "gemfile"
      6- bundle install, instala todas las gemas de 0 como si nunca se hubiesen instalado
         bundle update, actualiza todas las gemas instaladas a su ultima version    
      7- PAra que funcione de ambas maneras, importaria la gema de manera individual, y dejaria ademas el Bundler.require
=end
