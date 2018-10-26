require "byebug"

class Map
  attr_reader :map_pairs
  def initialize(pairs = [])
    @map_pairs = pairs
  end

  def set(key, value)
    self.map_pairs.each_with_index do |pair, idx|
      self.map_pairs[idx][1] = value if pair[0] == key
    end

    if self.map_pairs.none? { |pair| pair[0] == key }
      self.map_pairs << [key, value]
    end

    self.map_pairs
  end

  def get(key)
    self.map_pairs.each do |pair|
      return [key, pair[1]] if pair[0] == key
    end
  end

  def delete(key)
    self.map_pairs.delete_if { |pair| pair[0] == key }
  end

  def show
    @map_pairs
  end
end
