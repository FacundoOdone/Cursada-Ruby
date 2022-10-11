=begin

1. Implementá un método que reciba como parámetro un arreglo de números, los ordene y de‑
vuelva el resultado. Por ejemplo:

=end

#COMENTARIO DE PRUEBA :D

def ordenar_arreglo (arreglo)
    return arreglo.sort
end

#puts ordenar_arreglo([1, 4, 6, 2, 3, 0, 10])
# => [0, 1, 2, 3, 4, 6, 10]

=begin
2. Modificá el método anterior para que en lugar de recibir un arreglo como único parámetro, re‑
ciba todos los números como parámetros separados. Por ejemplo:
=end

def ordenar_arreglo2(*args)
  return arreglo = args.sort
end

#puts ordenar_arreglo2(5,4,2,8,1,9)


=begin

Ejercicio 3:
Suponé que se te da el método que implementaste en el ejercicio 2 para que lo uses a fin de or‑
denar un conjunto de números que te son provistos en forma de arreglo. ¿Cómo podrías invocar
el método? Por ejemplo, teniendo la siguiente variable con los números a ordenar:
  
=end
#ntrada = [10, 9, 1, 2, 3, 5, 7, 8]


# Dada `entrada', invocá a #ordenar utilizando los valores que contiene la variable
#p ordenar_arreglo2(*entrada) # <= Esto no funciona. Corregí esta invocación para que funcione.

=begin

4. Escribí un método que dado un número variable de parámetros que pueden ser de cualquier
tipo, imprima en pantalla la cantidad de caracteres que tiene su representación como String
y la representación que se utilizó para contarla.

=end

def longitud (*args)
  args.each{|var| p "#{var} => cantidad de chars = #{var.to_s.length}"}
end

#longitud(9, Time.now, 'Hola', {un: 'hash'}, :ruby)

=begin
  
Implementá el método cuanto_falta? que opcionalmente reciba como parámetro un objeto
Time y que calcule la cantidad de minutos que faltan para ese momento. Si el parámetro de
fecha no es provisto, asumí que la consulta es para la medianoche de hoy.
Por ejemplo:

  
=end

def cuanto_falta? (tiempo)
  p Time.now
  #tiempo_ahora= Time.now
   #p tiempo.min - tiempo_ahora.min 
end

#cuanto_falta? Time.new(2032, 12, 31, 23, 59, 59)


class Documento
  attr_accessor :creador, :contenido, :publico, :borrado

  def initialize(usuario, publico = true, contenido = '')
    self.creador = usuario
    self.publico = publico
    self.contenido = contenido
    self.borrado = false
  end

  def getState
    @publico
  end

  def getCreador
    @creador
  end

  def getContenido
    @contenido
  end

  def getBorrado
    @borrado
  end

  def borrar
    self.borrado = true
  end

  def puede_ser_visto_por?(usuario)
    usuario.puede_ver? self
  end

  def puede_ser_modificado_por?(usuario)
    usuario.puede_modificar? self
  end

  def puede_ser_borrado_por?(usuario)
    usuario.puede_borrar? self
  end

end

=begin
Los usuarios finales de una aplicación tienen los atributos básicos que permiten identificarlos
(usuario, clave, email ‑ los que consideres necesarios), y un rol que determina qué operaciones
pueden hacer. Los roles posibles son: Lector, Redactor, Director y Administrador. Cada usuario
gestiona Documentos según su rol le permita, acorde a las siguientes reglas:
• Los Lectores pueden ver cualquier Documento que esté marcado como público.
• Los Redactores pueden hacer todo lo que los Lectores y además pueden cambiar el con‑
tenido de los Documentos que ellos crearon.
• Los Directores pueden ver y cambiar el contenido de cualquier documento (público o pri‑
vado, y creado por cualquier usuario), excepto aquellos que hayan sido borrados.
• Los Administradores pueden hacer lo mismo que los directores y además pueden borrar
Documentos.

=end

class Users 
  def initialize (user,clave,email)
    @usuario = user
    @clave = clave
    @email = email
  end

  def puede_ver?(usuario)
    false
  end

  def puede_modificar?(usuario)
    false
  end

  def puede_borrar?(usuario)
    false
  end


  def to_s
    " Mi nombre es #{@usuario}, \n Mi mail: #{@email} \n Mi clave #{@clave} \n Mi rol es: #{self.class} "
  end

end 

class Lector < Users
  def puede_ver?(document)
     if document.getState
      true
     end
  end
end

class Redactor < Lector
  def puede_modificar?(document)
    if (document.getCreador == self)
      true
    else 
      false
    end
  end
end

class Director < Redactor
  def puede_ver?(document)
    document.getBorrado
  end

  def puede_modificar?(document)
    !document.getBorrado
  end
end

class Administrador < Director
  def puede_borrar?(document)
    true
  end
end

