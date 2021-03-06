

# revision_docs:cf9c93b944382e16fa7b30acaebc002b51629b47
# revision_generator:HEAD/2019-02-08T151342/soenke
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
      #company, created_at, id, name, updated_at, 
      def initialize(hash)
        super(hash)
        PhraseApp.handle_times(self)
      end
    end

    class AccountDetails < Account
      #slug, 
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

    class BitbucketSync < ::OpenStruct
      #id, last_export_to_bitbucket_at, last_import_from_bitbucket_at, phraseapp_projects, repository_name, valid_phraseapp_yaml, 
      def initialize(hash)
        super(hash)
        PhraseApp.handle_times(self)
      end
    end

    class BitbucketSyncExportResponse < ::OpenStruct
      #status_path, 
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

    class Branch < ::OpenStruct
      #created_at, created_by, merged_at, merged_by, name, state, updated_at, 
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

    class Distribution < ::OpenStruct
      #created_at, deleted_at, id, name, platforms, project, releases, 
      def initialize(hash)
        super(hash)
        PhraseApp.handle_times(self)
      end
    end

    class DistributionPreview < ::OpenStruct
      #created_at, deleted_at, id, name, platforms, project, release_count, 
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

    class Glossary < ::OpenStruct
      #created_at, id, name, projects, updated_at, 
      def initialize(hash)
        super(hash)
        PhraseApp.handle_times(self)
      end
    end

    class GlossaryTerm < ::OpenStruct
      #case_sensitive, created_at, description, id, term, translatable, translations, updated_at, 
      def initialize(hash)
        super(hash)
        PhraseApp.handle_times(self)
      end
    end

    class GlossaryTermTranslation < ::OpenStruct
      #content, created_at, id, locale_code, updated_at, 
      def initialize(hash)
        super(hash)
        PhraseApp.handle_times(self)
      end
    end

    class Invitation < ::OpenStruct
      #accepted_at, created_at, email, id, locales, permissions, projects, role, state, updated_at, 
      def initialize(hash)
        super(hash)
        PhraseApp.handle_times(self)
      end
    end

    class Job < ::OpenStruct
      #briefing, created_at, due_date, id, name, state, updated_at, 
      def initialize(hash)
        super(hash)
        PhraseApp.handle_times(self)
      end
    end

    class JobDetails < Job
      #job_tag_name, keys, locales, owner, 
      def initialize(hash)
        super(hash)
        PhraseApp.handle_times(self)
      end
    end

    class JobLocale < ::OpenStruct
      #id, job, locale, users, 
      def initialize(hash)
        super(hash)
        PhraseApp.handle_times(self)
      end
    end

    class JobPreview < ::OpenStruct
      #id, name, state, 
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

    class Member < ::OpenStruct
      #email, id, projects, role, username, 
      def initialize(hash)
        super(hash)
        PhraseApp.handle_times(self)
      end
    end

    class Project < ::OpenStruct
      #account, created_at, id, main_format, name, project_image_url, updated_at, 
      def initialize(hash)
        super(hash)
        PhraseApp.handle_times(self)
      end
    end

    class ProjectDetails < Project
      #shares_translation_memory, slug, 
      def initialize(hash)
        super(hash)
        PhraseApp.handle_times(self)
      end
    end

    class ProjectShort < ::OpenStruct
      #created_at, id, main_format, name, updated_at, 
      def initialize(hash)
        super(hash)
        PhraseApp.handle_times(self)
      end
    end

    class ProjectLocales < ProjectShort
      #locales, 
      def initialize(hash)
        super(hash)
        PhraseApp.handle_times(self)
      end
    end

    class Release < ::OpenStruct
      #app_max_version, app_min_version, created_at, description, environments, id, locales, platforms, project, updated_at, version, 
      def initialize(hash)
        super(hash)
        PhraseApp.handle_times(self)
      end
    end

    class ReleasePreview < ::OpenStruct
      #app_max_version, app_min_version, created_at, description, environments, id, locale_codes, platforms, project, updated_at, version, 
      def initialize(hash)
        super(hash)
        PhraseApp.handle_times(self)
      end
    end

    class Screenshot < ::OpenStruct
      #created_at, description, id, markers_count, name, screenshot_url, updated_at, 
      def initialize(hash)
        super(hash)
        PhraseApp.handle_times(self)
      end
    end

    class ScreenshotMarker < ::OpenStruct
      #created_at, id, presentation, presentation_type, translation_key, updated_at, 
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
      #comments_count, creator, format_value_type, max_characters_allowed, name_plural, original_file, screenshot_url, unformatted, xml_space_preserve, 
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
  class AuthorizationParams < ::OpenStruct

    def expires_at=(val)
      super(DateTime.parse(val))
    end

    def note=(val)
      super(val)
    end

    def scopes=(val)
      super(val.split(','))
    end

    def validate
      
      if note == nil || note == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"note\" of \"AuthorizationParams\" not set")
      end
    end

  end
end


module RequestParams
  # BitbucketSyncParams
  # == Parameters:
  # account_id::
  #   Account ID to specify the actual account the project should be created in. Required if the requesting user is a member of multiple accounts.
  class BitbucketSyncParams < ::OpenStruct

    def account_id=(val)
      super(val)
    end

    def validate
      
    end

  end
end


module RequestParams
  # BlacklistedKeyParams
  # == Parameters:
  # name::
  #   Blacklisted key name
  class BlacklistedKeyParams < ::OpenStruct

    def name=(val)
      super(val)
    end

    def validate
      
      if name == nil || name == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"name\" of \"BlacklistedKeyParams\" not set")
      end
    end

  end
end


module RequestParams
  # BranchParams
  # == Parameters:
  # name::
  #   Name of the branch
  class BranchParams < ::OpenStruct

    def name=(val)
      super(val)
    end

    def validate
      
      if name == nil || name == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"name\" of \"BranchParams\" not set")
      end
    end

  end
end


module RequestParams
  # CommentParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  # message::
  #   Comment message
  class CommentParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def message=(val)
      super(val)
    end

    def validate
      
      if message == nil || message == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"message\" of \"CommentParams\" not set")
      end
    end

  end
end


module RequestParams
  # DistributionsParams
  # == Parameters:
  # fallback_to_default_locale::
  #   Indicates whether to fallback to projects default locale when locale can not be found
  # fallback_to_non_regional_locale::
  #   Indicates whether to fallback to non regional locale when locale can not be found
  # name::
  #   Name of the distribution
  # platforms::
  #   List of platforms the distribution should support.
  # project_id::
  #   Project id the distribution should be assigned to.
  class DistributionsParams < ::OpenStruct

    def fallback_to_default_locale=(val)
      if val.is_a?(TrueClass)
        super(true)
      elsif val.is_a?(FalseClass)
        return
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def fallback_to_non_regional_locale=(val)
      if val.is_a?(TrueClass)
        super(true)
      elsif val.is_a?(FalseClass)
        return
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def name=(val)
      super(val)
    end

    def platforms=(val)
      super(val.split(','))
    end

    def project_id=(val)
      super(val)
    end

    def validate
      
      if name == nil || name == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"name\" of \"DistributionsParams\" not set")
      end
      if platforms == nil
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"platforms\" of \"DistributionsParams\" not set")
      end
      if project_id == nil || project_id == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"project_id\" of \"DistributionsParams\" not set")
      end
    end

  end
end


module RequestParams
  # GlossaryParams
  # == Parameters:
  # name::
  #   Name of the glossary
  # project_ids::
  #   List of project ids the glossary should be assigned to.
  class GlossaryParams < ::OpenStruct

    def name=(val)
      super(val)
    end

    def project_ids=(val)
      super(val)
    end

    def validate
      
      if name == nil || name == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"name\" of \"GlossaryParams\" not set")
      end
    end

  end
end


module RequestParams
  # GlossaryTermTranslationParams
  # == Parameters:
  # content::
  #   The content of the translation
  # locale_code::
  #   Identifies the language for this translation
  class GlossaryTermTranslationParams < ::OpenStruct

    def content=(val)
      super(val)
    end

    def locale_code=(val)
      super(val)
    end

    def validate
      
      if locale_code == nil || locale_code == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"locale_code\" of \"GlossaryTermTranslationParams\" not set")
      end
    end

  end
end


module RequestParams
  # GlossaryTermParams
  # == Parameters:
  # case_sensitive::
  #   Indicates whether the term is case sensitive
  # description::
  #   Description of term
  # term::
  #   Glossary term
  # translatable::
  #   Indicates whether the term should be used for all languages or can be translated
  class GlossaryTermParams < ::OpenStruct

    def case_sensitive=(val)
      if val.is_a?(TrueClass)
        super(true)
      elsif val.is_a?(FalseClass)
        return
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def description=(val)
      super(val)
    end

    def term=(val)
      super(val)
    end

    def translatable=(val)
      if val.is_a?(TrueClass)
        super(true)
      elsif val.is_a?(FalseClass)
        return
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def validate
      
      if term == nil || term == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"term\" of \"GlossaryTermParams\" not set")
      end
    end

  end
end


module RequestParams
  # JobLocaleParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  # locale_id::
  #   locale id
  # user_ids::
  #   Array of user ids to be assigned to the job locale
  class JobLocaleParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def locale_id=(val)
      super(val)
    end

    def user_ids=(val)
      super(val.split(','))
    end

    def validate
      
      if locale_id == nil || locale_id == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"locale_id\" of \"JobLocaleParams\" not set")
      end
    end

  end
end


module RequestParams
  # JobParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  # briefing::
  #   Briefing for the translators
  # due_date::
  #   Date the job should be finished
  # name::
  #   Job name
  # tags::
  #   tags of keys that should be included within the job
  # translation_key_ids::
  #   ids of keys that should be included within the job
  class JobParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def briefing=(val)
      super(val)
    end

    def due_date=(val)
      super(DateTime.parse(val))
    end

    def name=(val)
      super(val)
    end

    def tags=(val)
      super(val.split(','))
    end

    def translation_key_ids=(val)
      super(val.split(','))
    end

    def validate
      
      if name == nil || name == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"name\" of \"JobParams\" not set")
      end
      if tags == nil
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"tags\" of \"JobParams\" not set")
      end
      if translation_key_ids == nil
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"translation_key_ids\" of \"JobParams\" not set")
      end
    end

  end
end


module RequestParams
  # TranslationKeyParams
  # == Parameters:
  # branch::
  #   specify the branch to use
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
  #   Indicates whether the screenshot will be deleted. This parameter is deprecated. Please use the Screenshots endpoint instead.
  # screenshot::
  #   Screenshot/image for the key. This parameter is deprecated. Please use the Screenshots endpoint instead.
  # tags::
  #   List of tags separated by comma to be associated with the key.
  # unformatted::
  #   Indicates whether the key should be exported as "unformatted". Supported by Android XML and other formats.
  # xml_space_preserve::
  #   Indicates whether the key should be exported with "xml:space=preserve". Supported by several XML-based formats.
  class TranslationKeyParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def data_type=(val)
      super(val)
    end

    def description=(val)
      super(val)
    end

    def localized_format_key=(val)
      super(val)
    end

    def localized_format_string=(val)
      super(val)
    end

    def max_characters_allowed=(val)
      super(val.to_i)
    end

    def name=(val)
      super(val)
    end

    def name_plural=(val)
      super(val)
    end

    def original_file=(val)
      super(val)
    end

    def plural=(val)
      if val.is_a?(TrueClass)
        super(true)
      elsif val.is_a?(FalseClass)
        return
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def remove_screenshot=(val)
      if val.is_a?(TrueClass)
        super(true)
      elsif val.is_a?(FalseClass)
        return
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def screenshot=(val)
      super(val)
    end

    def tags=(val)
      super(val)
    end

    def unformatted=(val)
      if val.is_a?(TrueClass)
        super(true)
      elsif val.is_a?(FalseClass)
        return
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def xml_space_preserve=(val)
      if val.is_a?(TrueClass)
        super(true)
      elsif val.is_a?(FalseClass)
        return
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def validate
      
      if name == nil || name == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"name\" of \"TranslationKeyParams\" not set")
      end
    end

  end
end


