#csv_sorter.rb

require 'csv'

# Spécifier le point-virgule comme séparateur
CSV.open("./../../../output_mairies.csv", "wb", col_sep: ",") do |csv|
  # En-têtes dans l'ordre souhaité
  csv << ["Code INSEE", "Code Postal", "Nom de la mairie", "Ville", "Email", "Téléphone", "URL", "Adresse", "Dernière MAJ"]

  # Lire et écrire les données du fichier source
  CSV.foreach("../../../../mairies.csv", headers: true) do |row|
    # Convertir toutes les valeurs en chaîne de caractères pour être sûr
    csv << [row['codeInsee'].to_s, row['CodePostal'].to_s, row['NomOrganisme'].to_s, row['NomCommune'].to_s, row['Email'].to_s, row['Téléphone'].to_s, row['Url'].to_s, row['Adresse'].to_s, row['dateMiseAJour'].to_s]
  end
end

puts "Les données ont été sauvegardées dans 'output_mairies.csv'."
