module Types
    class SensorDataType < BaseObject
      graphql_name "SensorData"
      description "Multiple pieces of sensor data"
  
      field :temperature, Float, null: false
      field :humidity, Float, null: false
    end
  end
  