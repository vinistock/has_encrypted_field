# frozen_string_literal: true

require "test_helper"

class AccessorsTest < Minitest::Test
  def setup
    @user = User.new
  end

  def test_writer
    @user.email = "user@example.com"

    refute_equal "user@example.com", @user.email
  end

  def test_reader
    @user.email = "user@example.com"

    assert_equal "user@example.com", @user.decrypted_email
  end

  def test_attribute_assignment
    user = User.create!(email: "user@example.com")

    refute_equal "user@example.com", user[:email]
    assert_equal "user@example.com", user.decrypted_email
  end

  def test_registers_field
    HasEncryptedField.expects(:register).with("User", :name)

    User.has_encrypted_field :name
  end
end
