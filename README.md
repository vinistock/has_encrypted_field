[![Build Status](https://github.com/vinistock/has_encrypted_field/workflows/Ruby/badge.svg?branch=master)](https://github.com/vinistock/has_encrypted_field/actions)

# HasEncryptedField

This gem provides support for encrypted attributes for Rails models.

It will encrypt the desired values inside model instances.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "has_encrypted_field"
```

And then execute:

    $ bundle install

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
p user.email
=> "user@example.com"
```

### Available configuration and defaults

```ruby
HasEncryptedField.configure do |config|
  config.secret_key = Rails::Secrets.key # master.key or ENV["RAILS_MASTER_KEY"]
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/vinistock/has_encrypted_field.
