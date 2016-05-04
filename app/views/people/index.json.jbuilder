json.array!(@people) do |person|
  json.extract! person, :id, :nick_name, :nr, :bio, :birthday
  json.url person_url(person, format: :json)
end
