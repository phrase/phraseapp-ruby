
require 'ostruct'
require 'net/https'
require 'uri'
require 'cgi'
require 'json'
require 'date'
require File.expand_path('../auth', __FILE__)
require File.expand_path('../request_handler', __FILE__)

module PhraseApp
  def self.handle_times(obj)
    obj.each_pair do |k, v|
      if is_a_date?(v)
        obj.send(:"#{k}=", DateTime.parse(v))
      end
    end    
  end

  def self.is_a_date?(str)
    if !str.nil? && str.is_a?(String)
      str.match(/^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}/)
    end
  end

  class Authorization < ::OpenStruct
    #created_at, hashed_token, id, note, scopes, token_last_eight, updated_at, 
    def initialize(hash)
      super(hash)
      PhraseApp.handle_times(self)
    end
  end

  class AuthorizationWithToken < Authorization
    #token, 
    def initialize(hash)
      super(hash)
      PhraseApp.handle_times(self)
    end
  end

  class BlacklistedKey < ::OpenStruct
    #created_at, id, name, updated_at, 
    def initialize(hash)
      super(hash)
      PhraseApp.handle_times(self)
    end
  end

  class Comment < ::OpenStruct
    #created_at, id, message, updated_at, user, 
    def initialize(hash)
      super(hash)
      PhraseApp.handle_times(self)
    end
  end

  class Format < ::OpenStruct
    #api_name, default_encoding, description, exportable, extension, importable, name, 
    def initialize(hash)
      super(hash)
      PhraseApp.handle_times(self)
    end
  end

  class KeyPreview < ::OpenStruct
    #id, name, plural, 
    def initialize(hash)
      super(hash)
      PhraseApp.handle_times(self)
    end
  end

  class Locale < ::OpenStruct
    #code, created_at, default, id, main, name, rtl, source_locale, updated_at, 
    def initialize(hash)
      super(hash)
      PhraseApp.handle_times(self)
    end
  end

  class LocaleDetails < Locale
    #statistics, 
    def initialize(hash)
      super(hash)
      PhraseApp.handle_times(self)
    end
  end

  class LocaleFileImport < ::OpenStruct
    #created_at, format, id, state, updated_at, 
    def initialize(hash)
      super(hash)
      PhraseApp.handle_times(self)
    end
  end

  class LocaleFileImportWithSummary < LocaleFileImport
    #summary, 
    def initialize(hash)
      super(hash)
      PhraseApp.handle_times(self)
    end
  end

  class LocalePreview < ::OpenStruct
    #code, id, name, 
    def initialize(hash)
      super(hash)
      PhraseApp.handle_times(self)
    end
  end

  class LocaleStatistics < ::OpenStruct
    #keys_total_count, keys_untranslated_count, missing_words_count, translations_completed_count, translations_unverified_count, unverified_words_count, words_total_count, 
    def initialize(hash)
      super(hash)
      PhraseApp.handle_times(self)
    end
  end

  class Project < ::OpenStruct
    #created_at, id, name, updated_at, 
    def initialize(hash)
      super(hash)
      PhraseApp.handle_times(self)
    end
  end

  class ProjectDetails < Project
    #shares_translation_memory, 
    def initialize(hash)
      super(hash)
      PhraseApp.handle_times(self)
    end
  end

  class StatisticsListItem < ::OpenStruct
    #locale, statistics, 
    def initialize(hash)
      super(hash)
      PhraseApp.handle_times(self)
    end
  end

  class StatisticsType < ::OpenStruct
    #keys_total_count, keys_untranslated_count, translations_completed_count, translations_unverified_count, 
    def initialize(hash)
      super(hash)
      PhraseApp.handle_times(self)
    end
  end

  class Styleguide < ::OpenStruct
    #created_at, id, title, updated_at, 
    def initialize(hash)
      super(hash)
      PhraseApp.handle_times(self)
    end
  end

  class StyleguideDetails < Styleguide
    #audience, business, company_branding, formatting, glossary_terms, grammar_consistency, grammatical_person, literal_translation, overall_tone, public_url, samples, target_audience, vocabulary_type, 
    def initialize(hash)
      super(hash)
      PhraseApp.handle_times(self)
    end
  end

  class StyleguidePreview < ::OpenStruct
    #id, public_url, 
    def initialize(hash)
      super(hash)
      PhraseApp.handle_times(self)
    end
  end

  class SummaryType < ::OpenStruct
    #locales_created, tags_created, translation_keys_created, translations_created, translations_updated, 
    def initialize(hash)
      super(hash)
      PhraseApp.handle_times(self)
    end
  end

  class Tag < ::OpenStruct
    #created_at, keys_count, name, updated_at, 
    def initialize(hash)
      super(hash)
      PhraseApp.handle_times(self)
    end
  end

  class TagWithStats < Tag
    #statistics, 
    def initialize(hash)
      super(hash)
      PhraseApp.handle_times(self)
    end
  end

  class Translation < ::OpenStruct
    #content, created_at, excluded, id, key, locale, plural_suffix, unverified, updated_at, 
    def initialize(hash)
      super(hash)
      PhraseApp.handle_times(self)
    end
  end

  class TranslationDetails < Translation
    #user, word_count, 
    def initialize(hash)
      super(hash)
      PhraseApp.handle_times(self)
    end
  end

  class TranslationKey < ::OpenStruct
    #created_at, description, id, name, name_hash, plural, tags, updated_at, 
    def initialize(hash)
      super(hash)
      PhraseApp.handle_times(self)
    end
  end

  class TranslationKeyDetails < TranslationKey
    #comments_count, data_type, format_value_type, max_characters_allowed, name_plural, original_file, screenshot_url, unformatted, xml_space_preserve, 
    def initialize(hash)
      super(hash)
      PhraseApp.handle_times(self)
    end
  end

  class TranslationOrder < ::OpenStruct
    #amount_in_cents, created_at, currency, id, lsp, message, priority, progress_percent, quality, source_locale, state, styleguide, tag, target_locales, translation_type, unverify_translations_upon_delivery, updated_at, 
    def initialize(hash)
      super(hash)
      PhraseApp.handle_times(self)
    end
  end

  class TranslationVersion < ::OpenStruct
    #changed_at, content, created_at, id, key, locale, plural_suffix, updated_at, 
    def initialize(hash)
      super(hash)
      PhraseApp.handle_times(self)
    end
  end

  class TranslationVersionWithUser < TranslationVersion
    #user, 
    def initialize(hash)
      super(hash)
      PhraseApp.handle_times(self)
    end
  end

  class User < ::OpenStruct
    #company, created_at, email, id, name, position, updated_at, username, 
    def initialize(hash)
      super(hash)
      PhraseApp.handle_times(self)
    end
  end

  class UserPreview < ::OpenStruct
    #id, name, username, 
    def initialize(hash)
      super(hash)
      PhraseApp.handle_times(self)
    end
  end

