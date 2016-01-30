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

q1 = Questionary.find_or_create_by(name: "nasatlx")
Case.find_or_create_by(name: "Dropdown", questionary: q1)
Case.find_or_create_by(name: "Mega Menu", questionary: q1)
Case.find_or_create_by(name: "Dropdown mit Mega Menu", questionary: q1)

Question.find_or_create_by(questionary: q1, kind: "value", label: "Geistige Anforderung", description: "Wie viel geistige Anforderung war bei der Informationsaufnahme und bei der Informationsverarbeitung erforderlich (z.B. Denken, Entscheiden, Rechnen, Erinnern, Hinsehen, Suchen ...)? War die Aufgabe leicht oder anspruchsvoll, einfach oder komplex, erfordert sie hohe Genauigkeit oder ist sie fehlertolerant?")
Question.find_or_create_by(questionary: q1, kind: "value", label: "Körperliche Anforderung", description: "Wie viel körperliche Aktivität war erforderlich (z.B. ziehen, drücken, drehen, steuern, aktivieren ...)? War die Aufgabe leicht oder schwer, einfach oder anstrengend, erholsam oder mühselig?")
Question.find_or_create_by(questionary: q1, kind: "value", label: "Zeitliche Anforderung", description: "Wie viel Zeitdruck empfanden Sie hinsichtlich der Häufigkeit oder dem Takt mit dem die Aufgaben oder Aufgabenelemente auftraten? War die Aufgabe langsam und geruhsam oder schnell und hektisch?")
Question.find_or_create_by(questionary: q1, kind: "value", label: "Leistung", description: "Wie erfolgreich haben Sie Ihrer Meinung nach die vom Versuchsleiter (oder Ihnen selbst) gesetzten Ziele erreicht? Wie zufrieden waren Sie mit Ihrer Leistung bei der Verfolgung dieser Ziele?")
Question.find_or_create_by(questionary: q1, kind: "value", label: "Anstrengung", description: "Wie hart mussten Sie arbeiten, um Ihren Grad an Aufgabenerfüllung zu erreichen?")
Question.find_or_create_by(questionary: q1, kind: "value", label: "Frustration", description: "Wie unsicher, entmutigt, irritiert, gestresst und verärgert (versus sicher, bestätigt, zufrieden, entspannt und zufrieden mit sich selbst) fühlten Sie sich während der Aufgabe?")

