require "roda"

TWML = # Twilio Markup Language (in plain text)
  "
  <Response>
    <Say>Meeao!</Say>
  </Response>
  "

# require 'nokogiri'
#
# TWML = Nokogiri::XML::Builder.new do |xml|
#   xml.root {
#     xml.Response {
#       xml.Say "Hello Monkey"
#     }
#   }
# end

# todo: json 2 xml
#
# TWML = {
#   Response: {
#     Say: "Hello Monkey",
#   },
# }

# MonkeyX or MonkeyXML - monkey that speaks xml (sorry about the naming :D)

class MonkeyX < Roda
  route do |r|
    r.root do
      response['Content-Type'] = 'application/xml'
      TWML
    end
  end
end
