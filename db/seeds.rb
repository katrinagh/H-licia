# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# creating users
puts "Cleaning database..."
Store.destroy_all
Article.destroy_all


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
    Store.create!(
    title: titles[rand(1..8)],
    description:  descriptions[rand(1..8)],
    image: images[rand(1..8)],
    rating: ratings[rand(1..5)],
    estimated_delivery_time: estimated_delivery_tims[rand(1..3)],
    delivery_fee: delivery_fees[rand(1..4)]
    )



  Article.create!(
  description: "cpr 500 mg blister 16 pce",
  title: "Dafalgan",
  weight: "10g",
  category: "Pain",
  price: "CHF 2.50"
    )
  puts "Creating new #{articles.title}"

  Article.create!(
  description: "Probi-intestis caps 40 pce",
  title: "Vitafor",
  weight: "20g",
  category: "Digestion",
  price: "CHF 48.95"
  )
  puts "Creating new #{articles.title}"


  Article.create!(
  description: "fl spray 30 ml",
  title: "Bucco Tantum",
  weight: "40g",
  category: "Coolings",
  price: "CHF 14.95"
  )
  puts "Creating new #{articles.title}"

  Article.create!(
  description: "Aqueous solution colorless aqueous sol spr 30 ml",
  title: "Merfen",
  weight: "40g",
  category: "Skin & Hair",
  price: "CHF 9.40"
  )
  puts "Creating new #{articles.title}"

Article.create!(
  description: "Dry eyes gtt opht monodos 0.35 ml",
  title: "Collypan",
  weight: "15g",
  category: "Ears & Eyes",
  price: "CHF 20.50"
  )
  puts "Creating new #{articles.title}"

Article.create!(
  description: "Classic gel tb 200 ml",
  title: "Perskindol",
  weight: "210g",
  category: "Pain",
  price: "CHF 33.95".
  )
  puts "Creating new #{articles.title}"

Article.create!(
  description: "Earwax fl 10 ml",
  title: "Otalgan",
  weight: "20g",
  category: "Ears & Eyes",
  price: "CHF 10.20"
  )
  puts "Creating new #{articles.title}"

Article.create!(
  description: "Caps blister 10 pc",
  title: "Itinerol",
  weight: "11g",
  category: "Digestion",
  price: "CHF 14.20"
  )
  puts "Creating new #{articles.title}"

Article.create!(
  description: "Pro Sensiderm cream tb 20 g",
  title: "Bepanthen",
  weight: "30g",
  category: "Skin & Hair",
  price: "CHF 14.50"
  )
  puts "Creating new #{articles.title}"

Article.create!(
  description: "cpr eff orange flavor box 60 pce",
  title: "Berocca",
  weight: "55g",
  category: "Fortifiers",
  price: "CHF 59.95"
  )
  puts "Creating new #{articles.title}"
