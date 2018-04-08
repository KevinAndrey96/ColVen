# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Setting.create(exchange_rate: '0.09')
Setting.create(text: 'Bienvenido a Colven Intercambios')
User.create(email: 'admin@colvenintercambios.com', commission:0.05, zone:'Pruebas', role: 'Admin', name: 'Administrador', creator: 'admin@colvenintercambios.com', password: 'Pruebas2018@', password_confirmation: 'Pruebas2018@')
User.create(email: 'wholesaler@colvenintercambios.com', commission:0.05, zone:'Pruebas', role: 'Wholesaler', name: 'Mayorista', creator: 'admin@colvenintercambios.com', password: 'Pruebas2018@', password_confirmation: 'Pruebas2018@')
User.create(email: 'distributor@colvenintercambios.com', commission:0.05, zone:'Pruebas', role: 'Distributor', name: 'Distribuidor', creator: 'wholesaler@colvenintercambios.com', password: 'Pruebas2018@', password_confirmation: 'Pruebas2018@')
User.create(email: 'commerce@colvenintercambios.com', commission:0.05, zone:'Pruebas', role: 'Commerce', name: 'Comercio', creator: 'distributor@colvenintercambios.com', password: 'Pruebas2018@', password_confirmation: 'Pruebas2018@')