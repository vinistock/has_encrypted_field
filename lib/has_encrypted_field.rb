# frozen_string_literal: true

require "active_support/concern"
require "active_support/message_encryptor"
require "has_encrypted_field/version"
require "has_encrypted_field/configuration"
require "has_encrypted_field/accessors"
require "has_encrypted_field/query_methods"

module HasEncryptedField # :nodoc:
  class << self
    attr_writer :configuration

    def encryptor
      @encryptor ||= ActiveSupport::MessageEncryptor.new(configuration.secret_key)
    end

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end

    def registered_fields
      @registered_fields ||= {}
    end

    def register(class_name, field)
      registered_fields[class_name] ||= []
      registered_fields[class_name] << field
    end
  end
end
