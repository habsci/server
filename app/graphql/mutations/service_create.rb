module Mutations
    class ServiceCreate < BaseMutation
      description "Create a service"
  
      argument :service_input, Inputs::ServiceInput, required: true
  
      field :service, Types::ServiceType, null: true
      field :user_errors, [Types::UserErrorType], null: false
  
      def resolve(args)
        service_input = args[:service_input]
        service = Service.create(
          name: service_input[:name],
          on_duration: service_input[:on_duration],
          off_duration: service_input[:off_duration],
        )
  
        {
          service: service.valid? ? service : nil,
          user_errors: Types::UserErrorType.errors_from(service),
        }
      end
    end
  end
  