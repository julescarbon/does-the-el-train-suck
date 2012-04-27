require 'sinatra'
require 'open-uri'
require 'nokogiri'
require 'erb'

get '/' do
  @doc = Nokogiri::XML(open('http://www.transitchicago.com/api/1.0/routes.aspx'))
  @status = @doc.xpath('//RouteStatus')[2]
  @train_status = @status.to_s =~ /Normal Service/ ? 'nope' : 'yup'
  erb :index
end
