
# revision_docs:d104be46bd36f220e2df166ba7d3adb7ee9b1005
# revision_generator:HEAD/2016-04-20T153217/sacry1

require 'ostruct'
require 'net/https'
require 'uri'
require 'cgi'
require 'json'
require 'date'
require 'phraseapp-ruby/auth'
require 'phraseapp-ruby/request_handler'
require 'phraseapp-ruby/version'

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
    class Account < ::OpenStruct
      #created_at, id, name, updated_at, 
      def initialize(hash)
        super(hash)
        PhraseApp.handle_times(self)
      end
    end

    class AccountPreview < ::OpenStruct
      #created_at, id, name, updated_at, 
      def initialize(hash)
        super(hash)
        PhraseApp.handle_times(self)
      end
    end

    class AffectedCount < ::OpenStruct
      #records_affected, 
      def initialize(hash)
        super(hash)
        PhraseApp.handle_times(self)
      end
    end

    class AffectedResources < ::OpenStruct
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

    class Format < ::OpenStruct
      #api_name, default_encoding, default_file, description, exportable, extension, importable, includes_locale_information, name, renders_default_locale, 
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
      #account, created_at, id, main_format, name, updated_at, 
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
      #id, title, 
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

    class Upload < ::OpenStruct
      #created_at, filename, format, id, state, summary, updated_at, 
      def initialize(hash)
        super(hash)
        PhraseApp.handle_times(self)
      end
    end

    class User < ::OpenStruct
      #created_at, email, id, name, position, updated_at, username, 
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

    class Webhook < ::OpenStruct
      #active, callback_url, created_at, description, events, id, updated_at, 
      def initialize(hash)
        super(hash)
        PhraseApp.handle_times(self)
      end
    end

  
end


module RequestParams
  # AuthorizationParams
  # == Parameters:
  # expires_at::
  #   Expiration date for the authorization token. Null means no expiration date (default).
  # note::
  #   A note to help you remember what the access is used for.
  # scopes::
  #   A list of scopes that the access can be used for.
  class AuthorizationParams
    attr_accessor :expires_at, :note, :scopes 

    def expires_at=(val)
      @expires_at = DateTime.parse(val)
    end

    def note=(val)
      @note = val
    end

    def scopes=(val)
      @scopes = val.split(',')
    end

    def validate
      if @note == nil || @note == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"note\" of \"AuthorizationParams\" not set")
      end
    end

    def to_h
      { expires_at: @expires_at, note: @note, scopes: @scopes }
    end

  end
end


module RequestParams
  # BlacklistedKeyParams
  # == Parameters:
  # name::
  #   Blacklisted key name
  class BlacklistedKeyParams
    attr_accessor :name 

    def name=(val)
      @name = val
    end

    def validate
      if @name == nil || @name == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"name\" of \"BlacklistedKeyParams\" not set")
      end
    end

    def to_h
      { name: @name }
    end

  end
end


module RequestParams
  # CommentParams
  # == Parameters:
  # message::
  #   Comment message
  class CommentParams
    attr_accessor :message 

    def message=(val)
      @message = val
    end

    def validate
      if @message == nil || @message == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"message\" of \"CommentParams\" not set")
      end
    end

    def to_h
      { message: @message }
    end

  end
end


module RequestParams
  # TranslationKeyParams
  # == Parameters:
  # data_type::
  #   Type of the key. Can be one of the following: string, number, boolean, number, array.
  # description::
  #   Key description (usually includes contextual information for translators)
  # localized_format_key::
  #   NSStringLocalizedFormatKey attribute. Used in .stringsdict format.
  # localized_format_string::
  #   NSStringLocalizedFormatKey attribute. Used in .stringsdict format.
  # max_characters_allowed::
  #   Max. number of characters translations for this key can have.
  # name::
  #   Key name
  # name_plural::
  #   Plural name for the key (used in some file formats, e.g. Gettext)
  # original_file::
  #   Original file attribute. Used in some formats, e.g. XLIFF.
  # plural::
  #   Indicates whether key supports pluralization
  # remove_screenshot::
  #   Indicates whether the screenshot will be deleted.
  # screenshot::
  #   Screenshot/image for the key.
  # tags::
  #   List of tags separated by comma to be associated with the key.
  # unformatted::
  #   Indicates whether the key should be exported as "unformatted". Supported by Android XML and other formats.
  # xml_space_preserve::
  #   Indicates whether the key should be exported with "xml:space=preserve". Supported by several XML-based formats.
  class TranslationKeyParams
    attr_accessor :data_type, :description, :localized_format_key, :localized_format_string, :max_characters_allowed, :name, :name_plural, :original_file, :plural, :remove_screenshot, :screenshot, :tags, :unformatted, :xml_space_preserve 

    def data_type=(val)
      @data_type = val
    end

    def description=(val)
      @description = val
    end

    def localized_format_key=(val)
      @localized_format_key = val
    end

    def localized_format_string=(val)
      @localized_format_string = val
    end

    def max_characters_allowed=(val)
      @max_characters_allowed = val.to_i
    end

    def name=(val)
      @name = val
    end

    def name_plural=(val)
      @name_plural = val
    end

    def original_file=(val)
      @original_file = val
    end

    def plural=(val)
      if val.is_a?(TrueClass)
        @plural = true
      elsif val.is_a?(FalseClass) #ignore
        @plural = b
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def remove_screenshot=(val)
      if val.is_a?(TrueClass)
        @remove_screenshot = true
      elsif val.is_a?(FalseClass) #ignore
        @remove_screenshot = b
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def screenshot=(val)
      @screenshot = val
    end

    def tags=(val)
      @tags = val
    end

    def unformatted=(val)
      if val.is_a?(TrueClass)
        @unformatted = true
      elsif val.is_a?(FalseClass) #ignore
        @unformatted = b
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def xml_space_preserve=(val)
      if val.is_a?(TrueClass)
        @xml_space_preserve = true
      elsif val.is_a?(FalseClass) #ignore
        @xml_space_preserve = b
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def validate
      if @name == nil || @name == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"name\" of \"TranslationKeyParams\" not set")
      end
    end

    def to_h
      { data_type: @data_type, description: @description, localized_format_key: @localized_format_key, localized_format_string: @localized_format_string, max_characters_allowed: @max_characters_allowed, name: @name, name_plural: @name_plural, original_file: @original_file, plural: @plural, remove_screenshot: @remove_screenshot, screenshot: @screenshot, tags: @tags, unformatted: @unformatted, xml_space_preserve: @xml_space_preserve }
    end

  end
end


module RequestParams
  # LocaleParams
  # == Parameters:
  # code::
  #   Locale ISO code
  # default::
  #   Indicates whether locale is the default locale. If set to true, the previous default locale the project is no longer the default locale.
  # main::
  #   Indicates whether locale is a main locale.
  # name::
  #   Locale name
  # rtl::
  #   Indicates whether locale is a RTL (Right-to-Left) locale.
  # source_locale_id::
  #   Source locale. Can be the name or public id of the locale. Preferred is the public id.
  class LocaleParams
    attr_accessor :code, :default, :main, :name, :rtl, :source_locale_id 

    def code=(val)
      @code = val
    end

    def default=(val)
      if val.is_a?(TrueClass)
        @default = true
      elsif val.is_a?(FalseClass) #ignore
        @default = b
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def main=(val)
      if val.is_a?(TrueClass)
        @main = true
      elsif val.is_a?(FalseClass) #ignore
        @main = b
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def name=(val)
      @name = val
    end

    def rtl=(val)
      if val.is_a?(TrueClass)
        @rtl = true
      elsif val.is_a?(FalseClass) #ignore
        @rtl = b
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def source_locale_id=(val)
      @source_locale_id = val
    end

    def validate
      if @code == nil || @code == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"code\" of \"LocaleParams\" not set")
      endif @name == nil || @name == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"name\" of \"LocaleParams\" not set")
      end
    end

    def to_h
      { code: @code, default: @default, main: @main, name: @name, rtl: @rtl, source_locale_id: @source_locale_id }
    end

  end
