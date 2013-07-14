module Omdb
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
