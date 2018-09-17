class ServiceController < ApplicationController
    def create
        Service.create!(service_params)
    end

    def service_params
        params.permit(:name, :on_duration, :off_duration)
    end
end
