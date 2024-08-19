class Bill < ApplicationRecord
    belongs_to :submitted_by, class_name: 'Employee', foreign_key: 'submitted_by'
    validates :amount, :bill_type, :status, presence: true
  
    enum bill_type: {"food":0 , "travel":1, "others":2}
    enum status: {"pending":0, "approved":1 , "rejected":2}
end
