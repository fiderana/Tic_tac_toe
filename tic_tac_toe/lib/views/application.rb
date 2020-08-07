# Interface utilisateur
class Application
  def perform
    header
    # Noms des Joueurs
    puts " Entrez un nom pour le Joueur 1 (#{'O'.colorize(:red)})"
    name = player_name
    player1 = Player.new(name, 'O'.colorize(:red))

    puts " Entrez un nom pour le Joueur 2 (#{'X'.colorize(:blue)})"
    name = player_name
    player2 = Player.new(name, 'X'.colorize(:blue))

    puts "\n Bienvenue #{player1.name} et #{player2.name}."
    print " Appuyez sur \"Entrer\" lorsque vous êtes prêt(e)s."
    gets.chomp
    # Partie
    game = Game.new(player1, player2)

    while game.status == 'on going'
      system('clear')
      header
      puts '=' * 50
      puts "                 Tour de #{game.current_player.name}"
      puts '=' * 50
      game.turn
      while game.status == 'game end'
        puts "\n Voulez-vous faire une autre partie ?"
        puts ' 1. Oui'
        puts ' 2. Non'
        print ' > '
        new_game = gets.chomp.to_s
        if new_game == '1'
          game.new_round
        else
          game.status = 'quit'
        end
      end
    end
    puts "\n 👋 Au revoir #{player1.name} et #{player2.name} !\n\n"
  end

 def header
    puts ''
    puts '           _______             '
    puts '  _______ |__   __| _______    '              
    puts " |__   __|#{'O'.colorize(:red)}  |A|  #{'X'.colorize(:blue)}|__   __|   "         
    puts '    |I|      |C|      |O|      '
    puts '    |C|      |_|      |E|      '
    puts "    |_|   #{'X'.colorize(:blue)}       #{'O'.colorize(:red)}   |_|      "                                      
    puts ''
  end
  
  def player_name
    name = 0
    while name == 0 || name == ''
      print ' > '
      name = gets.chomp.to_s
      if name == ''
        puts "Veuillez entrer un nom svp !!"
      end
    end
    name
  end
end
