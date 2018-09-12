class SensorDataController < ApplicationController
    def create
        SensorData.create!(sensor_data_params)
    end

    def sensor_data_params
        params.permit(:humidity, :temperature)
    end
end
