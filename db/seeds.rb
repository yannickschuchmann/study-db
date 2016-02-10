# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Job.find_or_create_by(name: "Student")
Job.find_or_create_by(name: "Berufstätig")
Job.find_or_create_by(name: "Schüler")
Job.find_or_create_by(name: "Rentner")
Job.find_or_create_by(name: "Sonstiges")

Case.find_or_create_by(name: "Mega Dropdown")
Case.find_or_create_by(name: "Mega Menu")
Case.find_or_create_by(name: "Dynamic Mega Menu")

q1 = Questionary.find_or_create_by(name: "nasatlx")
q2 = Questionary.find_or_create_by(name: "attrakdiff", description: 'Nachfolgend findest Du Wortpaare, mit deren Hilfe Du die Beurteilung vornehmen kannst. Sie stellen jeweils extreme Gegensätze dar, zwischen denen eine Abstufung möglich ist. Diese Bewertung bedeutet, dass das Produkt eher sympathisch, aber noch verbesserungsbedürftig ist.Denken Sie nicht lange über die Wortpaare nach, sondern geben Sie bitte die Einschätzung ab, die Ihnen spontan in den Sinn kommt. Vielleicht passen einige Wortpaare nicht so gut auf das Produkt, kreuzen Sie aber trotzdem bitte immer eine Antwort an. Denken Sie daran, dass es keine "richtigen" oder "falschen" Antworten gibt - nur Ihre persönliche Meinung zählt!')
q3 = Questionary.find_or_create_by(name: "conclusion")


Question.find_or_create_by(questionary: q1, kind: "value", label: "Geistige Anforderung", description: "Wie hoch war die geistige Anforderung der Aufgaben? (z.B. Denken, Entscheiden, Rechnen, Erinnern, Hinsehen, Suchen ...)?")
Question.find_or_create_by(questionary: q1, kind: "value", label: "Körperliche Anforderung", description: "Wie viel körperliche Aktivität war erforderlich (z.B. ziehen, drücken, drehen, steuern, aktivieren ...)?")
Question.find_or_create_by(questionary: q1, kind: "value", label: "Zeitliche Anforderung", description: "Wie viel Zeitdruck hast Du hinsichtlich der Häufigkeit oder des Takts mit dem die Aufgaben auftraten empfunden?")
Question.find_or_create_by(questionary: q1, kind: "value", label: "Leistung", description: "Wie erfolgreich hast Du Deiner Meinung nach die gesetzten Ziele erreicht?")
Question.find_or_create_by(questionary: q1, kind: "value", label: "Anstrengung", description: "Wie hart musstest Du arbeiten, um Deinen Grad an Aufgabenerfüllung zu erreichen?")
Question.find_or_create_by(questionary: q1, kind: "value", label: "Frustration", description: "Wie unsicher, entmutigt, irritiert, gestresst hast Du Dich während der Aufgabe gefühlt?")

Question.find_or_create_by(questionary: q2, kind: "comparison", label: "menschlich|technisch")
Question.find_or_create_by(questionary: q2, kind: "comparison", label: "angenehm|unangenehm")
Question.find_or_create_by(questionary: q2, kind: "comparison", label: "einfach|kompliziert")
Question.find_or_create_by(questionary: q2, kind: "comparison", label: "schön|hässlich")
Question.find_or_create_by(questionary: q2, kind: "comparison", label: "praktisch|unpraktisch")
Question.find_or_create_by(questionary: q2, kind: "comparison", label: "direkt|umständlich")
Question.find_or_create_by(questionary: q2, kind: "comparison", label: "voraussagbar|unberechenbar")
Question.find_or_create_by(questionary: q2, kind: "comparison", label: "gut|schlecht")
Question.find_or_create_by(questionary: q2, kind: "comparison", label: "übersichtlich|verwirrend")
Question.find_or_create_by(questionary: q2, kind: "comparison", label: "motivierend|entmutigend")
Question.find_or_create_by(questionary: q2, kind: "comparison", label: "neuartig|herkömmlich")
Question.find_or_create_by(questionary: q2, kind: "comparison", label: "handhabbar|widerspenstig")
Question.find_or_create_by(questionary: q2, kind: "text", label: "Anmerkungen", required: false)

Question.find_or_create_by(questionary: q3, kind: "value", label: "Welche Navigation hat dir am besten gefallen?")

settings = Setting.find_by(name: "app")
if settings.nil?
  Setting.create(name: "app", maintenance: false)
end