end


module RequestParams
  # TranslationOrderParams
  # == Parameters:
  # category::
  #   Category to use (required for orders processed by TextMaster). <a href="#categories">Category List</a>
  # include_untranslated_keys::
  #   Order translations for keys with untranslated content in the selected target locales.
  # include_unverified_translations::
  #   Order translations for keys with unverified content in the selected target locales.
  # lsp::
  #   Name of the LSP that should process this order. Can be one of gengo, textmaster.
  # message::
  #   Message that is displayed to the translators for description.
  # priority::
  #   Indicates whether the priority option should be ordered which decreases turnaround time by 30%. Available only for orders processed by TextMaster.
  # quality::
  #   Extra proofreading option to ensure consistency in vocabulary and style. Only available for orders processed by TextMaster.
  # source_locale_id::
  #   Source locale for the order. Can be the name or public id of the source locale. Preferred is the public id.
  # styleguide_id::
  #   Style guide for translators to be sent with the order.
  # tag::
  #   Tag you want to order translations for.
  # target_locale_ids::
  #   List of target locales you want the source content translate to. Can be the name or public id of the target locales. Preferred is the public id.
  # translation_type::
  #   Name of the quality level, availability depends on the LSP. Can be one of:  standard, pro (for orders processed by Gengo) and one of regular, premium, enterprise (for orders processed by TextMaster)
  # unverify_translations_upon_delivery::
  #   Unverify translations upon delivery.
  class TranslationOrderParams
    attr_accessor :category, :include_untranslated_keys, :include_unverified_translations, :lsp, :message, :priority, :quality, :source_locale_id, :styleguide_id, :tag, :target_locale_ids, :translation_type, :unverify_translations_upon_delivery 

    def category=(val)
      @category = val
    end

    def include_untranslated_keys=(val)
      if val.is_a?(TrueClass)
        @include_untranslated_keys = true
      elsif val.is_a?(FalseClass) #ignore
        @include_untranslated_keys = b
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def include_unverified_translations=(val)
      if val.is_a?(TrueClass)
        @include_unverified_translations = true
      elsif val.is_a?(FalseClass) #ignore
        @include_unverified_translations = b
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def lsp=(val)
      @lsp = val
    end

    def message=(val)
      @message = val
    end

    def priority=(val)
      if val.is_a?(TrueClass)
        @priority = true
      elsif val.is_a?(FalseClass) #ignore
        @priority = b
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def quality=(val)
      if val.is_a?(TrueClass)
        @quality = true
      elsif val.is_a?(FalseClass) #ignore
        @quality = b
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def source_locale_id=(val)
      @source_locale_id = val
    end

    def styleguide_id=(val)
      @styleguide_id = val
    end

    def tag=(val)
      @tag = val
    end

    def target_locale_ids=(val)
      @target_locale_ids = val.split(',')
    end

    def translation_type=(val)
      @translation_type = val
    end

    def unverify_translations_upon_delivery=(val)
      if val.is_a?(TrueClass)
        @unverify_translations_upon_delivery = true
      elsif val.is_a?(FalseClass) #ignore
        @unverify_translations_upon_delivery = b
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def validate
      if @category == nil || @category == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"category\" of \"TranslationOrderParams\" not set")
      endif @lsp == nil || @lsp == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"lsp\" of \"TranslationOrderParams\" not set")
      endif @source_locale_id == nil
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"source_locale_id\" of \"TranslationOrderParams\" not set")
      endif @target_locale_ids == nil
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"target_locale_ids\" of \"TranslationOrderParams\" not set")
      endif @translation_type == nil || @translation_type == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"translation_type\" of \"TranslationOrderParams\" not set")
      end
    end

    def to_h
      { category: @category, include_untranslated_keys: @include_untranslated_keys, include_unverified_translations: @include_unverified_translations, lsp: @lsp, message: @message, priority: @priority, quality: @quality, source_locale_id: @source_locale_id, styleguide_id: @styleguide_id, tag: @tag, target_locale_ids: @target_locale_ids, translation_type: @translation_type, unverify_translations_upon_delivery: @unverify_translations_upon_delivery }
    end

  end
end


module RequestParams
  # ProjectParams
  # == Parameters:
  # account_id::
  #   Account ID to specify the actual account the project should be created in. Required if the requesting user is a member of multiple accounts.
  # main_format::
  #   Main file format specified by its API Extension name. Used for locale downloads if no format is specified. For API Extension names of available file formats see <a href="guides/formats/">Format Guide</a> or our <a href="https://api.phraseapp.com/api/v2/formats">Formats API Endpoint</a>.
  # name::
  #   Name of the project
  # shares_translation_memory::
  #   Indicates whether the project should share the account's translation memory
  class ProjectParams
    attr_accessor :account_id, :main_format, :name, :shares_translation_memory 

    def account_id=(val)
      @account_id = val
    end

    def main_format=(val)
      @main_format = val
    end

    def name=(val)
      @name = val
    end

    def shares_translation_memory=(val)
      if val.is_a?(TrueClass)
        @shares_translation_memory = true
      elsif val.is_a?(FalseClass) #ignore
        @shares_translation_memory = b
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def validate
      if @name == nil || @name == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"name\" of \"ProjectParams\" not set")
      end
    end

    def to_h
      { account_id: @account_id, main_format: @main_format, name: @name, shares_translation_memory: @shares_translation_memory }
    end

  end
end


