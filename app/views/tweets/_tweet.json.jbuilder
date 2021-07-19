json.extract! tweet, :id, :Text, :author_id, :created_at, :updated_at
json.url tweet_url(tweet, format: :json)
