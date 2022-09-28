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

Usu = Lector.new("Facundo", 12345, "facuodone1@gmail.com")
Doc = Documento.new(Usu, true)

puts(" Puede borrar ? #{Doc.puede_ser_borrado_por?(Usu)}")
puts (Usu.to_s)