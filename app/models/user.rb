class User < ApplicationRecord
  VALID_ROLES = %w[admin doctor patient manager].freeze
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_and_belongs_to_many :roles

  validates :email_address, presence: true, email: true, uniqueness: true
  normalizes :email_address, with: ->(email) { email.strip.downcase }

  validate :roles_must_be_valid

  has_many :doctor_appointments, class_name: 'Appointment', foreign_key: 'doctor_id', dependent: :destroy
  has_many :patient_appointments, class_name: 'Appointment', foreign_key: 'patient_id', dependent: :destroy

  scope :doctors, -> { joins(:roles).where(roles: { name: 'doctor' }) }
  scope :patients, -> { joins(:roles).where(roles: { name: 'patient' }) }

  # Métodos auxiliares
  def doctor?
    roles.exists?(name: 'doctor')
  end

  def patient?
    roles.exists?(name: 'patient')
  end

  def admin?
    roles.exists?(name: 'admin')
  end

  def manager?
    roles.exists?(name: 'manager')
  end

  private

  def roles_must_be_valid
    role_names = roles.pluck(:name)
    invalid_roles = role_names - VALID_ROLES
    errors.add(:roles, "contains invalid roles: #{invalid_roles.to_sentence}") if invalid_roles.any?
  end
end
