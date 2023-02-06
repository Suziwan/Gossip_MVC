require_relative 'view'
require_relative 'gossip'

class Controller
	attr_accessor :gossip, :view

	def initialize
		@view = View.new
	end

	def create_gossip # Méthode qui gère la création de potins
		params = @view.create_gossip # Une méthode dans le view qui a le meme nom
		gossip = Gossip.new(params[:author],params[:content])
		gossip.save
	end

	def index_gossips # Méthode qui gère l'affichage
		gossips = Gossip.all
		@view.index_gossips(gossips)
	end
  
	def destroy_gossip # Méthode qui permet de détruire un potin
		params = @view.destroy_gossip
    Gossip.destroy_gossip(params)
	end
end