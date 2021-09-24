This unfinished experiment is no longer active. It did not work and should not be used.

# HasEncryptedField

This gem provides support for encrypted attributes for models based on activerecord.

It will encrypt the desired values inside model instances and save encrypted values to the database.

## Installation

Not published

## Usage

Include the `HasEncryptedField` module inside the desired models and declare fields.

```ruby
class User < ApplicationRecord
  include HasEncryptedField

  has_encrypted_field :email
end

# The writer encrypts
user = User.create!(email: "user@example.com")
p user
=> #<User id: 1, email: "eXhzeEJ1ejRvOVE2VGFiU0V6Y0NPMWJybjd6a005c1F3RGh0R3...">

# The reader decrypts
p user.decrypted_email
=> "user@example.com"

# Pluck decrypted fields
p User.pluck_decrypted(:email)
=> ["user@example.com"]

# Pluck including encrypted and regular fields
p User.pluck_decrypted(:id, :email)
=> [[1, "user@example.com"]]
```

### Available configuration and defaults

```ruby
HasEncryptedField.configure do |config|
  config.secret_key = ENV["RAILS_MASTER_KEY"] || contents of master.key
end
```

### Warning

Remember that using this gem to save encrypted fields to the database will always require the original master key in order to decrypt data.

It will not be possible to recover data encrypted if the original master key is lost.
