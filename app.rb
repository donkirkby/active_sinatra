require 'sinatra'
require 'sinatra/activerecord'

Dir.glob('./{models,controllers}/*.rb').each { |file| require file }

before do
  content_type :json
end

get '/' do
  p 'Hello!'
end
