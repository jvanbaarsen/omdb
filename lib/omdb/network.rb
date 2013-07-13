require 'rest_client'
require 'json'
module Omdb
  class Network
    OMDB_API_URL = 'http://www.omdbapi.com'
    def call(params)
      response = RestClient.get OMDB_API_URL, {params: params}
      JSON.parse response
    end
  end
end
