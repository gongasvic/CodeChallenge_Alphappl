# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Produto.delete_all
Produto.create! id: 1, nome: "Banana", preco: 0.49, active: true
Produto.create! id: 2, nome: "Maçã", preco: 0.29, active: true
Produto.create! id: 3, nome: "Morangos", preco: 1.99, active: true
Produto.create! id: 4, nome: "Cebolas", preco: 0.35, active: true
Produto.create! id: 5, nome: "Biscoitos", preco: 1.29, active: true
Produto.create! id: 6, nome: "Queijo", preco: 1.55, active: true
Produto.create! id: 7, nome: "Mel", preco: 1.69, active: true
Produto.create! id: 8, nome: "Abobora", preco: 2.29, active: true


Cliente.delete_all
#Cliente.create! id: 1, nome: "Gonçalo Vicente", morada: "Rua Costa Reis nº4", cidade: "Belas", pais: "Portugal", mail:"gongas09@gmail.com", telefone: "917455392", cpostal: "2605-206", nif: "222652594", titulo: "Sr.", password: "1234567", password_confirmation: "1234567", cardNumb: "12345678", expDate: "december 2015", nomeCartao: "Goncalo"
#Cliente.create! id: 2, nome: "Lara Llamazares"
#Cliente.create! id: 3, nome: "Fátima Lampreia"
#Cliente.create! id: 4, nome: "António Vicente"
