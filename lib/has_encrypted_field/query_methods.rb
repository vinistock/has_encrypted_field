# frozen_string_literal: true

module HasEncryptedField # :nodoc:
  extend ActiveSupport::Concern

  # ClassMethods
  #
  # These methods are added to classes that include
  # the HasEncryptedField module.
  module ClassMethods
    def pluck_decrypted(*attributes)
      pluck(*attributes)
        .map! { |attr| HasEncryptedField.encryptor.decrypt_and_verify(attr) }
    end
  end
end
