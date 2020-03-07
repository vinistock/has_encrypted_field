# frozen_string_literal: true

require "test_helper"

class QueryMethodsTest < Minitest::Test
  def setup
    User.destroy_all
    @user1 = User.create!(email: "user_1@example.com")
    @user2 = User.create!(email: "user_2@example.com")
  end

  def test_pluck_decrypted
    encrypted = User.pluck(:email)

    refute_includes encrypted, "user_1@example.com"
    refute_includes encrypted, "user_2@example.com"

    assert_equal %w[user_1@example.com user_2@example.com], User.pluck_decrypted(:email)
  end
end
