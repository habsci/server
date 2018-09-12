# frozen_string_literal: true
require 'test_helper'

module Mutations
  class UserCreateTest < ActiveSupport::TestCase
    def execute(params = {})
      query_string = 'mutation($userInput: UserInput!) {
        userCreate(userInput: $userInput) {
          user {
            fullName
            email
          }
          userErrors {
            message
          }
        }
      }'

      ServerSchema.execute(
        query_string,
        context: {},
        variables: {
          'userInput' => {
            'fullName' => params[:full_name],
            'email' => params[:email],
          },
        },
      )['data']['userCreate']
    end

    test "Create a user" do
      create_user_params = {
        full_name: 'Jeffrey Goldmsith',
        email: 'test@123.ca'
      }
      data = execute(create_user_params).to_h
      user = data['user']

      assert_equal 'Jeffrey Goldmsith', user["fullName"]
      assert_equal 'test@123.ca', user["email"]
    end

    test "Returns correct errors for each field if no fields are provided" do
        create_user_params = {}
        data = execute(create_user_params).to_h

        user_errors = data['userErrors']

        assert_includes(user_errors, "message" => "Full name can't be blank")
        assert_includes(user_errors, "message" => "Email can't be blank")
    end
  end
end