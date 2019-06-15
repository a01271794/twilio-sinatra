require 'sinatra'
require 'twilio-ruby'

set :bind, '0.0.0.0'

get '/' do
  content_type 'text/xml'

  Twilio::TwiML::VoiceResponse.new do | response |
    response.say(message: 'Hello World')
  end.to_s
end
