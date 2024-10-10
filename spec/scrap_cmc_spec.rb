require 'rspec'
require 'nokogiri'
require 'http'
require_relative '../lib/scrap_cmc' # Chemin relatif vers ton script Ruby

describe 'Scraping Crypto Data' do
  let(:base_url) { "https://coinmarketcap.com" }
  let(:total_pages) { 2 }

  it 'récupère correctement les noms et les prix des cryptos' do
    crypto_data = fetch_multiple_pages_and_parse(base_url, total_pages)

    expect(crypto_data).to be_an(Array)
    expect(crypto_data.size).to be > 0

    # Vérification de la structure de données (au moins un objet avec :name et :price)
    expect(crypto_data.first).to have_key(:name)
    expect(crypto_data.first).to have_key(:price)
  end

  it 'affiche les bons messages de récupération des pages' do
    expect { fetch_multiple_pages_and_parse(base_url, total_pages) }.to output(/Page 1 récupérée et analysée avec succès./).to_stdout
    expect { fetch_multiple_pages_and_parse(base_url, total_pages) }.to output(/Page 2 récupérée et analysée avec succès./).to_stdout
  end
end