require 'spec_helper'
require 'omdb/movie'

describe 'Omdb::Movie' do
  it "should return an instance of Omdb::Movie when parsed with the correct values" do
    movie = create_movie_object("{}")
    expect(movie).to be_instance_of(Omdb::Movie)
  end

  context "With the basic information loaded" do
    describe '#title' do
      it 'returns the title' do
        movie = create_movie_object('{"Title":"Star Wars: Episode IV - A New Hope"}')
        expect(movie.title).to eq('Star Wars: Episode IV - A New Hope')
      end
    end

    describe '#year' do
      it 'returns the year' do
        movie = create_movie_object('{"Year":"1977"}')
        expect(movie.year).to eq(1977)
      end
    end

    describe '#rated' do
      it 'returns the rating' do
        movie = create_movie_object('{"Rated": "PG"}')
        expect(movie.rated).to eq("PG")
      end
    end

    describe '#released' do
      it 'returns the release date' do
        movie = create_movie_object('{"Released": "25 May 1977"}')
        expect(movie.released).to eq("25 May 1977")
      end
    end

    describe '#runtime' do
      it 'returns the runtime' do
        movie = create_movie_object('{"Runtime":"121 min"}')
        expect(movie.runtime).to eq('121 min')
      end
    end

    describe '#genre' do
      it 'returns the genre' do
        movie = create_movie_object('{"Genre":"Action, Adventure, Fantasy"}')
        expect(movie.genre).to eq('Action, Adventure, Fantasy')
      end
    end

    describe '#director' do
      it 'returns the director' do
        movie = create_movie_object('{"Director": "George Lucas"}')
        expect(movie.director).to eq('George Lucas')
      end
    end

    describe '#writer' do
      it 'returns the writer' do
        movie = create_movie_object('{"Writer": "George Lucas"}')
        expect(movie.writer).to eq('George Lucas')
      end
    end

    describe '#actors' do
      it 'returns the actors' do
        movie = create_movie_object('{"Actors":"Mark Hamill, Harrison Ford, Carrie Fisher, Peter Cushing"}')
        expect(movie.actors).to eq('Mark Hamill, Harrison Ford, Carrie Fisher, Peter Cushing')
      end
    end

    describe '#plot' do
      it 'returns the plot' do
        movie = create_movie_object('{"Plot":"This is the plot story"}')
        expect(movie.plot).to eq("This is the plot story")
      end
    end

    describe '#imdb_id' do
      it 'returns the IMDB ID' do
        movie = create_movie_object('{"imdbID":"tt0076759"}')
        expect(movie.imdb_id).to eq("tt0076759")
      end
    end

    describe '#type' do
      it 'returns the type' do
        movie = create_movie_object('{"Type":"movie"}')
        expect(movie.type).to eq('movie')
      end
    end

    describe '#poster' do
      it 'returns the poster' do
        movie = create_movie_object('{"Poster":"poster_url"}')
        expect(movie.poster).to eq('poster_url')
      end
    end

    describe '#metascore' do
      it 'returns the metascore' do
        movie = create_movie_object('{"Metascore":"91"}')
        expect(movie.metascore).to eq('91')
      end
    end

    describe '#language' do
      it 'returns the language' do
        movie = create_movie_object('{"Language":"English"}')
        expect(movie.language).to eq('English')
      end
    end

    describe '#country' do
      it 'returns the country' do
        movie = create_movie_object('{"Country":"USA"}')
        expect(movie.country).to eq('USA')
      end
    end

    describe '#awards' do
      it 'returns the awards' do
        movie = create_movie_object('{"Awards":"Won 6 Oscars. Another 38 wins & 26 nominations."}')
        expect(movie.awards).to eq('Won 6 Oscars. Another 38 wins & 26 nominations.')
      end
    end
  end

  def create_movie_object(json_data)
    Omdb::Movie.new(JSON.parse(json_data))
  end
end

