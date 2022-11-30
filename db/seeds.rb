require "open-uri"
require "nokogiri"

puts 'Cleaning DB...'
Gift.destroy_all

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

pages.each do |page|
  url = page[:url]
  html_file = URI.open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search(".gallery__slides__slide").each do |gift|
    name = gift.search("h2").text
    description = gift.search("p").text
    price = gift.search(".product-offer__buy-button span span").text.split("$").last.to_i
    price = rand(30..60) if price.zero?
    photo = gift.search(".ResponsiveImageContainer-dmlCKO.hWKgYV.responsive-image__image").last&.attributes&.[]("src")&.value
    Gift.create(name: name, price: price, photo: photo, description: description, category: page[:category])
  end
end
