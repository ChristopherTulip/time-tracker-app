json.array! @entries do |entry|
  json.id         entry.id
  json.started_at entry.started_at.to_formatted_s(:short)
  json.ended_at   entry.ended_at
end