module RequestParams
  # StyleguideParams
  # == Parameters:
  # audience::
  #   Audience description
  # business::
  #   Description of the business
  # company_branding::
  #   Company branding to remain consistent.
  # formatting::
  #   Formatting requirements and character limitations.
  # glossary_terms::
  #   List of terms and/or phrases that need to be translated consistently.
  # grammar_consistency::
  #   Formal or informal pronouns, consistent conjugation, grammatical gender
  # grammatical_person::
  #   Can be one of: not_specified, first_person_singular, second_person_singular, third_person_singular_masculine, third_person_singular_feminine, third_person_singular_neuter, first_person_plural, second_person_plural, third_person_plural.
  # literal_translation::
  #   Can be one of: Cultural/Conversational, Literal, Neutral.
  # overall_tone::
  #   Tone requirement descriptions
  # samples::
  #   Provide links to sample product pages, FAQ pages, etc. to give the translator a point of reference. You can also provide past translations. Even snippets or short paragraphs are helpful for maintaining consistency.
  # target_audience::
  #   Can be one of: not_specified, children, teenager, young_adults, adults, old_adults.
  # title::
  #   Style guide title
  # vocabulary_type::
  #   Can be one of: not_specified, popular, technical, fictional.
  class StyleguideParams
    attr_accessor :audience, :business, :company_branding, :formatting, :glossary_terms, :grammar_consistency, :grammatical_person, :literal_translation, :overall_tone, :samples, :target_audience, :title, :vocabulary_type 

    def audience=(val)
      @audience = val
    end

    def business=(val)
      @business = val
    end

    def company_branding=(val)
      @company_branding = val
    end

    def formatting=(val)
      @formatting = val
    end

    def glossary_terms=(val)
      @glossary_terms = val
    end

    def grammar_consistency=(val)
      @grammar_consistency = val
    end

    def grammatical_person=(val)
      @grammatical_person = val
    end

    def literal_translation=(val)
      @literal_translation = val
    end

    def overall_tone=(val)
      @overall_tone = val
    end

    def samples=(val)
      @samples = val
    end

    def target_audience=(val)
      @target_audience = val
    end

    def title=(val)
      @title = val
    end

    def vocabulary_type=(val)
      @vocabulary_type = val
    end

    def validate
      if @title == nil || @title == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"title\" of \"StyleguideParams\" not set")
      end
    end

    def to_h
      { audience: @audience, business: @business, company_branding: @company_branding, formatting: @formatting, glossary_terms: @glossary_terms, grammar_consistency: @grammar_consistency, grammatical_person: @grammatical_person, literal_translation: @literal_translation, overall_tone: @overall_tone, samples: @samples, target_audience: @target_audience, title: @title, vocabulary_type: @vocabulary_type }
    end

  end
end


module RequestParams
  # TagParams
  # == Parameters:
  # name::
  #   Name of the tag
  class TagParams
    attr_accessor :name 

    def name=(val)
      @name = val
    end

    def validate
      if @name == nil || @name == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"name\" of \"TagParams\" not set")
      end
    end

    def to_h
      { name: @name }
    end

  end
end


module RequestParams
  # TranslationParams
  # == Parameters:
  # content::
  #   Translation content
  # excluded::
  #   Indicates whether translation is excluded.
  # key_id::
  #   Key
  # locale_id::
  #   Locale. Can be the name or public id of the locale. Preferred is the public id.
  # plural_suffix::
  #   Plural suffix. Can be one of: zero, one, two, few, many, other.
  # unverified::
  #   Indicates whether translation is unverified.
  class TranslationParams
    attr_accessor :content, :excluded, :key_id, :locale_id, :plural_suffix, :unverified 

    def content=(val)
      @content = val
    end

    def excluded=(val)
      if val.is_a?(TrueClass)
        @excluded = true
      elsif val.is_a?(FalseClass) #ignore
        @excluded = b
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def key_id=(val)
      @key_id = val
    end

    def locale_id=(val)
      @locale_id = val
    end

    def plural_suffix=(val)
      @plural_suffix = val
    end

    def unverified=(val)
      if val.is_a?(TrueClass)
        @unverified = true
      elsif val.is_a?(FalseClass) #ignore
        @unverified = b
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def validate
      if @content == nil || @content == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"content\" of \"TranslationParams\" not set")
      endif @key_id == nil
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"key_id\" of \"TranslationParams\" not set")
      endif @locale_id == nil
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"locale_id\" of \"TranslationParams\" not set")
      end
    end

    def to_h
      { content: @content, excluded: @excluded, key_id: @key_id, locale_id: @locale_id, plural_suffix: @plural_suffix, unverified: @unverified }
    end

  end
end


module RequestParams
  # UploadParams
  # == Parameters:
  # convert_emoji::
  #   Indicates whether the file contains Emoji symbols that should be converted. <a href="guides/working-with-phraseapp/emoji-support/">Working with Emojis</a>.
  # file::
  #   File to be imported
  # file_encoding::
  #   Enforces a specific encoding on the file contents. Valid options are "UTF-8", "UTF-16" and "ISO-8859-1".
  # file_format::
  #   File format. Auto-detected when possible and not specified.
  # format_options::
  #   Additional options available for specific formats. See our format guide for complete list.
  # locale_id::
  #   Locale of the file's content. Can be the name or public id of the locale. Preferred is the public id.
  # skip_unverification::
  #   Indicates whether the upload should unverify updated translations.
  # skip_upload_tags::
  #   Indicates whether the upload should not create upload tags.
  # tags::
  #   List of tags separated by comma to be associated with the new keys contained in the upload.
  # update_translations::
  #   Indicates whether existing translations should be updated with the file content.
  class UploadParams
    attr_accessor :convert_emoji, :file, :file_encoding, :file_format, :format_options, :locale_id, :skip_unverification, :skip_upload_tags, :tags, :update_translations 

    def convert_emoji=(val)
      if val.is_a?(TrueClass)
        @convert_emoji = true
      elsif val.is_a?(FalseClass) #ignore
        @convert_emoji = b
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def file=(val)
      @file = val
    end

    def file_encoding=(val)
      @file_encoding = val
    end

    def file_format=(val)
      @file_format = val
    end

    def format_options=(val)
      @format_options = JSON.load(val)
    end

    def locale_id=(val)
      @locale_id = val
    end

    def skip_unverification=(val)
      if val.is_a?(TrueClass)
        @skip_unverification = true
      elsif val.is_a?(FalseClass) #ignore
        @skip_unverification = b
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def skip_upload_tags=(val)
      if val.is_a?(TrueClass)
        @skip_upload_tags = true
      elsif val.is_a?(FalseClass) #ignore
        @skip_upload_tags = b
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def tags=(val)
      @tags = val
    end

    def update_translations=(val)
      if val.is_a?(TrueClass)
        @update_translations = true
      elsif val.is_a?(FalseClass) #ignore
        @update_translations = b
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def validate
      if @file == nil
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"file\" of \"UploadParams\" not set")
      end
    end

    def to_h
      { convert_emoji: @convert_emoji, file: @file, file_encoding: @file_encoding, file_format: @file_format, format_options: @format_options, locale_id: @locale_id, skip_unverification: @skip_unverification, skip_upload_tags: @skip_upload_tags, tags: @tags, update_translations: @update_translations }
    end

  end
end


module RequestParams
  # WebhookParams
  # == Parameters:
  # active::
  #   Whether webhook is active or inactive
  # callback_url::
  #   Callback URL to send requests to
  # description::
  #   Webhook description
  # events::
  #   List of event names to trigger the webhook (separated by comma)
  class WebhookParams
    attr_accessor :active, :callback_url, :description, :events 

    def active=(val)
      if val.is_a?(TrueClass)
        @active = true
      elsif val.is_a?(FalseClass) #ignore
        @active = b
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def callback_url=(val)
      @callback_url = val
    end

    def description=(val)
      @description = val
    end

    def events=(val)
      @events = val
    end

    def validate
      if @callback_url == nil || @callback_url == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"callback_url\" of \"WebhookParams\" not set")
      endif @events == nil || @events == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"events\" of \"WebhookParams\" not set")
      end
    end

    def to_h
      { active: @active, callback_url: @callback_url, description: @description, events: @events }
    end

  end
end

end


module PhraseApp
  MULTIPART_BOUNDARY = "{PHRASE!!EOF}"

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
  # KeysDeleteParams
  # == Parameters:
  # locale_id::
  #   Locale used to determine the translation state of a key when filtering for untranslated or translated keys.
  # q::
  #   q_description_placeholder
  class KeysDeleteParams
    attr_accessor :locale_id, :q 

    def locale_id=(val)
      @locale_id = val
    end

    def q=(val)
      @q = val
    end

    def validate
      
    end

    def to_h
      { locale_id: @locale_id, q: @q }
    end

  end
