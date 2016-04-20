require "minitest/autorun"
require 'phraseapp-ruby'
require 'date'


describe PhraseApp do
  it "TranslationKeyParams can set and accessed" do
    params = PhraseApp::RequestParams::TranslationKeyParams.new
    assert_raises(PhraseApp::ParamsHelpers::ParamsValidationError) { params.validate }
    assert_equal nil, params.data_type
    params.data_type = "string"
    assert_equal "string", params.data_type
    assert_equal nil, params.max_characters_allowed
    params.max_characters_allowed = "1"
    assert_equal 1, params.max_characters_allowed
  end

  it "AuthorizationParams can set and accessed" do
    params = PhraseApp::RequestParams::AuthorizationParams.new
    assert_raises(PhraseApp::ParamsHelpers::ParamsValidationError) { params.validate }
    assert_equal nil, params.expires_at
    date = DateTime.new(2000,1,1)
    params.expires_at = date.to_s
    assert_equal date, params.expires_at
    assert_equal nil, params.scopes
    params.scopes = "read,write"
    assert_equal ["read", "write"], params.scopes
  end

  it "ResponseObjects::Account can be initialized" do
    date = DateTime.new(2000,1,1)
    h = {created_at: date.to_s}
    response = PhraseApp::ResponseObjects::Account.new(h)
    assert_equal date, response.created_at
  end

  it "#to_h" do
    params = PhraseApp::RequestParams::TranslationKeyParams.new
    assert_raises(PhraseApp::ParamsHelpers::ParamsValidationError) { params.validate }
    params.data_type = "string"
    params.max_characters_allowed = "1"
    expected = {
      data_type: "string",
      max_characters_allowed: 1
    }
    assert_equal expected, params.to_h
  end

  it "#validate" do
    params = PhraseApp::RequestParams::LocaleParams.new
    assert_raises(PhraseApp::ParamsHelpers::ParamsValidationError) { params.validate }
    params.name = "English"
    assert_raises(PhraseApp::ParamsHelpers::ParamsValidationError) { params.validate }
    params.code = "en"
    assert_equal nil, params.validate
  end
end