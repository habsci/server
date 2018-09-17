module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :all_sensor_data, [Types::SensorDataType], null: true
    field :all_users, [Types::UserType], null: true
    field :all_services, [Types::ServiceType], null: true

    def all_sensor_data
      SensorData.all
    end

    def all_users
      User.all
    end

    def all_services
      Service.all
    end
  end
end
