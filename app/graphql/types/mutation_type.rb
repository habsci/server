module Types
  class MutationType < Types::BaseObject

    field :sensor_data_create, mutation: Mutations::SensorDataCreate
    field :user_create, mutation: Mutations::UserCreate
    field :service_create, mutation: Mutations::ServiceCreate
  end
end
