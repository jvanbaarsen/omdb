module Omdb
  class Movie
    attr_reader :loaded, :title, :year, :rated, :released, :runtime, :genre,
      :director, :writer, :actors, :plot, :poster, :imdb_rating, :imdb_votes,
      :imdb_id, :type, :metascore, :language, :country, :awards, :imdb_rating,
      :imdb_votes, :tomato_meter, :tomato_rating, :tomato_reviews, :tomato_fresh,
      :tomato_rotten, :tomato_consensus, :tomat_user_meter, :tomato_user_rating,
      :tomato_user_reviews, :dvd, :box_office, :production, :website

    def initialize(movie)
      @title = movie["Title"]
      @year = movie["Year"].to_i
      @imdb_id = movie["imdbID"]
      @actors = movie["Actors"]
      @awards = movie["Awards"]
      @box_office = movie["BoxOffice"]
      @country = movie["Country"]
      @director = movie["Director"]
      @dvd = movie["DVD"]
      @genre = movie["Genre"]
      @imdb_rating = movie["imdbRating"]
      @imdb_votes = movie["imdbVotes"]
      @language = movie["Language"]
      @metascore = movie["Metascore"]
      @plot = movie["Plot"]
      @poster = movie["Poster"]
      @production = movie["Production"]
      @rated = movie["Rated"]
      @released = movie["Released"]
      @runtime = movie["Runtime"]
      @tomato_consensus = movie["tomatoConsensus"]
      @tomato_fresh = movie["tomatoFresh"]
      @tomato_meter = movie["tomatoMeter"]
      @tomato_rating = movie["tomatoRating"]
      @tomato_reviews = movie["tomatoReviews"]
      @tomato_rotten = movie["tomatoRotten"]
      @tomato_user_meter = movie["tomatoUserMeter"]
      @tomato_user_rating = movie["tomatoUserRating"]
      @tomato_user_reviews = movie["tomatoUserReviews"]
      @type = movie["Type"]
      @website = movie["Website"]
      @writer = movie["Writer"]
    end
  end
end

