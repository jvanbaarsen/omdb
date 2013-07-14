module Omdb
  class Movie
    attr_reader :loaded, :title, :year, :rated, :released, :runtime, :genre, :director, :writer, :actors, :plot,
                :poster, :imdb_rating, :imdb_votes, :imdb_id, :type

    def initialize(movie)
      @title = movie["Title"]
      @year = movie["Year"].to_i
      @imdb_id = movie["imdbID"]
      @type = movie["Type"]
      @rated = movie["Rated"]
      @released = movie["Released"]
      @runtime = movie["Runtime"]
      @genre = movie["Genre"]
      @director = movie["Director"]
      @writer = movie["Writer"]
      @actors = movie["Actors"]
      @plot = movie["Plot"]
    end
  end
end
