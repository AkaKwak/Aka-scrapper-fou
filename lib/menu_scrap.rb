# menu_scrap.rb

def display_menu
  puts "======================================"
  puts "Menu de sélection :"
  puts "1. Lancer scrap_cmc.rb"
  puts "2. Lancer scrap_town.rb"
  puts "3. Lancer scrap_town_csv.rb"
  puts "4. Lancer les tests RSpec de scrap_cmc"
  puts "5. Lancer les tests RSpec de scrap_town"
  puts "6. Lancer tous les tests RSpec"
  puts "7. Quitter"
end

def run_choice(choice)
  case choice
  when '1'
    load './lib/scrap_cmc.rb'
  when '2'
    load './lib/scrap_town.rb'
  when '3'
    load './lib/scrap_town_csv.rb'
  when '7'
    puts "Sortie du programme."
    exit
  else
    puts "Choix invalide, merci de réessayer."
  end
end

loop do
  display_menu
  print "Choisissez une option : "
  choice = gets.chomp
  run_choice(choice)
end
