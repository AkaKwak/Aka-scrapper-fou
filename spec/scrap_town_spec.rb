#scrap_town_spec.rb

require 'nokogiri'
require 'http'
require 'open-uri'
require_relative "../lib/scrap_town"

describe 'Townhall scraper' do
  # Test de la méthode get_townhall_email
  describe '#get_townhall_email' do
    it 'récupère l\'email correct à partir d\'une URL de mairie' do
      # Exemple d'URL d'une mairie, remplace par une URL réelle pour tester
      url = 'https://lannuaire.service-public.fr/ile-de-france/val-d-oise/avernes/mairie-95800'

      email = get_townhall_email(url)
      
      expect(email).not_to be_nil
      expect(email).to match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i) # Vérifie que l'email est au bon format
    end
  end

  # Test de la méthode get_townhall_urls
  describe '#get_townhall_urls' do
    it 'récupère les URLs et emails des mairies à partir d\'une page d\'annuaire' do
      # Exemple avec une page de numéro
      page_num = 1
      result = get_townhall_urls(page_num)
      
      expect(result).not_to be_nil
      expect(result).to be_a(Hash) # Vérifie que la méthode retourne un hash
      expect(result.keys).not_to be_empty # Vérifie que des villes ont été trouvées
      expect(result.values.first).to match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i) # Vérifie que le premier email est au bon format
    end
  end
end