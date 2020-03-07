# frozen_string_literal: true

require "test_helper"

class ConfigurationTest < Minitest::Test
  def test_initialize_uses_rails_secrets
    assert_equal FAKE_KEY, HasEncryptedField::Configuration.new.secret_key
  end
end