module RequestParams
  # LocaleParams
  # == Parameters:
  # autotranslate::
  #   If set, translations for this locale will be fetched automatically, right after creation.
  # branch::
  #   specify the branch to use
  # code::
  #   Locale ISO code
  # default::
  #   Indicates whether locale is the default locale. If set to true, the previous default locale the project is no longer the default locale.
  # main::
  #   Indicates whether locale is a main locale. Main locales are part of the <a href="https://help.phraseapp.com/translate-website-and-app-content/verify-and-proofread-translations/verification-and-proofreading" target="_blank">Verification System</a> feature.
  # name::
  #   Locale name
  # rtl::
  #   Indicates whether locale is a RTL (Right-to-Left) locale.
  # source_locale_id::
  #   Source locale. Can be the name or public id of the locale. Preferred is the public id.
  # unverify_new_translations::
  #   Indicates that new translations for this locale should be marked as unverified. Part of the <a href="https://help.phraseapp.com/translate-website-and-app-content/verify-and-proofread-translations/verification-and-proofreading" target="_blank">Advanced Workflows</a> feature.
  # unverify_updated_translations::
  #   Indicates that updated translations for this locale should be marked as unverified. Part of the <a href="https://help.phraseapp.com/translate-website-and-app-content/verify-and-proofread-translations/verification-and-proofreading" target="_blank">Advanced Workflows</a> feature.
  class LocaleParams < ::OpenStruct

    def autotranslate=(val)
      if val.is_a?(TrueClass)
        super(true)
      elsif val.is_a?(FalseClass)
        return
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def branch=(val)
      super(val)
    end

    def code=(val)
      super(val)
    end

    def default=(val)
      if val.is_a?(TrueClass)
        super(true)
      elsif val.is_a?(FalseClass)
        return
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def main=(val)
      if val.is_a?(TrueClass)
        super(true)
      elsif val.is_a?(FalseClass)
        return
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def name=(val)
      super(val)
    end

    def rtl=(val)
      if val.is_a?(TrueClass)
        super(true)
      elsif val.is_a?(FalseClass)
        return
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def source_locale_id=(val)
      super(val)
    end

    def unverify_new_translations=(val)
      if val.is_a?(TrueClass)
        super(true)
      elsif val.is_a?(FalseClass)
        return
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def unverify_updated_translations=(val)
      if val.is_a?(TrueClass)
        super(true)
      elsif val.is_a?(FalseClass)
        return
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def validate
      
      if code == nil || code == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"code\" of \"LocaleParams\" not set")
      end
      if name == nil || name == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"name\" of \"LocaleParams\" not set")
      end
    end

  end
end


module RequestParams
  # TranslationOrderParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  # category::
  #   Category to use (required for orders processed by TextMaster).
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
  class TranslationOrderParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def category=(val)
      super(val)
    end

    def include_untranslated_keys=(val)
      if val.is_a?(TrueClass)
        super(true)
      elsif val.is_a?(FalseClass)
        return
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def include_unverified_translations=(val)
      if val.is_a?(TrueClass)
        super(true)
      elsif val.is_a?(FalseClass)
        return
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def lsp=(val)
      super(val)
    end

    def message=(val)
      super(val)
    end

    def priority=(val)
      if val.is_a?(TrueClass)
        super(true)
      elsif val.is_a?(FalseClass)
        return
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def quality=(val)
      if val.is_a?(TrueClass)
        super(true)
      elsif val.is_a?(FalseClass)
        return
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def source_locale_id=(val)
      super(val)
    end

    def styleguide_id=(val)
      super(val)
    end

    def tag=(val)
      super(val)
    end

    def target_locale_ids=(val)
      super(val.split(','))
    end

    def translation_type=(val)
      super(val)
    end

    def unverify_translations_upon_delivery=(val)
      if val.is_a?(TrueClass)
        super(true)
      elsif val.is_a?(FalseClass)
        return
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def validate
      
      if category == nil || category == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"category\" of \"TranslationOrderParams\" not set")
      end
      if lsp == nil || lsp == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"lsp\" of \"TranslationOrderParams\" not set")
      end
      if source_locale_id == nil
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"source_locale_id\" of \"TranslationOrderParams\" not set")
      end
      if target_locale_ids == nil
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"target_locale_ids\" of \"TranslationOrderParams\" not set")
      end
      if translation_type == nil || translation_type == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"translation_type\" of \"TranslationOrderParams\" not set")
      end
    end

  end
end


module RequestParams
  # ProjectParams
  # == Parameters:
  # account_id::
  #   Account ID to specify the actual account the project should be created in. Required if the requesting user is a member of multiple accounts.
  # main_format::
  #   Main file format specified by its API Extension name. Used for locale downloads if no format is specified. For API Extension names of available file formats see <a href="https://help.phraseapp.com/what-is-phraseapp/supported-platforms-and-formats/supported-platforms-and-formats">Format Guide</a> or our <a href="#formats">Formats API Endpoint</a>.
  # name::
  #   Name of the project
  # project_image::
  #   Image to identify the project
  # remove_project_image::
  #   Indicates whether the project image should be deleted.
  # shares_translation_memory::
  #   Indicates whether the project should share the account's translation memory
  class ProjectParams < ::OpenStruct

    def account_id=(val)
      super(val)
    end

    def main_format=(val)
      super(val)
    end

    def name=(val)
      super(val)
    end

    def project_image=(val)
      super(val)
    end

    def remove_project_image=(val)
      if val.is_a?(TrueClass)
        super(true)
      elsif val.is_a?(FalseClass)
        return
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def shares_translation_memory=(val)
      if val.is_a?(TrueClass)
        super(true)
      elsif val.is_a?(FalseClass)
        return
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def validate
      
      if name == nil || name == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"name\" of \"ProjectParams\" not set")
      end
    end

  end
end


module RequestParams
  # ReleasesParams
  # == Parameters:
  # branch::
  #   Branch used for release
  # description::
  #   Description of the release
  # platforms::
  #   List of platforms the release should support.
  class ReleasesParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def description=(val)
      super(val)
    end

    def platforms=(val)
      super(val.split(','))
    end

    def validate
      
      if platforms == nil
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"platforms\" of \"ReleasesParams\" not set")
      end
    end

  end
end


module RequestParams
  # ScreenshotMarkerParams
  # == Parameters:
  # key_id::
  #   Specify the Key ID which should be highlighted on the specified screenshot. The Key must belong to the project.
  # presentation::
  #   Presentation details of the screenshot marker in JSON format.<br/><br/>Each Screenshot Marker is represented as a rectangular shaped highlight box with the name of the specified Key attached. You can specify the marker position on the screenshot (<code>x</code>-axis and <code>y</code>-axis in pixels) from the top left corner of the screenshot and the dimensions of the marker itself (<code>w</code> and <code>h</code> in pixels).
  class ScreenshotMarkerParams < ::OpenStruct

    def key_id=(val)
      super(val)
    end

    def presentation=(val)
      super(val)
    end

    def validate
      
      if key_id == nil
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"key_id\" of \"ScreenshotMarkerParams\" not set")
      end
      if presentation == nil || presentation == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"presentation\" of \"ScreenshotMarkerParams\" not set")
      end
    end

  end
end


module RequestParams
  # ScreenshotParams
  # == Parameters:
  # description::
  #   Description of the screenshot
  # filename::
  #   Screenshot file
  # name::
  #   Name of the screenshot
  class ScreenshotParams < ::OpenStruct

    def description=(val)
      super(val)
    end

    def filename=(val)
      super(val)
    end

    def name=(val)
      super(val)
    end

    def validate
      
      if filename == nil
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"filename\" of \"ScreenshotParams\" not set")
      end
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
  class StyleguideParams < ::OpenStruct

    def audience=(val)
      super(val)
    end

    def business=(val)
      super(val)
    end

    def company_branding=(val)
      super(val)
    end

    def formatting=(val)
      super(val)
    end

    def glossary_terms=(val)
      super(val)
    end

    def grammar_consistency=(val)
      super(val)
    end

    def grammatical_person=(val)
      super(val)
    end

    def literal_translation=(val)
      super(val)
    end

    def overall_tone=(val)
      super(val)
    end

    def samples=(val)
      super(val)
    end

    def target_audience=(val)
      super(val)
    end

    def title=(val)
      super(val)
    end

    def vocabulary_type=(val)
      super(val)
    end

    def validate
      
      if title == nil || title == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"title\" of \"StyleguideParams\" not set")
      end
    end

  end
end


module RequestParams
  # TagParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  # name::
  #   Name of the tag
  class TagParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def name=(val)
      super(val)
    end

    def validate
      
      if name == nil || name == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"name\" of \"TagParams\" not set")
      end
    end

  end
end


module RequestParams
  # TranslationParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  # content::
  #   Translation content
  # excluded::
  #   Indicates whether translation is excluded.
  # key_id::
  #   Key
  # locale_id::
  #   Locale. Can be the name or public id of the locale. Preferred is the public id.
  # plural_suffix::
  #   Plural suffix. Can be one of: zero, one, two, few, many, other. Must be specified if the key associated to the translation is pluralized.
  # unverified::
  #   Indicates whether translation is unverified. Part of the <a href="https://help.phraseapp.com/translate-website-and-app-content/verify-and-proofread-translations/verification-and-proofreading" target="_blank">Advanced Workflows</a> feature.
  class TranslationParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def content=(val)
      super(val)
    end

    def excluded=(val)
      if val.is_a?(TrueClass)
        super(true)
      elsif val.is_a?(FalseClass)
        return
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def key_id=(val)
      super(val)
    end

    def locale_id=(val)
      super(val)
    end

    def plural_suffix=(val)
      super(val)
    end

    def unverified=(val)
      if val.is_a?(TrueClass)
        super(true)
      elsif val.is_a?(FalseClass)
        return
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def validate
      
      if content == nil || content == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"content\" of \"TranslationParams\" not set")
      end
      if key_id == nil
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"key_id\" of \"TranslationParams\" not set")
      end
      if locale_id == nil
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"locale_id\" of \"TranslationParams\" not set")
      end
    end

  end
end


module RequestParams
  # UploadParams
  # == Parameters:
  # autotranslate::
  #   If set, translations for the uploaded language will be fetched automatically.
  # branch::
  #   specify the branch to use
  # convert_emoji::
  #   Indicates whether the file contains Emoji symbols that should be converted. <a href="https://help.phraseapp.com/manage-translations-and-languages/work-with-emojis/working-with-emojis">Working with Emojis</a>.
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
  # locale_mapping::
  #   Optional, format specific mapping between locale names and the columns the translations to those locales are contained in.
  # mark_reviewed::
  #   Indicated whether the imported translations should be marked as reviewed. This setting is available if the review workflow (currently beta) is enabled for the project.
  # skip_unverification::
  #   Indicates whether the upload should unverify updated translations.
  # skip_upload_tags::
  #   Indicates whether the upload should not create upload tags.
  # tags::
  #   List of tags separated by comma to be associated with the new keys contained in the upload.
  # update_descriptions::
  #   Existing key descriptions will be updated with the file content. Empty descriptions overwrite existing descriptions.
  # update_translations::
  #   Indicates whether existing translations should be updated with the file content.
  class UploadParams < ::OpenStruct

    def autotranslate=(val)
      if val.is_a?(TrueClass)
        super(true)
      elsif val.is_a?(FalseClass)
        return
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def branch=(val)
      super(val)
    end

    def convert_emoji=(val)
      if val.is_a?(TrueClass)
        super(true)
      elsif val.is_a?(FalseClass)
        return
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def file=(val)
      super(val)
    end

    def file_encoding=(val)
      super(val)
    end

    def file_format=(val)
      super(val)
    end

    def format_options=(val)
      super(JSON.load(val))
    end

    def locale_id=(val)
      super(val)
    end

    def locale_mapping=(val)
      super(JSON.load(val))
    end

    def mark_reviewed=(val)
      if val.is_a?(TrueClass)
        super(true)
      elsif val.is_a?(FalseClass)
        return
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def skip_unverification=(val)
      if val.is_a?(TrueClass)
        super(true)
      elsif val.is_a?(FalseClass)
        return
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def skip_upload_tags=(val)
      if val.is_a?(TrueClass)
        super(true)
      elsif val.is_a?(FalseClass)
        return
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def tags=(val)
      super(val)
    end

    def update_descriptions=(val)
      if val.is_a?(TrueClass)
        super(true)
      elsif val.is_a?(FalseClass)
        return
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def update_translations=(val)
      if val.is_a?(TrueClass)
        super(true)
      elsif val.is_a?(FalseClass)
        return
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def validate
      
      if file == nil
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"file\" of \"UploadParams\" not set")
      end
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
  class WebhookParams < ::OpenStruct

    def active=(val)
      if val.is_a?(TrueClass)
        super(true)
      elsif val.is_a?(FalseClass)
        return
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def callback_url=(val)
      super(val)
    end

    def description=(val)
      super(val)
    end

    def events=(val)
      super(val)
    end

    def validate
      
      if callback_url == nil || callback_url == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"callback_url\" of \"WebhookParams\" not set")
      end
      if events == nil || events == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"events\" of \"WebhookParams\" not set")
      end
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
  # BranchMergeParams
  # == Parameters:
  # strategy::
  #   strategy used for merge blocking, use_master or use_branch
  class BranchMergeParams < ::OpenStruct

    def strategy=(val)
      super(val)
    end

    def validate
      
    end

  end
end


module RequestParams
  # CommentDeleteParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  class CommentDeleteParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def validate
      
    end

  end
end


module RequestParams
  # CommentMarkCheckParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  class CommentMarkCheckParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def validate
      
    end

  end
end


module RequestParams
  # CommentMarkReadParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  class CommentMarkReadParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def validate
      
    end

  end
end


module RequestParams
  # CommentMarkUnreadParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  class CommentMarkUnreadParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def validate
      
    end

  end
end


module RequestParams
  # CommentShowParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  class CommentShowParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def validate
      
    end

  end
end


module RequestParams
  # CommentsListParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  class CommentsListParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def validate
      
    end

  end
end


