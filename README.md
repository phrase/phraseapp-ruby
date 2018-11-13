# phraseapp-ruby

phraseapp-ruby is a Ruby gem that allows you to interact with the [PhraseApp API](https://developers.phraseapp.com/api/).

PhraseApp is a translation management platform for software projects. You can collaborate on language file translation with your team or order translations through our platform. The API allows you to import locale files, download locale files, tag keys or interact in other ways with the localization data stored in PhraseApp for your account.

phraseapp-ruby is not a replacement for the **phrase gem**, it is a pure API client for programmaticly using our features inside your own applications and does not support the push or pull commands for locale files. However, it does support uploading and downloading of single locale files through the according API endpoints.

If you're looking for a CLI sync command for PhraseApp, please user our official [PhraseApp client](https://help.phraseapp.com/phraseapp-for-developers/phraseapp-client/phraseapp-in-your-terminal). The **phrase gem** is deprecated and will be discontinued at the end of 2015.

## Installation

Install the gem:

    gem install phraseapp-ruby

or add it to your Gemfile when using bundler:

    gem 'phraseapp-ruby'

and install it via

    bundle install

## Usage

For usage examples please refer to our [Wiki](https://github.com/phrase/phraseapp-ruby/wiki/Usage-Example) for this. Here is a basic setup with an [Access Token](https://phraseapp.com/settings/oauth_access_tokens) that you can find in your PhraseApp user profile for Authentication.

```ruby
# Require the gem
require 'phraseapp-ruby'

# Setup Authentication Credentials and Client
credentials = PhraseApp::Auth::Credentials.new(token: "YOUR_ACCESS_TOKEN")
client = PhraseApp::Client.new(credentials)

# List projects page 1 and list 10 projects per_page
rsp, err = client.projects_list(1, 10)
puts rsp

# Create a new key
params = PhraseApp::RequestParams::TranslationKeyParams.new(name: "foo")
rsp, err = client.key_create('YOUR_PROJECT_ID', params)
puts rsp
```

There are also other ways of authentication, which are described in our [API v2 Documentation](https://developers.phraseapp.com/api/)

## Documentation

For a full list of available client actions, see the [phraseapp-ruby Documentation](http://www.rubydoc.info/gems/phraseapp-ruby/PhraseApp/Client)

The actions are generated automatically from our API specification, so once you get the hang of the Ruby specific naming, you should be able to infer names of actions and endpoints through our [API v2 Documentation](https://developers.phraseapp.com/api/)

## OpenSSL

Please note that OpenSSL may cause issues, especially on MacOS X. The following error patterns might be seen:

* `certificate verification failed`: On MacOS X this might be caused by [rvm](http://rvm.io) binary releases trying to fiddle with root certificates. Using `rvm install ruby-2.2.3 --disable-binary` fixes the issue. If you already had installed the rvm binaries it might be necessary to reinstall openssl and removing artifacts (like `/etc/openssl` and `/usr/local/etc/openssl`).
* `handshake failure`: This is most probably related to an outdated version of OpenSSL that tries to initiate a connection using SSLv2/v3 which is not supported by our servers. Updating OpenSSL to version 1.0.2d or later should be sufficient.

## Tests

To run the test first install the dependencies

    $ bundle install

and run the tests by 

    $ rake test


## Contributing 

This library is auto-generated from templates that run against a API specification file. Therefore we can not accept any pull requests in this repository. Please use the [GitHub Issue Tracker](https://github.com/phrase/phraseapp-ruby/issues) to report bugs.


## Further reading

* [phraseapp-ruby documentation](http://www.rubydoc.info/gems/phraseapp-ruby)
* [PhraseApp](https://phraseapp.com)
* [PhraseApp API documentation](https://developers.phraseapp.com/api/)
