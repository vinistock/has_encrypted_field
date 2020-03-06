# frozen_string_literal: true

require "rails/secrets"

module HasEncryptedField
  class Configuration
    attr_accessor :secret_key

    def initialize
      @secret_key = Rails::Secrets.key
    end
  end
end
