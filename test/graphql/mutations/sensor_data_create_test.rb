# frozen_string_literal: true
require 'test_helper'

module Mutations
  class SensorDataCreateTest < ActiveSupport::TestCase
    def execute(params = {})
      query_string = 'mutation($sensorDataInput: SensorDataInput!) {
        sensorDataCreate(sensorDataInput: $sensorDataInput) {
          sensorData {
            temperature
            humidity
          }
          userErrors {
            message
          }
        }
      }'

      ServerSchema.execute(
        query_string,
        context: {},
        variables: {
          'sensorDataInput' => {
            'temperature' => params[:temperature],
            'humidity' => params[:humidity],
          },
        },
      )['data']['sensorDataCreate']
    end

    test "Create a sensor data point" do
      create_sensor_data_params = {
        temperature: 55.5,
        humidity: 80.1
      }
      data = execute(create_sensor_data_params).to_h
      sensor_data = data['sensorData']

      assert_equal 55.5, sensor_data["temperature"]
      assert_equal 80.1, sensor_data["humidity"]
    end

    test "Returns correct errors for each field if no fields are provided" do
        create_sensor_data_params = {}
        data = execute(create_sensor_data_params).to_h

        user_errors = data['userErrors']

        assert_includes(user_errors, "message" => "Temperature can't be blank")
        assert_includes(user_errors, "message" => "Humidity can't be blank")
    end
  end
end
