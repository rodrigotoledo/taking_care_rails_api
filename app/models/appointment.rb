class Appointment < ApplicationRecord
  belongs_to :doctor, class_name: "User"
  belongs_to :patient, class_name: "User"

  validates :appointment_date, presence: true
  validates :status, inclusion: { in: %w[scheduled completed canceled rescheduled] }

  validate :doctor_must_be_doctor
  validate :patient_must_be_patient
  validate :appointment_date_cannot_be_in_past

  # Scopes úteis (mantidos os mesmos)
  scope :upcoming, -> { where("appointment_date >= ?", Time.current).order(:appointment_date) }
  scope :past, -> { where("appointment_date < ?", Time.current).order(appointment_date: :desc) }
  scope :by_doctor, ->(doctor_id) { where(doctor_id: doctor_id) }
  scope :by_patient, ->(patient_id) { where(patient_id: patient_id) }

  private

  def doctor_must_be_doctor
    errors.add(:doctor, "must have the doctor role") unless doctor&.doctor?
  end

  def patient_must_be_patient
    errors.add(:patient, "must have the patient role") unless patient&.patient?
  end

  def appointment_date_cannot_be_in_past
    if appointment_date.present? && appointment_date < Time.current
      errors.add(:appointment_date, "can't be in the past")
    end
  end
end
