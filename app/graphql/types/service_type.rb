module Types
    class ServiceType < BaseObject
      graphql_name "Service"
      description "A service that the raspberry pi controls"
  
      field :name, String, null: false
      field :on_duration, Integer, null: false
      field :off_duration, Integer, null: false
    end
  end
  