class GpsCoordinate
  include Mongoid::Document
  include Mongoid::Timestamps

  field :device_id, type: String
  field :longitude, type: String
  field :latitude, type: String
  field :captured_at, type: String
end
