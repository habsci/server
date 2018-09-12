class SensorData < ApplicationRecord
    validates :temperature, :humidity, presence: true
end