end


module RequestParams
  # KeysListParams
  # == Parameters:
  # locale_id::
  #   Locale used to determine the translation state of a key when filtering for untranslated or translated keys.
  # order::
  #   Order direction. Can be one of: asc, desc.
  # q::
  #   q_description_placeholder
  # sort::
  #   Sort by field. Can be one of: name, created_at, updated_at.
  class KeysListParams
    attr_accessor :locale_id, :order, :q, :sort 

    def locale_id=(val)
      @locale_id = val
    end

    def order=(val)
      @order = val
    end

    def q=(val)
      @q = val
    end

    def sort=(val)
      @sort = val
    end

    def validate
      
    end

    def to_h
      { locale_id: @locale_id, order: @order, q: @q, sort: @sort }
    end

  end
end


module RequestParams
  # KeysSearchParams
  # == Parameters:
  # locale_id::
  #   Locale used to determine the translation state of a key when filtering for untranslated or translated keys.
  # order::
  #   Order direction. Can be one of: asc, desc.
  # q::
  #   q_description_placeholder
  # sort::
  #   Sort by field. Can be one of: name, created_at, updated_at.
  class KeysSearchParams
    attr_accessor :locale_id, :order, :q, :sort 

    def locale_id=(val)
      @locale_id = val
    end

    def order=(val)
      @order = val
    end

    def q=(val)
      @q = val
    end

    def sort=(val)
      @sort = val
    end

    def validate
      
    end

    def to_h
      { locale_id: @locale_id, order: @order, q: @q, sort: @sort }
    end

  end
end


module RequestParams
  # KeysTagParams
  # == Parameters:
  # locale_id::
  #   Locale used to determine the translation state of a key when filtering for untranslated or translated keys.
  # q::
  #   q_description_placeholder
  # tags::
  #   Tag or comma-separated list of tags to add to the matching collection of keys
  class KeysTagParams
    attr_accessor :locale_id, :q, :tags 

    def locale_id=(val)
      @locale_id = val
    end

    def q=(val)
      @q = val
    end

    def tags=(val)
      @tags = val
    end

    def validate
      if @tags == nil || @tags == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"tags\" of \"keys_tagParams\" not set")
      end
    end

    def to_h
      { locale_id: @locale_id, q: @q, tags: @tags }
    end

  end
end


module RequestParams
  # KeysUntagParams
  # == Parameters:
  # locale_id::
  #   Locale used to determine the translation state of a key when filtering for untranslated or translated keys.
  # q::
  #   q_description_placeholder
  # tags::
  #   Tag or comma-separated list of tags to add to the matching collection of keys
  class KeysUntagParams
    attr_accessor :locale_id, :q, :tags 

    def locale_id=(val)
      @locale_id = val
    end

    def q=(val)
      @q = val
    end

    def tags=(val)
      @tags = val
    end

    def validate
      if @tags == nil || @tags == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"tags\" of \"keys_untagParams\" not set")
      end
    end

    def to_h
      { locale_id: @locale_id, q: @q, tags: @tags }
    end

  end
end


module RequestParams
  # LocaleDownloadParams
  # == Parameters:
  # convert_emoji::
  #   Indicates whether Emoji symbols should be converted to actual Emojis. <a href="guides/working-with-phraseapp/emoji-support/">Working with Emojis</a>.
  # encoding::
  #   Enforces a specific encoding on the file contents. Valid options are "UTF-8", "UTF-16" and "ISO-8859-1".
  # fallback_locale_id::
  #   If a key has no translation in the locale being downloaded the translation in the fallback locale will be used. Provide the public ID of the locale that should be used as the fallback. Requires include_empty_translations to be set to <code>true</code>.
  # file_format::
  #   File format name. See the format guide for all supported file formats.
  # format_options::
  #   Additional formatting and render options. See the <a href="guides/formats">format guide</a> for a list of options available for each format. Specify format options like this: <code>...&format_options[foo]=bar</code>
  # include_empty_translations::
  #   Indicates whether keys without translations should be included in the output as well.
  # keep_notranslate_tags::
  #   Indicates whether [NOTRANSLATE] tags should be kept.
  # skip_unverified_translations::
  #   Indicates whether the locale file should skip all unverified translations.
  # tag::
  #   Limit result to keys tagged with the given tag (identified by its name).
  class LocaleDownloadParams
    attr_accessor :convert_emoji, :encoding, :fallback_locale_id, :file_format, :format_options, :include_empty_translations, :keep_notranslate_tags, :skip_unverified_translations, :tag 

    def convert_emoji=(val)
      if val.is_a?(TrueClass)
        @convert_emoji = true
      elsif val.is_a?(FalseClass) #ignore
        @convert_emoji = b
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def encoding=(val)
      @encoding = val
    end

    def fallback_locale_id=(val)
      @fallback_locale_id = val
    end

    def file_format=(val)
      @file_format = val
    end

    def format_options=(val)
      @format_options = JSON.load(val)
    end

    def include_empty_translations=(val)
      if val.is_a?(TrueClass)
        @include_empty_translations = true
      elsif val.is_a?(FalseClass) #ignore
        @include_empty_translations = b
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def keep_notranslate_tags=(val)
      if val.is_a?(TrueClass)
        @keep_notranslate_tags = true
      elsif val.is_a?(FalseClass) #ignore
        @keep_notranslate_tags = b
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def skip_unverified_translations=(val)
      if val.is_a?(TrueClass)
        @skip_unverified_translations = true
      elsif val.is_a?(FalseClass) #ignore
        @skip_unverified_translations = b
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def tag=(val)
      @tag = val
    end

    def validate
      if @file_format == nil || @file_format == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"file_format\" of \"locale_downloadParams\" not set")
      end
    end

    def to_h
      { convert_emoji: @convert_emoji, encoding: @encoding, fallback_locale_id: @fallback_locale_id, file_format: @file_format, format_options: @format_options, include_empty_translations: @include_empty_translations, keep_notranslate_tags: @keep_notranslate_tags, skip_unverified_translations: @skip_unverified_translations, tag: @tag }
    end

  end
end


module RequestParams
  # TranslationUpdateParams
  # == Parameters:
  # content::
  #   Translation content
  # excluded::
  #   Indicates whether translation is excluded.
  # plural_suffix::
  #   Plural suffix. Can be one of: zero, one, two, few, many, other.
  # unverified::
  #   Indicates whether translation is unverified.
  class TranslationUpdateParams
    attr_accessor :content, :excluded, :plural_suffix, :unverified 

    def content=(val)
      @content = val
    end

    def excluded=(val)
      if val.is_a?(TrueClass)
        @excluded = true
      elsif val.is_a?(FalseClass) #ignore
        @excluded = b
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def plural_suffix=(val)
      @plural_suffix = val
    end

    def unverified=(val)
      if val.is_a?(TrueClass)
        @unverified = true
      elsif val.is_a?(FalseClass) #ignore
        @unverified = b
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def validate
      if @content == nil || @content == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"content\" of \"translation_updateParams\" not set")
      end
    end

    def to_h
      { content: @content, excluded: @excluded, plural_suffix: @plural_suffix, unverified: @unverified }
    end

  end
end


