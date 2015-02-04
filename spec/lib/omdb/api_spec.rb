require 'spec_helper'
require 'omdb/api'

describe 'Omdb::Api' do
  it "Should return a instance of OMDB::API" do
    expect(Omdb::Api.new).to be_a(Omdb::Api)
  end

  context "When searching for 'Star Wars'" do
    it "responds to a search call" do
      expect(Omdb::Api.new).to respond_to(:search).with(1).argument
    end

    it "return status code 200" do
      expect(do_movie_search[:status]).to eq(200)
    end

    it "returns a total of 10 items" do
      expect(do_movie_search[:movies].size).to eq(10)
    end

    it "returned list movies should be of the type Omdb::Movie" do
      expect(do_movie_search[:movies][0]).to be_a(Omdb::Movie)
    end
  end

  describe "Searching for a single movie" do
    context "When searching for an existing movie" do
      it "responds to a fetch call" do
        expect(Omdb::Api.new).to respond_to(:fetch).with(1).argument
      end

      describe "the return object" do
        it "has status code 200" do
          expect(movie_fetch[:status]).to eq(200)
        end

        it "has a movie object" do
          expect(movie_fetch[:movie]).to be_a(Omdb::Movie)
        end

        it "has a director called 'George Lucas'" do
          expect(movie_fetch[:movie].director).to eq("George Lucas")
        end
      end
    end
  end

  describe 'Searching for a movie, with no results' do
    it 'returns status code 404' do
      expect(no_result_search[:status]).to eq(404)
    end

    it 'returns an empty movie hash' do
      expect(no_result_search[:movies].size).to eq(0)
    end
  end

  describe 'Fetching an unknown movie' do
    it 'returns status code 404' do
      expect(no_result_fetch[:status]).to eq(404)
    end
  end

  describe 'Finding a movie by IMDB ID' do
    context "When searching for 'Star Wars' by ID" do
      it "has status code 200" do
        expect(movie_fetch[:status]).to eq(200)
      end

      it "has a movie object" do
        expect(movie_fetch[:movie]).to be_a(Omdb::Movie)
      end

      it "has a title 'Star Wars'" do
        expect(movie_find[:movie].title).to eq("Star Wars")
      end
    end
  end

  def do_movie_search
    omdb_return_data = File.read(File.join("spec", "fixtures", "movies_search.json"))
    stub_request(:any, /.*www.omdbapi.com.*/).to_return(body: omdb_return_data, status: 200 )
    Omdb::Api.new.search("Star Wars")
  end

  def no_result_search
    omdb_return_data = File.read(File.join("spec", "fixtures", "no_results.json"))
    stub_request(:any, /.*www.omdbapi.com.*/).to_return(body: omdb_return_data, status: 200)
    Omdb::Api.new.search("Search term")
  end

  def movie_fetch
    omdb_return_data = File.read(File.join("spec", "fixtures", "star_wars.json"))
    stub_request(:any, /.*www.omdbapi.com.*/).to_return(body: omdb_return_data, status: 200)
    Omdb::Api.new.fetch("Star Wars")
  end

  def no_result_fetch
    omdb_return_data = File.read(File.join("spec", "fixtures", "no_results.json"))
    stub_request(:any, /.*www.omdbapi.com.*/).to_return(body: omdb_return_data, status: 200)
    Omdb::Api.new.fetch("Search term")
  end

  def movie_find
    omdb_return_data = File.read(File.join("spec", "fixtures", "star_wars.json"))
    stub_request(:any, /.*www.omdbapi.com.*/).to_return(body: omdb_return_data, status: 200)
    Omdb::Api.new.find("tt0076759")
  end
end

