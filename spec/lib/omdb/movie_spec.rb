require 'spec_helper'
require 'omdb/movie'

describe 'Omdb::Movie' do
  it "should return an instance of Omdb::Movie when parsed with the correct values" do
    movie = create_movie_object("{}")
    movie.should be_instance_of(Omdb::Movie)
  end

  context "With the basic information loaded" do
    describe '#title' do
      it 'returns the title' do
        movie = create_movie_object('{"Title":"Star Wars"}')
        movie.title.should eq('Star Wars')
      end
    end

    describe '#year' do
      it 'returns the year' do
        movie = create_movie_object('{"Year":"1977"}')
        movie.year.should eq(1977)
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
        movie = create_movie_object('{"Runtime":"2 h 1 min"}')
        expect(movie.runtime).to eq('2 h 1 min')
      end
    end

    describe '#genre' do
      it 'returns the genre' do
        movie = create_movie_object('{"Genre":"Action, Adventure"}')
        expect(movie.genre).to eq("Action, Adventure")
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
        movie = create_movie_object('{"Actors":"Mark Hamill, Harrison Ford"}')
        expect(movie.actors).to eq('Mark Hamill, Harrison Ford')
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
        movie.imdb_id.should eq("tt0076759")
      end
    end

    describe '#type' do
      it 'returns the type' do
        movie = create_movie_object('{"Type":"movie"}')
        movie.type.should eq('movie')
      end
    end
  end

  def create_movie_object(json_data)
    Omdb::Movie.new(JSON.parse(json_data))
  end
end

