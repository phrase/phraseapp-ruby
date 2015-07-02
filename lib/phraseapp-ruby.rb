
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


module ResponseObjects
    class AffectedCount < ::OpenStruct
      #records_affected, 
      def initialize(hash)
        super(hash)
        PhraseApp.handle_times(self)
      end
    end

    class Authorization < ::OpenStruct
      #created_at, expires_at, hashed_token, id, note, scopes, token_last_eight, updated_at, 
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

    class ExcludeRule < ::OpenStruct
      #created_at, id, name, updated_at, 
      def initialize(hash)
        super(hash)
        PhraseApp.handle_times(self)
      end
    end

    class Format < ::OpenStruct
      #api_name, default_encoding, default_file, description, exportable, extension, importable, name, 
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
      #code, created_at, default, id, main, name, plural_forms, rtl, source_locale, updated_at, 
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
      #created_at, file_format, id, state, updated_at, 
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
      #created_at, id, main_format, name, updated_at, 
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
      #content, created_at, excluded, id, key, locale, placeholders, plural_suffix, unverified, updated_at, 
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
      #created_at, data_type, description, id, name, name_hash, plural, tags, updated_at, 
      def initialize(hash)
        super(hash)
        PhraseApp.handle_times(self)
      end
    end

    class TranslationKeyDetails < TranslationKey
      #comments_count, format_value_type, max_characters_allowed, name_plural, original_file, screenshot_url, unformatted, xml_space_preserve, 
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

module RequestParams
  class AuthorizationParams < ::OpenStruct
    # :expires_at, :note, :scopes, 
    def expires_at=(val)
      self.expires_at = Time.parse(val)
    end

    def note=(val)
      self.note = val
    end

    def scopes=(val)
      self.scopes = val.split(',')
    end

    def validate
      if self.note == nil || self.note == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"note\" of \"AuthorizationParams\" not set")
      end
    end
  end
end


module RequestParams
  class CommentParams < ::OpenStruct
    # :message, 
    def message=(val)
      self.message = val
    end

    def validate
      if self.message == nil || self.message == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"message\" of \"CommentParams\" not set")
      end
    end
  end
end


module RequestParams
  class ExcludeRuleParams < ::OpenStruct
    # :name, 
    def name=(val)
      self.name = val
    end

    def validate
      if self.name == nil || self.name == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"name\" of \"ExcludeRuleParams\" not set")
      end
    end
  end
end


module RequestParams
  class TranslationKeyParams < ::OpenStruct
    # :data_type, :description, :localized_format_key, :localized_format_string, :max_characters_allowed, :name, :name_plural, :original_file, :plural, :remove_screenshot, :screenshot, :tags, :unformatted, :xml_space_preserve, 
    def data_type=(val)
      self.data_type = val
    end

    def description=(val)
      self.description = val
    end

    def localized_format_key=(val)
      self.localized_format_key = val
    end

    def localized_format_string=(val)
      self.localized_format_string = val
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
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def remove_screenshot=(val)
      if val == "true"
        self.remove_screenshot = true
      elsif val == "false" #ignore
        self.remove_screenshot = b
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
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
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def xml_space_preserve=(val)
      if val == "true"
        self.xml_space_preserve = true
      elsif val == "false" #ignore
        self.xml_space_preserve = b
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def validate
      if self.name == nil || self.name == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"name\" of \"TranslationKeyParams\" not set")
      end
    end
  end
end


module RequestParams
  class LocaleParams < ::OpenStruct
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
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def main=(val)
      if val == "true"
        self.main = true
      elsif val == "false" #ignore
        self.main = b
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
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
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def source_locale_id=(val)
      self.source_locale_id = val
    end

    def validate
      if self.code == nil || self.code == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"code\" of \"LocaleParams\" not set")
      endif self.name == nil || self.name == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"name\" of \"LocaleParams\" not set")
      end
    end
  end
end


module RequestParams
  class TranslationOrderParams < ::OpenStruct
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
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def include_unverified_translations=(val)
      if val == "true"
        self.include_unverified_translations = true
      elsif val == "false" #ignore
        self.include_unverified_translations = b
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
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
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def quality=(val)
      if val == "true"
        self.quality = true
      elsif val == "false" #ignore
        self.quality = b
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
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
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def validate
      if self.category == nil || self.category == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"category\" of \"TranslationOrderParams\" not set")
      endif self.lsp == nil || self.lsp == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"lsp\" of \"TranslationOrderParams\" not set")
      endif self.source_locale_id == nil
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"source_locale_id\" of \"TranslationOrderParams\" not set")
      endif self.target_locale_ids == nil
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"target_locale_ids\" of \"TranslationOrderParams\" not set")
      endif self.translation_type == nil || self.translation_type == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"translation_type\" of \"TranslationOrderParams\" not set")
      end
    end
  end
end


module RequestParams
  class ProjectParams < ::OpenStruct
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
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def validate
      if self.name == nil || self.name == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"name\" of \"ProjectParams\" not set")
      end
    end
  end
end


module RequestParams
  class StyleguideParams < ::OpenStruct
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
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"title\" of \"StyleguideParams\" not set")
      end
    end
  end
end


module RequestParams
  class TagParams < ::OpenStruct
    # :name, 
    def name=(val)
      self.name = val
    end

    def validate
      if self.name == nil || self.name == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"name\" of \"TagParams\" not set")
      end
    end
  end
end


module RequestParams
  class TranslationParams < ::OpenStruct
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
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
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
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def validate
      if self.content == nil || self.content == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"content\" of \"TranslationParams\" not set")
      endif self.key_id == nil
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"key_id\" of \"TranslationParams\" not set")
      endif self.locale_id == nil
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"locale_id\" of \"TranslationParams\" not set")
      end
    end
  end
end


