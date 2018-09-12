module Mutations
    class UserCreate < BaseMutation
      description "Create a user"
  
      argument :user_input, Inputs::UserInput, required: true
  
      field :user, Types::UserType, null: true
      field :user_errors, [Types::UserErrorType], null: false
  
      def resolve(args)
        user_input = args[:user_input]
        user = User.create(
          full_name: user_input[:full_name],
          email: user_input[:email],
        )
  
        {
          user: user.valid? ? user : nil,
          user_errors: Types::UserErrorType.errors_from(user),
        }
      end
    end
  end
  