=begin
Usu = Lector.new("Facundo", 12345, "facuodone1@gmail.com")
Doc = Documento.new(Usu, true)

puts(" Puede borrar ? #{Doc.puede_ser_borrado_por?(Usu)}")
puts (Usu.to_s)
=end

module Reverso
  def di_tcejbo()
    puts(self.object_id.to_s.reverse)
  end

  def ssalc()
    puts (self.class.to_s.reverse)
  end
end

class Prueba_mixin
  include Reverso
  def initialize()
    puts("CLASE INICIADA XDXD")
  end
end

=begin
mixin= Prueba_mixin.new

mixin.ssalc
mixin.di_tcejbo
=end

module Countable

  def invocations
      @invocations ||= Hash.new(0)
  end

  module ClassMethods
      def count_invocations_of(sym)
          alias_method(":original_#{sym}", sym) 

          define_method "#{sym}" do
              invocations[__method__] += 1
              send(":original_#{sym}")
          end
      end
  end

  def invoked?(sym)
      @invocations[sym] > 0
  end

  def invoked(sym)
      @invocations[sym]
  end

  def self.included(base)
      base.extend ClassMethods
  end

end


class Prueba

  include Countable

  def met1
  end

  def met2
  end

  count_invocations_of :met1
end

=begin
p = Prueba.new

p.met1
p.met1
p.met1
p.met1

puts p.invoked? :met1 #true
puts p.invoked? :met2 #false

puts p.invoked :met1 #4
puts p.invoked :met2 #0

=end
#a


class GenericFactory
  def self.create(*args)
    new(*args)
  end
  def initialize(*args)
    raise NotImplementedError
  end
end

class Persona < GenericFactory
  def initialize(*args)
    print("Mi nombre es #{args[0]} y mi apellido es #{args[1]}")
  end
end


#p=Persona.create("Facundo","Odone")

module Opposite
  def opposite_2
    return !self
  end
end


class TrueClass
  include Opposite

end

class FalseClass
include Opposite
end

=begin
p false.opposite_2
# => true
p true.opposite_2
# => false
p true.opposite_2.opposite_2
# => true
=end

=begin
EJERCICIO 15
Escribí un método da_nil? que reciba un bloque, lo invoque y retorne si el valor de retorno del
bloque fue nil. Por ejemplo:
=end

def da_nil?
  if yield != nil 
    return false
  else
    return true
  end
end

=begin
p (da_nil? { })
# => true
p (da_nil? do
'Algo distinto de nil'
end)
# => false

=end

=begin
EJERCICIO 16
Implementá un método que reciba como parámetros un Hash y un Proc, y que devuelva un
nuevo Hash cuyas las claves sean los valores del Hash recibido como parámetro, y cuyos valores
sean el resultado de invocar el Proc con cada clave del Hash original. Por ejemplo:

=end

def procesar_hash(hash,proc)
  hash.inject({}){|hash_retorno,(clave,valor)| hash_retorno[valor] =proc.call(clave); hash_retorno}
end

#
#hash = { 'clave' => 1, :otra_clave => 'valor' }
#p procesar_hash(hash, ->(x) { x.to_s.upcase })
# => { 1 => 'CLAVE', 'valor' => 'OTRA_CLAVE' }


=begin 
EJERCICIO 17

Implementá un método que reciba un número variable de parámetros y un bloque, y que al ser
invocado ejecute el bloque recibido pasándole todos los parámetros que se recibieron encap‑
sulando todo esto con captura de excepciones de manera tal que si en la ejecución del bloque
se produce alguna excepción, proceda de la siguiente forma:
• Si la excepción es de clase RuntimeError, debe imprimir en pantalla "Hay algo mal
que no anda bien", y retornar :rt.
• Si la excepción es de clase NoMethodError, debe imprimir "Y este método?" más el
mensaje original de la excepción que se produjo, y retornar :nm.
• Si se produce cualquier otra excepción, debe imprimir en pantalla "Y ahora?", y relanzar
la excepción que se produjo.
En caso que la ejecución del bloque sea exitosa, deberá retornar :ok

=end

def ej17(*args)
  #raise Exception
  args.each{|arg| yield arg}
  return :ok

rescue RuntimeError => excepcion
  p ('Hay algo mal que no anda bien'); return :rt

rescue NoMethodError => excepcion
  p ('Y este metodo?'); return :nm

rescue Exception => excepcion
  p ('Y ahora?'); raise excepcion
end

#puts ej17("a","b","c") { | letra | puts "Letra #{letra}: #{letra.ord} en ascii"}

=begin 

EJERCICIO 18

Escribí un enumerador que calcule la serie de Fibonacci.

=end

fibonacci = Enumerator.new do |caller|
  i1, i2 = 1, 1
  loop do
    caller.yield i1
    i1, i2 = i2, i1+i2
  end
end

6.times { puts fibonacci.next }
