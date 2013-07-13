require 'omdb'
require 'spec_helper'

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
    omdb_return_data = '{"Search":[{"Title":"Star Wars","Year":"1977","imdbID":"tt0076759","Type":"movie"},{"Title":"Star Wars: Episode V - The Empire Strikes Back","Year":"1980","imdbID":"tt0080684","Type":"movie"},{"Title":"Star Wars: Episode VI - Return of the Jedi","Year":"1983","imdbID":"tt0086190","Type":"movie"},{"Title":"Star Wars: Episode I - The Phantom Menace","Year":"1999","imdbID":"tt0120915","Type":"movie"},{"Title":"Star Wars: Episode III - Revenge of the Sith","Year":"2005","imdbID":"tt0121766","Type":"movie"},{"Title":"Star Wars: Episode II - Attack of the Clones","Year":"2002","imdbID":"tt0121765","Type":"movie"},{"Title":"Star Wars: The Clone Wars","Year":"2008","imdbID":"tt1185834","Type":"movie"},{"Title":"Star Wars: Clone Wars","Year":"2003","imdbID":"tt0361243","Type":"series"},{"Title":"Star Wars: The Clone Wars","Year":"2008","imdbID":"tt0458290","Type":"series"},{"Title":"The Star Wars Holiday Special","Year":"1978","imdbID":"tt0193524","Type":"movie"}]}'
    stub_request(:any, "http://www.omdbapi.com").
      with({query: {"s" => movie_name}}).
      to_return(:body => omdb_return_data, :code => 200 )
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
