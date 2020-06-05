
comuna = Commune.new(nombre: 'Santiago Centro')
comuna.save!

comuna = Commune.new(nombre: 'San Joaquin')
comuna.save!

comuna = Commune.new(nombre: 'Macul')
comuna.save!

comuna = Commune.new(nombre: 'Conchalí')
comuna.save!

comuna = Commune.new(nombre: 'Providencia')
comuna.save!

comuna = Commune.new(nombre: 'Las Condes')
comuna.save!

comuna = Commune.new(nombre: 'Estación Central')
comuna.save!

comuna = Commune.new(nombre: 'Renca')
comuna.save!

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

user = User.new(email: 'hackerman@uc.cl',
                password: 'hackerman',
                password_confirmation: 'hackerman',
                admin: true,
                nombre: 'Admin',
                commune_id: 1)
user.save!

user = User.new(email: 'oscar@uc.cl',
                password: 'oscars810',
                password_confirmation: 'oscars810',
                admin: false,
                nombre: 'Oscar',
                commune_id: 2)
user.save!

user = User.new(email: 'benito1234@uc.cl',
                password: '1junio1996',
                password_confirmation: '1junio1996',
                admin: false,
                nombre: 'Benito',
                commune_id: 3)
user.save!

user = User.new(email: 'eduardo@uc.cl',
                password: 'eduardo1234',
                password_confirmation: 'eduardo1234',
                admin: false,
                nombre: 'Eduardo',
                commune_id: 4)
user.save!

user = User.new(email: 'felipe1234@uc.cl',
                password: 'felipe1234',
                password_confirmation: 'felipe1234',
                admin: false,
                nombre: 'Felipe',
                commune_id: 5)
user.save!

user = User.new(email: 'alfonso@uc.cl',
                password: 'alfonso1234',
                password_confirmation: 'alfonso1234',
                admin: false,
                nombre: 'Alfonso',
                commune_id: 4)
user.save!

user = User.new(email: 'mario@uc.cl',
                password: 'mario1234',
                password_confirmation: 'mario1234',
                admin: false,
                nombre: 'Mario',
                commune_id: 4)
user.save!

user = User.new(email: 'fernando@uc.cl',
                password: 'fernando1234',
                password_confirmation: 'fernando1234',
                admin: false,
                nombre: 'Fernando',
                commune_id: 2)
user.save!

user = User.new(email: 'ricardo@uc.cl',
                password: 'ricardo1234',
                password_confirmation: 'ricardo1234',
                admin: false,
                nombre: 'Ricardo',
                commune_id: 6)
user.save!

user = User.new(email: 'benjamin@uc.cl',
                password: 'benjamin1234',
                password_confirmation: 'benjamin1234',
                admin: false,
                nombre: 'Benjamin',
                commune_id: 7)
user.save!

user = User.new(email: 'esteban@uc.cl',
                password: 'esteban1234',
                password_confirmation: 'esteban1234',
                admin: false,
                nombre: 'Esteban',
                commune_id: 8)
user.save!

local = Local.new(nombre: 'Juan y Medio',
                  descripcion: 'Restaurante de comida tipica chilena', 
                  aceptado: true, 
                  commune_id: 1, 
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
                          user_id: 6)
valuation.save!

valuation = Valuation.new(local_id: 4,
                          user_id: 7)
valuation.save!

valuation = Valuation.new(local_id: 2,
                          user_id: 4,
                          puntuacion: 5,
                          realizada: true)
valuation.save!

valuation = Valuation.new(local_id: 2,
                          user_id: 6)
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
