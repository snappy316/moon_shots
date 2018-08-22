json.extract! satellite, :id, :last_telemetry_timestamp, :created_at, :updated_at
json.url satellite_url(satellite, format: :json)
