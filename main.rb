

require 'json'
require_relative 'wardrobe'
require_relative 'chatgpt'

puts "Welcome to your wardrobe management system!"

# Load wardrobe data from file
wardrobe = Wardrobe.load_from_file
chatbot = ChatGPT.new



loop do
  puts "\nWhat would you like to do?\n1. Add an item to your wardrobe\n2. Remove an item from your wardrobe\n3. View your wardrobe\n4. Describe your overall style\n5. Get an outfit suggestion\n6. Exit"
    choice = gets.chomp.to_i

  case choice
  when 1
    puts "What type of clothing would you like to add?"
    type = gets.chomp
    puts "What is the color of the #{type}?"
    color = gets.chomp
    puts "What is the fabric of the #{type}?"
    fabric = gets.chomp
    puts "What is the style of the #{type}?"
    style = gets.chomp
    puts "Can you describe the #{type}?"
    description = gets.chomp
    item = { name: type, color: color, fabric: fabric, style: style, description: description }
    wardrobe.add_item(item)
    puts "Item added successfully!"
  when 2
    puts "What type of clothing would you like to remove?"
    type = gets.chomp
    wardrobe.remove_item(type)
    puts "Item removed successfully!"
  when 3
    puts wardrobe.view
  when 4
    # Describe overall style
    puts "Please describe your overall style:"
    style_description = gets.chomp
    File.open("data/style.json", "w") do |file|
      file.write({ style_description: style_description }.to_json)
    end
    puts "Style description saved successfully!"
  when 5
    puts "What is the occasion?"
    occasion = gets.chomp
    puts "What kind of look are you going for?"
    look = gets.chomp
    # Load style description from file
    style_description = JSON.parse(File.read("data/style.json"))["style_description"]
    prompt = "#{style_description}\n\nToday, I am going to #{occasion} and I want to look #{look}\n\nI own:\n#{wardrobe.to_s}\n\nPlease give me a possible outfit. An outfit doesn't have two of the same type of item (I can only wear one shirt at a time). Explain, in the style of a hip British butler, in one short paragraph why you chose this outfit and in two poetic sentences what sort of vibe this outfit gives off. End by wishing me luck on my occasion and giving me some advice, words of encouragement, or general thoughts related to what I am doing."
    puts prompt 

    outfit_suggestion = chatbot.generate_text(prompt)
    puts "\nOutfit suggestion:\n#{outfit_suggestion}"
    
  when 6
    # Save wardrobe data to file before exiting
    wardrobe.save
    break
  else
    puts "Invalid choice, please try again."
  end
end

puts "Goodbye!"
