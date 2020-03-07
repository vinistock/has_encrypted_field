# frozen_string_literal: true

module HasEncryptedField # :nodoc:
  extend ActiveSupport::Concern

  # ClassMethods
  #
  # These methods are added to classes that include
  # the HasEncryptedField module.
  module ClassMethods
    # rubocop:disable Naming/PredicateName
    def has_encrypted_field(attribute)
      class_eval(<<~ACCESSORS, __FILE__, __LINE__ + 1)
        def decrypted_#{attribute}
          HasEncryptedField.encryptor.decrypt_and_verify(self[:#{attribute}])
        end

        def #{attribute}=(value)
          self[:#{attribute}] = HasEncryptedField.encryptor.encrypt_and_sign(value)
        end
      ACCESSORS
    end
    # rubocop:enable Naming/PredicateName
  end
end
