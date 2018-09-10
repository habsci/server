module Mutations
    class SensorDataCreate < BaseMutation
      description "Create a sensor data point"
  
      argument :sensor_data_input, Inputs::SensorDataInput, required: true
  
      field :sensor_data, Types::SensorDataType, null: true
      field :user_errors, [Types::UserErrorType], null: false
  
      def resolve(args)
        sensor_data_input = args[:sensor_data_input]
        sensor_data = SensorData.create(
          temperature: sensor_data_input[:temperature],
          humidity: sensor_data_input[:humidity],
        )
  
        {
          sensor_data: sensor_data.valid? ? sensor_data : nil,
          user_errors: Types::UserErrorType.errors_from(sensor_data),
        }
      end
    end
  end
  