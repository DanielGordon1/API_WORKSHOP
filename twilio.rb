require 'twilio-ruby'
require 'yaml'
require 'yaml'

account_sid = YAML.load_file('api_keys.yml')['TWILIO_SID'] # Your Account SID from www.twilio.com/console
auth_token = YAML.load_file('api_keys.yml')['TWILIO_AUTH'] # Your Auth Token from www.twilio.com/console
twilio_number = YAML.load_file('api_keys.yml')['TWILIO_NUM']
my_number = YAML.load_file('api_keys.yml')['MY_NUM']

@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.messages.create(
    body: "Bla bla bla",
    to: my_number,    # Replace with your phone number
    from: twilio_number)  # Replace with your Twilio number

puts message.sid
