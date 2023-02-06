require 'csv'

class Gossip 
  attr_reader :author, :content

  def initialize(author, content)
    @author = author
    @content = content
  end

  def save
    array_gossip = [@author, @content]
    CSV.open("./db/gossip.csv", "a") do |csv|
      csv << array_gossip
    end
  end

  def self.all 
    all_gossips = []
    CSV.foreach("./db/gossip.csv") do |gossip|
      gossip_prov = Gossip.new(gossip[0], gossip[1])
      all_gossips << gossip_prov
    end
    return all_gossips
  end

  def self.destroy_gossip(gossip_number)
    gossips = CSV.read('./db/gossip.csv')
    gossips.delete_at(gossip_number - 1)
    CSV.open('db/gossip.csv', 'w') do |csv|
      gossips.each do |gossip|
        csv << gossip
      end
    end
  end
end