module RequestParams
  # InvitationCreateParams
  # == Parameters:
  # email::
  #   The email of the invited user. The <code>email</code> can not be updated once created. Create a new invitation for each unique email.
  # locale_ids::
  #   List of locale ids the invited user has access to.
  # permissions::
  #   Additional permissions depending on invitation role. Available permissions are <code>create_upload</code> and <code>review_translations</code>
  # project_ids::
  #   List of project ids the invited user has access to.
  # role::
  #   Invitiation role, can be any of Manager, Developer, Translator.
  class InvitationCreateParams < ::OpenStruct

    def email=(val)
      super(val)
    end

    def locale_ids=(val)
      super(val)
    end

    def permissions=(val)
      super(JSON.load(val))
    end

    def project_ids=(val)
      super(val)
    end

    def role=(val)
      super(val)
    end

    def validate
      
      if email == nil || email == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"email\" of \"invitation_createParams\" not set")
      end
      if role == nil || role == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"role\" of \"invitation_createParams\" not set")
      end
    end

  end
end


module RequestParams
  # InvitationUpdateParams
  # == Parameters:
  # locale_ids::
  #   List of locale ids the invited user has access to
  # permissions::
  #   Additional permissions depending on invitation role.
  # project_ids::
  #   List of project ids the invited user has access to
  # role::
  #   Invitiation role, can be any of Manager, Developer, Translator
  class InvitationUpdateParams < ::OpenStruct

    def locale_ids=(val)
      super(val)
    end

    def permissions=(val)
      super(JSON.load(val))
    end

    def project_ids=(val)
      super(val)
    end

    def role=(val)
      super(val)
    end

    def validate
      
      if role == nil || role == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"role\" of \"invitation_updateParams\" not set")
      end
    end

  end
end


module RequestParams
  # JobCompleteParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  class JobCompleteParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def validate
      
    end

  end
end


module RequestParams
  # JobDeleteParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  class JobDeleteParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def validate
      
    end

  end
end


module RequestParams
  # JobKeysCreateParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  # translation_key_ids::
  #   ids of keys that should added to the job
  class JobKeysCreateParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def translation_key_ids=(val)
      super(val.split(','))
    end

    def validate
      
      if translation_key_ids == nil
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"translation_key_ids\" of \"job_keys_createParams\" not set")
      end
    end

  end
end


module RequestParams
  # JobKeysDeleteParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  # translation_key_ids::
  #   ids of keys that should added to the job
  class JobKeysDeleteParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def translation_key_ids=(val)
      super(val.split(','))
    end

    def validate
      
      if translation_key_ids == nil
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"translation_key_ids\" of \"job_keys_deleteParams\" not set")
      end
    end

  end
end


module RequestParams
  # JobReopenParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  class JobReopenParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def validate
      
    end

  end
end


module RequestParams
  # JobShowParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  class JobShowParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def validate
      
    end

  end
end


module RequestParams
  # JobStartParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  class JobStartParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def validate
      
    end

  end
end


module RequestParams
  # JobUpdateParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  # briefing::
  #   Briefing for the translators
  # due_date::
  #   Date the job should be finished
  # name::
  #   Job name
  class JobUpdateParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def briefing=(val)
      super(val)
    end

    def due_date=(val)
      super(DateTime.parse(val))
    end

    def name=(val)
      super(val)
    end

    def validate
      
      if name == nil || name == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"name\" of \"job_updateParams\" not set")
      end
    end

  end
end


module RequestParams
  # JobLocaleCompleteParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  class JobLocaleCompleteParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def validate
      
    end

  end
end


module RequestParams
  # JobLocaleDeleteParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  class JobLocaleDeleteParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def validate
      
    end

  end
end


module RequestParams
  # JobLocaleReopenParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  class JobLocaleReopenParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def validate
      
    end

  end
end


module RequestParams
  # JobLocaleShowParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  class JobLocaleShowParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def validate
      
    end

  end
end


module RequestParams
  # JobLocalesListParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  class JobLocalesListParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def validate
      
    end

  end
end


module RequestParams
  # JobsListParams
  # == Parameters:
  # assigned_to::
  #   filter by user assigned to job
  # branch::
  #   specify the branch to use
  # owned_by::
  #   filter by user owning job
  # state::
  #   filter by state of job Valid states are <code>draft</code>, <code>in_progress</code>, <code>completed</code>
  class JobsListParams < ::OpenStruct

    def assigned_to=(val)
      super(val)
    end

    def branch=(val)
      super(val)
    end

    def owned_by=(val)
      super(val)
    end

    def state=(val)
      super(val)
    end

    def validate
      
      if assigned_to == nil || assigned_to == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"assigned_to\" of \"jobs_listParams\" not set")
      end
      if owned_by == nil || owned_by == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"owned_by\" of \"jobs_listParams\" not set")
      end
      if state == nil || state == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"state\" of \"jobs_listParams\" not set")
      end
    end

  end
end


module RequestParams
  # KeyDeleteParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  class KeyDeleteParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def validate
      
    end

  end
end


module RequestParams
  # KeyShowParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  class KeyShowParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def validate
      
    end

  end
end


module RequestParams
  # KeysDeleteParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  # locale_id::
  #   Locale used to determine the translation state of a key when filtering for untranslated or translated keys.
  # q::
  #   q_description_placeholder
  class KeysDeleteParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def locale_id=(val)
      super(val)
    end

    def q=(val)
      super(val)
    end

    def validate
      
    end

  end
end


module RequestParams
  # KeysListParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  # locale_id::
  #   Locale used to determine the translation state of a key when filtering for untranslated or translated keys.
  # order::
  #   Order direction. Can be one of: asc, desc.
  # q::
  #   q_description_placeholder
  # sort::
  #   Sort by field. Can be one of: name, created_at, updated_at.
  class KeysListParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def locale_id=(val)
      super(val)
    end

    def order=(val)
      super(val)
    end

    def q=(val)
      super(val)
    end

    def sort=(val)
      super(val)
    end

    def validate
      
    end

  end
end


module RequestParams
  # KeysSearchParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  # locale_id::
  #   Locale used to determine the translation state of a key when filtering for untranslated or translated keys.
  # order::
  #   Order direction. Can be one of: asc, desc.
  # q::
  #   q_description_placeholder
  # sort::
  #   Sort by field. Can be one of: name, created_at, updated_at.
  class KeysSearchParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def locale_id=(val)
      super(val)
    end

    def order=(val)
      super(val)
    end

    def q=(val)
      super(val)
    end

    def sort=(val)
      super(val)
    end

    def validate
      
    end

  end
end


module RequestParams
  # KeysTagParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  # locale_id::
  #   Locale used to determine the translation state of a key when filtering for untranslated or translated keys.
  # q::
  #   q_description_placeholder
  # tags::
  #   Tag or comma-separated list of tags to add to the matching collection of keys
  class KeysTagParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def locale_id=(val)
      super(val)
    end

    def q=(val)
      super(val)
    end

    def tags=(val)
      super(val)
    end

    def validate
      
      if tags == nil || tags == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"tags\" of \"keys_tagParams\" not set")
      end
    end

  end
end


module RequestParams
  # KeysUntagParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  # locale_id::
  #   Locale used to determine the translation state of a key when filtering for untranslated or translated keys.
  # q::
  #   q_description_placeholder
  # tags::
  #   Tag or comma-separated list of tags to remove from the matching collection of keys
  class KeysUntagParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def locale_id=(val)
      super(val)
    end

    def q=(val)
      super(val)
    end

    def tags=(val)
      super(val)
    end

    def validate
      
      if tags == nil || tags == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"tags\" of \"keys_untagParams\" not set")
      end
    end

  end
end


module RequestParams
  # LocaleDeleteParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  class LocaleDeleteParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def validate
      
    end

  end
end


module RequestParams
  # LocaleDownloadParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  # convert_emoji::
  #   Indicates whether Emoji symbols should be converted to actual Emojis. <a href="https://help.phraseapp.com/manage-translations-and-languages/work-with-emojis/working-with-emojis">Working with Emojis</a>.
  # encoding::
  #   Enforces a specific encoding on the file contents. Valid options are "UTF-8", "UTF-16" and "ISO-8859-1".
  # fallback_locale_id::
  #   If a key has no translation in the locale being downloaded the translation in the fallback locale will be used. Provide the public ID of the locale that should be used as the fallback. Requires include_empty_translations to be set to <code>true</code>.
  # file_format::
  #   File format name. See the format guide for all supported file formats.
  # format_options::
  #   Additional formatting and render options. See the <a href="https://help.phraseapp.com/what-is-phraseapp/supported-platforms-and-formats/supported-platforms-and-formats">format guide</a> for a list of options available for each format. Specify format options like this: <code>...&format_options[foo]=bar</code>
  # include_empty_translations::
  #   Indicates whether keys without translations should be included in the output as well.
  # include_translated_keys::
  #   Include translated keys in the locale file. Use in combination with include_empty_translations to obtain only untranslated keys.
  # include_unverified_translations::
  #   if set to false unverified translations are excluded
  # keep_notranslate_tags::
  #   Indicates whether [NOTRANSLATE] tags should be kept.
  # skip_unverified_translations::
  #   Indicates whether the locale file should skip all unverified translations. This parameter is deprecated and should be replaced with <code>include_unverified_translations</code>.
  # tag::
  #   This parameter is deprecated. Please use the "tags" parameter instead
  # tags::
  #   Limit results to keys tagged with a list of comma separated tag names.
  # use_last_reviewed_version::
  #   If set to true the last reviewed version of a translation is used. This is only available if the review workflow (currently in beta) is enabled for the project.
  class LocaleDownloadParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def convert_emoji=(val)
      if val.is_a?(TrueClass)
        super(true)
      elsif val.is_a?(FalseClass)
        return
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def encoding=(val)
      super(val)
    end

    def fallback_locale_id=(val)
      super(val)
    end

    def file_format=(val)
      super(val)
    end

    def format_options=(val)
      super(JSON.load(val))
    end

    def include_empty_translations=(val)
      if val.is_a?(TrueClass)
        super(true)
      elsif val.is_a?(FalseClass)
        return
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def include_translated_keys=(val)
      if val.is_a?(TrueClass)
        super(true)
      elsif val.is_a?(FalseClass)
        return
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def include_unverified_translations=(val)
      if val.is_a?(TrueClass)
        super(true)
      elsif val.is_a?(FalseClass)
        return
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def keep_notranslate_tags=(val)
      if val.is_a?(TrueClass)
        super(true)
      elsif val.is_a?(FalseClass)
        return
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def skip_unverified_translations=(val)
      if val.is_a?(TrueClass)
        super(true)
      elsif val.is_a?(FalseClass)
        return
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def tag=(val)
      super(val)
    end

    def tags=(val)
      super(val)
    end

    def use_last_reviewed_version=(val)
      if val.is_a?(TrueClass)
        super(true)
      elsif val.is_a?(FalseClass)
        return
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def validate
      
      if file_format == nil || file_format == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"file_format\" of \"locale_downloadParams\" not set")
      end
    end

  end
end


module RequestParams
  # LocaleShowParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  class LocaleShowParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def validate
      
    end

  end
end


module RequestParams
  # LocalesListParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  class LocalesListParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def validate
      
    end

  end
end


module RequestParams
  # MemberUpdateParams
  # == Parameters:
  # locale_ids::
  #   List of locale ids the user has access to.
  # permissions::
  #   Additional permissions depending on member role. Available permissions are <code>create_upload</code> and <code>review_translations</code>
  # project_ids::
  #   List of project ids the user has access to. 
  # role::
  #   Member role, can be any of of Manager, Developer, Translator
  class MemberUpdateParams < ::OpenStruct

    def locale_ids=(val)
      super(val)
    end

    def permissions=(val)
      super(JSON.load(val))
    end

    def project_ids=(val)
      super(val)
    end

    def role=(val)
      super(val)
    end

    def validate
      
      if role == nil || role == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"role\" of \"member_updateParams\" not set")
      end
    end

  end
end


module RequestParams
  # OrderConfirmParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  class OrderConfirmParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def validate
      
    end

  end
end


module RequestParams
  # OrderDeleteParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  class OrderDeleteParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def validate
      
    end

  end
end


module RequestParams
  # OrderShowParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  class OrderShowParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def validate
      
    end

  end
end


module RequestParams
  # OrdersListParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  class OrdersListParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def validate
      
    end

  end
end


module RequestParams
  # TagDeleteParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  class TagDeleteParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def validate
      
    end

  end
end


module RequestParams
  # TagShowParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  class TagShowParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def validate
      
    end

  end
end


module RequestParams
  # TagsListParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  class TagsListParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def validate
      
    end

  end
end


module RequestParams
  # TranslationShowParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  class TranslationShowParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def validate
      
    end

  end
end


