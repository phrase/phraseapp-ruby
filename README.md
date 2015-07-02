# phraseapp-ruby

phraseapp-ruby is a Ruby gem that allows you to interact with the [PhraseApp API](http://docs.phraseapp.com/api/v2/). 

## Installation

Install the gem:

    gem install phraseapp-ruby

or add it to your Gemfile when using bundler:

    gem 'phraseapp-ruby

and install it via

    bundle install

## Usage

Setup a [Access Token](https://phraseapp.com/me/oauth_access_tokens) for Authentication. 

	# Require the gem
    require 'phraseapp-ruby'

    # Setup Authentication 
    auth_handler = PhraseApp::Auth::AuthHandler.new({:token => "YOUR_ACCESS_TOKEN"})
    PhraseApp::Auth.register_auth_handler(auth_handler)

    # Create a client
    client = PhraseApp::Client

    # List Projects
    rsp, err = client.projects_list(1, 10)
    puts rsp

    # Create a new key
    params = PhraseApp::RequestParams::TranslationKeyParams.new(:name => "foo")
    rsp, err = client.key_create('YOUR_PROJECT_ID', params)
    puts rsp


## Documentation

    For a full list of available client actions, see the [phraseapp-ruby Documentation](http://www.rubydoc.info/gems/phraseapp-ruby/PhraseApp/Client)

## Contributing 

This library is auto-generated from templates that run against a API specification file. Therefore we can not accept any pull requests in this repository. Please use the [GitHub Issue Tracker](https://github.com/phrase/phraseapp-ruby/issues) to report bugs.


## Further reading

* [phraseapp-ruby documentation](http://www.rubydoc.info/gems/phraseapp-ruby)
* [PhraseApp](https://phraseapp.com)
* [PhraseApp API documentation](http://docs.phraseapp.com/api/v2/)