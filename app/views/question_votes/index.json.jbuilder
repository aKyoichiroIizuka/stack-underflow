json.array!(@question_votes) do |question_vote|
  json.extract! question_vote, :id, :value, :question_id, :user_id
  json.url question_vote_url(question_vote, format: :json)
end
