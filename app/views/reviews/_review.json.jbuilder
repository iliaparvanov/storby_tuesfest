json.extract! review, :id, :text, :recommended, :game, :user, :created_at, :updated_at
json.url review_url(review, format: :json)
