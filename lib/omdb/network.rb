require 'rest_client'
require 'json'
module Omdb
  class Network
    OMDB_API_URL = 'http://www.omdbapi.com'
    def call(params)
      response = RestClient.get OMDB_API_URL, params: params
      {
        code: response.code,
        data: JSON.parse(response.body)
      }
    end
  end
end
