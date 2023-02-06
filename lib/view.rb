require_relative 'gossip'

class View
	def create_gossip
		params = {}
		puts "Who is gossiping ?"
		print "> "
		params[:author] = gets.chomp
		puts "Write your gossip"
		print "> "
		params[:content] = gets.chomp
		return params
	end

	#:author, :content
	def index_gossips(gossips)
		i = 1
		gossips.each do |gossip|
			puts " #{i}) #{gossip.author} said : #{gossip.content}"
			i += 1
		end
	end
  
	def destroy_gossip
		puts "Which gossip do you want to delete ? (Enter gossip number)"
    print "> "
    number = gets.chomp.to_i
    puts "You deleted the gossip number #{number}"
    return number
	end
end