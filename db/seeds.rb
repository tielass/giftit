require 'json'

puts 'Cleaning DB...'
Gift.destroy_all

serialized_makeup = File.read("#{Rails.root}/db/data/makeup.json")
makeups = JSON.parse(serialized_makeup)

makeups.first(20).each do |makeup|
  name = makeup["name"]
  price = makeup["price"].to_f
  photo = makeup["image_link"]
  description = makeup["description"]
  new_gift = Gift.create!(name: name, price: price, photo: photo, description: description)
  puts "#{new_gift.id} was sucessfully created!"
end
