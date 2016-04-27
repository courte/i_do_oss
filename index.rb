require 'tilt/erubis'
require 'sinatra'
require 'pry'

set :views, settings.root

def get_random_file(dir)
  filenames = []
  Dir.new(settings.root + dir).each { |f| filenames << f }
  filenames.delete('.')
  filenames.delete('..')
  filenames.sample
end

get '/' do
  redirect '/vows'
end

get '/vows' do
  text_file = get_random_file('/vows')
  @text = File.open(settings.root + '/vows/' + text_file).readlines("\n")
  @css_path = 'css/' + get_random_file('/public/css')
  erb :index
end
