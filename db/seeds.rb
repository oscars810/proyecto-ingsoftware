require "csv"

descripcion = 
"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, 
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
"

CSV.foreach("db/comunas_ordenadas.csv") do |row|
    comuna = Commune.new(nombre: row[0])
    comuna.save!
end

interest = Interest.new(nombre: 'Escalada', descripcion: 'Para los amantes de la escalada')
interest.save!

interest = Interest.new(nombre: 'Música', descripcion: 'Para los amantes de la música')
interest.save!

interest = Interest.new(nombre: 'Guitarra', descripcion: 'Para los amantes de la guitarra')
interest.save!

interest = Interest.new(nombre: 'Comida', descripcion: 'Para los amantes de la comida')
interest.save!

interest = Interest.new(nombre: 'Viajar', descripcion: 'Para los amantes de viajar')
interest.save!

interest = Interest.new(nombre: 'Lectura', descripcion: 'Para los amantes de la lectura')
interest.save!

interest = Interest.new(nombre: 'Deporte', descripcion: 'Para los amantes del deporte')
interest.save!

interest = Interest.new(nombre: 'Política', descripcion: 'Para los amantes de la política')
interest.save!

interest = Interest.new(nombre: 'Astronomía', descripcion: 'Para los amantes de la astronomía')
interest.save!

interest = Interest.new(nombre: 'Programación', descripcion: 'Para los amantes de la programación')
interest.save!

interest = Interest.new(nombre: 'Ciencia', descripcion: 'Para los amantes de la ciencia')
interest.save!

interest = Interest.new(nombre: 'Tecnología', descripcion: 'Para los amantes de la tecnología')
interest.save!

interest = Interest.new(nombre: 'Filosofía', descripcion: 'Para los amantes de la filosofía')
interest.save!

user = User.new(email: 'hackerman@uc.cl',
                password: 'hackerman',
                password_confirmation: 'hackerman',
                admin: true,
                nombre: 'Admin',
                commune_id: 7)
user.save!


user = User.new(email: 'oscar@uc.cl',
                password: 'oscars810',
                password_confirmation: 'oscars810',
                admin: false,
                nombre: 'Oscar',
                commune_id: 2,
                edad: 20,
                descripcion: descripcion)
user.save!
user.interests << Interest.find(2)
user.interests << Interest.find(3)
user.interests << Interest.find(11)

user = User.new(email: 'benito1234@uc.cl',
                password: '1junio1996',
                password_confirmation: '1junio1996',
                admin: false,
                nombre: 'Benito',
                commune_id: 3,
                edad: 5,
                descripcion: descripcion)
user.save!
user.interests << Interest.find(1)
user.interests << Interest.find(4)

user = User.new(email: 'eduardo@uc.cl',
                password: 'eduardo1234',
                password_confirmation: 'eduardo1234',
                admin: false,
                nombre: 'Eduardo',
                commune_id: 4,
                edad: 20,
                descripcion: descripcion)
user.save!
user.interests << Interest.find(5)
user.interests << Interest.find(8)

user = User.new(email: 'felipe1234@uc.cl',
                password: 'felipe1234',
                password_confirmation: 'felipe1234',
                admin: false,
                nombre: 'Felipe',
                commune_id: 5,
                edad: 20,
                descripcion: descripcion)
user.save!
user.interests << Interest.find(6)
user.interests << Interest.find(7)

user = User.new(email: 'alfonso@uc.cl',
                password: 'alfonso1234',
                password_confirmation: 'alfonso1234',
                admin: false,
                nombre: 'Alfonso',
                commune_id: 4,
                edad: 20,
                descripcion: descripcion)
user.save!
user.interests << Interest.find(9)
user.interests << Interest.find(10)

user = User.new(email: 'mario@uc.cl',
                password: 'mario1234',
                password_confirmation: 'mario1234',
                admin: false,
                nombre: 'Mario',
                commune_id: 4,
                edad: 19,
                descripcion: descripcion)
user.save!
user.interests << Interest.find(1)
user.interests << Interest.find(3)
user.interests << Interest.find(5)

user = User.new(email: 'fernando@uc.cl',
                password: 'fernando1234',
                password_confirmation: 'fernando1234',
                admin: false,
                nombre: 'Fernando',
                commune_id: 2,
                edad: 21,
                descripcion: descripcion)
user.save!
user.interests << Interest.find(2)
user.interests << Interest.find(4)
user.interests << Interest.find(6)
user.interests << Interest.find(13)

user = User.new(email: 'ricardo@uc.cl',
                password: 'ricardo1234',
                password_confirmation: 'ricardo1234',
                admin: false,
                nombre: 'Ricardo',
                commune_id: 6,
                edad: 18,
                descripcion: descripcion)
user.save!
user.interests << Interest.find(7)

