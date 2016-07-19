require 'httparty'

class Recipe
  include HTTParty

  hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'food2fork.com'
  base_uri "http://#{hostport}/api"
  default_params key: ENV['FOOD2FORK_KEY']
  format :json

  debug_output $stdout

  def self.for(search_term)
    response = get('/search', :query => { q: search_term })
    if response.code == 200
      response['recipes']
    end
  end
end
