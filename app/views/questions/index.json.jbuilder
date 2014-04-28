json.array!(@questions) do |question|
  json.extract! question, :id, :name, :id, :user_id, :text
  json.url question_url(question, format: :json)
end
