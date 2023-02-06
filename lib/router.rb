require 'controller'

class Router
  # On veut qu'un "Router.new" lancé par app.rb, crée automatique une instance "@controller"
  def initialize
    @controller =  Controller.new
  end 

  # Rappelle-toi que l'on fait "Router.new.perform" dans app.rb => après initialize, on définit donc perform
  def perform 
    puts "WELCOME TO THE GOSSIP PROJECT"

    while true
      # On affiche le menu
      puts
      puts "What do you want to do ?"
      puts "1\. Create a new gossip"
      puts "2\. View existing gossips"
      puts "3\. Delete a gossip"
      puts "4\. Leave the gossip app"
      print "> "
      params = gets.chomp.to_i # On attend le choix de l'utilisateur

      case params # En fonction du choix
      when 1
        puts "You chose to create a gossip" 
        @controller.create_gossip

      when 2
        puts "You chose to display all gossips" 
        @controller.index_gossips

      when 3
        puts "You chose to delete a gossip" 
        @controller.destroy_gossip

      when 4
        puts "See you soon !"
        break # Ce "break" permet de sortir de la boucle while. C'est même la seule façon d'en sortir.

      else
        puts "This choice doesn't exist, try something else" 
        # Si l'utilisateur saisit une entrée non prévue, il retourne au début du "while true". 
        # C'est pour ça qu'elle est infinie: potentiellement, il peut se gourer jusqu'à la fin des temps :)
      end
    end
  end
end