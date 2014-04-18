json.array!(@month_years) do |month_year|
  json.extract! month_year, :id
  json.url month_year_url(month_year, format: :json)
end