module RequestParams
  class LocaleFileImportParams < ::OpenStruct
    # :convert_emoji, :file, :file_format, :format_options, :locale_id, :skip_unverification, :skip_upload_tags, :tags, :update_translations, 
    def convert_emoji=(val)
      if val == "true"
        self.convert_emoji = true
      elsif val == "false" #ignore
        self.convert_emoji = b
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def file=(val)
      self.file = val
    end

    def file_format=(val)
      self.file_format = val
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
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def skip_upload_tags=(val)
      if val == "true"
        self.skip_upload_tags = true
      elsif val == "false" #ignore
        self.skip_upload_tags = b
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
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
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def validate
      if self.file == nil
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"file\" of \"LocaleFileImportParams\" not set")
      end
    end
  end
end

end


module PhraseApp
  MULTIPART_BOUNDARY = "{PHRASE!!EOF}"
  URL = "https://api.phraseapp.com"

  module ParamsHelpers
    class ParamsValidationError < StandardError; end

    class ParamsError < StandardError; end

    class BodyTypeHelper
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

  end


    

module RequestParams
  class KeysDeleteParams < ::OpenStruct
    # :locale_id, :q, 
    def locale_id=(val)
      self.locale_id = val
    end

    def q=(val)
      self.q = val
    end

    def validate
      
    end
  end
end


module RequestParams
  class KeysListParams < ::OpenStruct
    # :locale_id, :order, :q, :sort, 
    def locale_id=(val)
      self.locale_id = val
    end

    def order=(val)
      self.order = val
    end

    def q=(val)
      self.q = val
    end

    def sort=(val)
      self.sort = val
    end

    def validate
      
    end
  end
end


module RequestParams
  class KeysSearchParams < ::OpenStruct
    # :locale_id, :order, :q, :sort, 
    def locale_id=(val)
      self.locale_id = val
    end

    def order=(val)
      self.order = val
    end

    def q=(val)
      self.q = val
    end

    def sort=(val)
      self.sort = val
    end

    def validate
      
    end
  end
end


module RequestParams
  class KeysTagParams < ::OpenStruct
    # :locale_id, :q, :tags, 
    def locale_id=(val)
      self.locale_id = val
    end

    def q=(val)
      self.q = val
    end

    def tags=(val)
      self.tags = val.split(',')
    end

    def validate
      if self.tags == nil
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"tags\" of \"keys_tagParams\" not set")
      end
    end
  end
end


module RequestParams
  class KeysUntagParams < ::OpenStruct
    # :locale_id, :q, :tags, 
    def locale_id=(val)
      self.locale_id = val
    end

    def q=(val)
      self.q = val
    end

    def tags=(val)
      self.tags = val.split(',')
    end

    def validate
      if self.tags == nil
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"tags\" of \"keys_untagParams\" not set")
      end
    end
  end
end


module RequestParams
  class LocaleDownloadParams < ::OpenStruct
    # :convert_emoji, :file_format, :format_options, :include_empty_translations, :keep_notranslate_tags, :tag_id, 
    def convert_emoji=(val)
      if val == "true"
        self.convert_emoji = true
      elsif val == "false" #ignore
        self.convert_emoji = b
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def file_format=(val)
      self.file_format = val
    end

    def format_options=(val)
      self.format_options = JSON.load(val)
    end

    def include_empty_translations=(val)
      if val == "true"
        self.include_empty_translations = true
      elsif val == "false" #ignore
        self.include_empty_translations = b
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def keep_notranslate_tags=(val)
      if val == "true"
        self.keep_notranslate_tags = true
      elsif val == "false" #ignore
        self.keep_notranslate_tags = b
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def tag_id=(val)
      self.tag_id = val
    end

    def validate
      if self.file_format == nil || self.file_format == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"file_format\" of \"locale_downloadParams\" not set")
      end
    end
  end
end


module RequestParams
  class TranslationUpdateParams < ::OpenStruct
    # :content, :excluded, :plural_suffix, :unverified, 
    def content=(val)
      self.content = val
    end

    def excluded=(val)
      if val == "true"
        self.excluded = true
      elsif val == "false" #ignore
        self.excluded = b
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
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
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def validate
      if self.content == nil || self.content == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"content\" of \"translation_updateParams\" not set")
      end
    end
  end
end


module RequestParams
  class TranslationsByKeyParams < ::OpenStruct
    # :order, :q, :sort, 
    def order=(val)
      self.order = val
    end

    def q=(val)
      self.q = val
    end

    def sort=(val)
      self.sort = val
    end

    def validate
      
    end
  end
end


module RequestParams
  class TranslationsByLocaleParams < ::OpenStruct
    # :order, :q, :sort, 
    def order=(val)
      self.order = val
    end

    def q=(val)
      self.q = val
    end

    def sort=(val)
      self.sort = val
    end

    def validate
      
    end
  end
end


module RequestParams
  class TranslationsExcludeParams < ::OpenStruct
    # :order, :q, :sort, 
    def order=(val)
      self.order = val
    end

    def q=(val)
      self.q = val
    end

    def sort=(val)
      self.sort = val
    end

    def validate
      
    end
  end
end


module RequestParams
  class TranslationsIncludeParams < ::OpenStruct
    # :order, :q, :sort, 
    def order=(val)
      self.order = val
    end

    def q=(val)
      self.q = val
    end

    def sort=(val)
      self.sort = val
    end

    def validate
      
    end
  end
end


module RequestParams
  class TranslationsListParams < ::OpenStruct
    # :order, :q, :sort, 
    def order=(val)
      self.order = val
    end

    def q=(val)
      self.q = val
    end

    def sort=(val)
      self.sort = val
    end

    def validate
      
    end
  end
end


module RequestParams
  class TranslationsSearchParams < ::OpenStruct
    # :order, :q, :sort, 
    def order=(val)
      self.order = val
    end

    def q=(val)
      self.q = val
    end

    def sort=(val)
      self.sort = val
    end

    def validate
      
    end
  end
end


module RequestParams
  class TranslationsUnverifyParams < ::OpenStruct
    # :order, :q, :sort, 
    def order=(val)
      self.order = val
    end

    def q=(val)
      self.q = val
    end

    def sort=(val)
      self.sort = val
    end

    def validate
      
    end
  end
end


