$:.unshift(File.join(File.dirname(__FILE__)))
require 'sinatra'
require 'haml'
require 'lists_features'
require 'search_features'

get '/features' do
  @features = ListsFeatures.features
  haml :features
end

get '/features/:feature' do |feature|
  features = ListsFeatures.features
  features.each do |feature_hash|
   @feature = feature_hash if feature_hash["uri"] == "/features/#{feature}"
  end
  haml :feature
end

get '/search' do
  if params[:q]
    @features = SearchFeatures.new.find(:query => params[:q])
  end
  haml :search
end