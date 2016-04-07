require "minitest/autorun"
require 'phraseapp-ruby/auth'


describe PhraseApp::Auth::Credentials do
  let(:token) { "123456789" }
  let(:username) { "tom" }
  let(:password) { "secret-password" }

  let(:credentials) { 
    PhraseApp::Auth::Credentials.new(
      token: token,
      username: username,
      password: password
    )
  }

  it "host" do
    assert_equal "https://api.phraseapp.com", credentials.host
  end

  it "token" do
    assert_equal "123456789", credentials.token
  end

  it "username" do
    assert_equal "tom", credentials.username
  end

  it "password" do
    assert_equal "secret-password", credentials.password
  end

  it "validate!" do
    assert_equal nil, credentials.validate!
  end 

  it "if no username or token given validate should raise" do
    invalid_credentials = PhraseApp::Auth::Credentials.new(
      token: "",
      username: ""
    )
    assert_raises(ValidationError) { invalid_credentials.validate! }
  end

  it "if not username or token given authenticate should raise" do
    nil_credentials = PhraseApp::Auth::Credentials.new
    assert_raises(ValidationError) { nil_credentials.authenticate(nil) }
  end
end
