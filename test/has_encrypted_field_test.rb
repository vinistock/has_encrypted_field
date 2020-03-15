# frozen_string_literal: true

require "test_helper"

class HasEncryptedFieldTest < Minitest::Test
  def test_encryptor
    assert_kind_of ActiveSupport::MessageEncryptor, HasEncryptedField.encryptor
  end

  def test_configuration
    assert_kind_of HasEncryptedField::Configuration, HasEncryptedField.configuration
  end

  def test_registered_fields
    assert_kind_of Hash, HasEncryptedField.registered_fields
  end

  def test_register
    HasEncryptedField.register("Post", :title)
    HasEncryptedField.register("Admin", :email)

    assert_equal [:title], HasEncryptedField.registered_fields["Post"]
    assert_equal [:email], HasEncryptedField.registered_fields["Admin"]
  end
end
