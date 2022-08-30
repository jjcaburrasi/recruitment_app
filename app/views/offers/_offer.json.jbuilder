json.extract! offer, :id, :content, :user_id, :job_id, :status, :created_at, :updated_at
json.url offer_url(offer, format: :json)
