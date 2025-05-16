class User < ApplicationRecord
  VALID_ROLES = %w[admin doctor patient manager].freeze
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_and_belongs_to_many :roles

  validates :email_address, presence: true, email: true, uniqueness: true
  normalizes :email_address, with: ->(email) { email.strip.downcase }

  validate :roles_must_be_valid

  private

  def roles_must_be_valid
    role_names = roles.pluck(:name)
    invalid_roles = role_names - VALID_ROLES
    errors.add(:roles, "contains invalid roles: #{invalid_roles.to_sentence}") if invalid_roles.any?
  end
end