user = User.new(email: 'benjamin@uc.cl',
                password: 'benjamin1234',
                password_confirmation: 'benjamin1234',
                admin: false,
                nombre: 'Benjamin',
                commune_id: 7,
                edad: 19,
                descripcion: descripcion)
user.save!
user.interests << Interest.find(8)

user = User.new(email: 'esteban@uc.cl',
                password: 'esteban1234',
                password_confirmation: 'esteban1234',
                admin: false,
                nombre: 'Esteban',
                commune_id: 8,
                edad: 19,
                descripcion: descripcion)
user.save!
user.interests << Interest.find(9)

user = User.new(email: "cristina@uc.cl",
                password: 'cristina1234',
                password_confirmation: 'cristina1234',
                admin: false,
                nombre: 'Cristina',
                commune_id: 4,
                edad: 24,
                descripcion: descripcion)
user.save!
user.interests << Interest.find(10)
user.interests << Interest.find(1)

user = User.new(email: "valentina@uc.cl",
    password: "valentina1234",
    password_confirmation: "valentina1234",
    admin: false,
    nombre: "Valentina",
    commune_id: 5,
    edad: 20,
    descripcion: descripcion)
user.save!
user.interests << Interest.find(8)
user.interests << Interest.find(4)

user = User.new(email: "daniela@uc.cl",
    password: "daniela1234",
    password_confirmation: "daniela1234",
    admin: false,
    nombre: "Daniela",
    commune_id: 5,
    edad: 23,
    descripcion: descripcion)
user.save!
user.interests << Interest.find(7)
user.interests << Interest.find(3)

user = User.new(email: "fernanda@uc.cl",
    password: "fernanda1234",
    password_confirmation: "fernanda1234",
    admin: false,
    nombre: "Fernanda",
    commune_id: 2,
    edad: 19,
    descripcion: descripcion)
user.save!
user.interests << Interest.find(5)
user.interests << Interest.find(2)

local = Local.new(nombre: 'Juan y Medio',
                  descripcion: 'Restaurante de comida tipica chilena', 
                  aceptado: true, 
                  commune_id: 2, 
                  user_id: 2)
local.save!

local = Local.new(nombre: 'Pamplona',
                  descripcion: 'Sandwicheria española',
                  aceptado: true,
                  commune_id: 3, 
                  user_id: 3)
local.save!

local = Local.new(nombre: 'Taiko',
                  descripcion: 'Tenedor libre de sushi',
                  aceptado: false,
                  commune_id: 4, 
                  user_id: 4)
local.save!

local = Local.new(nombre: 'Pollos Hermanos',
                  descripcion: 'Totalmente un local de pollo',
                  aceptado: true,
                  commune_id: 5,
                  user_id: 5)
local.save!

local = Local.new(nombre: 'SubGuay',
                descripcion: 'Sandwiches con todo lo que puedas comer.',
                aceptado: true,
                commune_id: 1,
                user_id: 9)
local.save!

local = Local.new(nombre: 'Chicken Brother',
                descripcion: 'Totalmente una copia de un local de pollos.',
                aceptado: false,
                commune_id: 2,
                user_id: 8)
local.save!

local = Local.new(nombre: 'El Fito',
                descripcion: 'Grandes cantidades de cerveza por bajas cantidades de dinero.',
                aceptado: true,
                commune_id: 2,
                user_id: 7)
local.save!

comentario = Comment.new(contenido: 'Un local bastante variado y con muy buena atención', 
                        user_id: 8,
                        local_id: 1)
comentario.save!

comentario = Comment.new(contenido: 'Posee una comida muy sabrosa, la atencion es 10/10',
                        user_id: 9,
                        local_id: 1)
comentario.save!

comentario = Comment.new(contenido: 'La atencion es muy buena, pero debería existir mas variedad de sandwiches',
                        user_id: 8,
                        local_id: 2)
comentario.save!

comentario = Comment.new(contenido: 'El tiempo de atencion es bastante bueno y los precios estan acorde al nivel de los platos',
                        user_id: 10,
                        local_id: 2)
comentario.save!

comentario = Comment.new(contenido: 'Se demoraban demasiado en atender, pero la comida estaba muy buena',
                         user_id: 11,
                         local_id: 4)
comentario.save!

comentario = Comment.new(contenido: 'Pesima atencion',
    user_id: 11,
    local_id: 5)
comentario.save!

comentario = Comment.new(contenido: 'El mejor lugar para ir con amigos',
    user_id: 10,
    local_id: 7)
comentario.save!

comentario = Comment.new(contenido: 'Atencion lenta, pero la comida vale la pena',
    user_id: 9,
    local_id: 5)
comentario.save!

comentario = Comment.new(contenido: 'Excelentes precios!!!!!!!',
    user_id: 11,
    local_id: 7)
comentario.save!

