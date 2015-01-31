require 'spec_helper'
require 'omdb/network'

describe Omdb::Network do
  it "returns a instance of Omdb::Network" do
    network = Omdb::Network.new
    expect(network).to be_a(Omdb::Network)
  end

  describe "#call" do
    it "returns a hash when called" do
      expect(search_movie).to be_a(Hash)
    end

    context 'When called with {t: "Star Wars"} as params' do
      it 'returns value contains "Star Wars"' do
        expect(fetch_movie[:data]).to include(
          {"Title"=> "Star Wars"}
        )
      end
    end

    context 'When called with {s: "Star Wars"{ as params' do
      it 'returns value contains "Star Wars: The Clone Wars"' do
        expect(search_movie[:data]["Search"].last).to include (
          {"Title" => "The Star Wars Holiday Special"}
        )
      end
    end

    def search_movie
      omdb_return_data = File.read(File.join("spec", "fixtures", "movies_search.json"))
      stub_request(:any, "http://www.omdbapi.com").
        with({query: {"s" => "Star Wars"}}).
        to_return(body: omdb_return_data, status: 200 )
      Omdb::Network.new.call({s: "Star Wars"})
    end

    def fetch_movie
      omdb_return_data = File.read(File.join("spec", "fixtures", "star_wars.json"))
      stub_request(:any, "http://www.omdbapi.com").
        with({query: {"t" => "Star Wars"}}).
        to_return(body: omdb_return_data, status: 200 )
      Omdb::Network.new.call({t: "Star Wars"})
    end
  end
end
