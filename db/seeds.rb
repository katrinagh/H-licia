# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# creating users
puts "Cleaning database..."
Article.User.destroy_all


titles = ["Amavita", "SUN STORE", "PharmaSuisse", "BENU", "TopPharm", "Pharmacie Bien-Être",
  "PureSanté", "Pharmacie Vitalité"]

descriptions = ["Votre partenaire santé. Médicaments, conseils, soins. Pharmacie de confiance.",
  "Votre santé, notre passion. Pharmacie au service de votre bien-être.",
  "La référence en santé. Expertise pharmaceutique. Solutions pour chaque besoin.",
  "Qualité et fiabilité. Soins pour tous. Votre santé, notre engagement",
  "Pharmacie moderne et accessible. Solutions pour votre santé.",
  "Votre santé, notre priorité. Médicaments et conseils adaptés. Proche de vous.",
  "Santé et beauté réunies. Large sélection de produits. Professionnels attentionnés.",
  "Expertise pharmaceutique. Bien-être naturel. Service personnalisé."]

images =["pharm1.jpg", "pharm2.jpeg", "pharm3.jpeg", "pharm4.jpeg",
  "pharm5.jpeg", "pharm6.jpeg", "pharm7.jpeg", "pharm8.jpeg",]

ratings = ["1", "2", "3", "4", "5"]

estimated_delivery_times =["10-15min", "15-20min", "10-20min"]

delivery_fees =["2chf", "4chf", "5chf", "7chf"]

puts "Creating new pharmacies"
8.times do
    User.create!(
    title: titles[rand(1..8)],
    description:  descriptions[rand(1..8)],
    image: images[rand(1..8)],
    rating: ratings[rand(1..5)],
    estimated_delivery_time: estimated_delivery_tims[rand(1..3)],
    delivery_fee: delivery_fees[rand(1..4)]
    )
end



puts "Creating new articles" do
    User.create!(
    description_of_article: "cpr 500 mg blist 16 pce",
    title_of_article: "Dafalgan",
    weight: "10g",
    category: "Pain",
    price: "CHF 2.50"
    )
end

puts "Finished toilet papers"
