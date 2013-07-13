require 'spec_helper'
require 'omdb/network'

describe Omdb::Network do
  it "returns a instance of Omdb::Network" do
    network = Omdb::Network.new
    expect(network).to be_a(Omdb::Network)
  end

  describe "#call" do
    it "returns a hash when called" do
      WebMock.allow_net_connect!
      network = Omdb::Network.new.call({s: "Star Wars"})
      expect(network).to be_a(Hash)
    end

    context 'When called with {t: "Star Wars"} as params' do
      it 'returns value contains "Star Wars"' do
        WebMock.allow_net_connect!
        response = Omdb::Network.new.call({t: "Star Wars"})
        expect(response[:data]).to include(
          {"Title"=> "Star Wars"}
        )
      end
    end

    context 'When called with {s: "Star Wars"{ as params' do
      it 'returns value contains "Star Wars: The Clone Wars"' do
        WebMock.allow_net_connect!
        response = Omdb::Network.new.call({s: "Star Wars"})
        expect(response[:data]["Search"].last).to include (
          {"Title" => "The Star Wars Holiday Special"}
        )
      end
    end
  end
end
