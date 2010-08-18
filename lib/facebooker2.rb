# Provides rails helpers for interfacing with Facebook's OpenGraph Javascript
# API, http://developers.facebook.com/docs/reference/javascript/.

require "mogli"
require "facebooker2/rails/controller"
require "facebooker2/rails/helpers/facebook_connect"
require "facebooker2/rails/helpers/javascript"
require "facebooker2/rails/helpers/request_forms"
require "facebooker2/rails/helpers/user"
require "facebooker2/rails/helpers"
require "facebooker2/not_configured"

module Facebooker2

  # provide cached access to configuration
  class << self
    attr_accessor :api_key, :secret, :app_id
  end

  # provide cached access to the configured application secret
  def self.secret
    @secret || raise_unconfigured_exception
  end

  # provide cached access to the configured app_id
  def self.app_id
    @app_id || raise_unconfigured_exception
  end

  # when configuration is missing, raise exception
  def self.raise_unconfigured_exception
    raise NotConfigured.new("No configuration provided for Facebooker2. Either set the app_id and secret or call Facebooker2.load_facebooker_yaml in an initializer")
  end

  # load configuration from hash
  def self.configuration=(hash)
    self.api_key = hash[:api_key]
    self.secret = hash[:secret]
    self.app_id = hash[:app_id]
  end

  # read configuration from yaml config file
  def self.load_facebooker_yaml
    config = YAML.load(File.read(File.join(::Rails.root,"config","facebooker.yml")))[::Rails.env]
    raise NotConfigured.new("Unable to load configuration for #{::Rails.env} from facebooker.yml. Is it set up?") if config.nil?
    self.configuration = config.with_indifferent_access
  end

  # flexible access to facebook_id of user from several possible object types
  def self.cast_to_facebook_id(object)
    if object.kind_of?(Mogli::Profile)
      object.id
    elsif object.respond_to?(:facebook_id)
      object.facebook_id
    else
      object
    end
  end

end
