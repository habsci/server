module Types
  class MutationType < Types::BaseObject

    field :sensor_data_create, mutation: Mutations::SensorDataCreate
  end
end