module RequestParams
  # TranslationsByKeyParams
  # == Parameters:
  # order::
  #   Order direction. Can be one of: asc, desc.
  # q::
  #   q_description_placeholder
  # sort::
  #   Sort criteria. Can be one of: key_name, created_at, updated_at.
  class TranslationsByKeyParams
    attr_accessor :order, :q, :sort 

    def order=(val)
      @order = val
    end

    def q=(val)
      @q = val
    end

    def sort=(val)
      @sort = val
    end

    def validate
      
    end

    def to_h
      { order: @order, q: @q, sort: @sort }
    end

  end
end


module RequestParams
  # TranslationsByLocaleParams
  # == Parameters:
  # order::
  #   Order direction. Can be one of: asc, desc.
  # q::
  #   q_description_placeholder
  # sort::
  #   Sort criteria. Can be one of: key_name, created_at, updated_at.
  class TranslationsByLocaleParams
    attr_accessor :order, :q, :sort 

    def order=(val)
      @order = val
    end

    def q=(val)
      @q = val
    end

    def sort=(val)
      @sort = val
    end

    def validate
      
    end

    def to_h
      { order: @order, q: @q, sort: @sort }
    end

  end
end


module RequestParams
  # TranslationsExcludeParams
  # == Parameters:
  # order::
  #   Order direction. Can be one of: asc, desc.
  # q::
  #   q_description_placeholder
  # sort::
  #   Sort criteria. Can be one of: key_name, created_at, updated_at.
  class TranslationsExcludeParams
    attr_accessor :order, :q, :sort 

    def order=(val)
      @order = val
    end

    def q=(val)
      @q = val
    end

    def sort=(val)
      @sort = val
    end

    def validate
      
    end

    def to_h
      { order: @order, q: @q, sort: @sort }
    end

  end
end


module RequestParams
  # TranslationsIncludeParams
  # == Parameters:
  # order::
  #   Order direction. Can be one of: asc, desc.
  # q::
  #   q_description_placeholder
  # sort::
  #   Sort criteria. Can be one of: key_name, created_at, updated_at.
  class TranslationsIncludeParams
    attr_accessor :order, :q, :sort 

    def order=(val)
      @order = val
    end

    def q=(val)
      @q = val
    end

    def sort=(val)
      @sort = val
    end

    def validate
      
    end

    def to_h
      { order: @order, q: @q, sort: @sort }
    end

  end
end


module RequestParams
  # TranslationsListParams
  # == Parameters:
  # order::
  #   Order direction. Can be one of: asc, desc.
  # q::
  #   q_description_placeholder
  # sort::
  #   Sort criteria. Can be one of: key_name, created_at, updated_at.
  class TranslationsListParams
    attr_accessor :order, :q, :sort 

    def order=(val)
      @order = val
    end

    def q=(val)
      @q = val
    end

    def sort=(val)
      @sort = val
    end

    def validate
      
    end

    def to_h
      { order: @order, q: @q, sort: @sort }
    end

  end
end


module RequestParams
  # TranslationsSearchParams
  # == Parameters:
  # order::
  #   Order direction. Can be one of: asc, desc.
  # q::
  #   q_description_placeholder
  # sort::
  #   Sort criteria. Can be one of: key_name, created_at, updated_at.
  class TranslationsSearchParams
    attr_accessor :order, :q, :sort 

    def order=(val)
      @order = val
    end

    def q=(val)
      @q = val
    end

    def sort=(val)
      @sort = val
    end

    def validate
      
    end

    def to_h
      { order: @order, q: @q, sort: @sort }
    end

  end
end


module RequestParams
  # TranslationsUnverifyParams
  # == Parameters:
  # order::
  #   Order direction. Can be one of: asc, desc.
  # q::
  #   q_description_placeholder
  # sort::
  #   Sort criteria. Can be one of: key_name, created_at, updated_at.
  class TranslationsUnverifyParams
    attr_accessor :order, :q, :sort 

    def order=(val)
      @order = val
    end

    def q=(val)
      @q = val
    end

    def sort=(val)
      @sort = val
    end

    def validate
      
    end

    def to_h
      { order: @order, q: @q, sort: @sort }
    end

  end
end


module RequestParams
  # TranslationsVerifyParams
  # == Parameters:
  # order::
  #   Order direction. Can be one of: asc, desc.
  # q::
  #   q_description_placeholder
  # sort::
  #   Sort criteria. Can be one of: key_name, created_at, updated_at.
  class TranslationsVerifyParams
    attr_accessor :order, :q, :sort 

    def order=(val)
      @order = val
    end

    def q=(val)
      @q = val
    end

    def sort=(val)
      @sort = val
    end

    def validate
      
    end

    def to_h
      { order: @order, q: @q, sort: @sort }
    end

  end
