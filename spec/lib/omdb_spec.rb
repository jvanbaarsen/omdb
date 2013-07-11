require 'omdb'

describe 'Omdb::API' do
	subject {Omdb::API.new}
	let(:omdb_api) {Omdb::API.new}
	it "Should return a instance of OMDB::API" do
		omdb_api.should be_instance_of(Omdb::API)
	end

	context "When searching for 'Star Wars'" do
		let(:response) {subject.search("Star Wars")}	
	
		it "responds to a search call" do
			omdb_api.should respond_to(:search).with(1).argument
		end

		it "returnr status code 200" do
			response[:status].should eq(200)		
		end

		it "returns a total of 10 items" do
			response[:movies].size.should eq(10)	
		end

		it "returned list movies should be of the type Omdb::Movie" do
			response[:movies][0].should be_instance_of(Omdb::Movie)
		end
	end
end

describe 'Omdb::Movie' do
	subject {Omdb::Movie.new(JSON.parse('{"Title":"Star Wars","Year":"1977","imdbID":"tt0076759","Type":"movie"}'))}
	it "should return an instance of Omdb::Movie when parsed with the correct values" do
		movie = Omdb::Movie.new(JSON.parse('{"Title":"Star Wars","Year":"1977","imdbID":"tt0076759","Type":"movie"}'))
		movie.should be_instance_of(Omdb::Movie)
	end
	
	context "With the basic information loaded" do
		describe 'the values' do
			its(:title) {should eq("Star Wars")}
			its(:year) {should eq(1977)}
			its(:imdb_id) {should eq('tt0076759')}
			its(:type) {should eq('movie')}
		end
	end

	context "Unloaded situation" do
		it "should have status loaded false" do
			subject.loaded.should be_false
		end
	end
end
