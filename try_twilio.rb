AC6509009d4e813b1e671dd10f6c4ff9b2


require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# build up a response
response = Twilio::TwiML::Response.new do |r|
  r.Say 'Hello There', voice: 'alice'
  r.Dial callerId: '+441432233336' do |d|
    d.Client 'jenny'
  end
end

# print the result
puts response.text
