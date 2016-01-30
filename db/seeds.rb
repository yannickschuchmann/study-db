# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Job.find_or_create_by(name: "Schüler")
Job.find_or_create_by(name: "Student")
Job.find_or_create_by(name: "Renter")
Job.find_or_create_by(name: "Angesteller")
Job.find_or_create_by(name: "Selbstständiger")
Job.find_or_create_by(name: "Sonstiges")

q1 = Questionary.find_or_create_by(id: 1)
q2 = Questionary.find_or_create_by(id: 2)
q3 = Questionary.find_or_create_by(id: 3)
Case.find_or_create_by(name: "Dropdown", questionary: q1)
Case.find_or_create_by(name: "Mega Menu", questionary: q2)
Case.find_or_create_by(name: "Dropdown mit Mega Menu", questionary: q3)