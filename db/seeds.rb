# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# creating users
puts 'Cleaning article order...'
ArticleOrder.destroy_all
puts 'Cleaning articles...'
Article.destroy_all
puts 'Cleaning stores...'
Store.destroy_all

i = 0
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

estimated_delivery_times = %w[2-3min 5-7min 3-4min]

delivery_fee = %w[2.00 4.00 5.00 7.00]

puts 'Creating 8 new pharmacies'
8.times do
  Store.create!(
    title: titles[i],
    description: descriptions[i],
    image_url: images[i],
    rating: rand(1.25..5.75),
    estimated_delivery_time: estimated_delivery_times[rand(0..2)],
    delivery_fees: delivery_fee[rand(0..3)]
  )
  i += 1
end
puts 'pharmacies done'

Store.all.each do |store|
  puts "Creating articles for store #{store.id}"
  store.articles.create!([{
                           image_url: 'buccotantum.png',
                           description: 'fl spray 30 ml, Symptomatic treatment of pain and bucco-pharyngeal irritation; from 6 years old.',
                           title: 'Bucco Tantum',
                           weight: 40,
                           category: 'Coolings',
                           price: 14.95
                         },
                          {
                            image_url: 'triumph.png',
                            description: 'Sinomarin hypertonic nasal spray fl 30 ml, With natural minerals and trace elements. Decongests and releases; from infant age',
                            title: 'Triumph',
                            weight: 40,
                            category: 'Coolings',
                            price: 14.20
                          },
                          {
                            image_url: 'vicks.png',
                            description: 'spr dosing spray 15 ml, Clears stuffy nose and decreases mucus secretion in case of colds and sinusitis. From 6 years old.',
                            title: 'Vicks',
                            weight: 20,
                            category: 'Coolings',
                            price: 15.50
                          },
                          {
                            image_url: 'solmucol.png',
                            description: 'gran 100 mg without sugar sach 1.5 g, Dissolve the contents of the sachet in a glass of water and drink it immediately after dissolution.',
                            title: 'Solmucol',
                            weight: 40,
                            category: 'Coolings',
                            price: 2.75
                          },
                          {
                            image_url: 'lidazon.png',
                            description: 'Gargling liq fl 240 ml, Sore throat, swallowing disorders, hoarseness, inflammation of the mouth, throat and pharynx; from 18 years old.',
                            title: 'Lidazon',
                            weight: 250,
                            category: 'Coolings',
                            price: 14.95
                          },
                          {
                            image_url: 'itinerol.png',
                            description: 'Caps blister 10 pc,Nausea and vomiting of all origins, motion sickness. Vomiting of pregnancy: only on medical prescription. Adults and teenagers from 12 years old.',
                            title: 'Itinerol',
                            weight: 11,
                            category: 'Digestion',
                            price: 14.20
                          },
                          {
                            image_url: 'vitafor.png',
                            description: 'Probi-intestis caps 40 pce, Stimulation of the intestinal flora; For intestinal well-being.',
                            title: 'Vitafor',
                            weight: 20,
                            category: 'Digestion',
                            price: 48.95
                          },
                          {
                            image_url: 'tavolax.png',
                            description: 'drag 5 mg blister 30 pce, Occasional constipation; from 12 years old; from 4–12 years old on medical prescription.',
                            title: 'Tavolax',
                            weight: 10,
                            category: 'Digestion',
                            price: 11.20
                          },
                          {
                            image_url: 'carmol.png',
                            description: 'drops fl 200 ml, By absorption in case of: stomach disorders, nervousness, sleep disorders, difficulty falling asleep / By friction in case of: Joint and muscle pain, rheumatism, lumbago, headache / By gargling in case of: Diseases respiratory tract (cough, catarrh). From 18 years old',
                            title: 'Carmol',
                            weight: 210,
                            category: 'Digestion',
                            price: 45.95
                          },
                          {
                            image_url: 'bioflorin.png',
                            description: 'caps fl 50 pc, To make it easier to take Bioflorin, the capsules can be opened and their contents mixed with liquid, cold or lukewarm food.',
                            title: 'Bioflorin',
                            weight: 13,
                            category: 'Digestion',
                            price: 38.95
                          },
                          {
                            image_url: 'collypan.png',
                            description: 'Dry eyes gtt opht monodos 0.35 ml, For long-lasting hydration of dry, irritated or watery eyes.',
                            title: 'Collypan',
                            weight: 15,
                            category: 'Ears & Eyes',
                            price: 20.50
                          },
                          {
                            image_url: 'otalgan.png',
                            description: 'Earwax fl 10 ml, Otalgan Cerumen is a solution that facilitates the elimination of earwax plugs.',
                            title: 'Otalgan',
                            weight: 20,
                            category: 'Ears & Eyes',
                            price: 10.20
                          },
                          {
                            image_url: 'optava.png',
                            description: 'Unit Dose gtt opht 5 mg/ml monodos 0.4 ml, In case of concomitant use of other eye drops, you must wait 15 minutes between instillation of Optava Unit Dose and application of the other eye drops.',
                            title: 'Optava',
                            weight: 20,
                            category: 'Ears & Eyes',
                            price: 16.95
                          },
                          {
                            image_url: 'protect.png',
                            description: 'SE gtt opht monodos 0.4 ml, Adults: In general, instill 4 to 5 times a day 1 drop in the affected eye.',
                            title: 'Protect',
                            weight: 10,
                            category: 'Ears & Eyes',
                            price: 35.65
                          },
                          {
                            image_url: 'liposic.png',
                            description: 'Eye gel 10 g, Please follow the dosage given on the package insert or prescribed by your doctor. If you feel that the effectiveness of the medicine is too weak or on the contrary too strong, please contact your doctor, your pharmacist or your druggist.',
                            title: 'Liposic',
                            weight: 15,
                            category: 'Ears & Eyes',
                            price: 5.30
                          },
                          {
                            image_url: 'berocca.png',
                            description: 'cpr eff orange flavor box 60 pce, La vitamine C et le zinc soutiennent les défenses immunitaires affaiblies par le stress pendant que le calcium et le magnésium, deux minéraux, régulent lactivité musculaire en transmettant les impulsions des nerfs aux muscles.',
                            title: 'Berocca',
                            weight: 55,
                            category: 'Fortifiers',
                            price: 59.95
                          },
                          {
                            image_url: 'energizing.png',
                            description: 'strong sol drink amp 10 ml, Please follow the dosage given on the package insert or prescribed by your doctor.',
                            title: 'Energizing',
                            weight: 410,
                            category: 'Fortifiers',
                            price: 109.00
                          },
                          {
                            image_url: 'ephynal.png',
                            description: 'caps 300 mg 100 pce, Since the vitamin in Ephynal is fat-soluble, its absorption in the intestine is best when ingested meals contain a small amount of fat.',
                            title: 'Ephynal',
                            weight: 32,
                            category: 'Fortifiers',
                            price: 63.95
                          },
                          {
                            image_url: 'streuli.png',
                            description: 'Streuli cpr 300 mg box 100 pce, Vitamin D 3 is necessary for the absorption of calcium from food and is indispensable for normal bone and tooth formation.',
                            title: 'Streuli',
                            weight: 32,
                            category: 'Fortifiers',
                            price: 47.40
                          },
                          {
                            image_url: 'solmag.png',
                            description: 'cpr eff raspberry aroma box 60 pce, 1 Effervescent tablet per day in a glass of water (1½ dl).',
                            title: 'Solmag',
                            weight: 55,
                            category: 'Fortifiers',
                            price: 42.80
                          },
                          {
                            image_url: 'perskindol.png',
                            description: 'Classic gel tb 200 ml, Muscle cramps, sore muscles, calf cramps, back and neck pain, lumbago, sciatica, rheumatic pain, joint pain, bruises, sprains, strains, tennis elbow, headaches, migraines; from 3 years.',
                            title: 'Perskindol',
                            weight: 210,
                            category: 'Pain',
                            price: 33.95
                          },
                          {
                            image_url: 'algifor.png',
                            description: 'Liquid Caps Kaps 400 mg Blist 10 pcs, Maximum Daily Dose: Do not take more than 3 soft gelatin capsules in any 24 hour period, unless prescribed by a doctor.',
                            title: 'Algifor',
                            weight: 15,
                            category: 'Pain',
                            price: 13.20
                          },
                          {
                            image_url: 'dafalgan.png',
                            description: 'cpr 500 mg blister 16 pce, Do not administer single doses of the tablets more frequently than indicated.',
                            title: 'Dafalgan',
                            weight: 10,
                            category: 'Pain',
                            price: 2.50
                          },
                          {
                            image_url: 'xylocaine.png',
                            description: 'Spray cannula long sterile 50 pcs, This product is designed to provide a more accurate, efficient, and comfortable application of Xylocaine, a local anesthetic commonly used in dental and medical procedures.',
                            title: 'Xylocaine',
                            weight: 5,
                            category: 'Pain',
                            price: 99.95
                          },
                          {
                            image_url: 'kytta.png',
                            description: 'Ointment Tb 50 g, Rheumatic diseases; muscle and joint pain; neuralgia; blunt injuries; tenosynovitis. From 3 years.',
                            title: 'Kytta',
                            weight: 55,
                            category: 'Pain',
                            price: 16.50
                          },
                          {
                            image_url: 'bepanthen.png',
                            description: 'Pro Sensiderm cream tb 20 g, Bepanthen® PRO Sensiderm acts in case of itching and skin irritations.',
                            title: 'Bepanthen',
                            weight: 30,
                            category: 'Skin & Hair',
                            price: 14.50
                          }, {
                            image_url: 'puressentiel.png',
                            description: 'Anti-lice lotion with comb 200 ml, Apply Puressentiel Anti-Lice generously line by line to dry hair to obtain complete impregnation. Leave to act for 10 minutes.',
                            title: 'Puressentiel',
                            weight: 210,
                            category: 'Skin & Hair',
                            price: 36.95
                          }, {
                            image_url: 'betadin.png',
                            description: 'liq fl soap 120 ml, In rare cases, hypersensitivity reactions or contact dermatitis (with symptoms such as skin redness, blisters and itching) may occur.',
                            title: 'Betadin',
                            weight: 130,
                            category: 'Skin & Hair',
                            price: 13.70
                          }, {
                            image_url: 'ichtholan.png',
                            description: 'Blistering ointment ong 20% ​​tb 40 g, Unless the doctor advises otherwise, Ichtholan blister ointment 20% should be applied in a thick layer to the area to be treated and covered with a large bandage.',
                            title: 'Ichtholan',
                            weight: 45,
                            category: 'Skin & Hair',
                            price: 22.50
                          }, {
                            image_url: 'lalugen.png',
                            description: 'Cream tb 25 g, Before applying ialugen cream or compresses, it is necessary to carry out cleaning and disinfection of wounds and their contour.',
                            title: 'Ialugen',
                            weight: 30,
                            category: 'Skin & Hair',
                            price: 20.25
                          }])
  puts "created #{Article.count} articles"
end
puts 'Finished stores'
