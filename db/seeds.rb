# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#user = User.new(email: 'hackerman@uc.cl', password: 'hackerman', password_confirmation: 'hackerman', admin: true, nombre: 'Admin')
#user.save!

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