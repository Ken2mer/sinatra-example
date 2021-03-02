require 'sinatra/base'
require "sinatra/reloader"

current_dir = Dir.pwd
Dir["#{current_dir}/models/*.rb"].each { |file| require file }

class App < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    content_type :txt

    stream do |out|
      out << "It's gonna be legen -\n"
      sleep 0.5
      out << " (wait for it) \n"
      sleep 1
      out << "- dary!\n"
    end
  end

  get '/articles' do
    Article.all
  end
end
