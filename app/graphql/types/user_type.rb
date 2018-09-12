module Types
    class UserType < BaseObject
      graphql_name "User"
      description "A single user"
  
      field :full_name, String, null: false
      field :email, String, null: false
    end
  end
  