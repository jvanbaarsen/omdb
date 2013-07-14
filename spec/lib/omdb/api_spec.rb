require 'spec_helper'
require 'omdb/api'

describe 'Omdb::Api' do
  it "Should return a instance of OMDB::API" do
    Omdb::Api.new.should be_instance_of(Omdb::Api)
  end

  context "When searching for 'Star Wars'" do
    it "responds to a search call" do
      Omdb::Api.new.should respond_to(:search).with(1).argument
    end

    it "return status code 200" do
      do_movie_search[:status].should eq(200)
    end

    it "returns a total of 10 items" do
      do_movie_search[:movies].size.should eq(10)
    end

    it "returned list movies should be of the type Omdb::Movie" do
      do_movie_search[:movies][0].should be_instance_of(Omdb::Movie)
    end
  end

  def do_movie_search
    omdb_return_data = File.read(File.join("spec", "fixtures", "movies_search.json"))
    stub_request(:any, "http://www.omdbapi.com").
      with({query: {"s" => "Star Wars"}}).
      to_return(:body => omdb_return_data, :code => 200 )
    Omdb::Api.new.search("Star Wars")
  end
end

