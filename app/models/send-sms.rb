require 'rubygems'
require 'twilio-ruby'
 
account_sid = 'AC8c5be76854a889a1b26d9f48131671c8' 
auth_token = '858986e9e7fe0396edac815d1d1fd911' 
client = Twilio::REST::Client.new account_sid, auth_token
 
from = "+19093783080" # Your Twilio number
 
friends = {
"+19098393097" => "Shawn Pan",
}
friends.each do |key, value|
  client.account.messages.create(
    :from => from,
    :to => key,
    :body => "Hey #{value}, I am at Cole Student Activities Bldg, College Park, MD 20740. I am feeling unsafe and please come ASAP!"
  	:media_url => "https://demo.twilio.com/owl.png"
  )
  puts "Sent message to #{value}"
end