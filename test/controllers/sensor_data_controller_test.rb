require 'test_helper'

class SensorDataControllerTest < ActionController::TestCase
  def valid_sensor_data_params
    {
      temperature: 5.5,
      humidity: 5.5
    }
  end

  test "#create with valid payload creates sensor_data" do
    assert_difference 'SensorData.count', 1 do
      post :create, params: valid_sensor_data_params
    end
  end
end
