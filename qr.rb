# Write your solution here!
# pp "hello world"
require "rqrcode"

# Use the RQRCode::QRCode class to encode some text
qrcode = RQRCode::QRCode.new("https://en.wikipedia.org/wiki/QR_code")

# Use the .as_png method to create a 500 pixels by 500 pixels image
png = qrcode.as_png({ :size => 500 })

# Write the image data to a file
IO.binwrite("sometext.png", png.to_s)
#attempting below
puts "What kind of QR code would you like to generate?"

puts "1. Open a URL"
puts "2. Join a wifi network"
puts "3. Send a text message"

puts "Press 4 to exit" 

initial_response = gets.chomp
puts
if initial_response = "4"
  puts 
  puts "Goodbye!"
elsif initial_response = "3"
  puts 
  puts "What is the phone number you want the code to send a text message to?"
  phone_num = gets.chomp
  puts 
  puts "What do you want to populate the message with?"
  puts
  phone_msg = gets.chomp 
  puts
  puts "What would you like to call the PNG?"
  puts
  msg_body = gets.chomp
  puts
  encoded_text = text_to_encode = "SMSTO:#{phone_num}:#{phone_msg}"
elsif initial_response = "2"
  puts
  puts "What is the name of the wifi network?"
  puts
  name_network = gets.chomp 
  puts
  puts "What is the password?"
  puts
  pass_name = gets.chomp 
  puts
  puts "What would you like to call the PNG?"
  puts
  msg_body = gets.chomp
  puts
  text_to_encode = "WIFI:T:WPA;S:#{name_network};P:#{pass)name};;"
elsif initial_response = "1"
  puts 
  puts "What is the URL you would like to encode?"
  puts
  url_response = gets.chomp
  puts
  puts "What would you like to call the PNG?"
  puts
  text_to_encode = gets.chomp
else
  puts "Didn't recognize selection. Please try again."
  exit
end
puts
puts "What would you like to call the PNG?"
puts
png_name = gets.chomp
puts
qrcode = RQRCode::QRCode.new(text_to_encode)

png = qrcode.as_png({ :size => 500 })

IO.binwrite("#{png_name}.png", png.to_s)
