# frozen_string_literal: true

require "test_helper"

class HasEncryptedFieldTest < Minitest::Test
  def setup
    @user = User.new
  end

  def test_encryptor
    assert_kind_of ActiveSupport::MessageEncryptor, HasEncryptedField.encryptor
  end

  def test_writer
    @user.email = "user@example.com"

    refute_equal "user@example.com", @user[:email]
  end

  def test_reader
    @user.email = "user@example.com"

    assert_equal "user@example.com", @user.email
  end

  def test_attribute_assignment
    user = User.create!(email: "user@example.com")

    refute_equal "user@example.com", user[:email]
    assert_equal "user@example.com", user.email
  end
end
