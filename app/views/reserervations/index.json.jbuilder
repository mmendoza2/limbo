json.array!(@reserervations) do |reserervation|
  json.extract! reserervation, 
  json.url reserervation_url(reserervation, format: :json)
end