end


  # Usage example:
  #
  # Require the gem
  #   require 'phraseapp-ruby'
  # Setup Credentials for Authentication
  #   credentials = PhraseApp::Auth::Credentials.new(token: "YOUR_ACCESS_TOKEN")
  # Create a client
  #   client = PhraseApp::Client.new(credentials)
  # List Projects
  #   rsp, err = client.projects_list(1, 10)
  #   puts rsp
  # Create a new key
  #   params = PhraseApp::RequestParams::TranslationKeyParams.new(:name => "foo")
  #   rsp, err = client.key_create('YOUR_PROJECT_ID', params)
  #   puts rsp
  class Client
    def initialize(credentials)
      @credentials = credentials
    end

  
    # Create a new authorization.
    # API Path: /v2/authorizations
    # == Parameters:
    # params::
    #   Parameters of type PhraseApp::RequestParams::AuthorizationParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::AuthorizationWithToken
    #   err
    def authorization_create(params)
      path = sprintf("/api/v2/authorizations")
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::AuthorizationParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::AuthorizationParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "POST", path, reqHelper.ctype, reqHelper.body, 201)
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
    #   err
    def authorization_delete(id)
      path = sprintf("/api/v2/authorizations/%s", id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "DELETE", path, reqHelper.ctype, reqHelper.body, 204)
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
    def authorization_show(id)
      path = sprintf("/api/v2/authorizations/%s", id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200)
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
    #   Parameters of type PhraseApp::RequestParams::AuthorizationParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Authorization
    #   err
    def authorization_update(id, params)
      path = sprintf("/api/v2/authorizations/%s", id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::AuthorizationParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::AuthorizationParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "PATCH", path, reqHelper.ctype, reqHelper.body, 200)
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
    def authorizations_list(page, per_page)
      path = sprintf("/api/v2/authorizations")
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request_paginated(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
      if err != nil
        return nil, err
      end
      
      return JSON.load(rc.body).map { |item| PhraseApp::ResponseObjects::Authorization.new(item) }, err
    end
  
    # Create a new rule for blacklisting keys.
    # API Path: /v2/projects/:project_id/blacklisted_keys
    # == Parameters:
    # project_id::
    #   project_id
    # params::
    #   Parameters of type PhraseApp::RequestParams::BlacklistedKeyParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::BlacklistedKey
    #   err
    def blacklisted_key_create(project_id, params)
      path = sprintf("/api/v2/projects/%s/blacklisted_keys", project_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::BlacklistedKeyParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::BlacklistedKeyParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "POST", path, reqHelper.ctype, reqHelper.body, 201)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::BlacklistedKey.new(JSON.load(rc.body)), err
    end
  
    # Delete an existing rule for blacklisting keys.
    # API Path: /v2/projects/:project_id/blacklisted_keys/:id
    # == Parameters:
    # project_id::
    #   project_id
    # id::
    #   id
    #
    # == Returns:
    #   err
    def blacklisted_key_delete(project_id, id)
      path = sprintf("/api/v2/projects/%s/blacklisted_keys/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "DELETE", path, reqHelper.ctype, reqHelper.body, 204)
      if err != nil
        return nil, err
      end
      
      return err
    end
  
    # Get details on a single rule for blacklisting keys for a given project.
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
    def blacklisted_key_show(project_id, id)
      path = sprintf("/api/v2/projects/%s/blacklisted_keys/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::BlacklistedKey.new(JSON.load(rc.body)), err
    end
  
    # Update an existing rule for blacklisting keys.
    # API Path: /v2/projects/:project_id/blacklisted_keys/:id
    # == Parameters:
    # project_id::
    #   project_id
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::BlacklistedKeyParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::BlacklistedKey
    #   err
    def blacklisted_key_update(project_id, id, params)
      path = sprintf("/api/v2/projects/%s/blacklisted_keys/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::BlacklistedKeyParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::BlacklistedKeyParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "PATCH", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::BlacklistedKey.new(JSON.load(rc.body)), err
    end
  
    # List all rules for blacklisting keys for the given project.
    # API Path: /v2/projects/:project_id/blacklisted_keys
    # == Parameters:
    # project_id::
    #   project_id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::BlacklistedKey
    #   err
    def blacklisted_keys_list(project_id, page, per_page)
      path = sprintf("/api/v2/projects/%s/blacklisted_keys", project_id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request_paginated(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
      if err != nil
        return nil, err
      end
      
      return JSON.load(rc.body).map { |item| PhraseApp::ResponseObjects::BlacklistedKey.new(item) }, err
    end
  
    # Create a new comment for a key.
    # API Path: /v2/projects/:project_id/keys/:key_id/comments
    # == Parameters:
    # project_id::
    #   project_id
    # key_id::
    #   key_id
    # params::
    #   Parameters of type PhraseApp::RequestParams::CommentParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Comment
    #   err
    def comment_create(project_id, key_id, params)
      path = sprintf("/api/v2/projects/%s/keys/%s/comments", project_id, key_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::CommentParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::CommentParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "POST", path, reqHelper.ctype, reqHelper.body, 201)
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
    #   err
    def comment_delete(project_id, key_id, id)
      path = sprintf("/api/v2/projects/%s/keys/%s/comments/%s", project_id, key_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "DELETE", path, reqHelper.ctype, reqHelper.body, 204)
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
    #   err
    def comment_mark_check(project_id, key_id, id)
      path = sprintf("/api/v2/projects/%s/keys/%s/comments/%s/read", project_id, key_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 204)
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
    #   err
    def comment_mark_read(project_id, key_id, id)
      path = sprintf("/api/v2/projects/%s/keys/%s/comments/%s/read", project_id, key_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "PATCH", path, reqHelper.ctype, reqHelper.body, 204)
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
    #   err
    def comment_mark_unread(project_id, key_id, id)
      path = sprintf("/api/v2/projects/%s/keys/%s/comments/%s/read", project_id, key_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "DELETE", path, reqHelper.ctype, reqHelper.body, 204)
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
    def comment_show(project_id, key_id, id)
      path = sprintf("/api/v2/projects/%s/keys/%s/comments/%s", project_id, key_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200)
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
    #   Parameters of type PhraseApp::RequestParams::CommentParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Comment
    #   err
    def comment_update(project_id, key_id, id, params)
      path = sprintf("/api/v2/projects/%s/keys/%s/comments/%s", project_id, key_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::CommentParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::CommentParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "PATCH", path, reqHelper.ctype, reqHelper.body, 200)
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
    def comments_list(project_id, key_id, page, per_page)
      path = sprintf("/api/v2/projects/%s/keys/%s/comments", project_id, key_id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request_paginated(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
      if err != nil
        return nil, err
      end
      
      return JSON.load(rc.body).map { |item| PhraseApp::ResponseObjects::Comment.new(item) }, err
    end
  
    # Get a handy list of all localization file formats supported in PhraseApp.
    # API Path: /v2/formats
    # == Parameters:
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Format
    #   err
    def formats_list(page, per_page)
      path = sprintf("/api/v2/formats")
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request_paginated(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
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
    #   Parameters of type PhraseApp::RequestParams::TranslationKeyParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::TranslationKeyDetails
    #   err
    def key_create(project_id, params)
      path = sprintf("/api/v2/projects/%s/keys", project_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::TranslationKeyParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::TranslationKeyParams")
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
        data_hash["plural"] = (params.plural == true)
      end

      if params.remove_screenshot != nil
        data_hash["remove_screenshot"] = (params.remove_screenshot == true)
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
        data_hash["unformatted"] = (params.unformatted == true)
      end

      if params.xml_space_preserve != nil
        data_hash["xml_space_preserve"] = (params.xml_space_preserve == true)
      end

  
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "POST", path, reqHelper.ctype, reqHelper.body, 201)
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
    #   err
    def key_delete(project_id, id)
      path = sprintf("/api/v2/projects/%s/keys/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "DELETE", path, reqHelper.ctype, reqHelper.body, 204)
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
    def key_show(project_id, id)
      path = sprintf("/api/v2/projects/%s/keys/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200)
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
    #   Parameters of type PhraseApp::RequestParams::TranslationKeyParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::TranslationKeyDetails
    #   err
    def key_update(project_id, id, params)
      path = sprintf("/api/v2/projects/%s/keys/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::TranslationKeyParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::TranslationKeyParams")
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
        data_hash["plural"] = (params.plural == true)
      end

      if params.remove_screenshot != nil
        data_hash["remove_screenshot"] = (params.remove_screenshot == true)
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
        data_hash["unformatted"] = (params.unformatted == true)
      end

      if params.xml_space_preserve != nil
        data_hash["xml_space_preserve"] = (params.xml_space_preserve == true)
      end

  
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "PATCH", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::TranslationKeyDetails.new(JSON.load(rc.body)), err
    end
  
    # Delete all keys matching query. Same constraints as list. Please limit the number of affected keys to about 1,000 as you might experience timeouts otherwise.
    # API Path: /v2/projects/:project_id/keys
    # == Parameters:
    # project_id::
    #   project_id
    # params::
    #   Parameters of type PhraseApp::RequestParams::KeysDeleteParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::AffectedResources
    #   err
    def keys_delete(project_id, params)
      path = sprintf("/api/v2/projects/%s/keys", project_id)
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
      rc, err = PhraseApp.send_request(@credentials, "DELETE", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::AffectedResources.new(JSON.load(rc.body)), err
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
    def keys_list(project_id, page, per_page, params)
      path = sprintf("/api/v2/projects/%s/keys", project_id)
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
      rc, err = PhraseApp.send_request_paginated(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
      if err != nil
        return nil, err
      end
      
      return JSON.load(rc.body).map { |item| PhraseApp::ResponseObjects::TranslationKey.new(item) }, err
    end
  
    # Search keys for the given project matching query.
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
    def keys_search(project_id, page, per_page, params)
      path = sprintf("/api/v2/projects/%s/keys/search", project_id)
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
      rc, err = PhraseApp.send_request_paginated(@credentials, "POST", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
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
    #   PhraseApp::ResponseObjects::AffectedResources
    #   err
    def keys_tag(project_id, params)
      path = sprintf("/api/v2/projects/%s/keys/tag", project_id)
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
      rc, err = PhraseApp.send_request(@credentials, "PATCH", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::AffectedResources.new(JSON.load(rc.body)), err
    end
  
    # Removes specified tags from keys matching query.
    # API Path: /v2/projects/:project_id/keys/untag
    # == Parameters:
    # project_id::
    #   project_id
    # params::
    #   Parameters of type PhraseApp::RequestParams::KeysUntagParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::AffectedResources
    #   err
    def keys_untag(project_id, params)
      path = sprintf("/api/v2/projects/%s/keys/untag", project_id)
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
      rc, err = PhraseApp.send_request(@credentials, "PATCH", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::AffectedResources.new(JSON.load(rc.body)), err
    end
  
    # Create a new locale.
    # API Path: /v2/projects/:project_id/locales
    # == Parameters:
    # project_id::
    #   project_id
    # params::
    #   Parameters of type PhraseApp::RequestParams::LocaleParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::LocaleDetails
    #   err
    def locale_create(project_id, params)
      path = sprintf("/api/v2/projects/%s/locales", project_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::LocaleParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::LocaleParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "POST", path, reqHelper.ctype, reqHelper.body, 201)
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
    #   err
    def locale_delete(project_id, id)
      path = sprintf("/api/v2/projects/%s/locales/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "DELETE", path, reqHelper.ctype, reqHelper.body, 204)
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
    #   err
    def locale_download(project_id, id, params)
      path = sprintf("/api/v2/projects/%s/locales/%s/download", project_id, id)
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
      rc, err = PhraseApp.send_request(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200)
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
    def locale_show(project_id, id)
      path = sprintf("/api/v2/projects/%s/locales/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200)
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
    #   Parameters of type PhraseApp::RequestParams::LocaleParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::LocaleDetails
    #   err
    def locale_update(project_id, id, params)
      path = sprintf("/api/v2/projects/%s/locales/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::LocaleParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::LocaleParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "PATCH", path, reqHelper.ctype, reqHelper.body, 200)
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
    def locales_list(project_id, page, per_page)
      path = sprintf("/api/v2/projects/%s/locales", project_id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request_paginated(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
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
    def order_confirm(project_id, id)
      path = sprintf("/api/v2/projects/%s/orders/%s/confirm", project_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "PATCH", path, reqHelper.ctype, reqHelper.body, 200)
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
    #   Parameters of type PhraseApp::RequestParams::TranslationOrderParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::TranslationOrder
    #   err
    def order_create(project_id, params)
      path = sprintf("/api/v2/projects/%s/orders", project_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::TranslationOrderParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::TranslationOrderParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "POST", path, reqHelper.ctype, reqHelper.body, 201)
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
    #   err
    def order_delete(project_id, id)
      path = sprintf("/api/v2/projects/%s/orders/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "DELETE", path, reqHelper.ctype, reqHelper.body, 204)
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
    def order_show(project_id, id)
      path = sprintf("/api/v2/projects/%s/orders/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200)
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
    def orders_list(project_id, page, per_page)
      path = sprintf("/api/v2/projects/%s/orders", project_id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request_paginated(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
      if err != nil
        return nil, err
      end
      
      return JSON.load(rc.body).map { |item| PhraseApp::ResponseObjects::TranslationOrder.new(item) }, err
    end
  
    # Create a new project.
    # API Path: /v2/projects
    # == Parameters:
    # params::
    #   Parameters of type PhraseApp::RequestParams::ProjectParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::ProjectDetails
    #   err
    def project_create(params)
      path = sprintf("/api/v2/projects")
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::ProjectParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::ProjectParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "POST", path, reqHelper.ctype, reqHelper.body, 201)
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
    #   err
    def project_delete(id)
      path = sprintf("/api/v2/projects/%s", id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "DELETE", path, reqHelper.ctype, reqHelper.body, 204)
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
    def project_show(id)
      path = sprintf("/api/v2/projects/%s", id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200)
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
    #   Parameters of type PhraseApp::RequestParams::ProjectParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::ProjectDetails
    #   err
    def project_update(id, params)
      path = sprintf("/api/v2/projects/%s", id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::ProjectParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::ProjectParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "PATCH", path, reqHelper.ctype, reqHelper.body, 200)
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
    def projects_list(page, per_page)
      path = sprintf("/api/v2/projects")
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request_paginated(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
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
    def show_user()
      path = sprintf("/api/v2/user")
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200)
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
    #   Parameters of type PhraseApp::RequestParams::StyleguideParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::StyleguideDetails
    #   err
    def styleguide_create(project_id, params)
      path = sprintf("/api/v2/projects/%s/styleguides", project_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::StyleguideParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::StyleguideParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "POST", path, reqHelper.ctype, reqHelper.body, 201)
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
    #   err
    def styleguide_delete(project_id, id)
      path = sprintf("/api/v2/projects/%s/styleguides/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "DELETE", path, reqHelper.ctype, reqHelper.body, 204)
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
    def styleguide_show(project_id, id)
      path = sprintf("/api/v2/projects/%s/styleguides/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200)
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
    #   Parameters of type PhraseApp::RequestParams::StyleguideParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::StyleguideDetails
    #   err
    def styleguide_update(project_id, id, params)
      path = sprintf("/api/v2/projects/%s/styleguides/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::StyleguideParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::StyleguideParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "PATCH", path, reqHelper.ctype, reqHelper.body, 200)
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
    def styleguides_list(project_id, page, per_page)
      path = sprintf("/api/v2/projects/%s/styleguides", project_id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request_paginated(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
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
    #   Parameters of type PhraseApp::RequestParams::TagParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::TagWithStats
    #   err
    def tag_create(project_id, params)
      path = sprintf("/api/v2/projects/%s/tags", project_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::TagParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::TagParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "POST", path, reqHelper.ctype, reqHelper.body, 201)
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
    #   err
    def tag_delete(project_id, name)
      path = sprintf("/api/v2/projects/%s/tags/%s", project_id, name)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "DELETE", path, reqHelper.ctype, reqHelper.body, 204)
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
    def tag_show(project_id, name)
      path = sprintf("/api/v2/projects/%s/tags/%s", project_id, name)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200)
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
    def tags_list(project_id, page, per_page)
      path = sprintf("/api/v2/projects/%s/tags", project_id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request_paginated(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
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
    #   Parameters of type PhraseApp::RequestParams::TranslationParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::TranslationDetails
    #   err
    def translation_create(project_id, params)
      path = sprintf("/api/v2/projects/%s/translations", project_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::TranslationParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::TranslationParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "POST", path, reqHelper.ctype, reqHelper.body, 201)
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
    def translation_show(project_id, id)
      path = sprintf("/api/v2/projects/%s/translations/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200)
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
    def translation_update(project_id, id, params)
      path = sprintf("/api/v2/projects/%s/translations/%s", project_id, id)
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
      rc, err = PhraseApp.send_request(@credentials, "PATCH", path, reqHelper.ctype, reqHelper.body, 200)
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
    def translations_by_key(project_id, key_id, page, per_page, params)
      path = sprintf("/api/v2/projects/%s/keys/%s/translations", project_id, key_id)
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
      rc, err = PhraseApp.send_request_paginated(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
      if err != nil
        return nil, err
      end
      
      return JSON.load(rc.body).map { |item| PhraseApp::ResponseObjects::Translation.new(item) }, err
    end
  
    # List translations for a specific locale. If you want to download all translations for one locale we recommend to use the <code>locales#download</code> endpoint.
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
    def translations_by_locale(project_id, locale_id, page, per_page, params)
      path = sprintf("/api/v2/projects/%s/locales/%s/translations", project_id, locale_id)
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
      rc, err = PhraseApp.send_request_paginated(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
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
    def translations_exclude(project_id, params)
      path = sprintf("/api/v2/projects/%s/translations/exclude", project_id)
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
      rc, err = PhraseApp.send_request(@credentials, "PATCH", path, reqHelper.ctype, reqHelper.body, 200)
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
    def translations_include(project_id, params)
      path = sprintf("/api/v2/projects/%s/translations/include", project_id)
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
      rc, err = PhraseApp.send_request(@credentials, "PATCH", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::AffectedCount.new(JSON.load(rc.body)), err
    end
  
    # List translations for the given project. If you want to download all translations for one locale we recommend to use the <code>locales#download</code> endpoint.
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
    def translations_list(project_id, page, per_page, params)
      path = sprintf("/api/v2/projects/%s/translations", project_id)
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
      rc, err = PhraseApp.send_request_paginated(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
      if err != nil
        return nil, err
      end
      
      return JSON.load(rc.body).map { |item| PhraseApp::ResponseObjects::Translation.new(item) }, err
    end
  
    # List translations for the given project if you exceed GET request limitations on translations list. If you want to download all translations for one locale we recommend to use the <code>locales#download</code> endpoint.
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
    def translations_search(project_id, page, per_page, params)
      path = sprintf("/api/v2/projects/%s/translations/search", project_id)
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
      rc, err = PhraseApp.send_request_paginated(@credentials, "POST", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
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
    def translations_unverify(project_id, params)
      path = sprintf("/api/v2/projects/%s/translations/unverify", project_id)
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
      rc, err = PhraseApp.send_request(@credentials, "PATCH", path, reqHelper.ctype, reqHelper.body, 200)
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
    def translations_verify(project_id, params)
      path = sprintf("/api/v2/projects/%s/translations/verify", project_id)
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
      rc, err = PhraseApp.send_request(@credentials, "PATCH", path, reqHelper.ctype, reqHelper.body, 200)
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
    #   Parameters of type PhraseApp::RequestParams::UploadParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Upload
    #   err
    def upload_create(project_id, params)
      path = sprintf("/api/v2/projects/%s/uploads", project_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::UploadParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::UploadParams")
        end
      end
      if params.convert_emoji != nil
        data_hash["convert_emoji"] = (params.convert_emoji == true)
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

      if params.file_encoding != nil
        data_hash["file_encoding"] = params.file_encoding
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
        data_hash["skip_unverification"] = (params.skip_unverification == true)
      end

      if params.skip_upload_tags != nil
        data_hash["skip_upload_tags"] = (params.skip_upload_tags == true)
      end

      if params.tags != nil
        data_hash["tags"] = params.tags
      end

      if params.update_translations != nil
        data_hash["update_translations"] = (params.update_translations == true)
      end

  
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "POST", path, reqHelper.ctype, reqHelper.body, 201)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::Upload.new(JSON.load(rc.body)), err
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
    #   PhraseApp::ResponseObjects::Upload
    #   err
    def upload_show(project_id, id)
      path = sprintf("/api/v2/projects/%s/uploads/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::Upload.new(JSON.load(rc.body)), err
    end
  
    # List all uploads for the given project.
    # API Path: /v2/projects/:project_id/uploads
    # == Parameters:
    # project_id::
    #   project_id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Upload
    #   err
    def uploads_list(project_id, page, per_page)
      path = sprintf("/api/v2/projects/%s/uploads", project_id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request_paginated(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
      if err != nil
        return nil, err
      end
      
      return JSON.load(rc.body).map { |item| PhraseApp::ResponseObjects::Upload.new(item) }, err
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
    def version_show(project_id, translation_id, id)
      path = sprintf("/api/v2/projects/%s/translations/%s/versions/%s", project_id, translation_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200)
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
    def versions_list(project_id, translation_id, page, per_page)
      path = sprintf("/api/v2/projects/%s/translations/%s/versions", project_id, translation_id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request_paginated(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
      if err != nil
        return nil, err
      end
      
      return JSON.load(rc.body).map { |item| PhraseApp::ResponseObjects::TranslationVersion.new(item) }, err
    end
  
    # Create a new webhook.
    # API Path: /v2/projects/:project_id/webhooks
    # == Parameters:
    # project_id::
    #   project_id
    # params::
    #   Parameters of type PhraseApp::RequestParams::WebhookParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Webhook
    #   err
    def webhook_create(project_id, params)
      path = sprintf("/api/v2/projects/%s/webhooks", project_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::WebhookParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::WebhookParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "POST", path, reqHelper.ctype, reqHelper.body, 201)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::Webhook.new(JSON.load(rc.body)), err
    end
  
    # Delete an existing webhook.
    # API Path: /v2/projects/:project_id/webhooks/:id
    # == Parameters:
    # project_id::
    #   project_id
    # id::
    #   id
    #
    # == Returns:
    #   err
    def webhook_delete(project_id, id)
      path = sprintf("/api/v2/projects/%s/webhooks/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "DELETE", path, reqHelper.ctype, reqHelper.body, 204)
      if err != nil
        return nil, err
      end
      
      return err
    end
  
    # Get details on a single webhook.
    # API Path: /v2/projects/:project_id/webhooks/:id
    # == Parameters:
    # project_id::
    #   project_id
    # id::
    #   id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Webhook
    #   err
    def webhook_show(project_id, id)
      path = sprintf("/api/v2/projects/%s/webhooks/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::Webhook.new(JSON.load(rc.body)), err
    end
  
    # Perform a test request for a webhook.
    # API Path: /v2/projects/:project_id/webhooks/:id/test
    # == Parameters:
    # project_id::
    #   project_id
    # id::
    #   id
    #
    # == Returns:
    #   err
    def webhook_test(project_id, id)
      path = sprintf("/api/v2/projects/%s/webhooks/%s/test", project_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "POST", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return err
    end
  
    # Update an existing webhook.
    # API Path: /v2/projects/:project_id/webhooks/:id
    # == Parameters:
    # project_id::
    #   project_id
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::WebhookParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Webhook
    #   err
    def webhook_update(project_id, id, params)
      path = sprintf("/api/v2/projects/%s/webhooks/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::WebhookParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::WebhookParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "PATCH", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::Webhook.new(JSON.load(rc.body)), err
    end
  
    # List all webhooks for the given project.
    # API Path: /v2/projects/:project_id/webhooks
    # == Parameters:
    # project_id::
    #   project_id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Webhook
    #   err
    def webhooks_list(project_id, page, per_page)
      path = sprintf("/api/v2/projects/%s/webhooks", project_id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request_paginated(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
      if err != nil
        return nil, err
      end
      
      return JSON.load(rc.body).map { |item| PhraseApp::ResponseObjects::Webhook.new(item) }, err
    end
  
  end

end
