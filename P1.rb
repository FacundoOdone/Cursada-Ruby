# Escribí una función llamada reemplazar que, dado un String que recibe como parámetro,
# busque y reemplace en éste cualquier ocurrencia de "{" por "do\n" y cualquier ocurrencia de
# "}" por "\nend", de modo que convierta los bloques escritos con llaves por bloques multilínea
# con do y end. Por ejemplo:

# Ejercicio 5
def reemplazar (palabra)
  palabra["{"] = "do\n"
  palabra["}"] = "\nend"
  puts(palabra)
end

#reemplazar("3.times { |i| puts i }")
# => "3.times do\n |i| puts i \nend"

=begin
#Ejercicio 6
#Escribí una función que exprese en palabras la hora que recibe como parámetro, según las si‑
#guientes reglas:
#Si el minuto está entre 0 y 10, debe decir “en punto”,
#• si el minuto está entre 11 y 20, debe decir “y cuarto”,
#• si el minuto está entre 21 y 34, debe decir “y media”,
#• si el minuto está entre 35 y 44, debe decir “menos veinticinco” con la hora siguiente,
#• si el minuto está entre 45 y 55, debe decir “menos cuarto” con la hora siguiente,
#• y si el minuto está entre 56 y 59, debe decir “Casi son las” con la hora siguiente

def tiempo_en_palabras(time)
  hour = time.hour
  min = time.min
str = case min
  when 0..10 then "Son las #{hour} en punto"
  when 11..20 then "Son las #{hour} y cuarto"
  when 21..34 then "Son las #{hour} y media"
  when 35..44 then "Son las #{hour+1} menos veinticinco"
  when 45..55 then "Son las #{hour+1} menos cuarto"
  when 56..59  then "Casi son las #{hour+1}"
  end
puts(str)
end

tiempo_en_palabras(Time.new(2022, 10, 21, 10, 1))
# => "Son las 10 en punto"
tiempo_en_palabras(Time.new(2022, 10, 21, 9, 33))
# => "Son las 9 y media"
tiempo_en_palabras(Time.new(2022, 10, 21, 8, 45))
# => "Son las 9 menos cuarto"
tiempo_en_palabras(Time.new(2022, 10, 21, 6, 58))
# => "Casi son las 7"
tiempo_en_palabras(Time.new(2022, 10, 21, 0, 58))
# => "Casi es las 1"

=end

#Ejercicio 8 Modificá la función anterior para que sólo considere como aparición del segundo String cuando se trate de palabras completas.
def contar (str1, str2)
  puts (str1.scan(str2).size)
end

contar("La casa de la esquina tiene la puerta roja y la ventana blanca
  .", "la")
  # => 5

=begin
Dada una cadena cualquiera, y utilizando los métodos que provee la clase String, realizá las
siguientes operaciones sobre dicha cadena, implementando métodos que funcionen de la si‑
guiente forma:
• string_reverso: retorna el string con los caracteres en orden inverso.
• string_sin_espacio: elimina los espacios en blanco que contenga.
• string_a_arreglo_ascii: retorna un arreglo con cada uno de los caracteres converti‑
dos a su correspondiente valor ASCII.
• string_remplaza_vocal: cambia las vocales por números:
– "a" o "A" por "4",
– "e" o "E" por "3",
– "i" o "I" por "1",
– "o" u "O" por "0",
– y "u" o "U" por "6".
=end

def clase_string (palabra)
  palabra_remplazada = palabra.char.each { |letra| }
  puts ("String Reverso: #{palabra.reverse} ")
  puts ("String Sin espacio: #{palabra.delete(" ")} ")
  puts ("String como ASCII: #{palabra.delete(" ").codepoints} ")
  puts ("String remplaza vocal: #{palabra_remplazada}} ")

end

clase_string("hola a")

=begin
  12. Escribí una función longitud que dado un arreglo que contenga varios String cualesquiera,
retorne un nuevo arreglo donde cada elemento es la longitud del String que se encuentra en
la misma posición del arreglo recibido como parámetro. Por ejemplo:


def longitud(arreglo)
  puts (arreglo.map {| palabra | palabra.size})
end

longitud(['TTPS', 'Opción', 'Ruby', 'Cursada 2022'])
# => [4, 6, 4, 12]

=begin
Escribí una función llamada listar que reciba un Hash y retorne un String con los pares de
clave/valor formateados en una lista ordenada en texto plano. Por ejemplo:



def listar(h)
  h= h.sort_by{|key,value| value}.reverse
  h.each_with_index {|value,i | puts " #{i +1}: #{value[0]}: #{value[1]}"}.to_s
end

listar({ perros: 2, gatos: 2, peces: 0, aves: 3 })
# => "1. perros: 2\n2. gatos: 2\n3. peces: 0\n4. aves: 0"

=begin
15: Escribí unafunción llamada rot13 que encripte un String recibido como parámetro utilizando
el algoritmo ROT13. Por ejemplo:
rot13("¡Bienvenidos a la cursada de TTPS Opción Ruby!")
# => "¡Ovrairavqbf n yn phefnqn qr GGCF Bcpvóa Ehol!



def rot13(string)
  string= string.chars.map {|letra| 
    case letra
    when "a".."m", "A".."M" then (letra.ord + 13).chr
    when "n".."z", "N".."Z" then (letra.ord - 13).chr
    else letra
    end
  }.join
  puts string
  
end

rot13("¡Bienvenidos a la cursada de TTPS Opción Ruby!")
# => "¡Ovrairavqbf n yn phefnqn qr GGCF Bcpvóa Ehol!

#16, lo mismo pero remplazar el 13 por el parametro nuevo que pasemos

=begin

17: Escribí un script en Ruby que le pida a quien lo ejecute su nombre, el cual ingresará por en‑
trada estándar (el teclado), y que lo utilice para saludarl@ imprimiendo en pantalla ¡Hola, <
nombre>!. Por ejemplo:
$ ruby script.rb
Por favor, ingresá tu nombre:
R2-D2
¡Hola, R2-D2!

#ejercicio17:

puts "hola! cual es tu nombre? "

name= gets

puts "Hola #{name}"


18: enviar al script el nombre desde afuera

ARGV.each do |_params|
  puts "Hola #{_params}"
end


19:
Implementá las funciones necesarias para que, dado un color expresado en notación RGB, se
pueda obtener su representación en las notaciones entera y hexadecimal. La notación entera
se define como red + green * 256 + blue * 256 * 256 y la hexadecimal como el resul‑
tado de expresar en base 16 el valor de cada color y concatenarlos en orden. Por ejemplo:


def notacion_hexadecimal(arreglo)
  "#" + arreglo.map{|i| format("%02x",i)}.join.upcase
  # Otra forma --> arreglo.inject("#") {|acc,i| acc += format("%02X",i)}
end

def notacion_entera(arreglo)
  arreglo.map.with_index{|elem,index| elem * 256.pow(index)}.sum 
  # Otra forma --> arrego.each.with_index.inject(0) {|acc,(elem,index)| acc += elem * 256.pow(index)}
end

notacion_hexadecimal([0, 128, 255])
# => '#0080FF'
notacion_entera([0, 128, 255])
# => 16744448

=end

def Ejercicio21(tope)
  (1..tope).filter {|i|
  i.modulo(3).zero? && i.modulo(5).zero?
  }.sum
end

puts(Ejercicio21(100))