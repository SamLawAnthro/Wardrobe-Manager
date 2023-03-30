require 'json'

class Wardrobe
  include Enumerable

  FILENAME = "data/wardrobe.json"
  attr_accessor :items

  def initialize(items = [])
    @items = items
  end

  def each(&block)
    @items.each(&block)
  end

  def add_item(item)
    @items << Item.new(*item.values)
  end

  def remove_item(name)
    @items.reject! { |item| item.name == name }
  end

  def view
    @items.map(&:to_s).join("\n")
  end

  def save
    File.open(FILENAME, 'w') do |file|
      file.write(JSON.generate(@items.map(&:to_hash)))
    end
  end

  def self.load_from_file
    wardrobe = new
    if File.exist?(FILENAME)
      json = File.read(FILENAME)
      items = JSON.parse(json, symbolize_names: true).map do |item|
        Item.new(*item.values_at(:name, :color, :fabric, :style, :description))
      end
      wardrobe.items = items
    end
    wardrobe
  end

  def self.load_wardrobe
    if File.exist?(FILENAME)
      JSON.parse(File.read(FILENAME), symbolize_names: true)
    else
      []
    end
  end

  def to_s
    @items.map { |item| "- #{item.color} #{item.fabric} #{item.name} with a #{item.style} style it is #{item.description}." }.join("\n")
  end
end

class Item
  attr_accessor :name, :color, :fabric, :style, :description

  def initialize(name, color, fabric, style, description)
    @name = name
    @color = color
    @fabric = fabric
    @style = style
    @description = description
  end

  def to_s
    "Name: #{@name}, Color: #{@color}, Fabric: #{@fabric}, Style: #{@style}, Description: #{@description}"
  end

  def to_hash
    { name: @name, color: @color, fabric: @fabric, style: @style, description: @description }
  end
end
