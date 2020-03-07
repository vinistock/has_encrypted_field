# frozen_string_literal: true

require "test_helper"

class HasEncryptedFieldTest < Minitest::Test
  def test_encryptor
    assert_kind_of ActiveSupport::MessageEncryptor, HasEncryptedField.encryptor
  end

  def test_configuration
    assert_kind_of HasEncryptedField::Configuration, HasEncryptedField.configuration
  end
end
