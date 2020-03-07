# frozen_string_literal: true

module HasEncryptedField
  # Configuration
  #
  # This class holds all initializer configuration
  # for the gem.
  class Configuration
    attr_accessor :secret_key

    def initialize
      @secret_key = initialize_secret_key
    end

    private

    def initialize_secret_key
      ENV["RAILS_MASTER_KEY"] || read_key_from_file
    end

    def read_key_from_file
      path = Rails.root.join("config/master.key")

      File.binread(path).strip
    end
  end
end