module RequestParams
  class TranslationsVerifyParams < ::OpenStruct
    # :order, :q, :sort, 
    def order=(val)
      self.order = val
    end

    def q=(val)
      self.q = val
    end

    def sort=(val)
      self.sort = val
    end

    def validate
      
    end
  end
end


  # Usage example:
  #
  # Require the gem
  #   require 'phraseapp-ruby'
  # Setup Authentication 
  #   auth_handler = PhraseApp::Auth::AuthHandler.new({:token => "YOUR_ACCESS_TOKEN"})
  #   PhraseApp::Auth.register_auth_handler(auth_handler)
  # Create a client
  #   client = PhraseApp::Client
  # List Projects
  #   rsp, err = client.projects_list(1, 10)
  #   puts rsp
  # Create a new key
  #   params = PhraseApp::RequestParams::TranslationKeyParams.new(:name => "foo")
  #   rsp, err = client.key_create('YOUR_PROJECT_ID', params)
  #   puts rsp
  class Client
  
    # Create a new authorization.
    # API Path: /v2/authorizations
    # == Parameters:
    # params::
    #   Parameters of type PhraseApp::RequestParams::AuthorizationCreateParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::AuthorizationWithToken
    #   err
    def self.authorization_create(params)
      path = sprintf("/v2/authorizations")
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::AuthorizationCreateParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::AuthorizationCreateParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("POST", path, reqHelper.ctype, reqHelper.body, 201)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::AuthorizationWithToken.new(JSON.load(rc.body)), err
    end
  
    # Delete an existing authorization. API calls using that token will stop working.
    # API Path: /v2/authorizations/:id
    # == Parameters:
    # id::
    #   id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::
    #   err
    def self.authorization_delete(id)
      path = sprintf("/v2/authorizations/%s", id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("DELETE", path, reqHelper.ctype, reqHelper.body, 204)
      if err != nil
        return nil, err
      end
      
      return err
    end
  
    # Get details on a single authorization.
    # API Path: /v2/authorizations/:id
    # == Parameters:
    # id::
    #   id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Authorization
    #   err
    def self.authorization_show(id)
      path = sprintf("/v2/authorizations/%s", id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("GET", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::Authorization.new(JSON.load(rc.body)), err
    end
  
    # Update an existing authorization.
    # API Path: /v2/authorizations/:id
    # == Parameters:
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::AuthorizationUpdateParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Authorization
    #   err
    def self.authorization_update(id, params)
      path = sprintf("/v2/authorizations/%s", id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::AuthorizationUpdateParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::AuthorizationUpdateParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("PATCH", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::Authorization.new(JSON.load(rc.body)), err
    end
  
    # List all your authorizations.
    # API Path: /v2/authorizations
    # == Parameters:
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Authorization
    #   err
    def self.authorizations_list(page, per_page)
      path = sprintf("/v2/authorizations")
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request_paginated("GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
      if err != nil
        return nil, err
      end
      
      return JSON.load(rc.body).map { |item| PhraseApp::ResponseObjects::Authorization.new(item) }, err
    end
  
    # Create a new comment for a key.
    # API Path: /v2/projects/:project_id/keys/:key_id/comments
    # == Parameters:
    # project_id::
    #   project_id
    # key_id::
    #   key_id
    # params::
    #   Parameters of type PhraseApp::RequestParams::CommentCreateParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Comment
    #   err
    def self.comment_create(project_id, key_id, params)
      path = sprintf("/v2/projects/%s/keys/%s/comments", project_id, key_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::CommentCreateParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::CommentCreateParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("POST", path, reqHelper.ctype, reqHelper.body, 201)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::Comment.new(JSON.load(rc.body)), err
    end
  
    # Delete an existing comment.
    # API Path: /v2/projects/:project_id/keys/:key_id/comments/:id
    # == Parameters:
    # project_id::
    #   project_id
    # key_id::
    #   key_id
    # id::
    #   id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::
    #   err
    def self.comment_delete(project_id, key_id, id)
      path = sprintf("/v2/projects/%s/keys/%s/comments/%s", project_id, key_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("DELETE", path, reqHelper.ctype, reqHelper.body, 204)
      if err != nil
        return nil, err
      end
      
      return err
    end
  
    # Check if comment was marked as read. Returns 204 if read, 404 if unread.
    # API Path: /v2/projects/:project_id/keys/:key_id/comments/:id/read
    # == Parameters:
    # project_id::
    #   project_id
    # key_id::
    #   key_id
    # id::
    #   id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::
    #   err
    def self.comment_mark_check(project_id, key_id, id)
      path = sprintf("/v2/projects/%s/keys/%s/comments/%s/read", project_id, key_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("GET", path, reqHelper.ctype, reqHelper.body, 204)
      if err != nil
        return nil, err
      end
      
      return err
    end
  
    # Mark a comment as read.
    # API Path: /v2/projects/:project_id/keys/:key_id/comments/:id/read
    # == Parameters:
    # project_id::
    #   project_id
    # key_id::
    #   key_id
    # id::
    #   id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::
    #   err
    def self.comment_mark_read(project_id, key_id, id)
      path = sprintf("/v2/projects/%s/keys/%s/comments/%s/read", project_id, key_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("PATCH", path, reqHelper.ctype, reqHelper.body, 204)
      if err != nil
        return nil, err
      end
      
      return err
    end
  
    # Mark a comment as unread.
    # API Path: /v2/projects/:project_id/keys/:key_id/comments/:id/read
    # == Parameters:
    # project_id::
    #   project_id
    # key_id::
    #   key_id
    # id::
    #   id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::
    #   err
    def self.comment_mark_unread(project_id, key_id, id)
      path = sprintf("/v2/projects/%s/keys/%s/comments/%s/read", project_id, key_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("DELETE", path, reqHelper.ctype, reqHelper.body, 204)
      if err != nil
        return nil, err
      end
      
      return err
    end
  
    # Get details on a single comment.
    # API Path: /v2/projects/:project_id/keys/:key_id/comments/:id
    # == Parameters:
    # project_id::
    #   project_id
    # key_id::
    #   key_id
    # id::
    #   id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Comment
    #   err
    def self.comment_show(project_id, key_id, id)
      path = sprintf("/v2/projects/%s/keys/%s/comments/%s", project_id, key_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("GET", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::Comment.new(JSON.load(rc.body)), err
    end
  
    # Update an existing comment.
    # API Path: /v2/projects/:project_id/keys/:key_id/comments/:id
    # == Parameters:
    # project_id::
    #   project_id
    # key_id::
    #   key_id
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::CommentUpdateParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Comment
    #   err
    def self.comment_update(project_id, key_id, id, params)
      path = sprintf("/v2/projects/%s/keys/%s/comments/%s", project_id, key_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::CommentUpdateParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::CommentUpdateParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("PATCH", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::Comment.new(JSON.load(rc.body)), err
    end
  
    # List all comments for a key.
    # API Path: /v2/projects/:project_id/keys/:key_id/comments
    # == Parameters:
    # project_id::
    #   project_id
    # key_id::
    #   key_id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Comment
    #   err
    def self.comments_list(project_id, key_id, page, per_page)
      path = sprintf("/v2/projects/%s/keys/%s/comments", project_id, key_id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request_paginated("GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
      if err != nil
        return nil, err
      end
      
      return JSON.load(rc.body).map { |item| PhraseApp::ResponseObjects::Comment.new(item) }, err
    end
  
    # Create a new blacklisted key.
    # API Path: /v2/projects/:project_id/blacklisted_keys
    # == Parameters:
    # project_id::
    #   project_id
    # params::
    #   Parameters of type PhraseApp::RequestParams::ExcludeRuleCreateParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::BlacklistedKey
    #   err
    def self.exclude_rule_create(project_id, params)
      path = sprintf("/v2/projects/%s/blacklisted_keys", project_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::ExcludeRuleCreateParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::ExcludeRuleCreateParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("POST", path, reqHelper.ctype, reqHelper.body, 201)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::BlacklistedKey.new(JSON.load(rc.body)), err
    end
  
    # Delete an existing blacklisted key.
    # API Path: /v2/projects/:project_id/blacklisted_keys/:id
    # == Parameters:
    # project_id::
    #   project_id
    # id::
    #   id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::
    #   err
    def self.exclude_rule_delete(project_id, id)
      path = sprintf("/v2/projects/%s/blacklisted_keys/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("DELETE", path, reqHelper.ctype, reqHelper.body, 204)
      if err != nil
        return nil, err
      end
      
      return err
    end
  
    # Get details on a single blacklisted key for a given project.
    # API Path: /v2/projects/:project_id/blacklisted_keys/:id
    # == Parameters:
    # project_id::
    #   project_id
    # id::
    #   id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::BlacklistedKey
    #   err
    def self.exclude_rule_show(project_id, id)
      path = sprintf("/v2/projects/%s/blacklisted_keys/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("GET", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::BlacklistedKey.new(JSON.load(rc.body)), err
    end
  
    # Update an existing blacklisted key.
    # API Path: /v2/projects/:project_id/blacklisted_keys/:id
    # == Parameters:
    # project_id::
    #   project_id
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::ExcludeRuleUpdateParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::BlacklistedKey
    #   err
    def self.exclude_rule_update(project_id, id, params)
      path = sprintf("/v2/projects/%s/blacklisted_keys/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::ExcludeRuleUpdateParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::ExcludeRuleUpdateParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("PATCH", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::BlacklistedKey.new(JSON.load(rc.body)), err
    end
  
    # List all blacklisted keys for the given project.
    # API Path: /v2/projects/:project_id/blacklisted_keys
    # == Parameters:
    # project_id::
    #   project_id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::BlacklistedKey
    #   err
    def self.exclude_rules_index(project_id, page, per_page)
      path = sprintf("/v2/projects/%s/blacklisted_keys", project_id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request_paginated("GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
      if err != nil
        return nil, err
      end
      
      return JSON.load(rc.body).map { |item| PhraseApp::ResponseObjects::BlacklistedKey.new(item) }, err
    end
  
    # Get a handy list of all localization file formats supported in PhraseApp.
    # API Path: /v2/formats
    # == Parameters:
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Format
    #   err
    def self.formats_list(page, per_page)
      path = sprintf("/v2/formats")
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request_paginated("GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
      if err != nil
        return nil, err
      end
      
      return JSON.load(rc.body).map { |item| PhraseApp::ResponseObjects::Format.new(item) }, err
    end
  
    # Create a new key.
    # API Path: /v2/projects/:project_id/keys
    # == Parameters:
    # project_id::
    #   project_id
    # params::
    #   Parameters of type PhraseApp::RequestParams::KeyCreateParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::TranslationKeyDetails
    #   err
    def self.key_create(project_id, params)
      path = sprintf("/v2/projects/%s/keys", project_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::KeyCreateParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::KeyCreateParams")
        end
      end
      if params.data_type != nil
        data_hash["data_type"] = params.data_type
      end

      if params.description != nil
        data_hash["description"] = params.description
      end

      if params.localized_format_key != nil
        data_hash["localized_format_key"] = params.localized_format_key
      end

      if params.localized_format_string != nil
        data_hash["localized_format_string"] = params.localized_format_string
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

  
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("POST", path, reqHelper.ctype, reqHelper.body, 201)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::TranslationKeyDetails.new(JSON.load(rc.body)), err
    end
  
    # Delete an existing key.
    # API Path: /v2/projects/:project_id/keys/:id
    # == Parameters:
    # project_id::
    #   project_id
    # id::
    #   id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::
    #   err
    def self.key_delete(project_id, id)
      path = sprintf("/v2/projects/%s/keys/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("DELETE", path, reqHelper.ctype, reqHelper.body, 204)
      if err != nil
        return nil, err
      end
      
      return err
    end
  
    # Get details on a single key for a given project.
    # API Path: /v2/projects/:project_id/keys/:id
    # == Parameters:
    # project_id::
    #   project_id
    # id::
    #   id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::TranslationKeyDetails
    #   err
    def self.key_show(project_id, id)
      path = sprintf("/v2/projects/%s/keys/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("GET", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::TranslationKeyDetails.new(JSON.load(rc.body)), err
    end
  
    # Update an existing key.
    # API Path: /v2/projects/:project_id/keys/:id
    # == Parameters:
    # project_id::
    #   project_id
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::KeyUpdateParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::TranslationKeyDetails
    #   err
    def self.key_update(project_id, id, params)
      path = sprintf("/v2/projects/%s/keys/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::KeyUpdateParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::KeyUpdateParams")
        end
      end
      if params.data_type != nil
        data_hash["data_type"] = params.data_type
      end

      if params.description != nil
        data_hash["description"] = params.description
      end

      if params.localized_format_key != nil
        data_hash["localized_format_key"] = params.localized_format_key
      end

      if params.localized_format_string != nil
        data_hash["localized_format_string"] = params.localized_format_string
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

  
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("PATCH", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::TranslationKeyDetails.new(JSON.load(rc.body)), err
    end
  
    # Delete all keys matching query. Same constraints as list.
    # API Path: /v2/projects/:project_id/keys
    # == Parameters:
    # project_id::
    #   project_id
    # params::
    #   Parameters of type PhraseApp::RequestParams::KeysDeleteParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::
    #   err
    def self.keys_delete(project_id, params)
      path = sprintf("/v2/projects/%s/keys", project_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::KeysDeleteParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::KeysDeleteParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("DELETE", path, reqHelper.ctype, reqHelper.body, 204)
      if err != nil
        return nil, err
      end
      
      return err
    end
  
    # List all keys for the given project. Alternatively you can POST requests to /search.
    # API Path: /v2/projects/:project_id/keys
    # == Parameters:
    # project_id::
    #   project_id
    # params::
    #   Parameters of type PhraseApp::RequestParams::KeysListParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::TranslationKey
    #   err
    def self.keys_list(project_id, page, per_page, params)
      path = sprintf("/v2/projects/%s/keys", project_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::KeysListParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::KeysListParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request_paginated("GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
      if err != nil
        return nil, err
      end
      
      return JSON.load(rc.body).map { |item| PhraseApp::ResponseObjects::TranslationKey.new(item) }, err
    end
  
    # List all keys for the given project matching query.
    # API Path: /v2/projects/:project_id/keys/search
    # == Parameters:
    # project_id::
    #   project_id
    # params::
    #   Parameters of type PhraseApp::RequestParams::KeysSearchParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::TranslationKey
    #   err
    def self.keys_search(project_id, page, per_page, params)
      path = sprintf("/v2/projects/%s/keys/search", project_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::KeysSearchParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::KeysSearchParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request_paginated("POST", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
      if err != nil
        return nil, err
      end
      
      return JSON.load(rc.body).map { |item| PhraseApp::ResponseObjects::TranslationKey.new(item) }, err
    end
  
    # Tags all keys matching query. Same constraints as list.
    # API Path: /v2/projects/:project_id/keys/tag
    # == Parameters:
    # project_id::
    #   project_id
    # params::
    #   Parameters of type PhraseApp::RequestParams::KeysTagParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::
    #   err
    def self.keys_tag(project_id, params)
      path = sprintf("/v2/projects/%s/keys/tag", project_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::KeysTagParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::KeysTagParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("PATCH", path, reqHelper.ctype, reqHelper.body, 204)
      if err != nil
        return nil, err
      end
      
      return err
    end
  
    # Removes specified tags from keys matching query.
    # API Path: /v2/projects/:project_id/keys/tag
    # == Parameters:
    # project_id::
    #   project_id
    # params::
    #   Parameters of type PhraseApp::RequestParams::KeysUntagParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::
    #   err
    def self.keys_untag(project_id, params)
      path = sprintf("/v2/projects/%s/keys/tag", project_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::KeysUntagParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::KeysUntagParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("DELETE", path, reqHelper.ctype, reqHelper.body, 204)
      if err != nil
        return nil, err
      end
      
      return err
    end
  
    # Create a new locale.
    # API Path: /v2/projects/:project_id/locales
    # == Parameters:
    # project_id::
    #   project_id
    # params::
    #   Parameters of type PhraseApp::RequestParams::LocaleCreateParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::LocaleDetails
    #   err
    def self.locale_create(project_id, params)
      path = sprintf("/v2/projects/%s/locales", project_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::LocaleCreateParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::LocaleCreateParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("POST", path, reqHelper.ctype, reqHelper.body, 201)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::LocaleDetails.new(JSON.load(rc.body)), err
    end
  
    # Delete an existing locale.
    # API Path: /v2/projects/:project_id/locales/:id
    # == Parameters:
    # project_id::
    #   project_id
    # id::
    #   id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::
    #   err
    def self.locale_delete(project_id, id)
      path = sprintf("/v2/projects/%s/locales/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("DELETE", path, reqHelper.ctype, reqHelper.body, 204)
      if err != nil
        return nil, err
      end
      
      return err
    end
  
    # Download a locale in a specific file format.
    # API Path: /v2/projects/:project_id/locales/:id/download
    # == Parameters:
    # project_id::
    #   project_id
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::LocaleDownloadParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::
    #   err
    def self.locale_download(project_id, id, params)
      path = sprintf("/v2/projects/%s/locales/%s/download", project_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::LocaleDownloadParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::LocaleDownloadParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("GET", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      return rc.body
      return err
    end
  
    # Get details on a single locale for a given project.
    # API Path: /v2/projects/:project_id/locales/:id
    # == Parameters:
    # project_id::
    #   project_id
    # id::
    #   id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::LocaleDetails
    #   err
    def self.locale_show(project_id, id)
      path = sprintf("/v2/projects/%s/locales/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("GET", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::LocaleDetails.new(JSON.load(rc.body)), err
    end
  
    # Update an existing locale.
    # API Path: /v2/projects/:project_id/locales/:id
    # == Parameters:
    # project_id::
    #   project_id
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::LocaleUpdateParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::LocaleDetails
    #   err
    def self.locale_update(project_id, id, params)
      path = sprintf("/v2/projects/%s/locales/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::LocaleUpdateParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::LocaleUpdateParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("PATCH", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::LocaleDetails.new(JSON.load(rc.body)), err
    end
  
    # List all locales for the given project.
    # API Path: /v2/projects/:project_id/locales
    # == Parameters:
    # project_id::
    #   project_id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Locale
    #   err
    def self.locales_list(project_id, page, per_page)
      path = sprintf("/v2/projects/%s/locales", project_id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request_paginated("GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
      if err != nil
        return nil, err
      end
      
      return JSON.load(rc.body).map { |item| PhraseApp::ResponseObjects::Locale.new(item) }, err
    end
  
    # Confirm an existing order and send it to the provider for translation. Same constraints as for create.
    # API Path: /v2/projects/:project_id/orders/:id/confirm
    # == Parameters:
    # project_id::
    #   project_id
    # id::
    #   id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::TranslationOrder
    #   err
    def self.order_confirm(project_id, id)
      path = sprintf("/v2/projects/%s/orders/%s/confirm", project_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("PATCH", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::TranslationOrder.new(JSON.load(rc.body)), err
    end
  
    # Create a new order. Access token scope must include <code>orders.create</code>.
    # API Path: /v2/projects/:project_id/orders
    # == Parameters:
    # project_id::
    #   project_id
    # params::
    #   Parameters of type PhraseApp::RequestParams::OrderCreateParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::TranslationOrder
    #   err
    def self.order_create(project_id, params)
      path = sprintf("/v2/projects/%s/orders", project_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::OrderCreateParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::OrderCreateParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("POST", path, reqHelper.ctype, reqHelper.body, 201)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::TranslationOrder.new(JSON.load(rc.body)), err
    end
  
    # Cancel an existing order. Must not yet be confirmed.
    # API Path: /v2/projects/:project_id/orders/:id
    # == Parameters:
    # project_id::
    #   project_id
    # id::
    #   id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::
    #   err
    def self.order_delete(project_id, id)
      path = sprintf("/v2/projects/%s/orders/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("DELETE", path, reqHelper.ctype, reqHelper.body, 204)
      if err != nil
        return nil, err
      end
      
      return err
    end
  
    # Get details on a single order.
    # API Path: /v2/projects/:project_id/orders/:id
    # == Parameters:
    # project_id::
    #   project_id
    # id::
    #   id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::TranslationOrder
    #   err
    def self.order_show(project_id, id)
      path = sprintf("/v2/projects/%s/orders/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("GET", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::TranslationOrder.new(JSON.load(rc.body)), err
    end
  
    # List all orders for the given project.
    # API Path: /v2/projects/:project_id/orders
    # == Parameters:
    # project_id::
    #   project_id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::TranslationOrder
    #   err
    def self.orders_list(project_id, page, per_page)
      path = sprintf("/v2/projects/%s/orders", project_id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request_paginated("GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
      if err != nil
        return nil, err
      end
      
      return JSON.load(rc.body).map { |item| PhraseApp::ResponseObjects::TranslationOrder.new(item) }, err
    end
  
    # Create a new project.
    # API Path: /v2/projects
    # == Parameters:
    # params::
    #   Parameters of type PhraseApp::RequestParams::ProjectCreateParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::ProjectDetails
    #   err
    def self.project_create(params)
      path = sprintf("/v2/projects")
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::ProjectCreateParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::ProjectCreateParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("POST", path, reqHelper.ctype, reqHelper.body, 201)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::ProjectDetails.new(JSON.load(rc.body)), err
    end
  
    # Delete an existing project.
    # API Path: /v2/projects/:id
    # == Parameters:
    # id::
    #   id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::
    #   err
    def self.project_delete(id)
      path = sprintf("/v2/projects/%s", id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("DELETE", path, reqHelper.ctype, reqHelper.body, 204)
      if err != nil
        return nil, err
      end
      
      return err
    end
  
    # Get details on a single project.
    # API Path: /v2/projects/:id
    # == Parameters:
    # id::
    #   id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::ProjectDetails
    #   err
    def self.project_show(id)
      path = sprintf("/v2/projects/%s", id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("GET", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::ProjectDetails.new(JSON.load(rc.body)), err
    end
  
    # Update an existing project.
    # API Path: /v2/projects/:id
    # == Parameters:
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::ProjectUpdateParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::ProjectDetails
    #   err
    def self.project_update(id, params)
      path = sprintf("/v2/projects/%s", id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::ProjectUpdateParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::ProjectUpdateParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("PATCH", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::ProjectDetails.new(JSON.load(rc.body)), err
    end
  
    # List all projects the current user has access to.
    # API Path: /v2/projects
    # == Parameters:
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Project
    #   err
    def self.projects_list(page, per_page)
      path = sprintf("/v2/projects")
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request_paginated("GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
      if err != nil
        return nil, err
      end
      
      return JSON.load(rc.body).map { |item| PhraseApp::ResponseObjects::Project.new(item) }, err
    end
  
    # Show details for current User.
    # API Path: /v2/user
    # == Parameters:
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::User
    #   err
    def self.show_user()
      path = sprintf("/v2/user")
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("GET", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::User.new(JSON.load(rc.body)), err
    end
  
    # Create a new style guide.
    # API Path: /v2/projects/:project_id/styleguides
    # == Parameters:
    # project_id::
    #   project_id
    # params::
    #   Parameters of type PhraseApp::RequestParams::StyleguideCreateParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::StyleguideDetails
    #   err
    def self.styleguide_create(project_id, params)
      path = sprintf("/v2/projects/%s/styleguides", project_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::StyleguideCreateParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::StyleguideCreateParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("POST", path, reqHelper.ctype, reqHelper.body, 201)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::StyleguideDetails.new(JSON.load(rc.body)), err
    end
  
    # Delete an existing style guide.
    # API Path: /v2/projects/:project_id/styleguides/:id
    # == Parameters:
    # project_id::
    #   project_id
    # id::
    #   id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::
    #   err
    def self.styleguide_delete(project_id, id)
      path = sprintf("/v2/projects/%s/styleguides/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("DELETE", path, reqHelper.ctype, reqHelper.body, 204)
      if err != nil
        return nil, err
      end
      
      return err
    end
  
    # Get details on a single style guide.
    # API Path: /v2/projects/:project_id/styleguides/:id
    # == Parameters:
    # project_id::
    #   project_id
    # id::
    #   id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::StyleguideDetails
    #   err
    def self.styleguide_show(project_id, id)
      path = sprintf("/v2/projects/%s/styleguides/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("GET", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::StyleguideDetails.new(JSON.load(rc.body)), err
    end
  
    # Update an existing style guide.
    # API Path: /v2/projects/:project_id/styleguides/:id
    # == Parameters:
    # project_id::
    #   project_id
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::StyleguideUpdateParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::StyleguideDetails
    #   err
    def self.styleguide_update(project_id, id, params)
      path = sprintf("/v2/projects/%s/styleguides/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::StyleguideUpdateParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::StyleguideUpdateParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("PATCH", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::StyleguideDetails.new(JSON.load(rc.body)), err
    end
  
    # List all styleguides for the given project.
    # API Path: /v2/projects/:project_id/styleguides
    # == Parameters:
    # project_id::
    #   project_id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Styleguide
    #   err
    def self.styleguides_list(project_id, page, per_page)
      path = sprintf("/v2/projects/%s/styleguides", project_id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request_paginated("GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
      if err != nil
        return nil, err
      end
      
      return JSON.load(rc.body).map { |item| PhraseApp::ResponseObjects::Styleguide.new(item) }, err
    end
  
    # Create a new tag.
    # API Path: /v2/projects/:project_id/tags
    # == Parameters:
    # project_id::
    #   project_id
    # params::
    #   Parameters of type PhraseApp::RequestParams::TagCreateParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::TagWithStats
    #   err
    def self.tag_create(project_id, params)
      path = sprintf("/v2/projects/%s/tags", project_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::TagCreateParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::TagCreateParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("POST", path, reqHelper.ctype, reqHelper.body, 201)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::TagWithStats.new(JSON.load(rc.body)), err
    end
  
    # Delete an existing tag.
    # API Path: /v2/projects/:project_id/tags/:name
    # == Parameters:
    # project_id::
    #   project_id
    # name::
    #   name
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::
    #   err
    def self.tag_delete(project_id, name)
      path = sprintf("/v2/projects/%s/tags/%s", project_id, name)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("DELETE", path, reqHelper.ctype, reqHelper.body, 204)
      if err != nil
        return nil, err
      end
      
      return err
    end
  
    # Get details and progress information on a single tag for a given project.
    # API Path: /v2/projects/:project_id/tags/:name
    # == Parameters:
    # project_id::
    #   project_id
    # name::
    #   name
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::TagWithStats
    #   err
    def self.tag_show(project_id, name)
      path = sprintf("/v2/projects/%s/tags/%s", project_id, name)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("GET", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::TagWithStats.new(JSON.load(rc.body)), err
    end
  
    # List all tags for the given project.
    # API Path: /v2/projects/:project_id/tags
    # == Parameters:
    # project_id::
    #   project_id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Tag
    #   err
    def self.tags_list(project_id, page, per_page)
      path = sprintf("/v2/projects/%s/tags", project_id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request_paginated("GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
      if err != nil
        return nil, err
      end
      
      return JSON.load(rc.body).map { |item| PhraseApp::ResponseObjects::Tag.new(item) }, err
    end
  
    # Create a translation.
    # API Path: /v2/projects/:project_id/translations
    # == Parameters:
    # project_id::
    #   project_id
    # params::
    #   Parameters of type PhraseApp::RequestParams::TranslationCreateParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::TranslationDetails
    #   err
    def self.translation_create(project_id, params)
      path = sprintf("/v2/projects/%s/translations", project_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::TranslationCreateParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::TranslationCreateParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("POST", path, reqHelper.ctype, reqHelper.body, 201)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::TranslationDetails.new(JSON.load(rc.body)), err
    end
  
    # Get details on a single translation.
    # API Path: /v2/projects/:project_id/translations/:id
    # == Parameters:
    # project_id::
    #   project_id
    # id::
    #   id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::TranslationDetails
    #   err
    def self.translation_show(project_id, id)
      path = sprintf("/v2/projects/%s/translations/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("GET", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::TranslationDetails.new(JSON.load(rc.body)), err
    end
  
    # Update an existing translation.
    # API Path: /v2/projects/:project_id/translations/:id
    # == Parameters:
    # project_id::
    #   project_id
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::TranslationUpdateParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::TranslationDetails
    #   err
    def self.translation_update(project_id, id, params)
      path = sprintf("/v2/projects/%s/translations/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::TranslationUpdateParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::TranslationUpdateParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("PATCH", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::TranslationDetails.new(JSON.load(rc.body)), err
    end
  
    # List translations for a specific key.
    # API Path: /v2/projects/:project_id/keys/:key_id/translations
    # == Parameters:
    # project_id::
    #   project_id
    # key_id::
    #   key_id
    # params::
    #   Parameters of type PhraseApp::RequestParams::TranslationsByKeyParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Translation
    #   err
    def self.translations_by_key(project_id, key_id, page, per_page, params)
      path = sprintf("/v2/projects/%s/keys/%s/translations", project_id, key_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::TranslationsByKeyParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::TranslationsByKeyParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request_paginated("GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
      if err != nil
        return nil, err
      end
      
      return JSON.load(rc.body).map { |item| PhraseApp::ResponseObjects::Translation.new(item) }, err
    end
  
    # List translations for a specific locale.
    # API Path: /v2/projects/:project_id/locales/:locale_id/translations
    # == Parameters:
    # project_id::
    #   project_id
    # locale_id::
    #   locale_id
    # params::
    #   Parameters of type PhraseApp::RequestParams::TranslationsByLocaleParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Translation
    #   err
    def self.translations_by_locale(project_id, locale_id, page, per_page, params)
      path = sprintf("/v2/projects/%s/locales/%s/translations", project_id, locale_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::TranslationsByLocaleParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::TranslationsByLocaleParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request_paginated("GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
      if err != nil
        return nil, err
      end
      
      return JSON.load(rc.body).map { |item| PhraseApp::ResponseObjects::Translation.new(item) }, err
    end
  
    # Exclude translations matching query from locale export.
    # API Path: /v2/projects/:project_id/translations/exclude
    # == Parameters:
    # project_id::
    #   project_id
    # params::
    #   Parameters of type PhraseApp::RequestParams::TranslationsExcludeParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::AffectedCount
    #   err
    def self.translations_exclude(project_id, params)
      path = sprintf("/v2/projects/%s/translations/exclude", project_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::TranslationsExcludeParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::TranslationsExcludeParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("PATCH", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::AffectedCount.new(JSON.load(rc.body)), err
    end
  
    # Include translations matching query in locale export.
    # API Path: /v2/projects/:project_id/translations/include
    # == Parameters:
    # project_id::
    #   project_id
    # params::
    #   Parameters of type PhraseApp::RequestParams::TranslationsIncludeParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::AffectedCount
    #   err
    def self.translations_include(project_id, params)
      path = sprintf("/v2/projects/%s/translations/include", project_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::TranslationsIncludeParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::TranslationsIncludeParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("PATCH", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::AffectedCount.new(JSON.load(rc.body)), err
    end
  
    # List translations for the given project. Alternatively, POST request to /search
    # API Path: /v2/projects/:project_id/translations
    # == Parameters:
    # project_id::
    #   project_id
    # params::
    #   Parameters of type PhraseApp::RequestParams::TranslationsListParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Translation
    #   err
    def self.translations_list(project_id, page, per_page, params)
      path = sprintf("/v2/projects/%s/translations", project_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::TranslationsListParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::TranslationsListParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request_paginated("GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
      if err != nil
        return nil, err
      end
      
      return JSON.load(rc.body).map { |item| PhraseApp::ResponseObjects::Translation.new(item) }, err
    end
  
    # List translations for the given project if you exceed GET request limitations on translations list.
    # API Path: /v2/projects/:project_id/translations/search
    # == Parameters:
    # project_id::
    #   project_id
    # params::
    #   Parameters of type PhraseApp::RequestParams::TranslationsSearchParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Translation
    #   err
    def self.translations_search(project_id, page, per_page, params)
      path = sprintf("/v2/projects/%s/translations/search", project_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::TranslationsSearchParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::TranslationsSearchParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request_paginated("POST", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
      if err != nil
        return nil, err
      end
      
      return JSON.load(rc.body).map { |item| PhraseApp::ResponseObjects::Translation.new(item) }, err
    end
  
    # Mark translations matching query as unverified.
    # API Path: /v2/projects/:project_id/translations/unverify
    # == Parameters:
    # project_id::
    #   project_id
    # params::
    #   Parameters of type PhraseApp::RequestParams::TranslationsUnverifyParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::AffectedCount
    #   err
    def self.translations_unverify(project_id, params)
      path = sprintf("/v2/projects/%s/translations/unverify", project_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::TranslationsUnverifyParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::TranslationsUnverifyParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("PATCH", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::AffectedCount.new(JSON.load(rc.body)), err
    end
  
    # Verify translations matching query.
    # API Path: /v2/projects/:project_id/translations/verify
    # == Parameters:
    # project_id::
    #   project_id
    # params::
    #   Parameters of type PhraseApp::RequestParams::TranslationsVerifyParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::AffectedCount
    #   err
    def self.translations_verify(project_id, params)
      path = sprintf("/v2/projects/%s/translations/verify", project_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::TranslationsVerifyParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::TranslationsVerifyParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("PATCH", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::AffectedCount.new(JSON.load(rc.body)), err
    end
  
    # Upload a new language file. Creates necessary resources in your project.
    # API Path: /v2/projects/:project_id/uploads
    # == Parameters:
    # project_id::
    #   project_id
    # params::
    #   Parameters of type PhraseApp::RequestParams::UploadCreateParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::LocaleFileImportWithSummary
    #   err
    def self.upload_create(project_id, params)
      path = sprintf("/v2/projects/%s/uploads", project_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::UploadCreateParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::UploadCreateParams")
        end
      end
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

      if params.file_format != nil
        data_hash["file_format"] = params.file_format
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

  
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("POST", path, reqHelper.ctype, reqHelper.body, 201)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::LocaleFileImportWithSummary.new(JSON.load(rc.body)), err
    end
  
    # View details and summary for a single upload.
    # API Path: /v2/projects/:project_id/uploads/:id
    # == Parameters:
    # project_id::
    #   project_id
    # id::
    #   id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::LocaleFileImportWithSummary
    #   err
    def self.upload_show(project_id, id)
      path = sprintf("/v2/projects/%s/uploads/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("GET", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::LocaleFileImportWithSummary.new(JSON.load(rc.body)), err
    end
  
    # Get details on a single version.
    # API Path: /v2/projects/:project_id/translations/:translation_id/versions/:id
    # == Parameters:
    # project_id::
    #   project_id
    # translation_id::
    #   translation_id
    # id::
    #   id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::TranslationVersionWithUser
    #   err
    def self.version_show(project_id, translation_id, id)
      path = sprintf("/v2/projects/%s/translations/%s/versions/%s", project_id, translation_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request("GET", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::TranslationVersionWithUser.new(JSON.load(rc.body)), err
    end
  
    # List all versions for the given translation.
    # API Path: /v2/projects/:project_id/translations/:translation_id/versions
    # == Parameters:
    # project_id::
    #   project_id
    # translation_id::
    #   translation_id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::TranslationVersion
    #   err
    def self.versions_list(project_id, translation_id, page, per_page)
      path = sprintf("/v2/projects/%s/translations/%s/versions", project_id, translation_id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request_paginated("GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
      if err != nil
        return nil, err
      end
      
      return JSON.load(rc.body).map { |item| PhraseApp::ResponseObjects::TranslationVersion.new(item) }, err
    end
  
  end

end






