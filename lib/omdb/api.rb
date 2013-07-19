require 'omdb/network'
require 'omdb/movie'
module Omdb
  class Api
    def search(search_term)
      res = Omdb::Network.new.call({s: search_term})

      response = {
        :movies => parse_movies(res[:data]),
        :status => res[:code]
      }
    end

    def fetch(title, year = nil)
      res = Omdb::Network.new.call({t: title, year: nil})
      response = {
        status: res[:code],
        movie: parse_movie(res[:data])
      }
    end

    private
    def parse_movies(json_string)
      data = json_string["Search"]
      movies = Array.new
      data.each do |movie|
        movies.push(Movie.new(movie))
      end
      return movies
    end

    def parse_movie(data)
      Movie.new(data)
    end
  end
end
