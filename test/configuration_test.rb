# frozen_string_literal: true

require "test_helper"

class ConfigurationTest < Minitest::Test
  def test_initialize_uses_rails_secrets
    Rails::Secrets.expects(:key).returns("Blah")

    assert_equal "Blah", HasEncryptedField::Configuration.new.secret_key
  end
end
