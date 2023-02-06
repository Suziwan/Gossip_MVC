require 'csv'

class Gossip
  attr_reader :author, :content

  def initialize(author, content, data_source = './db/gossip.csv')
    @author = author
    @content = content
    @data_source = data_source
  end

  def save
    array_gossip = [@author, @content]
    CSV.open(@data_source, "a") do |csv|
      csv << array_gossip
    end
  end

  def self.all
    all_gossips = []
    CSV.foreach(@data_source) do |author, content|
      gossip = Gossip.new(author, content, @data_source)
      all_gossips << gossip
    end
    return all_gossips
  end

  def self.destroy_gossip(gossip_id)
    gossips = CSV.read(@data_source)
    return if gossip_id >= gossips.size

    gossips.delete_at(gossip_id - 1)
    CSV.open(@data_source, 'w') do |csv|
      gossips.each do |gossip|
        csv << gossip
      end
    end
  end
end
