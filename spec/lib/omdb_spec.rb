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
	describe "attributes" do
		it '#title' do
		  expect(subject).to respond_to :title
		end
		
		it '#year' do
		  expect(subject).to respond_to :year
		end

		it '#rated' do
		  expect(subject).to respond_to :rated
		end
	
		it '#released' do
		  expect(subject).to respond_to :released
		end

		it '#runtime' do
		  expect(subject).to respond_to :runtime		  
		end

		it '#genre' do
		  expect(subject).to respond_to :genre
		end
	
		it '#director' do
		  expect(subject).to respond_to :director		  
		end

		it '#writer' do
		  expect(subject).to respond_to :writer		  
		end

		it '#actors' do
		  expect(subject).to respond_to :actors		  
		end

		it '#plot' do
		  expect(subject).to respond_to :plot		  
		end

		it '#poster' do
		  expect(subject).to respond_to :poster		  
		end

		it '#imdb_rating' do
		  expect(subject).to respond_to :imdb_rating
		end

		it '#imdb_votes' do
		  expect(subject).to respond_to :imdb_votes		  
		end

		it '#imdb_id' do
		  expect(subject).to respond_to :imdb_id		  
		end

		it '#type' do
		  expect(subject).to respond_to :type		  
		end
	end
	
	context "Unloaded situation" do
		it "should have status loaded false" do
			subject.loaded.should be_false
		end
		describe "the values should be" do
			its(:title) {should eq("Star Wars")}
			its(:year) {should eq(1977)}
			its(:imdb_id) {should eq('tt0076759')}
			its(:type) {should eq('movie')}
		end
	end
end
