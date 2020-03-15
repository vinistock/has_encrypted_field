# frozen_string_literal: true

module HasEncryptedField # :nodoc:
  extend ActiveSupport::Concern

  # ClassMethods
  #
  # These methods are added to classes that include
  # the HasEncryptedField module.
  module ClassMethods
    def pluck_decrypted(*attributes)
      attributes.length == 1 ? decrypt_simple(attributes) : decrypt_nested(attributes)
    end

    def decrypt_nested(attributes)
      encrypted_fields = HasEncryptedField.registered_fields[to_s]

      pluck(*attributes).map! do |tuple|
        tuple.map!.with_index do |attr, index|
          if encrypted_fields.include?(attributes[index])
            HasEncryptedField.encryptor.decrypt_and_verify(attr)
          else
            attr
          end
        end
      end
    end

    def decrypt_simple(attributes)
      pluck(*attributes)
        .map! { |attr| HasEncryptedField.encryptor.decrypt_and_verify(attr) }
    end
  end
end