module RequestParams
  # TranslationUpdateParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  # content::
  #   Translation content
  # excluded::
  #   Indicates whether translation is excluded.
  # plural_suffix::
  #   Plural suffix. Can be one of: zero, one, two, few, many, other. Must be specified if the key associated to the translation is pluralized.
  # unverified::
  #   Indicates whether translation is unverified. Part of the <a href="https://help.phraseapp.com/translate-website-and-app-content/verify-and-proofread-translations/verification-and-proofreading" target="_blank">Advanced Workflows</a> feature.
  class TranslationUpdateParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def content=(val)
      super(val)
    end

    def excluded=(val)
      if val.is_a?(TrueClass)
        super(true)
      elsif val.is_a?(FalseClass)
        return
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def plural_suffix=(val)
      super(val)
    end

    def unverified=(val)
      if val.is_a?(TrueClass)
        super(true)
      elsif val.is_a?(FalseClass)
        return
      else
        PhraseApp::ParamsHelpers::ParamsValidationError.new("invalid value #{val}")
      end
    end

    def validate
      
      if content == nil || content == "" 
        raise PhraseApp::ParamsHelpers::ParamsValidationError.new("Required parameter \"content\" of \"translation_updateParams\" not set")
      end
    end

  end
end


module RequestParams
  # TranslationsByKeyParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  # order::
  #   Order direction. Can be one of: asc, desc.
  # q::
  #   q_description_placeholder
  # sort::
  #   Sort criteria. Can be one of: key_name, created_at, updated_at.
  class TranslationsByKeyParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def order=(val)
      super(val)
    end

    def q=(val)
      super(val)
    end

    def sort=(val)
      super(val)
    end

    def validate
      
    end

  end
end


module RequestParams
  # TranslationsByLocaleParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  # order::
  #   Order direction. Can be one of: asc, desc.
  # q::
  #   q_description_placeholder
  # sort::
  #   Sort criteria. Can be one of: key_name, created_at, updated_at.
  class TranslationsByLocaleParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def order=(val)
      super(val)
    end

    def q=(val)
      super(val)
    end

    def sort=(val)
      super(val)
    end

    def validate
      
    end

  end
end


module RequestParams
  # TranslationsExcludeParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  # order::
  #   Order direction. Can be one of: asc, desc.
  # q::
  #   q_description_placeholder
  # sort::
  #   Sort criteria. Can be one of: key_name, created_at, updated_at.
  class TranslationsExcludeParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def order=(val)
      super(val)
    end

    def q=(val)
      super(val)
    end

    def sort=(val)
      super(val)
    end

    def validate
      
    end

  end
end


module RequestParams
  # TranslationsIncludeParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  # order::
  #   Order direction. Can be one of: asc, desc.
  # q::
  #   q_description_placeholder
  # sort::
  #   Sort criteria. Can be one of: key_name, created_at, updated_at.
  class TranslationsIncludeParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def order=(val)
      super(val)
    end

    def q=(val)
      super(val)
    end

    def sort=(val)
      super(val)
    end

    def validate
      
    end

  end
end


module RequestParams
  # TranslationsListParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  # order::
  #   Order direction. Can be one of: asc, desc.
  # q::
  #   q_description_placeholder
  # sort::
  #   Sort criteria. Can be one of: key_name, created_at, updated_at.
  class TranslationsListParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def order=(val)
      super(val)
    end

    def q=(val)
      super(val)
    end

    def sort=(val)
      super(val)
    end

    def validate
      
    end

  end
end


module RequestParams
  # TranslationsSearchParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  # order::
  #   Order direction. Can be one of: asc, desc.
  # q::
  #   q_description_placeholder
  # sort::
  #   Sort criteria. Can be one of: key_name, created_at, updated_at.
  class TranslationsSearchParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def order=(val)
      super(val)
    end

    def q=(val)
      super(val)
    end

    def sort=(val)
      super(val)
    end

    def validate
      
    end

  end
end


module RequestParams
  # TranslationsUnverifyParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  # order::
  #   Order direction. Can be one of: asc, desc.
  # q::
  #   q_description_placeholder
  # sort::
  #   Sort criteria. Can be one of: key_name, created_at, updated_at.
  class TranslationsUnverifyParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def order=(val)
      super(val)
    end

    def q=(val)
      super(val)
    end

    def sort=(val)
      super(val)
    end

    def validate
      
    end

  end
end


module RequestParams
  # TranslationsVerifyParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  # order::
  #   Order direction. Can be one of: asc, desc.
  # q::
  #   q_description_placeholder
  # sort::
  #   Sort criteria. Can be one of: key_name, created_at, updated_at.
  class TranslationsVerifyParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def order=(val)
      super(val)
    end

    def q=(val)
      super(val)
    end

    def sort=(val)
      super(val)
    end

    def validate
      
    end

  end
end


module RequestParams
  # UploadShowParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  class UploadShowParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def validate
      
    end

  end
end


module RequestParams
  # UploadsListParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  class UploadsListParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def validate
      
    end

  end
end


module RequestParams
  # VersionShowParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  class VersionShowParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def validate
      
    end

  end
end


