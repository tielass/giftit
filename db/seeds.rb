# require 'json'

# puts 'Cleaning DB...'
# Gift.destroy_all

# serialized_makeup = File.read("#{Rails.root}/db/data/makeup.json")
# makeups = JSON.parse(serialized_makeup)

# makeups.first(20).each do |makeup|
#   name = makeup["name"]
#   price = makeup["price"].to_f
#   photo = makeup["image_link"]
#   description = makeup["description"]
#   new_gift = Gift.create!(name: name, price: price, photo: photo, description: description)
#   puts "#{new_gift.id} was sucessfully created!"
# end

# require "open-uri"
# require "nokogiri"

# url = "https://www.self.com/gallery/best-tech-gifts"

# html_file = URI.open(url).read
# html_doc = Nokogiri::HTML(html_file)

# html_doc.search(".GallerySlideCaptionHedText-dauSZL.hOQIAG").each do |element|
# puts element.text.strip
# end

# require "open-uri"
# require "nokogiri"

# url = "https://www.self.com/gallery/best-tech-gifts"

# html_file = URI.open(url).read
# html_doc = Nokogiri::HTML(html_file)

# html_doc.search(".gallery__slides__slide").each do |gift|
#   p gift.search("h2").text
#   p gift.search("p").text
#   p gift.search(".product-offer__buy-button span span").text

# # name = ".GallerySlideCaptionHedText-dauSZL.hOQIAG"
# # price = "ButtonLabel-eAHUfq.bCFzBu.button__label"
# # photo = ".ResponsiveImageContainer-dmlCKO.hWKgYV.responsive-image__image"
# # description = ".GallerySlideCaptionDek-dhXPox.kLTDiI"
# end

require "open-uri"
require "nokogiri"


pages = [
  { url: "https://www.self.com/gallery/best-tech-gifts", category: "Technology" },
  { url: "https://www.self.com/gallery/best-chocolate-gifts", category: "Chocolate" },
  { url: "https://www.self.com/gallery/best-food-gifts", category: "Food" },
  { url: "https://www.self.com/gallery/cooking-gifts-for-home-cooks", category: "Cooking" },
  { url: "https://www.self.com/gallery/gifts-for-runners", category: "Running" },
  { url: "https://www.self.com/gallery/best-hiking-gifts", category: "Hiking" },
  { url: "https://www.self.com/gallery/best-perfume-gift-sets", category: "Perfume" },
  { url: "https://www.self.com/gallery/useful-gifts-for-practical-people", category: "Practical" },
  { url: "https://www.self.com/gallery/best-subscription-gifts", category: "Subscriptions" },
  { url: "https://www.self.com/gallery/healthy-gift-ideas-for-wellness-gurus", category: "Wellness" },
  { url: "https://www.self.com/gallery/best-yoga-gifts", category: "Yoga" },
  { url: "https://www.self.com/gallery/best-white-elephant-gifts", category: "Wildcard" }
]

pages.first(1).each do |page|
  url = page[:url]
  html_file = URI.open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search(".gallery__slides__slide").first(1).each do |gift|
    name = gift.search("h2").text
    description = gift.search("p").text
    price = gift.search(".product-offer__buy-button span span").text
    photo = gift.search(".ResponsiveImageContainer-dmlCKO.hWKgYV.responsive-image__image").last.attributes["src"].value
    # Gift.create(name:, price:, photo:, description:, category: page[1])
  end
end
