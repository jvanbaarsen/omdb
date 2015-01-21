module Omdb
  class Movie
    attr_reader :loaded, :title, :year, :rated, :released, :runtime, :genre, :director, :writer, :actors, :plot,
                :poster, :imdb_rating, :imdb_votes, :imdb_id, :type, :metascore, :language, :country, :awards

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
      @poster = movie["Poster"]
      @metascore = movie["Metascore"]
      @language = movie["Language"]
      @country = movie["Country"]
      @awards = movie["Awards"]
	  @imdb_rating = movie["imdbRating"]
    end
  end
end
