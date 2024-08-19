json.extract! bill, :id, :amount, :status, :bill_type, :submitted_by, :created_at, :updated_at
json.url bill_url(bill, format: :json)