end

class PhraseApp::AuthorizationParams < ::OpenStruct
  # :note, :scopes, 
  def note=(val)
    self.note = val
  end

  def scopes=(val)
    self.scopes = val.split(',')
  end

  def validate
    if self.note == nil || self.note == "" 
      raise PhraseApp::ParamsValidationError.new("Required parameter \"note\" of \"AuthorizationParams\" not set")
    end
  end
end

class PhraseApp::BlacklistedKeyParams < ::OpenStruct
  # :name, 
  def name=(val)
    self.name = val
  end

  def validate
    if self.name == nil || self.name == "" 
      raise PhraseApp::ParamsValidationError.new("Required parameter \"name\" of \"BlacklistedKeyParams\" not set")
    end
  end
end

class PhraseApp::CommentParams < ::OpenStruct
  # :message, 
  def message=(val)
    self.message = val
  end

  def validate
    if self.message == nil || self.message == "" 
      raise PhraseApp::ParamsValidationError.new("Required parameter \"message\" of \"CommentParams\" not set")
    end
  end
end

class PhraseApp::TranslationKeyParams < ::OpenStruct
  # :data_type, :description, :format_value_type, :max_characters_allowed, :name, :name_plural, :original_file, :plural, :remove_screenshot, :screenshot, :tags, :unformatted, :xml_space_preserve, 
  def data_type=(val)
    self.data_type = val
  end

  def description=(val)
    self.description = val
  end

  def format_value_type=(val)
    self.format_value_type = val
  end

  def max_characters_allowed=(val)
    self.max_characters_allowed = i.to_u
  end

  def name=(val)
    self.name = val
  end

  def name_plural=(val)
    self.name_plural = val
  end

  def original_file=(val)
    self.original_file = val
  end

  def plural=(val)
    if val == "true"
      self.plural = true
    elsif val == "false" #ignore
      self.plural = b
    else
      PhraseApp::ParamsValidationError.new("invalid value #{val}")
    end
  end

  def remove_screenshot=(val)
    if val == "true"
      self.remove_screenshot = true
    elsif val == "false" #ignore
      self.remove_screenshot = b
    else
      PhraseApp::ParamsValidationError.new("invalid value #{val}")
    end
  end

  def screenshot=(val)
    self.screenshot = val
  end

  def tags=(val)
    self.tags = val.split(',')
  end

  def unformatted=(val)
    if val == "true"
      self.unformatted = true
    elsif val == "false" #ignore
      self.unformatted = b
    else
      PhraseApp::ParamsValidationError.new("invalid value #{val}")
    end
  end

  def xml_space_preserve=(val)
    if val == "true"
      self.xml_space_preserve = true
    elsif val == "false" #ignore
      self.xml_space_preserve = b
    else
      PhraseApp::ParamsValidationError.new("invalid value #{val}")
    end
  end

  def validate
    if self.name == nil || self.name == "" 
      raise PhraseApp::ParamsValidationError.new("Required parameter \"name\" of \"TranslationKeyParams\" not set")
    end
  end
end

class PhraseApp::LocaleParams < ::OpenStruct
  # :code, :default, :main, :name, :rtl, :source_locale_id, 
  def code=(val)
    self.code = val
  end

  def default=(val)
    if val == "true"
      self.default = true
    elsif val == "false" #ignore
      self.default = b
    else
      PhraseApp::ParamsValidationError.new("invalid value #{val}")
    end
  end

  def main=(val)
    if val == "true"
      self.main = true
    elsif val == "false" #ignore
      self.main = b
    else
      PhraseApp::ParamsValidationError.new("invalid value #{val}")
    end
  end

  def name=(val)
    self.name = val
  end

  def rtl=(val)
    if val == "true"
      self.rtl = true
    elsif val == "false" #ignore
      self.rtl = b
    else
      PhraseApp::ParamsValidationError.new("invalid value #{val}")
    end
  end

  def source_locale_id=(val)
    self.source_locale_id = val
  end

  def validate
    if self.code == nil || self.code == "" 
      raise PhraseApp::ParamsValidationError.new("Required parameter \"code\" of \"LocaleParams\" not set")
    endif self.name == nil || self.name == "" 
      raise PhraseApp::ParamsValidationError.new("Required parameter \"name\" of \"LocaleParams\" not set")
    end
  end
end

