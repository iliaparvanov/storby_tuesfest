json.extract! game, :id, :name, :desc, :price, :created_at, :updated_at
json.url game_url(game, format: :json)
