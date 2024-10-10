#scrap_town_v2.rb

require 'nokogiri'
require 'http'
require 'open-uri'
 
def get_townhall_email(townhall_url)
  doc = Nokogiri::HTML(URI.open(townhall_url))
  mail = doc.css('.send-mail').text 
  mail
end

def get_townhall_urls(numero)
  # Charge la page d'annuaire de mairies
  begin
    doc = Nokogiri::HTML(URI.open("https://lannuaire.service-public.fr/navigation/ile-de-france/val-d-oise/mairie?page=#{numero}"))
  rescue OpenURI::HTTPError => e
    puts "Erreur de connexion : #{e.message}"
    return {}
  end

  # Récupère les noms des villes
  ville = doc.css('a.fr-link').map { |node| node.text.gsub("Mairie - ", "") }.drop(4)

  # Récupère les URLs des mairies
  townhall_url = doc.css('a.fr-link').map { |node| node['href'] }.drop(4)

  # Récupère les emails des mairies en vérifiant si l'email existe
  townhall_email = townhall_url.map do |lien|
    begin
      email = get_townhall_email(lien)
      email.nil? || email.empty? ? "Email non disponible" : email
    rescue StandardError => e
      puts "Erreur lors de la récupération de l'email pour #{lien}: #{e.message}"
      "Email non disponible"
    end
  end

  # Crée un Hash ville => email
  ville.zip(townhall_email).to_h
end

hash={}
7.times do |i|
  hash = hash.merge(get_townhall_urls(i + 1))
  sleep(1) # Délai d'une seconde entre chaque requête
end

puts hash


# def get_townhall_urls(numero)
#   doc = Nokogiri::HTML(URI.open("https://lannuaire.service-public.fr/navigation/ile-de-france/val-d-oise/mairie?page=#{numero}"))
  
#   ville = doc.css('a.fr-link').map { |node| node.text.gsub("Mairie - ", "") } .drop(4)
#   townhall_url = doc.css('a.fr-link').map { |node| node['href'] } .drop(4)
#   townhall_email = townhall_url.map { |lien| get_townhall_email(lien)}
#   hash = ville.zip(townhall_email).to_h
# end