class PhraseApp::TranslationOrderParams < ::OpenStruct
  # :category, :include_untranslated_keys, :include_unverified_translations, :lsp, :message, :priority, :quality, :source_locale_id, :styleguide_id, :tag, :target_locale_ids, :translation_type, :unverify_translations_upon_delivery, 
  def category=(val)
    self.category = val
  end

  def include_untranslated_keys=(val)
    if val == "true"
      self.include_untranslated_keys = true
    elsif val == "false" #ignore
      self.include_untranslated_keys = b
    else
      PhraseApp::ParamsValidationError.new("invalid value #{val}")
    end
  end

  def include_unverified_translations=(val)
    if val == "true"
      self.include_unverified_translations = true
    elsif val == "false" #ignore
      self.include_unverified_translations = b
    else
      PhraseApp::ParamsValidationError.new("invalid value #{val}")
    end
  end

  def lsp=(val)
    self.lsp = val
  end

  def message=(val)
    self.message = val
  end

  def priority=(val)
    if val == "true"
      self.priority = true
    elsif val == "false" #ignore
      self.priority = b
    else
      PhraseApp::ParamsValidationError.new("invalid value #{val}")
    end
  end

  def quality=(val)
    if val == "true"
      self.quality = true
    elsif val == "false" #ignore
      self.quality = b
    else
      PhraseApp::ParamsValidationError.new("invalid value #{val}")
    end
  end

  def source_locale_id=(val)
    self.source_locale_id = val
  end

  def styleguide_id=(val)
    self.styleguide_id = val
  end

  def tag=(val)
    self.tag = val
  end

  def target_locale_ids=(val)
    self.target_locale_ids = val.split(',')
  end

  def translation_type=(val)
    self.translation_type = val
  end

  def unverify_translations_upon_delivery=(val)
    if val == "true"
      self.unverify_translations_upon_delivery = true
    elsif val == "false" #ignore
      self.unverify_translations_upon_delivery = b
    else
      PhraseApp::ParamsValidationError.new("invalid value #{val}")
    end
  end

  def validate
    if self.category == nil || self.category == "" 
      raise PhraseApp::ParamsValidationError.new("Required parameter \"category\" of \"TranslationOrderParams\" not set")
    endif self.lsp == nil || self.lsp == "" 
      raise PhraseApp::ParamsValidationError.new("Required parameter \"lsp\" of \"TranslationOrderParams\" not set")
    endif self.source_locale_id == nil
      raise PhraseApp::ParamsValidationError.new("Required parameter \"source_locale_id\" of \"TranslationOrderParams\" not set")
    endif self.target_locale_ids == nil
      raise PhraseApp::ParamsValidationError.new("Required parameter \"target_locale_ids\" of \"TranslationOrderParams\" not set")
    endif self.translation_type == nil || self.translation_type == "" 
      raise PhraseApp::ParamsValidationError.new("Required parameter \"translation_type\" of \"TranslationOrderParams\" not set")
    end
  end
end

class PhraseApp::ProjectParams < ::OpenStruct
  # :name, :shares_translation_memory, 
  def name=(val)
    self.name = val
  end

  def shares_translation_memory=(val)
    if val == "true"
      self.shares_translation_memory = true
    elsif val == "false" #ignore
      self.shares_translation_memory = b
    else
      PhraseApp::ParamsValidationError.new("invalid value #{val}")
    end
  end

  def validate
    if self.name == nil || self.name == "" 
      raise PhraseApp::ParamsValidationError.new("Required parameter \"name\" of \"ProjectParams\" not set")
    end
  end
end

class PhraseApp::StyleguideParams < ::OpenStruct
  # :audience, :business, :company_branding, :formatting, :glossary_terms, :grammar_consistency, :grammatical_person, :literal_translation, :overall_tone, :samples, :target_audience, :title, :vocabulary_type, 
  def audience=(val)
    self.audience = val
  end

  def business=(val)
    self.business = val
  end

  def company_branding=(val)
    self.company_branding = val
  end

  def formatting=(val)
    self.formatting = val
  end

  def glossary_terms=(val)
    self.glossary_terms = val
  end

  def grammar_consistency=(val)
    self.grammar_consistency = val
  end

  def grammatical_person=(val)
    self.grammatical_person = val
  end

  def literal_translation=(val)
    self.literal_translation = val
  end

  def overall_tone=(val)
    self.overall_tone = val
  end

  def samples=(val)
    self.samples = val
  end

  def target_audience=(val)
    self.target_audience = val
  end

  def title=(val)
    self.title = val
  end

  def vocabulary_type=(val)
    self.vocabulary_type = val
  end

  def validate
    if self.title == nil || self.title == "" 
      raise PhraseApp::ParamsValidationError.new("Required parameter \"title\" of \"StyleguideParams\" not set")
    end
  end
end

class PhraseApp::TagParams < ::OpenStruct
  # :name, 
  def name=(val)
    self.name = val
  end

  def validate
    if self.name == nil || self.name == "" 
      raise PhraseApp::ParamsValidationError.new("Required parameter \"name\" of \"TagParams\" not set")
    end
  end
end

class PhraseApp::TranslationParams < ::OpenStruct
  # :content, :excluded, :key_id, :locale_id, :plural_suffix, :unverified, 
  def content=(val)
    self.content = val
  end

  def excluded=(val)
    if val == "true"
      self.excluded = true
    elsif val == "false" #ignore
      self.excluded = b
    else
      PhraseApp::ParamsValidationError.new("invalid value #{val}")
    end
  end

  def key_id=(val)
    self.key_id = val
  end

  def locale_id=(val)
    self.locale_id = val
  end

  def plural_suffix=(val)
    self.plural_suffix = val
  end

  def unverified=(val)
    if val == "true"
      self.unverified = true
    elsif val == "false" #ignore
      self.unverified = b
    else
      PhraseApp::ParamsValidationError.new("invalid value #{val}")
    end
  end

  def validate
    if self.content == nil || self.content == "" 
      raise PhraseApp::ParamsValidationError.new("Required parameter \"content\" of \"TranslationParams\" not set")
    endif self.key_id == nil
      raise PhraseApp::ParamsValidationError.new("Required parameter \"key_id\" of \"TranslationParams\" not set")
    endif self.locale_id == nil
      raise PhraseApp::ParamsValidationError.new("Required parameter \"locale_id\" of \"TranslationParams\" not set")
    end
  end
end

class PhraseApp::LocaleFileImportParams < ::OpenStruct
  # :convert_emoji, :file, :format, :format_options, :locale_id, :skip_unverification, :skip_upload_tags, :tags, :update_translations, 
  def convert_emoji=(val)
    if val == "true"
      self.convert_emoji = true
    elsif val == "false" #ignore
      self.convert_emoji = b
    else
      PhraseApp::ParamsValidationError.new("invalid value #{val}")
    end
  end

  def file=(val)
    self.file = val
  end

  def format=(val)
    self.format = val
  end

  def format_options=(val)
    self.format_options = JSON.load(val)
  end

  def locale_id=(val)
    self.locale_id = val
  end

  def skip_unverification=(val)
    if val == "true"
      self.skip_unverification = true
    elsif val == "false" #ignore
      self.skip_unverification = b
    else
      PhraseApp::ParamsValidationError.new("invalid value #{val}")
    end
  end

  def skip_upload_tags=(val)
    if val == "true"
      self.skip_upload_tags = true
    elsif val == "false" #ignore
      self.skip_upload_tags = b
    else
      PhraseApp::ParamsValidationError.new("invalid value #{val}")
    end
  end

  def tags=(val)
    self.tags = val.split(',')
  end

  def update_translations=(val)
    if val == "true"
      self.update_translations = true
    elsif val == "false" #ignore
      self.update_translations = b
    else
      PhraseApp::ParamsValidationError.new("invalid value #{val}")
    end
  end

  def validate
    if self.file == nil
      raise PhraseApp::ParamsValidationError.new("Required parameter \"file\" of \"LocaleFileImportParams\" not set")
    end
  end
