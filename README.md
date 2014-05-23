# Omdb
[![Code Climate](https://codeclimate.com/github/jvanbaarsen/omdb.png)](https://codeclimate.com/github/jvanbaarsen/omdb)
[![Build Status](https://travis-ci.org/jvanbaarsen/omdb.png?branch=master)](https://travis-ci.org/jvanbaarsen/omdb)

This gem is an easy way to access the OMDB Api (http://www.omdbapi.com)

See: https://gist.github.com/jvanbaarsen/6142607 for an example

## Installation

Add this line to your application's Gemfile:

    gem 'omdb'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omdb

## Usage

### Finding movies

    Omdb::Api.new.search('MOVIE NAME')

This will return an hash with movies

### Fetching movie
To fetch a single movie (when you know the full name):

    Omdb::Api.new.fetch('MOVIE NAME')
    Omdb::Api.new.fetch('MOVIE NAME', YEAR (Optional))

This will return a Omdb::Movie object with the following properties:

    :loaded, :title, :year, :rated, :released, :runtime, :genre, :director, :writer, :actors, :plot,
    :poster, :imdb_rating, :imdb_votes, :imdb_id, :type

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
