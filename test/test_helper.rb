# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)

require "has_encrypted_field"
require "minitest/autorun"
require "mocha/minitest"
require "rails/all"
require "byebug"
require "sqlite3"

FAKE_KEY = SecureRandom.random_bytes(32)
ENV["RAILS_MASTER_KEY"] = FAKE_KEY

HasEncryptedField.configure do |config|
  config.secret_key = FAKE_KEY
end

ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: ":memory:")
ActiveRecord::Schema.define do
  create_table :users, force: true do |t|
    t.string :email
  end
end

class User < ActiveRecord::Base
  include HasEncryptedField

  has_encrypted_field :email
end
