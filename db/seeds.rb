<<<<<<< HEAD
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

user = User.new(email: 'eduardo1234@uc.cl',
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

comentario = Comment.new(contenido: 'Un local bastante variado y con muy buena atención', 
                        user_id: 2,
                        local_id: 1,
                        valoracion: 5)
comentario.save!

comentario = Comment.new(contenido: 'Posee una comida muy sabrosa, la atencion es 10/10',
                        user_id: 5,
                        local_id: 2,
                        valoracion: 5)
comentario.save!

comentario = Comment.new(contenido: 'La atencion es muy buena, pero debería existir mas variedad de sandwiches',
                        user_id: 2,
                        local_id: 2,
                        valoracion: 4)
comentario.save!

comentario = Comment.new(contenido: 'El tiempo de atencion es bastante bueno y los precios estan acorde al nivel de los platos',
                        user_id: 3,
                        local_id: 1,
                        valoracion: 5)
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
=======
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.new(email: 'hackerman@uc.cl', password: 'hackerman', password_confirmation: 'hackerman', admin: true, nombre: 'Admin')
user.save!

comuna = Comuna.new(nombre: 'Santiago Centro')
comuna.save!

comuna = Comuna.new(nombre: 'San Joaquin')
comuna.save!

comuna = Comuna.new(nombre: 'Macul')
comuna.save!

user = User.new(email: 'oscar@uc.cl', password: 'oscars810', password_confirmation: 'oscars810', admin: false, nombre: 'Oscar')
user.save!

user = User.new(email: 'benito1234@uc.cl', password: '1junio1996', password_confirmation: '1junio1996', admin: false, nombre: 'Benito')
user.save!

user = User.new(email: 'eduardo1234@uc.cl', password: 'eduardo1234', password_confirmation: 'eduardo1234', admin: false, nombre: 'Eduardo')
user.save!

user = User.new(email: 'felipe1234@uc.cl', password: 'felipe1234', password_confirmation: 'felipe1234', admin: false, nombre: 'Felipe')
user.save!

local = Local.new(nombre: 'Juan y Medio', descripcion: 'Restaurante de comida tipica chilena', aceptado: true, idcomuna: 1, idusuario: 2)
local.save!

local = Local.new(nombre: 'Pamplona', descripcion: 'Sandwicheria española', aceptado: true, idcomuna: 3, idusuario: 1)
local.save!

local = Local.new(nombre: 'Taiko', descripcion: 'Tenedor libre de sushi', aceptado: false, idcomuna: 3, idusuario: 4)
local.save!

# menu = Menu.new(idlocal: 1, nombre: 'Cazuela', descripcion: 'Sopa de verduras con carne de vacuno o de ave', precio: 3000)
# menu.save!

# menu = Menu.new(idlocal: 1, nombre: 'Empanada de pino', descripcion: 'Carne molida con cebolla, aceitunas y huevo cocido, envuelto en masa', precio: 1500)
# menu.save!    

# menu = Menu.new(idlocal: 1, nombre: 'Porotos', descripcion: 'Porotos con tallarines cocidos', precio: 3000)
# menu.save!

# menu = Menu.new(idlocal: 2, nombre: 'Italiano', descripcion: 'Sandwich que posee carne de churrasco/ lomo, palta, tomate y mayonesa', precio: 2000)
# menu.save!

# menu = Menu.new(idlocal: 2, nombre: 'Barros Luco', descripcion: 'Sandwuich que posee carne de churrasco/ lomo y queso', precio: 1500)
# menu.save!

# menu = Menu.new(idlocal: 2, nombre: 'Mega Submarino', descripcion: 'Sandwuich que posee jamón, tomate, queso, lechuga, pepino, pepinillo y aceitunas', precio: 1000)
# menu.save!

comentario = Comentario.new(contenido: 'Un local bastante variado y con muy buena atención', idusuario: 2, idlocal: 1, valoracion: 5)
comentario.save!

comentario = Comentario.new(contenido: 'Posee una comida muy sabrosa, la atencion es 10/10', idusuario: 5, idlocal: 2, valoracion: 5)
comentario.save!

comentario = Comentario.new(contenido: 'La atencion es muy buena, pero debería existir mas variedad de sandwiches', idusuario: 2, idlocal: 2, valoracion: 4)
comentario.save!

comentario = Comentario.new(contenido: 'El tiempo de atencion es bastante bueno y los precios estan acorde al nivel de los platos', idusuario: 3, idlocal: 1, valoracion: 5)
comentario.save!
>>>>>>> master
