require "omdb/version"
require 'omdb/network'
require 'rest_client'
require 'json'

module Omdb
  class Api
    def search(search_term)
      res = Omdb::Network.new.call({s: search_term})

      response = {
        :movies => parse_movies(res[:data]),
        :status => res[:code]
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
  end

  class Movie
    attr_reader :loaded, :title, :year, :rated, :released, :runtime, :genre, :director, :writer, :actors, :plot,
                :poster, :imdb_rating, :imdb_votes, :imdb_id, :type
    def initialize(movie)
      @loaded = false # Default the details are not loaded
      @title = movie["Title"]
      @year = movie["Year"].to_i
      @imdb_id = movie["imdbID"]
      @type = movie["Type"]
    end
  end
end
