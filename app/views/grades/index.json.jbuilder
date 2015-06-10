json.array!(@grades) do |grade|
  json.extract! grade, :id, :assignment_id, :score, :student_id
  json.url grade_url(grade, format: :json)
end
