# frozen_string_literal: true

require "rails/secrets"

module HasEncryptedField
  # Configuration
  #
  # This class holds all initializer configuration
  # for the gem.
  class Configuration
    attr_accessor :secret_key

    def initialize
      @secret_key = Rails::Secrets.key
    end
  end
end
