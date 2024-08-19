class Employee < ApplicationRecord
    belongs_to :department
    has_many :bills, foreign_key: 'submitted_by'
    belongs_to :user

    validates :first_name, :last_name, :designation, :email, presence: true

    def full_name
        "#{first_name} #{last_name}"
    end
end
