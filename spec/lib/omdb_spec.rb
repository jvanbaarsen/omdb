require 'omdb'

describe 'Omdb::Api' do
  it "Should return a instance of OMDB::API" do
    Omdb::Api.new.should be_instance_of(Omdb::Api)
  end

  context "When searching for 'Star Wars'" do
    it "responds to a search call" do
      Omdb::Api.new.should respond_to(:search).with(1).argument
    end

    it "return status code 200" do
      response = do_movie_search("Star Wars")
      response[:status].should eq(200)
    end

    it "returns a total of 10 items" do
      response = do_movie_search("Star Wars")
      response[:movies].size.should eq(10)
    end

    it "returned list movies should be of the type Omdb::Movie" do
      response = do_movie_search("Star Wars")
      response[:movies][0].should be_instance_of(Omdb::Movie)
    end
  end

  def do_movie_search(movie_name)
    Omdb::Api.new.search(movie_name)
  end
end

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

  context "Unloaded situation" do
    it "should have status loaded false" do
      movie = create_movie_object('{}')
      movie.loaded.should be_false
    end
  end

  def create_movie_object(json_data)
    Omdb::Movie.new(JSON.parse(json_data))
  end
end
