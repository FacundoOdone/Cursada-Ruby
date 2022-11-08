=begin

# --------------------- Ejercicio 1 ---------------------
=begin
    - Action Mailer: Te permite enviar email desde la aplicacion usando "Mailers classes" y vistas
    - Action Pack: Es un framework que permite manejar y responder a solicitudes web. Proporciona mecanismos para el enrutamiento, definicion de controladores que implementan acciones y generan respuestas
    - Action View: Trabaja junto con el Action Controller. Este se encarga de comuniarse con la BD y realizar acciones CRUD, mientras que el Action View es el responsable de compilar la respuesta
    - Active Job: Es un framework para declarar trabajos y hacer que se ejecuten en una variedad de backends. Estos trabajos pueden ser desde limpiezas programadas regularmente hasta cargos de facturacion y envios por correo. Cualquier cosa que pueda dividirse en pequeñas unidades de trabajo y ejecutarse ne paralelo
    -  Active Model: Es una libreria que contiene varios modulos utilizados en el desarrollo de clases que necesitan algunas caracteristicas presentes en Active Record.
    - Active Record: Es la M en MVC, el modelo, es la capa del sismtea responsable de representar la logica y los datos. Active Record facilita la creacion y el uso de objetos cuyos datos requieran almacenamiento persistente en una BD.
    - Active Support: Es el componente responsable de proporcionar extensiones y utilidades del lenguaje Ruby.
    - Action Cable: Integra los WebSockets con el resto de su aplicacion Rails. Permite que las funciones en tiempo real se escriban en Ruby con el mismo estilo y forma que el resto de la aplicacion Rails.
    - Active Storage: Facilita la carga de archivos en un servicio de almacenamiento en la nube como Amazon S3, entre otros.
    - Action Text: Trae contenido de texto enriquecido y lo edite para Rails. Incluye el editor Trix que maneja todo, desde el formato hasta los enlaces, las citas,las listas,las imagenes incrustadas y las galerias.
    - Action MailBox: Enruta los correos electrinicos entrantes a buzonoes de correo similares a controladores para su procesamiento en Rails. Se envia con enstradas para Mailgun, Mandrill, Postmark y SendGrid. Tambien peude manejar los correso entrantes directamente a traves de los ingresos intengrados de Exim, Postfix y Qmail.
=end

#-------------------------Ejercicio 2---------------------------
=begin
    
    Paso 1- Instalar Rails :  gem install rails
    Paso 2- Generar el proyecto: rails new #{nombreDelProjecto}
    Paso 3- Instalar gema para sqlite: gem install sqlite3
    Paso 4- sqlite db \ <nombre>" sin comillas. Reemplazar "<nombre>" con el nombre de la base de datos SQLite3 desea crear. 
            Esto le llevará a una ventana de la consola para crear tablas SQLite3.
    Paso 5- crear la tabla <nombre>" sin comillas. Reemplazar "<nombre>" con el nombre de la tabla que 
            desee para crear, por ejemplo, "crear artículos de mesa."
    
=end
# --------------------- Ejercicio 4 ---------------------
=begin
    Cada ambiente, basicamente son configuraciones para utilizar diferenes versiones de ruby, diferentes librerias, etc.
    Se utilizan diferentes ambientes para ver como afectan al compartamiento esas diferentes configuraciones.
    Ni puta idea cual es el ambiente por defecto, supongo que el global.
=end

=begin
----------------------------Ejercicio 5-----------------------
1) Ruby on rails brinda diferentes El archivo de configuración config/application.rb y los archivos de configuración específicos del entorno 
(comoconfig/environment/production.rb) le permiten especificar las distintas configuraciones que desea transferir a todos los componentes
2) Los archivos de configuracion principales son: application.rb, production.rb, 
* ENV[" RAILS_ENV"] define el entorno de Rails (producción, desarrollo, prueba, etc.) en el que se ejecutará Rails.

ENV[" RAILS_RELATIVE_URL_ROOT"] es utilizado por el código de enrutamiento para reconocer las URL cuando implementa su aplicación en un subdirectorio.

ENV[" RAILS_CACHE_ID"] y ENV["RAILS_APP_VERSION"] se utilizan para generar claves de caché expandidas en el código de caché de Rails. 
Esto le permite tener múltiples cachés separados de la misma aplicación.

3) practico xdxd
4) practico xdxd


----------------------------Ejercicio 6------------------------
1 y 2) Un inicializador es cualquier archivo de código Ruby almacenado en /config/initializers en su aplicación. 
Puede usar inicializadores para mantener los ajustes de configuración que deben realizarse después de cargar todos los marcos y complementos.
3) No, ya que los initializer son ejecutados cuando se inicia el sistema

---------------------------Ejercicio 7------------------------
1)Ruby proporciona un script llamado Generator. Este script se puede usar para generar muchos elementos útiles en Rails
2)