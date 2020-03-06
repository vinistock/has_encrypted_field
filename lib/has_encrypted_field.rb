# frozen_string_literal: true

require "has_encrypted_field/version"
require "has_encrypted_field/configuration"
require "active_support/concern"
require "active_support/message_encryptor"

module HasEncryptedField
  extend ActiveSupport::Concern

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
  end

  module ClassMethods
    def has_encrypted_field(attribute)
      class_eval(<<~ACCESSORS, __FILE__, __LINE__ + 1)
          def #{attribute}
            HasEncryptedField.encryptor.decrypt_and_verify(self[:#{attribute}])
          end

          def #{attribute}=(value)
            self[:#{attribute}] = HasEncryptedField.encryptor.encrypt_and_sign(value)
          end
      ACCESSORS
    end
  end
end