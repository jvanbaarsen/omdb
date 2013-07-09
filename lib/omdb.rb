require "omdb/version"
require 'rest_client'
require 'json'

module Omdb
	class API
		def search(search_term)
			res = RestClient.get 'http://www.omdbapi.com', {params: {s: search_term, r: 'json'}}
	
			response = {
				:movies => parse_movies(res.body),
				:status => res.code
			}
		end

		private
		def parse_movies(json_string)
			data = JSON.parse(json_string)["Search"]
			movies = Array.new
			data.each do |movie|
				movies.push(Movie.new(movie))
			end
			return movies
		end
	end

	class Movie
		attr_accessor :loaded, :title, :year, :rated, :released, :runtime, :genre, :director, :writer, :actors, :plot,
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