end

module PhraseApp
  MULTIPART_BOUNDARY = "{PHRASE!!EOF}"
  URL = "https://api.phraseapp.com"

  class ParamsValidationError < StandardError
  end
end

class PhraseApp::RequestHelper
  def initialize(data_hash, post_body=nil)
    @data_hash = data_hash
    @post_body = post_body
  end

  def body
    if @post_body != nil
      body = @post_body.join+PhraseApp.multipart(@data_hash)
      body << "--#{PhraseApp::MULTIPART_BOUNDARY}--\r\n"
    elsif defined?(@data_hash) && @data_hash.is_a?(Hash) && @data_hash.keys.any?
      JSON.dump(@data_hash)
    else
      nil
    end
  end

  def ctype
    if @post_body != nil
      return "multipart/form-data; boundary=#{PhraseApp::MULTIPART_BOUNDARY}"
    elsif defined?(@data_hash) && @data_hash.is_a?(Hash) && @data_hash.keys.any?
      return "application/json"
    else
      return ""
    end
  end
end

class PhraseApp::Client

  # Create a new authorization.
  def self.authorization_create(params)
    path = sprintf("/v2/authorizations")
    data_hash = {}
    post_body = nil

    data_hash = params.to_h
    err = params.validate
    if err != nil
      return nil, err
    end
    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request("POST", path, reqHelper.ctype, reqHelper.body, 201)
    if err != nil
      return nil, err
    end
    
    return PhraseApp::AuthorizationWithToken.new(JSON.load(rc.body)), err
  end

  # Delete an existing authorization. Please note that this will revoke access for that token, so API calls using that token will stop working.
  def self.authorization_delete(id)
    path = sprintf("/v2/authorizations/%s", id)
    data_hash = {}
    post_body = nil

    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request("DELETE", path, reqHelper.ctype, reqHelper.body, 204)
    if err != nil
      return nil, err
    end
    
    return err
  end

  # List all your authorizations.
  def self.authorization_list(page, per_page)
    path = sprintf("/v2/authorizations")
    data_hash = {}
    post_body = nil

    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request_paginated("GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
    if err != nil
      return nil, err
    end
    
    return JSON.load(rc.body).map { |item| PhraseApp::Authorization.new(item) }, err
  end

  # Get details on a single authorization.
  def self.authorization_show(id)
    path = sprintf("/v2/authorizations/%s", id)
    data_hash = {}
    post_body = nil

    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request("GET", path, reqHelper.ctype, reqHelper.body, 200)
    if err != nil
      return nil, err
    end
    
    return PhraseApp::Authorization.new(JSON.load(rc.body)), err
  end

  # Update an existing authorization.
  def self.authorization_update(id, params)
    path = sprintf("/v2/authorizations/%s", id)
    data_hash = {}
    post_body = nil

    data_hash = params.to_h
    err = params.validate
    if err != nil
      return nil, err
    end
    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request("PATCH", path, reqHelper.ctype, reqHelper.body, 200)
    if err != nil
      return nil, err
    end
    
    return PhraseApp::Authorization.new(JSON.load(rc.body)), err
  end

  # Create a new blacklisted key.
  def self.blacklist_key_create(project_id, params)
    path = sprintf("/v2/projects/%s/blacklisted_keys", project_id)
    data_hash = {}
    post_body = nil

    data_hash = params.to_h
    err = params.validate
    if err != nil
      return nil, err
    end
    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request("POST", path, reqHelper.ctype, reqHelper.body, 201)
    if err != nil
      return nil, err
    end
    
    return PhraseApp::BlacklistedKey.new(JSON.load(rc.body)), err
  end

  # Delete an existing blacklisted key.
  def self.blacklist_key_delete(project_id, id)
    path = sprintf("/v2/projects/%s/blacklisted_keys/%s", project_id, id)
    data_hash = {}
    post_body = nil

    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request("DELETE", path, reqHelper.ctype, reqHelper.body, 204)
    if err != nil
      return nil, err
    end
    
    return err
  end

  # Get details on a single blacklisted key for a given project.
  def self.blacklist_key_show(project_id, id)
    path = sprintf("/v2/projects/%s/blacklisted_keys/%s", project_id, id)
    data_hash = {}
    post_body = nil

    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request("GET", path, reqHelper.ctype, reqHelper.body, 200)
    if err != nil
      return nil, err
    end
    
    return PhraseApp::BlacklistedKey.new(JSON.load(rc.body)), err
  end

  # Update an existing blacklisted key.
  def self.blacklist_key_update(project_id, id, params)
    path = sprintf("/v2/projects/%s/blacklisted_keys/%s", project_id, id)
    data_hash = {}
    post_body = nil

    data_hash = params.to_h
    err = params.validate
    if err != nil
      return nil, err
    end
    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request("PATCH", path, reqHelper.ctype, reqHelper.body, 200)
    if err != nil
      return nil, err
    end
    
    return PhraseApp::BlacklistedKey.new(JSON.load(rc.body)), err
  end

  # List all blacklisted keys for the given project.
  def self.blacklist_show(project_id, page, per_page)
    path = sprintf("/v2/projects/%s/blacklisted_keys", project_id)
    data_hash = {}
    post_body = nil

    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request_paginated("GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
    if err != nil
      return nil, err
    end
    
    return JSON.load(rc.body).map { |item| PhraseApp::BlacklistedKey.new(item) }, err
  end

  # Create a new comment for a key.
  def self.comment_create(project_id, key_id, params)
    path = sprintf("/v2/projects/%s/keys/%s/comments", project_id, key_id)
    data_hash = {}
    post_body = nil

    data_hash = params.to_h
    err = params.validate
    if err != nil
      return nil, err
    end
    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request("POST", path, reqHelper.ctype, reqHelper.body, 201)
    if err != nil
      return nil, err
    end
    
    return PhraseApp::Comment.new(JSON.load(rc.body)), err
  end

  # Delete an existing comment.
  def self.comment_delete(project_id, key_id, id)
    path = sprintf("/v2/projects/%s/keys/%s/comments/%s", project_id, key_id, id)
    data_hash = {}
    post_body = nil

    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request("DELETE", path, reqHelper.ctype, reqHelper.body, 204)
    if err != nil
      return nil, err
    end
    
    return err
  end

  # List all comments for a key.
  def self.comment_list(project_id, key_id, page, per_page)
    path = sprintf("/v2/projects/%s/keys/%s/comments", project_id, key_id)
    data_hash = {}
    post_body = nil

    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request_paginated("GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
    if err != nil
      return nil, err
    end
    
    return JSON.load(rc.body).map { |item| PhraseApp::Comment.new(item) }, err
  end

  # Check if comment was marked as read. Returns 204 if read, 404 if unread.
  def self.comment_mark_check(project_id, key_id, id)
    path = sprintf("/v2/projects/%s/keys/%s/comments/%s/read", project_id, key_id, id)
    data_hash = {}
    post_body = nil

    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request("GET", path, reqHelper.ctype, reqHelper.body, 204)
    if err != nil
      return nil, err
    end
    
    return err
  end

  # Mark a comment as read
  def self.comment_mark_read(project_id, key_id, id)
    path = sprintf("/v2/projects/%s/keys/%s/comments/%s/read", project_id, key_id, id)
    data_hash = {}
    post_body = nil

    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request("PUT", path, reqHelper.ctype, reqHelper.body, 204)
    if err != nil
      return nil, err
    end
    
    return err
  end

  # Mark a comment as unread
  def self.comment_mark_unread(project_id, key_id, id)
    path = sprintf("/v2/projects/%s/keys/%s/comments/%s/read", project_id, key_id, id)
    data_hash = {}
    post_body = nil

    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request("DELETE", path, reqHelper.ctype, reqHelper.body, 204)
    if err != nil
      return nil, err
    end
    
    return err
  end

  # Get details on a single comment.
  def self.comment_show(project_id, key_id, id)
    path = sprintf("/v2/projects/%s/keys/%s/comments/%s", project_id, key_id, id)
    data_hash = {}
    post_body = nil

    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request("GET", path, reqHelper.ctype, reqHelper.body, 200)
    if err != nil
      return nil, err
    end
    
    return PhraseApp::Comment.new(JSON.load(rc.body)), err
  end

  # Update an existing comment.
  def self.comment_update(project_id, key_id, id, params)
    path = sprintf("/v2/projects/%s/keys/%s/comments/%s", project_id, key_id, id)
    data_hash = {}
    post_body = nil

    data_hash = params.to_h
    err = params.validate
    if err != nil
      return nil, err
    end
    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request("PATCH", path, reqHelper.ctype, reqHelper.body, 200)
    if err != nil
      return nil, err
    end
    
    return PhraseApp::Comment.new(JSON.load(rc.body)), err
  end

  # Get a handy list of all localization file formats supported in PhraseApp.
  def self.formats_list(page, per_page)
    path = sprintf("/v2/formats")
    data_hash = {}
    post_body = nil

    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request_paginated("GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
    if err != nil
      return nil, err
    end
    
    return JSON.load(rc.body).map { |item| PhraseApp::Format.new(item) }, err
  end

  # Create a new key.
  def self.key_create(project_id, params)
    path = sprintf("/v2/projects/%s/keys", project_id)
    data_hash = {}
    post_body = nil
    if params.data_type != nil
      data_hash["data_type"] = params.data_type
    end

    if params.description != nil
      data_hash["description"] = params.description
    end

    if params.format_value_type != nil
      data_hash["format_value_type"] = params.format_value_type
    end

    if params.max_characters_allowed != nil
      data_hash["max_characters_allowed"] = params.max_characters_allowed.to_i
    end

    if params.name != nil
      data_hash["name"] = params.name
    end

    if params.name_plural != nil
      data_hash["name_plural"] = params.name_plural
    end

    if params.original_file != nil
      data_hash["original_file"] = params.original_file
    end

    if params.plural != nil
      data_hash["plural"] = (params.plural == "true")
    end

    if params.remove_screenshot != nil
      data_hash["remove_screenshot"] = (params.remove_screenshot == "true")
    end

    if params.screenshot != nil
      post_body = []
      post_body << "--#{PhraseApp::MULTIPART_BOUNDARY}\r\n"
      post_body << "Content-Disposition: form-data; name=\"screenshot\"; filename=\"#{File.basename(params.screenshot )}\"\r\n"
      post_body << "Content-Type: text/plain\r\n"
      post_body << "\r\n"
      post_body << File.read(params.screenshot)
      post_body << "\r\n"
    end

    if params.tags != nil
      data_hash["tags"] = params.tags
    end

    if params.unformatted != nil
      data_hash["unformatted"] = (params.unformatted == "true")
    end

    if params.xml_space_preserve != nil
      data_hash["xml_space_preserve"] = (params.xml_space_preserve == "true")
    end



    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request("POST", path, reqHelper.ctype, reqHelper.body, 201)
    if err != nil
      return nil, err
    end
    
    return PhraseApp::TranslationKeyDetails.new(JSON.load(rc.body)), err
  end

  # Delete an existing key.
  def self.key_delete(project_id, id)
    path = sprintf("/v2/projects/%s/keys/%s", project_id, id)
    data_hash = {}
    post_body = nil

    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request("DELETE", path, reqHelper.ctype, reqHelper.body, 204)
    if err != nil
      return nil, err
    end
    
    return err
  end

  # List all keys for the given project.
  def self.key_list(project_id, page, per_page, params)
    path = sprintf("/v2/projects/%s/keys", project_id)
    data_hash = {}
    post_body = nil

    data_hash = params.to_h
    err = params.validate
    if err != nil
      return nil, err
    end
    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request_paginated("GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
    if err != nil
      return nil, err
    end
    
    return JSON.load(rc.body).map { |item| PhraseApp::TranslationKey.new(item) }, err
  end

  # Get details on a single key for a given project.
  def self.key_show(project_id, id)
    path = sprintf("/v2/projects/%s/keys/%s", project_id, id)
    data_hash = {}
    post_body = nil

    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request("GET", path, reqHelper.ctype, reqHelper.body, 200)
    if err != nil
      return nil, err
    end
    
    return PhraseApp::TranslationKeyDetails.new(JSON.load(rc.body)), err
  end

  # Update an existing key.
  def self.key_update(project_id, id, params)
    path = sprintf("/v2/projects/%s/keys/%s", project_id, id)
    data_hash = {}
    post_body = nil
    if params.data_type != nil
      data_hash["data_type"] = params.data_type
    end

    if params.description != nil
      data_hash["description"] = params.description
    end

    if params.format_value_type != nil
      data_hash["format_value_type"] = params.format_value_type
    end

    if params.max_characters_allowed != nil
      data_hash["max_characters_allowed"] = params.max_characters_allowed.to_i
    end

    if params.name != nil
      data_hash["name"] = params.name
    end

    if params.name_plural != nil
      data_hash["name_plural"] = params.name_plural
    end

    if params.original_file != nil
      data_hash["original_file"] = params.original_file
    end

    if params.plural != nil
      data_hash["plural"] = (params.plural == "true")
    end

    if params.remove_screenshot != nil
      data_hash["remove_screenshot"] = (params.remove_screenshot == "true")
    end

    if params.screenshot != nil
      post_body = []
      post_body << "--#{PhraseApp::MULTIPART_BOUNDARY}\r\n"
      post_body << "Content-Disposition: form-data; name=\"screenshot\"; filename=\"#{File.basename(params.screenshot )}\"\r\n"
      post_body << "Content-Type: text/plain\r\n"
      post_body << "\r\n"
      post_body << File.read(params.screenshot)
      post_body << "\r\n"
    end

    if params.tags != nil
      data_hash["tags"] = params.tags
    end

    if params.unformatted != nil
      data_hash["unformatted"] = (params.unformatted == "true")
    end

    if params.xml_space_preserve != nil
      data_hash["xml_space_preserve"] = (params.xml_space_preserve == "true")
    end



    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request("PATCH", path, reqHelper.ctype, reqHelper.body, 200)
    if err != nil
      return nil, err
    end
    
    return PhraseApp::TranslationKeyDetails.new(JSON.load(rc.body)), err
  end

  # Create a new locale.
  def self.locale_create(project_id, params)
    path = sprintf("/v2/projects/%s/locales", project_id)
    data_hash = {}
    post_body = nil

    data_hash = params.to_h
    err = params.validate
    if err != nil
      return nil, err
    end
    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request("POST", path, reqHelper.ctype, reqHelper.body, 201)
    if err != nil
      return nil, err
    end
    
    return PhraseApp::LocaleDetails.new(JSON.load(rc.body)), err
  end

  # Delete an existing locale.
  def self.locale_delete(project_id, id)
    path = sprintf("/v2/projects/%s/locales/%s", project_id, id)
    data_hash = {}
    post_body = nil

    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request("DELETE", path, reqHelper.ctype, reqHelper.body, 204)
    if err != nil
      return nil, err
    end
    
    return err
  end

  # Download a locale in a specific file format.
  def self.locale_download(project_id, id, params)
    path = sprintf("/v2/projects/%s/locales/%s/download", project_id, id)
    data_hash = {}
    post_body = nil

    data_hash = params.to_h
    err = params.validate
    if err != nil
      return nil, err
    end
    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request("GET", path, reqHelper.ctype, reqHelper.body, 200)
    if err != nil
      return nil, err
    end
    return rc.body
    return err
  end

  # List all locales for the given project.
  def self.locale_list(project_id, page, per_page)
    path = sprintf("/v2/projects/%s/locales", project_id)
    data_hash = {}
    post_body = nil

    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request_paginated("GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
    if err != nil
      return nil, err
    end
    
    return JSON.load(rc.body).map { |item| PhraseApp::Locale.new(item) }, err
  end

  # Get details on a single locale for a given project.
  def self.locale_show(project_id, id)
    path = sprintf("/v2/projects/%s/locales/%s", project_id, id)
    data_hash = {}
    post_body = nil

    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request("GET", path, reqHelper.ctype, reqHelper.body, 200)
    if err != nil
      return nil, err
    end
    
    return PhraseApp::LocaleDetails.new(JSON.load(rc.body)), err
  end

  # Update an existing locale.
  def self.locale_update(project_id, id, params)
    path = sprintf("/v2/projects/%s/locales/%s", project_id, id)
    data_hash = {}
    post_body = nil

    data_hash = params.to_h
    err = params.validate
    if err != nil
      return nil, err
    end
    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request("PATCH", path, reqHelper.ctype, reqHelper.body, 200)
    if err != nil
      return nil, err
    end
    
    return PhraseApp::LocaleDetails.new(JSON.load(rc.body)), err
  end

  # Confirm an existing order. Sends the order to the language service provider for processing. Please note that your access token must include the <code>orders.create</code> scope to confirm orders.
  def self.order_confirm(project_id, id)
    path = sprintf("/v2/projects/%s/orders/%s/confirm", project_id, id)
    data_hash = {}
    post_body = nil

    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request("PATCH", path, reqHelper.ctype, reqHelper.body, 200)
    if err != nil
      return nil, err
    end
    
    return PhraseApp::TranslationOrder.new(JSON.load(rc.body)), err
  end

  # Create a new order. Please note that your access token must include the <code>orders.create</code> scope to create orders.
  def self.order_create(project_id, params)
    path = sprintf("/v2/projects/%s/orders", project_id)
    data_hash = {}
    post_body = nil

    data_hash = params.to_h
    err = params.validate
    if err != nil
      return nil, err
    end
    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request("POST", path, reqHelper.ctype, reqHelper.body, 201)
    if err != nil
      return nil, err
    end
    
    return PhraseApp::TranslationOrder.new(JSON.load(rc.body)), err
  end

  # Cancel an existing order. Must not yet be confirmed.
  def self.order_delete(project_id, id)
    path = sprintf("/v2/projects/%s/orders/%s", project_id, id)
    data_hash = {}
    post_body = nil

    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request("DELETE", path, reqHelper.ctype, reqHelper.body, 204)
    if err != nil
      return nil, err
    end
    
    return err
  end

  # List all orders for the given project.
  def self.order_list(project_id, page, per_page)
    path = sprintf("/v2/projects/%s/orders", project_id)
    data_hash = {}
    post_body = nil

    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request_paginated("GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
    if err != nil
      return nil, err
    end
    
    return JSON.load(rc.body).map { |item| PhraseApp::TranslationOrder.new(item) }, err
  end

  # Get details on a single order.
  def self.order_show(project_id, id)
    path = sprintf("/v2/projects/%s/orders/%s", project_id, id)
    data_hash = {}
    post_body = nil

    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request("GET", path, reqHelper.ctype, reqHelper.body, 200)
    if err != nil
      return nil, err
    end
    
    return PhraseApp::TranslationOrder.new(JSON.load(rc.body)), err
  end

  # Create a new project.
  def self.project_create(params)
    path = sprintf("/v2/projects")
    data_hash = {}
    post_body = nil

    data_hash = params.to_h
    err = params.validate
    if err != nil
      return nil, err
    end
    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request("POST", path, reqHelper.ctype, reqHelper.body, 201)
    if err != nil
      return nil, err
    end
    
    return PhraseApp::ProjectDetails.new(JSON.load(rc.body)), err
  end

  # Delete an existing project.
  def self.project_delete(id)
    path = sprintf("/v2/projects/%s", id)
    data_hash = {}
    post_body = nil

    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request("DELETE", path, reqHelper.ctype, reqHelper.body, 204)
    if err != nil
      return nil, err
    end
    
    return err
  end

  # List all projects the current user has access to.
  def self.project_list(page, per_page)
    path = sprintf("/v2/projects")
    data_hash = {}
    post_body = nil

    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request_paginated("GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
    if err != nil
      return nil, err
    end
    
    return JSON.load(rc.body).map { |item| PhraseApp::Project.new(item) }, err
  end

  # Get details on a single project.
  def self.project_show(id)
    path = sprintf("/v2/projects/%s", id)
    data_hash = {}
    post_body = nil

    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request("GET", path, reqHelper.ctype, reqHelper.body, 200)
    if err != nil
      return nil, err
    end
    
    return PhraseApp::ProjectDetails.new(JSON.load(rc.body)), err
  end

  # Update an existing project.
  def self.project_update(id, params)
    path = sprintf("/v2/projects/%s", id)
    data_hash = {}
    post_body = nil

    data_hash = params.to_h
    err = params.validate
    if err != nil
      return nil, err
    end
    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request("PATCH", path, reqHelper.ctype, reqHelper.body, 200)
    if err != nil
      return nil, err
    end
    
    return PhraseApp::ProjectDetails.new(JSON.load(rc.body)), err
  end

  # Show details for current User.
  def self.show_user()
    path = sprintf("/v2/user")
    data_hash = {}
    post_body = nil

    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request("GET", path, reqHelper.ctype, reqHelper.body, 200)
    if err != nil
      return nil, err
    end
    
    return PhraseApp::User.new(JSON.load(rc.body)), err
  end

  # Create a new style guide.
  def self.styleguide_create(project_id, params)
    path = sprintf("/v2/projects/%s/styleguides", project_id)
    data_hash = {}
    post_body = nil

    data_hash = params.to_h
    err = params.validate
    if err != nil
      return nil, err
    end
    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request("POST", path, reqHelper.ctype, reqHelper.body, 201)
    if err != nil
      return nil, err
    end
    
    return PhraseApp::StyleguideDetails.new(JSON.load(rc.body)), err
  end

  # Delete an existing style guide.
  def self.styleguide_delete(project_id, id)
    path = sprintf("/v2/projects/%s/styleguides/%s", project_id, id)
    data_hash = {}
    post_body = nil

    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request("DELETE", path, reqHelper.ctype, reqHelper.body, 204)
    if err != nil
      return nil, err
    end
    
    return err
  end

  # List all styleguides for the given project.
  def self.styleguide_list(project_id, page, per_page)
    path = sprintf("/v2/projects/%s/styleguides", project_id)
    data_hash = {}
    post_body = nil

    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request_paginated("GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
    if err != nil
      return nil, err
    end
    
    return JSON.load(rc.body).map { |item| PhraseApp::Styleguide.new(item) }, err
  end

  # Get details on a single style guide.
  def self.styleguide_show(project_id, id)
    path = sprintf("/v2/projects/%s/styleguides/%s", project_id, id)
    data_hash = {}
    post_body = nil

    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request("GET", path, reqHelper.ctype, reqHelper.body, 200)
    if err != nil
      return nil, err
    end
    
    return PhraseApp::StyleguideDetails.new(JSON.load(rc.body)), err
  end

  # Update an existing style guide.
  def self.styleguide_update(project_id, id, params)
    path = sprintf("/v2/projects/%s/styleguides/%s", project_id, id)
    data_hash = {}
    post_body = nil

    data_hash = params.to_h
    err = params.validate
    if err != nil
      return nil, err
    end
    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request("PATCH", path, reqHelper.ctype, reqHelper.body, 200)
    if err != nil
      return nil, err
    end
    
    return PhraseApp::StyleguideDetails.new(JSON.load(rc.body)), err
  end

  # Create a new tag.
  def self.tag_create(project_id, params)
    path = sprintf("/v2/projects/%s/tags", project_id)
    data_hash = {}
    post_body = nil

    data_hash = params.to_h
    err = params.validate
    if err != nil
      return nil, err
    end
    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request("POST", path, reqHelper.ctype, reqHelper.body, 201)
    if err != nil
      return nil, err
    end
    
    return PhraseApp::TagWithStats.new(JSON.load(rc.body)), err
  end

  # Delete an existing tag.
  def self.tag_delete(project_id, name)
    path = sprintf("/v2/projects/%s/tags/%s", project_id, name)
    data_hash = {}
    post_body = nil

    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request("DELETE", path, reqHelper.ctype, reqHelper.body, 204)
    if err != nil
      return nil, err
    end
    
    return err
  end

  # List all tags for the given project.
  def self.tag_list(project_id, page, per_page)
    path = sprintf("/v2/projects/%s/tags", project_id)
    data_hash = {}
    post_body = nil

    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request_paginated("GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
    if err != nil
      return nil, err
    end
    
    return JSON.load(rc.body).map { |item| PhraseApp::Tag.new(item) }, err
  end

  # Get details and progress information on a single tag for a given project.
  def self.tag_show(project_id, name)
    path = sprintf("/v2/projects/%s/tags/%s", project_id, name)
    data_hash = {}
    post_body = nil

    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request("GET", path, reqHelper.ctype, reqHelper.body, 200)
    if err != nil
      return nil, err
    end
    
    return PhraseApp::TagWithStats.new(JSON.load(rc.body)), err
  end

  # Create a translation.
  def self.translation_create(project_id, params)
    path = sprintf("/v2/projects/%s/translations", project_id)
    data_hash = {}
    post_body = nil

    data_hash = params.to_h
    err = params.validate
    if err != nil
      return nil, err
    end
    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request("POST", path, reqHelper.ctype, reqHelper.body, 201)
    if err != nil
      return nil, err
    end
    
    return PhraseApp::TranslationDetails.new(JSON.load(rc.body)), err
  end

  # List translations for the given project.
  def self.translation_list_all(project_id, page, per_page, params)
    path = sprintf("/v2/projects/%s/translations", project_id)
    data_hash = {}
    post_body = nil

    data_hash = params.to_h
    err = params.validate
    if err != nil
      return nil, err
    end
    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request_paginated("GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
    if err != nil
      return nil, err
    end
    
    return JSON.load(rc.body).map { |item| PhraseApp::Translation.new(item) }, err
  end

  # List translations for a specific key.
  def self.translation_list_key(project_id, key_id, page, per_page, params)
    path = sprintf("/v2/projects/%s/keys/%s/translations", project_id, key_id)
    data_hash = {}
    post_body = nil

    data_hash = params.to_h
    err = params.validate
    if err != nil
      return nil, err
    end
    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request_paginated("GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
    if err != nil
      return nil, err
    end
    
    return JSON.load(rc.body).map { |item| PhraseApp::Translation.new(item) }, err
  end

  # List translations for a specific locale.
  def self.translation_list_locale(project_id, locale_id, page, per_page, params)
    path = sprintf("/v2/projects/%s/locales/%s/translations", project_id, locale_id)
    data_hash = {}
    post_body = nil

    data_hash = params.to_h
    err = params.validate
    if err != nil
      return nil, err
    end
    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request_paginated("GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
    if err != nil
      return nil, err
    end
    
    return JSON.load(rc.body).map { |item| PhraseApp::Translation.new(item) }, err
  end

  # Get details on a single translation.
  def self.translation_show(project_id, id)
    path = sprintf("/v2/projects/%s/translations/%s", project_id, id)
    data_hash = {}
    post_body = nil

    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request("GET", path, reqHelper.ctype, reqHelper.body, 200)
    if err != nil
      return nil, err
    end
    
    return PhraseApp::TranslationDetails.new(JSON.load(rc.body)), err
  end

  # Update an existing translation.
  def self.translation_update(project_id, id, params)
    path = sprintf("/v2/projects/%s/translations/%s", project_id, id)
    data_hash = {}
    post_body = nil

    data_hash = params.to_h
    err = params.validate
    if err != nil
      return nil, err
    end
    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request("PATCH", path, reqHelper.ctype, reqHelper.body, 200)
    if err != nil
      return nil, err
    end
    
    return PhraseApp::TranslationDetails.new(JSON.load(rc.body)), err
  end

  # Upload a new file to your project. This will extract all new content such as keys, translations, locales, tags etc. and store them in your project.
  def self.upload_create(project_id, params)
    path = sprintf("/v2/projects/%s/uploads", project_id)
    data_hash = {}
    post_body = nil
    if params.convert_emoji != nil
      data_hash["convert_emoji"] = (params.convert_emoji == "true")
    end

    if params.file != nil
      post_body = []
      post_body << "--#{PhraseApp::MULTIPART_BOUNDARY}\r\n"
      post_body << "Content-Disposition: form-data; name=\"file\"; filename=\"#{File.basename(params.file )}\"\r\n"
      post_body << "Content-Type: text/plain\r\n"
      post_body << "\r\n"
      post_body << File.read(params.file)
      post_body << "\r\n"
    end

    if params.format != nil
      data_hash["format"] = params.format
    end

    if params.format_options != nil
      params.format_options.each do |key, value|
        data_hash["format_options"][key] = value
      end
    end

    if params.locale_id != nil
      data_hash["locale_id"] = params.locale_id
    end

    if params.skip_unverification != nil
      data_hash["skip_unverification"] = (params.skip_unverification == "true")
    end

    if params.skip_upload_tags != nil
      data_hash["skip_upload_tags"] = (params.skip_upload_tags == "true")
    end

    if params.tags != nil
      data_hash["tags"] = params.tags
    end

    if params.update_translations != nil
      data_hash["update_translations"] = (params.update_translations == "true")
    end



    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request("POST", path, reqHelper.ctype, reqHelper.body, 201)
    if err != nil
      return nil, err
    end
    
    return PhraseApp::LocaleFileImportWithSummary.new(JSON.load(rc.body)), err
  end

  # View details and summary for a single upload.
  def self.upload_show(project_id, id)
    path = sprintf("/v2/projects/%s/uploads/%s", project_id, id)
    data_hash = {}
    post_body = nil

    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request("GET", path, reqHelper.ctype, reqHelper.body, 200)
    if err != nil
      return nil, err
    end
    
    return PhraseApp::LocaleFileImportWithSummary.new(JSON.load(rc.body)), err
  end

  # List all versions for the given translation.
  def self.version_list(project_id, translation_id, page, per_page)
    path = sprintf("/v2/projects/%s/translations/%s/versions", project_id, translation_id)
    data_hash = {}
    post_body = nil

    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request_paginated("GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
    if err != nil
      return nil, err
    end
    
    return JSON.load(rc.body).map { |item| PhraseApp::TranslationVersion.new(item) }, err
  end

  # Get details on a single version.
  def self.version_show(project_id, translation_id, id)
    path = sprintf("/v2/projects/%s/translations/%s/versions/%s", project_id, translation_id, id)
    data_hash = {}
    post_body = nil

    reqHelper = PhraseApp::RequestHelper.new(data_hash, post_body)
    rc, err = PhraseApp.send_request("GET", path, reqHelper.ctype, reqHelper.body, 200)
    if err != nil
      return nil, err
    end
    
    return PhraseApp::TranslationVersionWithUser.new(JSON.load(rc.body)), err
  end

end
