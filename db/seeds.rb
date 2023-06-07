# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# creating users
puts 'Cleaning database...'
Store.destroy_all
Article.destroy_all

titles = ['Amavita', 'SUN STORE', 'PharmaSuisse', 'BENU', 'TopPharm', 'Pharmacie Bien-Être',
          'PureSanté', 'Pharmacie Vitalité']

descriptions = ['Your health partner. Medications, advice, care. Trusted pharmacy.',
                'Your health, our passion. Pharmacy dedicated to your well-being.',
                'The reference in health. Pharmaceutical expertise. Solutions for every need.',
                'Quality and reliability. Care for everyone. Your health, our commitment.',
                'Modern and accessible pharmacy. Solutions for your health.',
                'Your health, our priority. Tailored medications and advice. Close to you.',
                'Health and beauty combined. Wide selection of products. Attentive professionals.',
                'Pharmaceutical expertise. Natural well-being. Personalized service.']

images = ['pharm1.jpg', 'pharm2.jpeg', 'pharm3.jpeg', 'pharm4.jpeg',
          'pharm5.jpeg', 'pharm6.jpeg', 'pharm7.jpeg', 'pharm8.jpeg']

estimated_delivery_times = %w[10-15min 15-20min 10-20min]

delivery_fee = %w[2chf 4chf 5chf 7chf]

puts 'Creating 8 new pharmacies'
8.times do
  Store.create!(
    title: titles[rand(1..8)],
    description: descriptions[rand(1..8)],
    image_url: images[rand(1..8)],
    rating: [rand(1..5)],
    estimated_delivery_time: estimated_delivery_times[rand(1..3)],
    delivery_fees: delivery_fee[rand(1..4)]
  )
end

Store.all.each do |store|
  puts "Creating articles for store #{store.id}"
  store.articles.create!([{
                           description: 'cpr 500 mg blister 16 pce',
                           title: 'Dafalgan',
                           weight: 10,
                           category: 'Pain',
                           price: 2.50
                         },
                          {
                            description: 'Probi-intestis caps 40 pce',
                            title: 'Vitafor',
                            weight: 20,
                            category: 'Digestion',
                            price: 48.95
                          },
                          {
                            description: 'fl spray 30 ml',
                            title: 'Bucco Tantum',
                            weight: 40,
                            category: 'Coolings',
                            price: 14.95
                          },
                          {
                            description: 'Aqueous solution colorless aqueous sol spr 30 ml',
                            title: 'Merfen',
                            weight: 40,
                            category: 'Skin & Hair',
                            price: 9.40
                          },
                          {
                            description: 'Dry eyes gtt opht monodos 0.35 ml',
                            title: 'Collypan',
                            weight: 15,
                            category: 'Ears & Eyes',
                            price: 20.50
                          },
                          {
                            description: 'Classic gel tb 200 ml',
                            title: 'Perskindol',
                            weight: 210,
                            category: 'Pain',
                            price: 33.95
                          },
                          {
                            description: 'Earwax fl 10 ml',
                            title: 'Otalgan',
                            weight: 20,
                            category: 'Ears & Eyes',
                            price: 10.20
                          },
                          {
                            description: 'Caps blister 10 pc',
                            title: 'Itinerol',
                            weight: 11,
                            category: 'Digestion',
                            price: 14.20
                          },
                          {
                            description: 'Pro Sensiderm cream tb 20 g',
                            title: 'Bepanthen',
                            weight: 30,
                            category: 'Skin & Hair',
                            price: 14.50
                          },
                          {
                            description: 'cpr eff orange flavor box 60 pce',
                            title: 'Berocca',
                            weight: 55,
                            category: 'Fortifiers',
                            price: 59.95
                          }])
  puts "created #{Article.count} articles"
end
puts 'Finished stores'