menu = Menu.new(local_id: 1,
                nombre: 'Cazuela',
                descripcion: 'Sopa de verduras con carne de vacuno o de ave',
                precio: 3000)
menu.save!

menu = Menu.new(local_id: 1,
                nombre: 'Empanada de pino',
                descripcion: 'Carne molida con cebolla, aceitunas y huevo cocido, envuelto en masa',
                precio: 1500)
menu.save!    

menu = Menu.new(local_id: 1,
                nombre: 'Porotos',
                descripcion: 'Porotos con tallarines cocidos',
                precio: 3000)
menu.save!

menu = Menu.new(local_id: 2,
                nombre: 'Italiano',
                descripcion: 'Sandwich que posee carne de churrasco/ lomo, palta, tomate y mayonesa',
                precio: 2000)
menu.save!

menu = Menu.new(local_id: 2,
                nombre: 'Barros Luco',
                descripcion: 'Sandwich que posee carne de churrasco/ lomo y queso',
                precio: 1500)
menu.save!

menu = Menu.new(local_id: 2,
                nombre: 'Mega Submarino',
                descripcion: 'Sandwich que posee jamón, tomate, queso, lechuga, pepino, pepinillo y aceitunas',
                precio: 1000)
menu.save!


menu = Menu.new(local_id: 4,
                nombre: 'Metanfetamina',
                descripcion: 'No hay descripcion',
                precio: 50000)
menu.save!

valuation = Valuation.new(local_id: 4,
                          user_id: 6,
                          nombre: "Catalina",
                          fecha: "05-04-2020")
valuation.save!

valuation = Valuation.new(local_id: 4,
                          user_id: 7,
                          nombre: "Valentina",
                          fecha: "08-03-2020")
valuation.save!

valuation = Valuation.new(local_id: 2,
                          user_id: 4,
                          puntuacion: 5,
                          realizada: true)
valuation.save!

valuation = Valuation.new(local_id: 2,
                          user_id: 6,
                          nombre: "Daniela",
                          fecha: "22-05-2020")
valuation.save!

valuation = Valuation.new(local_id: 1,
                          user_id: 3,
                          puntuacion: 2,
                          realizada: true)
valuation.save!

valuation = Valuation.new(local_id: 1,
                          user_id: 4,
                          puntuacion: 5,
                          realizada: true)
valuation.save!

valuation = Valuation.new(local_id: 2,
                          user_id: 5,
                          puntuacion: 4,
                          realizada: true)
valuation.save!

valuation = Valuation.new(local_id: 5,
    user_id: 11,
    puntuacion: 1,
    realizada: true)
valuation.save!

valuation = Valuation.new(local_id: 7,
    user_id: 10,
    puntuacion: 5,
    realizada: true)
valuation.save!

valuation = Valuation.new(local_id: 5,
    user_id: 9,
    puntuacion: 4,
    realizada: true)
valuation.save!

valuation = Valuation.new(local_id: 7,
    user_id: 11,
    puntuacion: 5,
    realizada: true)
valuation.save!

valuation = Valuation.new(local_id: 4,
    user_id: 9,
    puntuacion: 4,
    realizada: true)
valuation.save!

valuation = Valuation.new(local_id: 4,
    user_id: 8,
    puntuacion: 2,
    realizada: true)
valuation.save!

valuation = Valuation.new(local_id: 1,
    user_id: 7,
    puntuacion: 5,
    realizada: true)
valuation.save!

valuation = Valuation.new(local_id: 1,
    user_id: 2,
    puntuacion: 3,
    realizada: true)
valuation.save!

valuation = Valuation.new(local_id: 2,
    user_id: 6,
    puntuacion: 5,
    realizada: true)
valuation.save!

valuation = Valuation.new(local_id: 2,
    user_id: 7,
    puntuacion: 4,
    realizada: true)
valuation.save!

match_request = MatchRequest.new(
                solicitante_id: 2,
                solicitado_id: 3)
match_request.save!


match_request = MatchRequest.new(
                solicitante_id: 3,
                solicitado_id: 4)
match_request.save!


match_request = MatchRequest.new(
                solicitante_id: 4,
                solicitado_id: 5)
match_request.save!


match_request = MatchRequest.new(
                solicitante_id: 5,
                solicitado_id: 2)
match_request.save!

match_request = MatchRequest.new(
    solicitante_id: 3,
    solicitado_id: 7)
match_request.save!

match_request = MatchRequest.new(
    solicitante_id: 3,
    solicitado_id: 8)
match_request.save!

match_request = MatchRequest.new(
    solicitante_id: 3,
    solicitado_id: 9)
match_request.save!

match_request = MatchRequest.new(
    solicitante_id: 3,
    solicitado_id: 13)
match_request.save!

match_request = MatchRequest.new(
    solicitante_id: 3,
    solicitado_id: 14)
match_request.save!
