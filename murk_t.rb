require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# TODO: DONT COMMIT, use configs

require_relative 'config/twilio_call.rb'

RECIPIENT = TO

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN

@client.account.calls.create(
  from: "+44#{FROM}",
  to: "+44#{RECIPIENT}",
  url: 'http://52a1a037.ngrok.com/call'
)
