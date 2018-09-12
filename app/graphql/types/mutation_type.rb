module Types
  class MutationType < Types::BaseObject

    field :sensor_data_create, mutation: Mutations::SensorDataCreate
    field :user_create, mutation: Mutations::UserCreate
  end
end
