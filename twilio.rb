require 'twilio-ruby'

account_sid = "AC7e52f2263604bb37e4468676c5d8029b" # Your Account SID from www.twilio.com/console
auth_token = "dfa37f92adba6a1bba3ab067d029e47d"   # Your Auth Token from www.twilio.com/console

@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.messages.create(
    body: "Bla bla bla",
    to: "+6282147388762",    # Replace with your phone number
    from: "+17199660836")  # Replace with your Twilio number

puts message.sid
