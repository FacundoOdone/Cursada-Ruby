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