module RequestParams
  # VersionsListParams
  # == Parameters:
  # branch::
  #   specify the branch to use
  class VersionsListParams < ::OpenStruct

    def branch=(val)
      super(val)
    end

    def validate
      
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

  
    # Get details on a single account.
    # API Path: /api/v2/accounts/:id
    # == Parameters:
    # id::
    #   id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::AccountDetails
    #   err
    def account_show(id)
      path = sprintf("/api/v2/accounts/%s", id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::AccountDetails.new(JSON.load(rc.body)), err
    end
  
    # List all accounts the current user has access to.
    # API Path: /api/v2/accounts
    # == Parameters:
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Account
    #   err
    def accounts_list(page, per_page)
      path = sprintf("/api/v2/accounts")
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request_paginated(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
      if err != nil
        return nil, err
      end
      
      return JSON.load(rc.body).map { |item| PhraseApp::ResponseObjects::Account.new(item) }, err
    end
  
    # Create a new authorization.
    # API Path: /api/v2/authorizations
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
    # API Path: /api/v2/authorizations/:id
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
    # API Path: /api/v2/authorizations/:id
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
    # API Path: /api/v2/authorizations/:id
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
    # API Path: /api/v2/authorizations
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
  
    # Export translations from PhraseApp to Bitbucket according to the .phraseapp.yml file within the Bitbucket Repository.
    # API Path: /api/v2/bitbucket_syncs/:id/export
    # == Parameters:
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::BitbucketSyncParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::BitbucketSyncExportResponse
    #   err
    def bitbucket_sync_export(id, params)
      path = sprintf("/api/v2/bitbucket_syncs/%s/export", id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::BitbucketSyncParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::BitbucketSyncParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "POST", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::BitbucketSyncExportResponse.new(JSON.load(rc.body)), err
    end
  
    # Import translations from Bitbucket to PhraseApp according to the .phraseapp.yml file within the Bitbucket repository.
    # API Path: /api/v2/bitbucket_syncs/:id/import
    # == Parameters:
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::BitbucketSyncParams
    #
    # == Returns:
    #   err
    def bitbucket_sync_import(id, params)
      path = sprintf("/api/v2/bitbucket_syncs/%s/import", id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::BitbucketSyncParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::BitbucketSyncParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "POST", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return err
    end
  
    # List all Bitbucket repositories for which synchronisation with PhraseApp is activated.
    # API Path: /api/v2/bitbucket_syncs
    # == Parameters:
    # params::
    #   Parameters of type PhraseApp::RequestParams::BitbucketSyncParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::BitbucketSync
    #   err
    def bitbucket_syncs_list(page, per_page, params)
      path = sprintf("/api/v2/bitbucket_syncs")
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::BitbucketSyncParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::BitbucketSyncParams")
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
      
      return JSON.load(rc.body).map { |item| PhraseApp::ResponseObjects::BitbucketSync.new(item) }, err
    end
  
    # Create a new rule for blacklisting keys.
    # API Path: /api/v2/projects/:project_id/blacklisted_keys
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
    # API Path: /api/v2/projects/:project_id/blacklisted_keys/:id
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
    # API Path: /api/v2/projects/:project_id/blacklisted_keys/:id
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
    # API Path: /api/v2/projects/:project_id/blacklisted_keys/:id
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
    # API Path: /api/v2/projects/:project_id/blacklisted_keys
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
  
    # Create a new branch.
    # API Path: /api/v2/projects/:project_id/branches
    # == Parameters:
    # project_id::
    #   project_id
    # params::
    #   Parameters of type PhraseApp::RequestParams::BranchParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Branch
    #   err
    def branch_create(project_id, params)
      path = sprintf("/api/v2/projects/%s/branches", project_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::BranchParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::BranchParams")
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
      
      return PhraseApp::ResponseObjects::Branch.new(JSON.load(rc.body)), err
    end
  
    # Delete an existing branch.
    # API Path: /api/v2/projects/:project_id/branches/:id
    # == Parameters:
    # project_id::
    #   project_id
    # id::
    #   id
    #
    # == Returns:
    #   err
    def branch_delete(project_id, id)
      path = sprintf("/api/v2/projects/%s/branches/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "DELETE", path, reqHelper.ctype, reqHelper.body, 204)
      if err != nil
        return nil, err
      end
      
      return err
    end
  
    # Merge an existing branch.
    # API Path: /api/v2/projects/:project_id/branches/:id/merge
    # == Parameters:
    # project_id::
    #   project_id
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::BranchMergeParams
    #
    # == Returns:
    #   err
    def branch_merge(project_id, id, params)
      path = sprintf("/api/v2/projects/%s/branches/%s/merge", project_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::BranchMergeParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::BranchMergeParams")
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
      
      return err
    end
  
    # Get details on a single branch for a given project.
    # API Path: /api/v2/projects/:project_id/branches/:id
    # == Parameters:
    # project_id::
    #   project_id
    # id::
    #   id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Branch
    #   err
    def branch_show(project_id, id)
      path = sprintf("/api/v2/projects/%s/branches/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::Branch.new(JSON.load(rc.body)), err
    end
  
    # Update an existing branch.
    # API Path: /api/v2/projects/:project_id/branches/:id
    # == Parameters:
    # project_id::
    #   project_id
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::BranchParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Branch
    #   err
    def branch_update(project_id, id, params)
      path = sprintf("/api/v2/projects/%s/branches/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::BranchParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::BranchParams")
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
      
      return PhraseApp::ResponseObjects::Branch.new(JSON.load(rc.body)), err
    end
  
    # List all branches the of the current project.
    # API Path: /api/v2/projects/:project_id/branches
    # == Parameters:
    # project_id::
    #   project_id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Branch
    #   err
    def branches_list(project_id, page, per_page)
      path = sprintf("/api/v2/projects/%s/branches", project_id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request_paginated(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
      if err != nil
        return nil, err
      end
      
      return JSON.load(rc.body).map { |item| PhraseApp::ResponseObjects::Branch.new(item) }, err
    end
  
    # Create a new comment for a key.
    # API Path: /api/v2/projects/:project_id/keys/:key_id/comments
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
    # API Path: /api/v2/projects/:project_id/keys/:key_id/comments/:id
    # == Parameters:
    # project_id::
    #   project_id
    # key_id::
    #   key_id
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::CommentDeleteParams
    #
    # == Returns:
    #   err
    def comment_delete(project_id, key_id, id, params)
      path = sprintf("/api/v2/projects/%s/keys/%s/comments/%s", project_id, key_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::CommentDeleteParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::CommentDeleteParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "DELETE", path, reqHelper.ctype, reqHelper.body, 204)
      if err != nil
        return nil, err
      end
      
      return err
    end
  
    # Check if comment was marked as read. Returns 204 if read, 404 if unread.
    # API Path: /api/v2/projects/:project_id/keys/:key_id/comments/:id/read
    # == Parameters:
    # project_id::
    #   project_id
    # key_id::
    #   key_id
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::CommentMarkCheckParams
    #
    # == Returns:
    #   err
    def comment_mark_check(project_id, key_id, id, params)
      path = sprintf("/api/v2/projects/%s/keys/%s/comments/%s/read", project_id, key_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::CommentMarkCheckParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::CommentMarkCheckParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 204)
      if err != nil
        return nil, err
      end
      
      return err
    end
  
    # Mark a comment as read.
    # API Path: /api/v2/projects/:project_id/keys/:key_id/comments/:id/read
    # == Parameters:
    # project_id::
    #   project_id
    # key_id::
    #   key_id
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::CommentMarkReadParams
    #
    # == Returns:
    #   err
    def comment_mark_read(project_id, key_id, id, params)
      path = sprintf("/api/v2/projects/%s/keys/%s/comments/%s/read", project_id, key_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::CommentMarkReadParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::CommentMarkReadParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "PATCH", path, reqHelper.ctype, reqHelper.body, 204)
      if err != nil
        return nil, err
      end
      
      return err
    end
  
    # Mark a comment as unread.
    # API Path: /api/v2/projects/:project_id/keys/:key_id/comments/:id/read
    # == Parameters:
    # project_id::
    #   project_id
    # key_id::
    #   key_id
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::CommentMarkUnreadParams
    #
    # == Returns:
    #   err
    def comment_mark_unread(project_id, key_id, id, params)
      path = sprintf("/api/v2/projects/%s/keys/%s/comments/%s/read", project_id, key_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::CommentMarkUnreadParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::CommentMarkUnreadParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "DELETE", path, reqHelper.ctype, reqHelper.body, 204)
      if err != nil
        return nil, err
      end
      
      return err
    end
  
    # Get details on a single comment.
    # API Path: /api/v2/projects/:project_id/keys/:key_id/comments/:id
    # == Parameters:
    # project_id::
    #   project_id
    # key_id::
    #   key_id
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::CommentShowParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Comment
    #   err
    def comment_show(project_id, key_id, id, params)
      path = sprintf("/api/v2/projects/%s/keys/%s/comments/%s", project_id, key_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::CommentShowParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::CommentShowParams")
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
      
      return PhraseApp::ResponseObjects::Comment.new(JSON.load(rc.body)), err
    end
  
    # Update an existing comment.
    # API Path: /api/v2/projects/:project_id/keys/:key_id/comments/:id
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
    # API Path: /api/v2/projects/:project_id/keys/:key_id/comments
    # == Parameters:
    # project_id::
    #   project_id
    # key_id::
    #   key_id
    # params::
    #   Parameters of type PhraseApp::RequestParams::CommentsListParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Comment
    #   err
    def comments_list(project_id, key_id, page, per_page, params)
      path = sprintf("/api/v2/projects/%s/keys/%s/comments", project_id, key_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::CommentsListParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::CommentsListParams")
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
      
      return JSON.load(rc.body).map { |item| PhraseApp::ResponseObjects::Comment.new(item) }, err
    end
  
    # Create a new distribution.
    # API Path: /api/v2/accounts/:account_id/distributions
    # == Parameters:
    # account_id::
    #   account_id
    # params::
    #   Parameters of type PhraseApp::RequestParams::DistributionsParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Distribution
    #   err
    def distribution_create(account_id, params)
      path = sprintf("/api/v2/accounts/%s/distributions", account_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::DistributionsParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::DistributionsParams")
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
      
      return PhraseApp::ResponseObjects::Distribution.new(JSON.load(rc.body)), err
    end
  
    # Delete an existing distribution.
    # API Path: /api/v2/accounts/:account_id/distributions/:id
    # == Parameters:
    # account_id::
    #   account_id
    # id::
    #   id
    #
    # == Returns:
    #   err
    def distribution_delete(account_id, id)
      path = sprintf("/api/v2/accounts/%s/distributions/%s", account_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "DELETE", path, reqHelper.ctype, reqHelper.body, 204)
      if err != nil
        return nil, err
      end
      
      return err
    end
  
    # Get details on a single distribution.
    # API Path: /api/v2/accounts/:account_id/distributions/:id
    # == Parameters:
    # account_id::
    #   account_id
    # id::
    #   id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Distribution
    #   err
    def distribution_show(account_id, id)
      path = sprintf("/api/v2/accounts/%s/distributions/%s", account_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::Distribution.new(JSON.load(rc.body)), err
    end
  
    # Update an existing distribution.
    # API Path: /api/v2/accounts/:account_id/distributions/:id
    # == Parameters:
    # account_id::
    #   account_id
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::DistributionsParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Distribution
    #   err
    def distribution_update(account_id, id, params)
      path = sprintf("/api/v2/accounts/%s/distributions/%s", account_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::DistributionsParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::DistributionsParams")
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
      
      return PhraseApp::ResponseObjects::Distribution.new(JSON.load(rc.body)), err
    end
  
    # List all distributions for the given account.
    # API Path: /api/v2/accounts/:account_id/distributions
    # == Parameters:
    # account_id::
    #   account_id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::DistributionPreview
    #   err
    def distributions_list(account_id, page, per_page)
      path = sprintf("/api/v2/accounts/%s/distributions", account_id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request_paginated(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
      if err != nil
        return nil, err
      end
      
      return JSON.load(rc.body).map { |item| PhraseApp::ResponseObjects::DistributionPreview.new(item) }, err
    end
  
    # Get a handy list of all localization file formats supported in PhraseApp.
    # API Path: /api/v2/formats
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
  
    # List all glossaries the current user has access to.
    # API Path: /api/v2/accounts/:account_id/glossaries
    # == Parameters:
    # account_id::
    #   account_id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Glossary
    #   err
    def glossaries_list(account_id, page, per_page)
      path = sprintf("/api/v2/accounts/%s/glossaries", account_id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request_paginated(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
      if err != nil
        return nil, err
      end
      
      return JSON.load(rc.body).map { |item| PhraseApp::ResponseObjects::Glossary.new(item) }, err
    end
  
    # Create a new glossary.
    # API Path: /api/v2/accounts/:account_id/glossaries
    # == Parameters:
    # account_id::
    #   account_id
    # params::
    #   Parameters of type PhraseApp::RequestParams::GlossaryParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Glossary
    #   err
    def glossary_create(account_id, params)
      path = sprintf("/api/v2/accounts/%s/glossaries", account_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::GlossaryParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::GlossaryParams")
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
      
      return PhraseApp::ResponseObjects::Glossary.new(JSON.load(rc.body)), err
    end
  
    # Delete an existing glossary.
    # API Path: /api/v2/accounts/:account_id/glossaries/:id
    # == Parameters:
    # account_id::
    #   account_id
    # id::
    #   id
    #
    # == Returns:
    #   err
    def glossary_delete(account_id, id)
      path = sprintf("/api/v2/accounts/%s/glossaries/%s", account_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "DELETE", path, reqHelper.ctype, reqHelper.body, 204)
      if err != nil
        return nil, err
      end
      
      return err
    end
  
    # Get details on a single glossary.
    # API Path: /api/v2/accounts/:account_id/glossaries/:id
    # == Parameters:
    # account_id::
    #   account_id
    # id::
    #   id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Glossary
    #   err
    def glossary_show(account_id, id)
      path = sprintf("/api/v2/accounts/%s/glossaries/%s", account_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::Glossary.new(JSON.load(rc.body)), err
    end
  
    # Update an existing glossary.
    # API Path: /api/v2/accounts/:account_id/glossaries/:id
    # == Parameters:
    # account_id::
    #   account_id
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::GlossaryParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Glossary
    #   err
    def glossary_update(account_id, id, params)
      path = sprintf("/api/v2/accounts/%s/glossaries/%s", account_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::GlossaryParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::GlossaryParams")
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
      
      return PhraseApp::ResponseObjects::Glossary.new(JSON.load(rc.body)), err
    end
  
    # Create a new glossary term.
    # API Path: /api/v2/accounts/:account_id/glossaries/:glossary_id/terms
    # == Parameters:
    # account_id::
    #   account_id
    # glossary_id::
    #   glossary_id
    # params::
    #   Parameters of type PhraseApp::RequestParams::GlossaryTermParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::GlossaryTerm
    #   err
    def glossary_term_create(account_id, glossary_id, params)
      path = sprintf("/api/v2/accounts/%s/glossaries/%s/terms", account_id, glossary_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::GlossaryTermParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::GlossaryTermParams")
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
      
      return PhraseApp::ResponseObjects::GlossaryTerm.new(JSON.load(rc.body)), err
    end
  
    # Delete an existing glossary term.
    # API Path: /api/v2/accounts/:account_id/glossaries/:glossary_id/terms/:id
    # == Parameters:
    # account_id::
    #   account_id
    # glossary_id::
    #   glossary_id
    # id::
    #   id
    #
    # == Returns:
    #   err
    def glossary_term_delete(account_id, glossary_id, id)
      path = sprintf("/api/v2/accounts/%s/glossaries/%s/terms/%s", account_id, glossary_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "DELETE", path, reqHelper.ctype, reqHelper.body, 204)
      if err != nil
        return nil, err
      end
      
      return err
    end
  
    # Get details on a single glossary term.
    # API Path: /api/v2/accounts/:account_id/glossaries/:glossary_id/terms/:id
    # == Parameters:
    # account_id::
    #   account_id
    # glossary_id::
    #   glossary_id
    # id::
    #   id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::GlossaryTerm
    #   err
    def glossary_term_show(account_id, glossary_id, id)
      path = sprintf("/api/v2/accounts/%s/glossaries/%s/terms/%s", account_id, glossary_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::GlossaryTerm.new(JSON.load(rc.body)), err
    end
  
    # Update an existing glossary term.
    # API Path: /api/v2/accounts/:account_id/glossaries/:glossary_id/terms/:id
    # == Parameters:
    # account_id::
    #   account_id
    # glossary_id::
    #   glossary_id
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::GlossaryTermParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::GlossaryTerm
    #   err
    def glossary_term_update(account_id, glossary_id, id, params)
      path = sprintf("/api/v2/accounts/%s/glossaries/%s/terms/%s", account_id, glossary_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::GlossaryTermParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::GlossaryTermParams")
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
      
      return PhraseApp::ResponseObjects::GlossaryTerm.new(JSON.load(rc.body)), err
    end
  
    # Create a new glossary term translation.
    # API Path: /api/v2/accounts/:account_id/glossaries/:glossary_id/terms/:term_id/translations
    # == Parameters:
    # account_id::
    #   account_id
    # glossary_id::
    #   glossary_id
    # term_id::
    #   term_id
    # params::
    #   Parameters of type PhraseApp::RequestParams::GlossaryTermTranslationParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::GlossaryTermTranslation
    #   err
    def glossary_term_translation_create(account_id, glossary_id, term_id, params)
      path = sprintf("/api/v2/accounts/%s/glossaries/%s/terms/%s/translations", account_id, glossary_id, term_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::GlossaryTermTranslationParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::GlossaryTermTranslationParams")
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
      
      return PhraseApp::ResponseObjects::GlossaryTermTranslation.new(JSON.load(rc.body)), err
    end
  
    # Delete an existing glossary term translation.
    # API Path: /api/v2/accounts/:account_id/glossaries/:glossary_id/terms/:term_id/translations/:id
    # == Parameters:
    # account_id::
    #   account_id
    # glossary_id::
    #   glossary_id
    # term_id::
    #   term_id
    # id::
    #   id
    #
    # == Returns:
    #   err
    def glossary_term_translation_delete(account_id, glossary_id, term_id, id)
      path = sprintf("/api/v2/accounts/%s/glossaries/%s/terms/%s/translations/%s", account_id, glossary_id, term_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "DELETE", path, reqHelper.ctype, reqHelper.body, 204)
      if err != nil
        return nil, err
      end
      
      return err
    end
  
    # Update an existing glossary term translation.
    # API Path: /api/v2/accounts/:account_id/glossaries/:glossary_id/terms/:term_id/translations/:id
    # == Parameters:
    # account_id::
    #   account_id
    # glossary_id::
    #   glossary_id
    # term_id::
    #   term_id
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::GlossaryTermTranslationParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::GlossaryTermTranslation
    #   err
    def glossary_term_translation_update(account_id, glossary_id, term_id, id, params)
      path = sprintf("/api/v2/accounts/%s/glossaries/%s/terms/%s/translations/%s", account_id, glossary_id, term_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::GlossaryTermTranslationParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::GlossaryTermTranslationParams")
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
      
      return PhraseApp::ResponseObjects::GlossaryTermTranslation.new(JSON.load(rc.body)), err
    end
  
    # List all glossary terms the current user has access to.
    # API Path: /api/v2/accounts/:account_id/glossaries/:glossary_id/terms
    # == Parameters:
    # account_id::
    #   account_id
    # glossary_id::
    #   glossary_id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::GlossaryTerm
    #   err
    def glossary_terms_list(account_id, glossary_id, page, per_page)
      path = sprintf("/api/v2/accounts/%s/glossaries/%s/terms", account_id, glossary_id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request_paginated(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
      if err != nil
        return nil, err
      end
      
      return JSON.load(rc.body).map { |item| PhraseApp::ResponseObjects::GlossaryTerm.new(item) }, err
    end
  
    # Invite a person to an account. Developers and translators need <code>project_ids</code> and <code>locale_ids</code> assigned to access them. Access token scope must include <code>team.manage</code>.
    # API Path: /api/v2/accounts/:account_id/invitations
    # == Parameters:
    # account_id::
    #   account_id
    # params::
    #   Parameters of type PhraseApp::RequestParams::InvitationCreateParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Invitation
    #   err
    def invitation_create(account_id, params)
      path = sprintf("/api/v2/accounts/%s/invitations", account_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::InvitationCreateParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::InvitationCreateParams")
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
      
      return PhraseApp::ResponseObjects::Invitation.new(JSON.load(rc.body)), err
    end
  
    # Delete an existing invitation (must not be accepted yet). Access token scope must include <code>team.manage</code>.
    # API Path: /api/v2/accounts/:account_id/invitations/:id
    # == Parameters:
    # account_id::
    #   account_id
    # id::
    #   id
    #
    # == Returns:
    #   err
    def invitation_delete(account_id, id)
      path = sprintf("/api/v2/accounts/%s/invitations/%s", account_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "DELETE", path, reqHelper.ctype, reqHelper.body, 204)
      if err != nil
        return nil, err
      end
      
      return err
    end
  
    # Resend the invitation email (must not be accepted yet). Access token scope must include <code>team.manage</code>.
    # API Path: /api/v2/accounts/:account_id/invitations/:id/resend
    # == Parameters:
    # account_id::
    #   account_id
    # id::
    #   id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Invitation
    #   err
    def invitation_resend(account_id, id)
      path = sprintf("/api/v2/accounts/%s/invitations/%s/resend", account_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "POST", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::Invitation.new(JSON.load(rc.body)), err
    end
  
    # Get details on a single invitation. Access token scope must include <code>team.manage</code>.
    # API Path: /api/v2/accounts/:account_id/invitations/:id
    # == Parameters:
    # account_id::
    #   account_id
    # id::
    #   id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Invitation
    #   err
    def invitation_show(account_id, id)
      path = sprintf("/api/v2/accounts/%s/invitations/%s", account_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::Invitation.new(JSON.load(rc.body)), err
    end
  
    # Update an existing invitation (must not be accepted yet). The <code>email</code> cannot be updated. Developers and translators need <code>project_ids</code> and <code>locale_ids</code> assigned to access them. Access token scope must include <code>team.manage</code>.
    # API Path: /api/v2/accounts/:account_id/invitations/:id
    # == Parameters:
    # account_id::
    #   account_id
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::InvitationUpdateParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Invitation
    #   err
    def invitation_update(account_id, id, params)
      path = sprintf("/api/v2/accounts/%s/invitations/%s", account_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::InvitationUpdateParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::InvitationUpdateParams")
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
      
      return PhraseApp::ResponseObjects::Invitation.new(JSON.load(rc.body)), err
    end
  
    # List invitations for an account. It will also list the accessible resources like projects and locales the invited user has access to. In case nothing is shown the default access from the role is used. Access token scope must include <code>team.manage</code>.
    # API Path: /api/v2/accounts/:account_id/invitations
    # == Parameters:
    # account_id::
    #   account_id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Invitation
    #   err
    def invitations_list(account_id, page, per_page)
      path = sprintf("/api/v2/accounts/%s/invitations", account_id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request_paginated(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
      if err != nil
        return nil, err
      end
      
      return JSON.load(rc.body).map { |item| PhraseApp::ResponseObjects::Invitation.new(item) }, err
    end
  
    # Mark a job as completed.
    # API Path: /api/v2/projects/:project_id/jobs/:id/complete
    # == Parameters:
    # project_id::
    #   project_id
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::JobCompleteParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::JobDetails
    #   err
    def job_complete(project_id, id, params)
      path = sprintf("/api/v2/projects/%s/jobs/%s/complete", project_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::JobCompleteParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::JobCompleteParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "POST", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::JobDetails.new(JSON.load(rc.body)), err
    end
  
    # Create a new job.
    # API Path: /api/v2/projects/:project_id/jobs
    # == Parameters:
    # project_id::
    #   project_id
    # params::
    #   Parameters of type PhraseApp::RequestParams::JobParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::JobDetails
    #   err
    def job_create(project_id, params)
      path = sprintf("/api/v2/projects/%s/jobs", project_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::JobParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::JobParams")
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
      
      return PhraseApp::ResponseObjects::JobDetails.new(JSON.load(rc.body)), err
    end
  
    # Delete an existing job.
    # API Path: /api/v2/projects/:project_id/jobs/:id
    # == Parameters:
    # project_id::
    #   project_id
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::JobDeleteParams
    #
    # == Returns:
    #   err
    def job_delete(project_id, id, params)
      path = sprintf("/api/v2/projects/%s/jobs/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::JobDeleteParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::JobDeleteParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "DELETE", path, reqHelper.ctype, reqHelper.body, 204)
      if err != nil
        return nil, err
      end
      
      return err
    end
  
    # Add multiple keys to a existing job.
    # API Path: /api/v2/projects/:project_id/jobs/:id/keys
    # == Parameters:
    # project_id::
    #   project_id
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::JobKeysCreateParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::JobDetails
    #   err
    def job_keys_create(project_id, id, params)
      path = sprintf("/api/v2/projects/%s/jobs/%s/keys", project_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::JobKeysCreateParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::JobKeysCreateParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "POST", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::JobDetails.new(JSON.load(rc.body)), err
    end
  
    # Remove multiple keys from existing job.
    # API Path: /api/v2/projects/:project_id/jobs/:id/keys
    # == Parameters:
    # project_id::
    #   project_id
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::JobKeysDeleteParams
    #
    # == Returns:
    #   err
    def job_keys_delete(project_id, id, params)
      path = sprintf("/api/v2/projects/%s/jobs/%s/keys", project_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::JobKeysDeleteParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::JobKeysDeleteParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "DELETE", path, reqHelper.ctype, reqHelper.body, 204)
      if err != nil
        return nil, err
      end
      
      return err
    end
  
    # Mark a job as uncompleted.
    # API Path: /api/v2/projects/:project_id/jobs/:id/reopen
    # == Parameters:
    # project_id::
    #   project_id
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::JobReopenParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::JobDetails
    #   err
    def job_reopen(project_id, id, params)
      path = sprintf("/api/v2/projects/%s/jobs/%s/reopen", project_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::JobReopenParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::JobReopenParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "POST", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::JobDetails.new(JSON.load(rc.body)), err
    end
  
    # Get details on a single job for a given project.
    # API Path: /api/v2/projects/:project_id/jobs/:id
    # == Parameters:
    # project_id::
    #   project_id
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::JobShowParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::JobDetails
    #   err
    def job_show(project_id, id, params)
      path = sprintf("/api/v2/projects/%s/jobs/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::JobShowParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::JobShowParams")
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
      
      return PhraseApp::ResponseObjects::JobDetails.new(JSON.load(rc.body)), err
    end
  
    # Starts an existing job in state draft.
    # API Path: /api/v2/projects/:project_id/jobs/:id/start
    # == Parameters:
    # project_id::
    #   project_id
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::JobStartParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::JobDetails
    #   err
    def job_start(project_id, id, params)
      path = sprintf("/api/v2/projects/%s/jobs/%s/start", project_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::JobStartParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::JobStartParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "POST", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::JobDetails.new(JSON.load(rc.body)), err
    end
  
    # Update an existing job.
    # API Path: /api/v2/projects/:project_id/jobs/:id
    # == Parameters:
    # project_id::
    #   project_id
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::JobUpdateParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::JobDetails
    #   err
    def job_update(project_id, id, params)
      path = sprintf("/api/v2/projects/%s/jobs/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::JobUpdateParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::JobUpdateParams")
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
      
      return PhraseApp::ResponseObjects::JobDetails.new(JSON.load(rc.body)), err
    end
  
    # Mark a job locale as completed.
    # API Path: /api/v2/projects/:project_id/jobs/:job_id/locales/:id/complete
    # == Parameters:
    # project_id::
    #   project_id
    # job_id::
    #   job_id
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::JobLocaleCompleteParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::JobLocale
    #   err
    def job_locale_complete(project_id, job_id, id, params)
      path = sprintf("/api/v2/projects/%s/jobs/%s/locales/%s/complete", project_id, job_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::JobLocaleCompleteParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::JobLocaleCompleteParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "POST", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::JobLocale.new(JSON.load(rc.body)), err
    end
  
    # Delete an existing job locale.
    # API Path: /api/v2/projects/:project_id/jobs/:job_id/locales/:id
    # == Parameters:
    # project_id::
    #   project_id
    # job_id::
    #   job_id
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::JobLocaleDeleteParams
    #
    # == Returns:
    #   err
    def job_locale_delete(project_id, job_id, id, params)
      path = sprintf("/api/v2/projects/%s/jobs/%s/locales/%s", project_id, job_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::JobLocaleDeleteParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::JobLocaleDeleteParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "DELETE", path, reqHelper.ctype, reqHelper.body, 204)
      if err != nil
        return nil, err
      end
      
      return err
    end
  
    # Mark a job locale as uncompleted.
    # API Path: /api/v2/projects/:project_id/jobs/:job_id/locales/:id/reopen
    # == Parameters:
    # project_id::
    #   project_id
    # job_id::
    #   job_id
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::JobLocaleReopenParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::JobLocale
    #   err
    def job_locale_reopen(project_id, job_id, id, params)
      path = sprintf("/api/v2/projects/%s/jobs/%s/locales/%s/reopen", project_id, job_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::JobLocaleReopenParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::JobLocaleReopenParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "POST", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::JobLocale.new(JSON.load(rc.body)), err
    end
  
    # Get a single job locale for a given job.
    # API Path: /api/v2/projects/:project_id/jobs/:job_id/locale/:id
    # == Parameters:
    # project_id::
    #   project_id
    # job_id::
    #   job_id
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::JobLocaleShowParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::JobLocale
    #   err
    def job_locale_show(project_id, job_id, id, params)
      path = sprintf("/api/v2/projects/%s/jobs/%s/locale/%s", project_id, job_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::JobLocaleShowParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::JobLocaleShowParams")
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
      
      return PhraseApp::ResponseObjects::JobLocale.new(JSON.load(rc.body)), err
    end
  
    # Update an existing job locale.
    # API Path: /api/v2/projects/:project_id/jobs/:job_id/locales/:id
    # == Parameters:
    # project_id::
    #   project_id
    # job_id::
    #   job_id
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::JobLocaleParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::JobLocale
    #   err
    def job_locale_update(project_id, job_id, id, params)
      path = sprintf("/api/v2/projects/%s/jobs/%s/locales/%s", project_id, job_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::JobLocaleParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::JobLocaleParams")
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
      
      return PhraseApp::ResponseObjects::JobLocale.new(JSON.load(rc.body)), err
    end
  
    # Create a new job locale.
    # API Path: /api/v2/projects/:project_id/jobs/:job_id/locales
    # == Parameters:
    # project_id::
    #   project_id
    # job_id::
    #   job_id
    # params::
    #   Parameters of type PhraseApp::RequestParams::JobLocaleParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::JobLocale
    #   err
    def job_locales_create(project_id, job_id, params)
      path = sprintf("/api/v2/projects/%s/jobs/%s/locales", project_id, job_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::JobLocaleParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::JobLocaleParams")
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
      
      return PhraseApp::ResponseObjects::JobLocale.new(JSON.load(rc.body)), err
    end
  
    # List all job locales for a given job.
    # API Path: /api/v2/projects/:project_id/jobs/:job_id/locales
    # == Parameters:
    # project_id::
    #   project_id
    # job_id::
    #   job_id
    # params::
    #   Parameters of type PhraseApp::RequestParams::JobLocalesListParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::JobLocale
    #   err
    def job_locales_list(project_id, job_id, page, per_page, params)
      path = sprintf("/api/v2/projects/%s/jobs/%s/locales", project_id, job_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::JobLocalesListParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::JobLocalesListParams")
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
      
      return JSON.load(rc.body).map { |item| PhraseApp::ResponseObjects::JobLocale.new(item) }, err
    end
  
    # List all jobs for the given project.
    # API Path: /api/v2/projects/:project_id/jobs
    # == Parameters:
    # project_id::
    #   project_id
    # params::
    #   Parameters of type PhraseApp::RequestParams::JobsListParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Job
    #   err
    def jobs_list(project_id, page, per_page, params)
      path = sprintf("/api/v2/projects/%s/jobs", project_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::JobsListParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::JobsListParams")
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
      
      return JSON.load(rc.body).map { |item| PhraseApp::ResponseObjects::Job.new(item) }, err
    end
  
    # Create a new key.
    # API Path: /api/v2/projects/:project_id/keys
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
      if params.branch != nil
        data_hash["branch"] = params.branch
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
    # API Path: /api/v2/projects/:project_id/keys/:id
    # == Parameters:
    # project_id::
    #   project_id
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::KeyDeleteParams
    #
    # == Returns:
    #   err
    def key_delete(project_id, id, params)
      path = sprintf("/api/v2/projects/%s/keys/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::KeyDeleteParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::KeyDeleteParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "DELETE", path, reqHelper.ctype, reqHelper.body, 204)
      if err != nil
        return nil, err
      end
      
      return err
    end
  
    # Get details on a single key for a given project.
    # API Path: /api/v2/projects/:project_id/keys/:id
    # == Parameters:
    # project_id::
    #   project_id
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::KeyShowParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::TranslationKeyDetails
    #   err
    def key_show(project_id, id, params)
      path = sprintf("/api/v2/projects/%s/keys/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::KeyShowParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::KeyShowParams")
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
      
      return PhraseApp::ResponseObjects::TranslationKeyDetails.new(JSON.load(rc.body)), err
    end
  
    # Update an existing key.
    # API Path: /api/v2/projects/:project_id/keys/:id
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
      if params.branch != nil
        data_hash["branch"] = params.branch
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
    # API Path: /api/v2/projects/:project_id/keys
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
    # API Path: /api/v2/projects/:project_id/keys
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
    # API Path: /api/v2/projects/:project_id/keys/search
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
    # API Path: /api/v2/projects/:project_id/keys/tag
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
    # API Path: /api/v2/projects/:project_id/keys/untag
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
    # API Path: /api/v2/projects/:project_id/locales
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
    # API Path: /api/v2/projects/:project_id/locales/:id
    # == Parameters:
    # project_id::
    #   project_id
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::LocaleDeleteParams
    #
    # == Returns:
    #   err
    def locale_delete(project_id, id, params)
      path = sprintf("/api/v2/projects/%s/locales/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::LocaleDeleteParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::LocaleDeleteParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "DELETE", path, reqHelper.ctype, reqHelper.body, 204)
      if err != nil
        return nil, err
      end
      
      return err
    end
  
    # Download a locale in a specific file format.
    # API Path: /api/v2/projects/:project_id/locales/:id/download
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
    # API Path: /api/v2/projects/:project_id/locales/:id
    # == Parameters:
    # project_id::
    #   project_id
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::LocaleShowParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::LocaleDetails
    #   err
    def locale_show(project_id, id, params)
      path = sprintf("/api/v2/projects/%s/locales/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::LocaleShowParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::LocaleShowParams")
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
      
      return PhraseApp::ResponseObjects::LocaleDetails.new(JSON.load(rc.body)), err
    end
  
    # Update an existing locale.
    # API Path: /api/v2/projects/:project_id/locales/:id
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
    # API Path: /api/v2/projects/:project_id/locales
    # == Parameters:
    # project_id::
    #   project_id
    # params::
    #   Parameters of type PhraseApp::RequestParams::LocalesListParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Locale
    #   err
    def locales_list(project_id, page, per_page, params)
      path = sprintf("/api/v2/projects/%s/locales", project_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::LocalesListParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::LocalesListParams")
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
      
      return JSON.load(rc.body).map { |item| PhraseApp::ResponseObjects::Locale.new(item) }, err
    end
  
    # Remove a user from the account. The user will be removed from the account but not deleted from PhraseApp. Access token scope must include <code>team.manage</code>.
    # API Path: /api/v2/accounts/:account_id/members/:id
    # == Parameters:
    # account_id::
    #   account_id
    # id::
    #   id
    #
    # == Returns:
    #   err
    def member_delete(account_id, id)
      path = sprintf("/api/v2/accounts/%s/members/%s", account_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "DELETE", path, reqHelper.ctype, reqHelper.body, 204)
      if err != nil
        return nil, err
      end
      
      return err
    end
  
    # Get details on a single user in the account. Access token scope must include <code>team.manage</code>.
    # API Path: /api/v2/accounts/:account_id/members/:id
    # == Parameters:
    # account_id::
    #   account_id
    # id::
    #   id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Member
    #   err
    def member_show(account_id, id)
      path = sprintf("/api/v2/accounts/%s/members/%s", account_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::Member.new(JSON.load(rc.body)), err
    end
  
    # Update user permissions in the account. Developers and translators need <code>project_ids</code> and <code>locale_ids</code> assigned to access them. Access token scope must include <code>team.manage</code>.
    # API Path: /api/v2/accounts/:account_id/members/:id
    # == Parameters:
    # account_id::
    #   account_id
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::MemberUpdateParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Member
    #   err
    def member_update(account_id, id, params)
      path = sprintf("/api/v2/accounts/%s/members/%s", account_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::MemberUpdateParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::MemberUpdateParams")
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
      
      return PhraseApp::ResponseObjects::Member.new(JSON.load(rc.body)), err
    end
  
    # Get all users active in the account. It also lists resources like projects and locales the member has access to. In case nothing is shown the default access from the role is used. Access token scope must include <code>team.manage</code>.
    # API Path: /api/v2/accounts/:account_id/members
    # == Parameters:
    # account_id::
    #   account_id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Member
    #   err
    def members_list(account_id, page, per_page)
      path = sprintf("/api/v2/accounts/%s/members", account_id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request_paginated(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
      if err != nil
        return nil, err
      end
      
      return JSON.load(rc.body).map { |item| PhraseApp::ResponseObjects::Member.new(item) }, err
    end
  
    # Confirm an existing order and send it to the provider for translation. Same constraints as for create.
    # API Path: /api/v2/projects/:project_id/orders/:id/confirm
    # == Parameters:
    # project_id::
    #   project_id
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::OrderConfirmParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::TranslationOrder
    #   err
    def order_confirm(project_id, id, params)
      path = sprintf("/api/v2/projects/%s/orders/%s/confirm", project_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::OrderConfirmParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::OrderConfirmParams")
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
      
      return PhraseApp::ResponseObjects::TranslationOrder.new(JSON.load(rc.body)), err
    end
  
    # Create a new order. Access token scope must include <code>orders.create</code>.
    # API Path: /api/v2/projects/:project_id/orders
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
    # API Path: /api/v2/projects/:project_id/orders/:id
    # == Parameters:
    # project_id::
    #   project_id
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::OrderDeleteParams
    #
    # == Returns:
    #   err
    def order_delete(project_id, id, params)
      path = sprintf("/api/v2/projects/%s/orders/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::OrderDeleteParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::OrderDeleteParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "DELETE", path, reqHelper.ctype, reqHelper.body, 204)
      if err != nil
        return nil, err
      end
      
      return err
    end
  
    # Get details on a single order.
    # API Path: /api/v2/projects/:project_id/orders/:id
    # == Parameters:
    # project_id::
    #   project_id
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::OrderShowParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::TranslationOrder
    #   err
    def order_show(project_id, id, params)
      path = sprintf("/api/v2/projects/%s/orders/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::OrderShowParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::OrderShowParams")
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
      
      return PhraseApp::ResponseObjects::TranslationOrder.new(JSON.load(rc.body)), err
    end
  
    # List all orders for the given project.
    # API Path: /api/v2/projects/:project_id/orders
    # == Parameters:
    # project_id::
    #   project_id
    # params::
    #   Parameters of type PhraseApp::RequestParams::OrdersListParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::TranslationOrder
    #   err
    def orders_list(project_id, page, per_page, params)
      path = sprintf("/api/v2/projects/%s/orders", project_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::OrdersListParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::OrdersListParams")
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
      
      return JSON.load(rc.body).map { |item| PhraseApp::ResponseObjects::TranslationOrder.new(item) }, err
    end
  
    # Create a new project.
    # API Path: /api/v2/projects
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
      if params.account_id != nil
        data_hash["account_id"] = params.account_id
      end

      if params.main_format != nil
        data_hash["main_format"] = params.main_format
      end

      if params.name != nil
        data_hash["name"] = params.name
      end

      if params.project_image != nil
        post_body = []
        post_body << "--#{PhraseApp::MULTIPART_BOUNDARY}\r\n"
        post_body << "Content-Disposition: form-data; name=\"project_image\"; filename=\"#{File.basename(params.project_image )}\"\r\n"
        post_body << "Content-Type: text/plain\r\n"
        post_body << "\r\n"
        post_body << File.read(params.project_image)
        post_body << "\r\n"
      end

      if params.remove_project_image != nil
        data_hash["remove_project_image"] = (params.remove_project_image == true)
      end

      if params.shares_translation_memory != nil
        data_hash["shares_translation_memory"] = (params.shares_translation_memory == true)
      end

  
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "POST", path, reqHelper.ctype, reqHelper.body, 201)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::ProjectDetails.new(JSON.load(rc.body)), err
    end
  
    # Delete an existing project.
    # API Path: /api/v2/projects/:id
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
    # API Path: /api/v2/projects/:id
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
    # API Path: /api/v2/projects/:id
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
      if params.account_id != nil
        data_hash["account_id"] = params.account_id
      end

      if params.main_format != nil
        data_hash["main_format"] = params.main_format
      end

      if params.name != nil
        data_hash["name"] = params.name
      end

      if params.project_image != nil
        post_body = []
        post_body << "--#{PhraseApp::MULTIPART_BOUNDARY}\r\n"
        post_body << "Content-Disposition: form-data; name=\"project_image\"; filename=\"#{File.basename(params.project_image )}\"\r\n"
        post_body << "Content-Type: text/plain\r\n"
        post_body << "\r\n"
        post_body << File.read(params.project_image)
        post_body << "\r\n"
      end

      if params.remove_project_image != nil
        data_hash["remove_project_image"] = (params.remove_project_image == true)
      end

      if params.shares_translation_memory != nil
        data_hash["shares_translation_memory"] = (params.shares_translation_memory == true)
      end

  
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "PATCH", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::ProjectDetails.new(JSON.load(rc.body)), err
    end
  
    # List all projects the current user has access to.
    # API Path: /api/v2/projects
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
  
    # Create a new release.
    # API Path: /api/v2/accounts/:account_id/distributions/:distribution_id/releases
    # == Parameters:
    # account_id::
    #   account_id
    # distribution_id::
    #   distribution_id
    # params::
    #   Parameters of type PhraseApp::RequestParams::ReleasesParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Release
    #   err
    def release_create(account_id, distribution_id, params)
      path = sprintf("/api/v2/accounts/%s/distributions/%s/releases", account_id, distribution_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::ReleasesParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::ReleasesParams")
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
      
      return PhraseApp::ResponseObjects::Release.new(JSON.load(rc.body)), err
    end
  
    # Delete an existing release.
    # API Path: /api/v2/accounts/:account_id/distributions/:distribution_id/releases/:id
    # == Parameters:
    # account_id::
    #   account_id
    # distribution_id::
    #   distribution_id
    # id::
    #   id
    #
    # == Returns:
    #   err
    def release_delete(account_id, distribution_id, id)
      path = sprintf("/api/v2/accounts/%s/distributions/%s/releases/%s", account_id, distribution_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "DELETE", path, reqHelper.ctype, reqHelper.body, 204)
      if err != nil
        return nil, err
      end
      
      return err
    end
  
    # Publish a release for production.
    # API Path: /api/v2/accounts/:account_id/distributions/:distribution_id/releases/:id/publish
    # == Parameters:
    # account_id::
    #   account_id
    # distribution_id::
    #   distribution_id
    # id::
    #   id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Release
    #   err
    def release_publish(account_id, distribution_id, id)
      path = sprintf("/api/v2/accounts/%s/distributions/%s/releases/%s/publish", account_id, distribution_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "POST", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::Release.new(JSON.load(rc.body)), err
    end
  
    # Get details on a single release.
    # API Path: /api/v2/accounts/:account_id/distributions/:distribution_id/releases/:id
    # == Parameters:
    # account_id::
    #   account_id
    # distribution_id::
    #   distribution_id
    # id::
    #   id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Release
    #   err
    def release_show(account_id, distribution_id, id)
      path = sprintf("/api/v2/accounts/%s/distributions/%s/releases/%s", account_id, distribution_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::Release.new(JSON.load(rc.body)), err
    end
  
    # Update an existing release.
    # API Path: /api/v2/accounts/:account_id/distributions/:distribution_id/releases/:id
    # == Parameters:
    # account_id::
    #   account_id
    # distribution_id::
    #   distribution_id
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::ReleasesParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Release
    #   err
    def release_update(account_id, distribution_id, id, params)
      path = sprintf("/api/v2/accounts/%s/distributions/%s/releases/%s", account_id, distribution_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::ReleasesParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::ReleasesParams")
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
      
      return PhraseApp::ResponseObjects::Release.new(JSON.load(rc.body)), err
    end
  
    # List all releases for the given distribution.
    # API Path: /api/v2/accounts/:account_id/distributions/:distribution_id/releases
    # == Parameters:
    # account_id::
    #   account_id
    # distribution_id::
    #   distribution_id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::ReleasePreview
    #   err
    def releases_list(account_id, distribution_id, page, per_page)
      path = sprintf("/api/v2/accounts/%s/distributions/%s/releases", account_id, distribution_id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request_paginated(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
      if err != nil
        return nil, err
      end
      
      return JSON.load(rc.body).map { |item| PhraseApp::ResponseObjects::ReleasePreview.new(item) }, err
    end
  
    # Create a new screenshot.
    # API Path: /api/v2/projects/:project_id/screenshots
    # == Parameters:
    # project_id::
    #   project_id
    # params::
    #   Parameters of type PhraseApp::RequestParams::ScreenshotParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Screenshot
    #   err
    def screenshot_create(project_id, params)
      path = sprintf("/api/v2/projects/%s/screenshots", project_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::ScreenshotParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::ScreenshotParams")
        end
      end
      if params.description != nil
        data_hash["description"] = params.description
      end

      if params.filename != nil
        post_body = []
        post_body << "--#{PhraseApp::MULTIPART_BOUNDARY}\r\n"
        post_body << "Content-Disposition: form-data; name=\"filename\"; filename=\"#{File.basename(params.filename )}\"\r\n"
        post_body << "Content-Type: text/plain\r\n"
        post_body << "\r\n"
        post_body << File.read(params.filename)
        post_body << "\r\n"
      end

      if params.name != nil
        data_hash["name"] = params.name
      end

  
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "POST", path, reqHelper.ctype, reqHelper.body, 201)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::Screenshot.new(JSON.load(rc.body)), err
    end
  
    # Delete an existing screenshot.
    # API Path: /api/v2/projects/:project_id/screenshots/:id
    # == Parameters:
    # project_id::
    #   project_id
    # id::
    #   id
    #
    # == Returns:
    #   err
    def screenshot_delete(project_id, id)
      path = sprintf("/api/v2/projects/%s/screenshots/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "DELETE", path, reqHelper.ctype, reqHelper.body, 204)
      if err != nil
        return nil, err
      end
      
      return err
    end
  
    # Get details on a single screenshot for a given project.
    # API Path: /api/v2/projects/:project_id/screenshots/:id
    # == Parameters:
    # project_id::
    #   project_id
    # id::
    #   id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Screenshot
    #   err
    def screenshot_show(project_id, id)
      path = sprintf("/api/v2/projects/%s/screenshots/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::Screenshot.new(JSON.load(rc.body)), err
    end
  
    # Update an existing screenshot.
    # API Path: /api/v2/projects/:project_id/screenshots/:id
    # == Parameters:
    # project_id::
    #   project_id
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::ScreenshotParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Screenshot
    #   err
    def screenshot_update(project_id, id, params)
      path = sprintf("/api/v2/projects/%s/screenshots/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::ScreenshotParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::ScreenshotParams")
        end
      end
      if params.description != nil
        data_hash["description"] = params.description
      end

      if params.filename != nil
        post_body = []
        post_body << "--#{PhraseApp::MULTIPART_BOUNDARY}\r\n"
        post_body << "Content-Disposition: form-data; name=\"filename\"; filename=\"#{File.basename(params.filename )}\"\r\n"
        post_body << "Content-Type: text/plain\r\n"
        post_body << "\r\n"
        post_body << File.read(params.filename)
        post_body << "\r\n"
      end

      if params.name != nil
        data_hash["name"] = params.name
      end

  
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "PATCH", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::Screenshot.new(JSON.load(rc.body)), err
    end
  
    # Create a new screenshot marker.
    # API Path: /api/v2/projects/:project_id/screenshots/:screenshot_id/markers
    # == Parameters:
    # project_id::
    #   project_id
    # screenshot_id::
    #   screenshot_id
    # params::
    #   Parameters of type PhraseApp::RequestParams::ScreenshotMarkerParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::ScreenshotMarker
    #   err
    def screenshot_marker_create(project_id, screenshot_id, params)
      path = sprintf("/api/v2/projects/%s/screenshots/%s/markers", project_id, screenshot_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::ScreenshotMarkerParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::ScreenshotMarkerParams")
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
      
      return PhraseApp::ResponseObjects::ScreenshotMarker.new(JSON.load(rc.body)), err
    end
  
    # Delete an existing screenshot marker.
    # API Path: /api/v2/projects/:project_id/screenshots/:screenshot_id/markers
    # == Parameters:
    # project_id::
    #   project_id
    # screenshot_id::
    #   screenshot_id
    #
    # == Returns:
    #   err
    def screenshot_marker_delete(project_id, screenshot_id)
      path = sprintf("/api/v2/projects/%s/screenshots/%s/markers", project_id, screenshot_id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "DELETE", path, reqHelper.ctype, reqHelper.body, 204)
      if err != nil
        return nil, err
      end
      
      return err
    end
  
    # Get details on a single screenshot marker for a given project.
    # API Path: /api/v2/projects/:project_id/screenshots/:screenshot_id/markers/:id
    # == Parameters:
    # project_id::
    #   project_id
    # screenshot_id::
    #   screenshot_id
    # id::
    #   id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::ScreenshotMarker
    #   err
    def screenshot_marker_show(project_id, screenshot_id, id)
      path = sprintf("/api/v2/projects/%s/screenshots/%s/markers/%s", project_id, screenshot_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200)
      if err != nil
        return nil, err
      end
      
      return PhraseApp::ResponseObjects::ScreenshotMarker.new(JSON.load(rc.body)), err
    end
  
    # Update an existing screenshot marker.
    # API Path: /api/v2/projects/:project_id/screenshots/:screenshot_id/markers
    # == Parameters:
    # project_id::
    #   project_id
    # screenshot_id::
    #   screenshot_id
    # params::
    #   Parameters of type PhraseApp::RequestParams::ScreenshotMarkerParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::ScreenshotMarker
    #   err
    def screenshot_marker_update(project_id, screenshot_id, params)
      path = sprintf("/api/v2/projects/%s/screenshots/%s/markers", project_id, screenshot_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::ScreenshotMarkerParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::ScreenshotMarkerParams")
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
      
      return PhraseApp::ResponseObjects::ScreenshotMarker.new(JSON.load(rc.body)), err
    end
  
    # List all screenshot markers for the given project.
    # API Path: /api/v2/projects/:project_id/screenshots/:id/markers
    # == Parameters:
    # project_id::
    #   project_id
    # id::
    #   id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::ScreenshotMarker
    #   err
    def screenshot_markers_list(project_id, id, page, per_page)
      path = sprintf("/api/v2/projects/%s/screenshots/%s/markers", project_id, id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request_paginated(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
      if err != nil
        return nil, err
      end
      
      return JSON.load(rc.body).map { |item| PhraseApp::ResponseObjects::ScreenshotMarker.new(item) }, err
    end
  
    # List all screenshots for the given project.
    # API Path: /api/v2/projects/:project_id/screenshots
    # == Parameters:
    # project_id::
    #   project_id
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Screenshot
    #   err
    def screenshots_list(project_id, page, per_page)
      path = sprintf("/api/v2/projects/%s/screenshots", project_id)
      data_hash = {}
      post_body = nil
  
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request_paginated(@credentials, "GET", path, reqHelper.ctype, reqHelper.body, 200, page, per_page)
      if err != nil
        return nil, err
      end
      
      return JSON.load(rc.body).map { |item| PhraseApp::ResponseObjects::Screenshot.new(item) }, err
    end
  
    # Show details for current User.
    # API Path: /api/v2/user
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
    # API Path: /api/v2/projects/:project_id/styleguides
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
    # API Path: /api/v2/projects/:project_id/styleguides/:id
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
    # API Path: /api/v2/projects/:project_id/styleguides/:id
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
    # API Path: /api/v2/projects/:project_id/styleguides/:id
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
    # API Path: /api/v2/projects/:project_id/styleguides
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
    # API Path: /api/v2/projects/:project_id/tags
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
    # API Path: /api/v2/projects/:project_id/tags/:name
    # == Parameters:
    # project_id::
    #   project_id
    # name::
    #   name
    # params::
    #   Parameters of type PhraseApp::RequestParams::TagDeleteParams
    #
    # == Returns:
    #   err
    def tag_delete(project_id, name, params)
      path = sprintf("/api/v2/projects/%s/tags/%s", project_id, name)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::TagDeleteParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::TagDeleteParams")
        end
      end
  
      data_hash = params.to_h
      err = params.validate
      if err != nil
        return nil, err
      end
      reqHelper = PhraseApp::ParamsHelpers::BodyTypeHelper.new(data_hash, post_body)
      rc, err = PhraseApp.send_request(@credentials, "DELETE", path, reqHelper.ctype, reqHelper.body, 204)
      if err != nil
        return nil, err
      end
      
      return err
    end
  
    # Get details and progress information on a single tag for a given project.
    # API Path: /api/v2/projects/:project_id/tags/:name
    # == Parameters:
    # project_id::
    #   project_id
    # name::
    #   name
    # params::
    #   Parameters of type PhraseApp::RequestParams::TagShowParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::TagWithStats
    #   err
    def tag_show(project_id, name, params)
      path = sprintf("/api/v2/projects/%s/tags/%s", project_id, name)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::TagShowParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::TagShowParams")
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
      
      return PhraseApp::ResponseObjects::TagWithStats.new(JSON.load(rc.body)), err
    end
  
    # List all tags for the given project.
    # API Path: /api/v2/projects/:project_id/tags
    # == Parameters:
    # project_id::
    #   project_id
    # params::
    #   Parameters of type PhraseApp::RequestParams::TagsListParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Tag
    #   err
    def tags_list(project_id, page, per_page, params)
      path = sprintf("/api/v2/projects/%s/tags", project_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::TagsListParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::TagsListParams")
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
      
      return JSON.load(rc.body).map { |item| PhraseApp::ResponseObjects::Tag.new(item) }, err
    end
  
    # Create a translation.
    # API Path: /api/v2/projects/:project_id/translations
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
    # API Path: /api/v2/projects/:project_id/translations/:id
    # == Parameters:
    # project_id::
    #   project_id
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::TranslationShowParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::TranslationDetails
    #   err
    def translation_show(project_id, id, params)
      path = sprintf("/api/v2/projects/%s/translations/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::TranslationShowParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::TranslationShowParams")
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
      
      return PhraseApp::ResponseObjects::TranslationDetails.new(JSON.load(rc.body)), err
    end
  
    # Update an existing translation.
    # API Path: /api/v2/projects/:project_id/translations/:id
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
    # API Path: /api/v2/projects/:project_id/keys/:key_id/translations
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
    # API Path: /api/v2/projects/:project_id/locales/:locale_id/translations
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
    # API Path: /api/v2/projects/:project_id/translations/exclude
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
    # API Path: /api/v2/projects/:project_id/translations/include
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
    # API Path: /api/v2/projects/:project_id/translations
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
  
    # Search translations for the given project. Provides the same search interface as <code>translations#index</code> but allows POST requests to avoid limitations imposed by GET requests. If you want to download all translations for one locale we recommend to use the <code>locales#download</code> endpoint.
    # API Path: /api/v2/projects/:project_id/translations/search
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
    # API Path: /api/v2/projects/:project_id/translations/unverify
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
    # API Path: /api/v2/projects/:project_id/translations/verify
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
    # API Path: /api/v2/projects/:project_id/uploads
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
      if params.autotranslate != nil
        data_hash["autotranslate"] = (params.autotranslate == true)
      end

      if params.branch != nil
        data_hash["branch"] = params.branch
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

      if params.locale_mapping != nil
        params.locale_mapping.each do |key, value|
          data_hash["locale_mapping"][key] = value
        end
      end

      if params.mark_reviewed != nil
        data_hash["mark_reviewed"] = (params.mark_reviewed == true)
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

      if params.update_descriptions != nil
        data_hash["update_descriptions"] = (params.update_descriptions == true)
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
    # API Path: /api/v2/projects/:project_id/uploads/:id
    # == Parameters:
    # project_id::
    #   project_id
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::UploadShowParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Upload
    #   err
    def upload_show(project_id, id, params)
      path = sprintf("/api/v2/projects/%s/uploads/%s", project_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::UploadShowParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::UploadShowParams")
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
      
      return PhraseApp::ResponseObjects::Upload.new(JSON.load(rc.body)), err
    end
  
    # List all uploads for the given project.
    # API Path: /api/v2/projects/:project_id/uploads
    # == Parameters:
    # project_id::
    #   project_id
    # params::
    #   Parameters of type PhraseApp::RequestParams::UploadsListParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::Upload
    #   err
    def uploads_list(project_id, page, per_page, params)
      path = sprintf("/api/v2/projects/%s/uploads", project_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::UploadsListParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::UploadsListParams")
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
      
      return JSON.load(rc.body).map { |item| PhraseApp::ResponseObjects::Upload.new(item) }, err
    end
  
    # Get details on a single version.
    # API Path: /api/v2/projects/:project_id/translations/:translation_id/versions/:id
    # == Parameters:
    # project_id::
    #   project_id
    # translation_id::
    #   translation_id
    # id::
    #   id
    # params::
    #   Parameters of type PhraseApp::RequestParams::VersionShowParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::TranslationVersionWithUser
    #   err
    def version_show(project_id, translation_id, id, params)
      path = sprintf("/api/v2/projects/%s/translations/%s/versions/%s", project_id, translation_id, id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::VersionShowParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::VersionShowParams")
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
      
      return PhraseApp::ResponseObjects::TranslationVersionWithUser.new(JSON.load(rc.body)), err
    end
  
    # List all versions for the given translation.
    # API Path: /api/v2/projects/:project_id/translations/:translation_id/versions
    # == Parameters:
    # project_id::
    #   project_id
    # translation_id::
    #   translation_id
    # params::
    #   Parameters of type PhraseApp::RequestParams::VersionsListParams
    #
    # == Returns:
    #   PhraseApp::ResponseObjects::TranslationVersion
    #   err
    def versions_list(project_id, translation_id, page, per_page, params)
      path = sprintf("/api/v2/projects/%s/translations/%s/versions", project_id, translation_id)
      data_hash = {}
      post_body = nil
  
      if params.present?
        unless params.kind_of?(PhraseApp::RequestParams::VersionsListParams)
          raise PhraseApp::ParamsHelpers::ParamsError.new("Expects params to be kind_of PhraseApp::RequestParams::VersionsListParams")
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
      
      return JSON.load(rc.body).map { |item| PhraseApp::ResponseObjects::TranslationVersion.new(item) }, err
    end
  
    # Create a new webhook.
    # API Path: /api/v2/projects/:project_id/webhooks
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
    # API Path: /api/v2/projects/:project_id/webhooks/:id
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
    # API Path: /api/v2/projects/:project_id/webhooks/:id
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
    # API Path: /api/v2/projects/:project_id/webhooks/:id/test
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
    # API Path: /api/v2/projects/:project_id/webhooks/:id
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
    # API Path: /api/v2/projects/:project_id/webhooks
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
