module Omdb
  class Movie
    attr_reader :loaded, :title, :year, :rated, :released, :runtime, :genre, :director, :writer, :actors, :plot, :poster, :imdb_rating, :imdb_votes, :imdb_id, :type, :metascore, :language, :country, :awards, :imdbRating, :imdbVotes, :tomatoMeter, :tomatoRating, :tomatoReviews, :tomatoFresh, :tomatoRotten, :tomatoConsensus, :tomatoUserMeter, :tomatoUserRating, :tomatoUserReviews, :dvd, :boxOffice, :production, :website

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

      # if movie with tomatoe ranking
      if movie["imdbRating"]
        # IMDB stats
        @imdbRating = movie["imdbRating"]
        @imdbVotes = movie["imdbVotes"]

        # rotten tomatoe stats
        @tomatoMeter = movie["tomatoMeter"]
        @tomatoRating = movie["tomatoRating"]
        @tomatoReviews = movie["tomatoReviews"]
        @tomatoFresh = movie["tomatoFresh"]
        @tomatoRotten = movie["tomatoRotten"]
        @tomatoConsensus = movie["tomatoConsensus"]
        @tomatoUserMeter = movie["tomatoUserMeter"]
        @tomatoUserRating = movie["tomatoUserRating"]
        @tomatoUserReviews = movie["tomatoUserReviews"]
        @dvd = movie["DVD"]
        @boxOffice = movie["BoxOffice"]
        @production = movie["Production"]
        @website = movie["Website"]
      end
    end
  end
end

