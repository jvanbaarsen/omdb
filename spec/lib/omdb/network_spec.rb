require 'spec_helper'
require 'omdb/network'

describe Omdb::Network do
  it "returns a instance of Omdb::Network" do
    network = Omdb::Network.new
    expect(network).to be_a(Omdb::Network)
  end

  describe "#call" do
    it "returns a hash when called" do
      network = Omdb::Network.new.call({s: "Star Wars"})
      expect(network).to be_a(Hash)
    end

    context 'When called with {t: "Star Wars"} as params' do
      it 'returns value contains "Star Wars"' do
        response = Omdb::Network.new.call({t: "Star Wars"})
        expect(response).to include(
          {"Title"=> "Star Wars"}
        )
      end
    end

    context 'When called with {s: "Star Wars"{ as params' do
      it 'returns value contains "Star Wars: The Clone Wars"' do
        response = Omdb::Network.new.call({s: "Star Wars"})
        expect(response["Search"].last).to include (
          {"Title" => "The Star Wars Holiday Special"}
        )
      end
    end
  end
end
