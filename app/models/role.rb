class Role < ApplicationRecord
  has_and_belongs_to_many :users

  validates :name, presence: true, uniqueness: true, inclusion: { in: User::VALID_ROLES }
end
