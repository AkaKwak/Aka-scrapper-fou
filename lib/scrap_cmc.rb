require 'nokogiri'
require 'http'
require 'open-uri'

# Fonction pour récupérer le contenu HTML brut et extraire les données
def fetch_multiple_pages_and_parse(base_url, total_pages)
  crypto_data = []

  (1..total_pages).each do |page|
    url = "#{base_url}?page=#{page}"
    response = HTTP.get(url)

    if response.status.success?
      html_content = response.to_s
      doc = Nokogiri::HTML(html_content)

      # Extraction des noms et des prix avec Nokogiri
      names = doc.css('.beGxzp .coin-item-symbol').map(&:text)
      prices = doc.css('.dzgUIj').map(&:text)

      # Combiner noms et prix dans un tableau d'objets
      names.zip(prices).each do |name, price|
        crypto_data << { name: name, price: price }
      end

      puts "Page #{page} récupérée et analysée avec succès."
    else
      puts "Erreur lors de la récupération de la page #{page}: #{response.status}"
    end
  end

  crypto_data
end

# URL de base de CoinMarketCap
base_url = "https://coinmarketcap.com"
total_pages = 10 # Pour les x premières pages

# Récupérer les données et les stocker dans un tableau d'objets
crypto_data = fetch_multiple_pages_and_parse(base_url, total_pages)

# Afficher les résultats
crypto_data.each do |crypto|
  puts "#{crypto[:name]} => #{crypto[:price]}"
end