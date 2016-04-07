require "minitest/autorun"
require 'phraseapp-ruby'


describe PhraseApp do
  it "identifier" do
    assert_includes PhraseApp::API_CLIENT_IDENTIFIER, "PhraseApp Ruby"
  end

  it "responds_to" do
    assert_respond_to PhraseApp, :handleResponseStatus
    assert_respond_to PhraseApp, :multipart
    assert_respond_to PhraseApp, :send_request
    assert_respond_to PhraseApp, :http_send
  end
end


describe PhraseApp::RequestErrors::ErrorResponse do
  let(:http_response) { MockResponse.new }

  let(:error_response) { 
    PhraseApp::RequestErrors::ErrorResponse.new(
      http_response
    )
  }

  it "error" do
    assert_equal "My Error", error_response.error
  end

  it "message" do
    assert_equal "My Error", error_response.message
  end
end


describe PhraseApp::RequestErrors::ValidationErrorResponse do
  let(:http_response) { MockResponse.new }
  let(:error_response) { 
    PhraseApp::RequestErrors::ValidationErrorResponse.new(
      http_response
    )
  }

  it "message" do
    assert_equal "My Error", error_response.message
  end

  it "errors" do
    expected = PhraseApp::RequestErrors::ValidationErrorMessage.new({
      "resource" => "Locale",
      "field" => "locale_id",
      "message" => "locale id is not set"
    })
    actual = error_response.errors.first
    assert_equal expected.resource, actual.resource
    assert_equal expected.field, actual.field
    assert_equal expected.message, actual.message
    assert_equal "\t[Locale:locale_id] locale id is not set", actual.to_s
  end
end


describe PhraseApp, "#handleResponseStatus" do
  let(:expected_code) { 200 }
  let(:response_code) { nil }
  let(:http_response) { MockResponse.new(code: response_code) }
  subject { PhraseApp.handleResponseStatus(http_response, expected_code) }

  describe "handle when both codes are the same" do
    let(:expected_code) { 400 }
    let(:response_code) { 400 }

    it "it should be nil" do
      assert_equal nil, subject
    end
  end

  describe "handle 400" do
    let(:response_code) { 400 }

    it "it should be a ErrorResponse" do
      assert_equal PhraseApp::RequestErrors::ErrorResponse, subject.class
    end
  end

  describe "handle 422" do
    let(:response_code) { 422 }

    it "be a ValidationErrorResponse" do
      assert_equal PhraseApp::RequestErrors::ValidationErrorResponse, subject.class
    end
  end

  describe "handle 404" do
    let(:response_code) { 404 }

    it "should raise" do
      -> { subject }.must_raise RuntimeError
    end
  end

  describe "handle unknown errror" do
    let(:response_code) { 1000 }

    it "should raise" do
      -> { subject }.must_raise RuntimeError
    end
  end
end


class MockResponse
  attr_accessor :code
  def initialize(code:nil)
    @code = code
  end
  def body
    %{{ 
        "message" : "My Error",
        "errors" : [{
          "resource" : "Locale",
          "field" : "locale_id",
          "message" : "locale id is not set"
        }]
    }}
  end
end

