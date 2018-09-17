# frozen_string_literal: true
require 'test_helper'

module Mutations
  class ServiceCreateTest < ActiveSupport::TestCase
    def execute(params = {})
      query_string = 'mutation($serviceInput: ServiceInput!) {
        serviceCreate(serviceInput: $serviceInput) {
          service {
            name
            onDuration
            offDuration
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
          'serviceInput' => {
            'name' => params[:name],
            'onDuration' => params[:on_duration],
            'offDuration' => params[:off_duration],
          },
        },
      )['data']['serviceCreate']
    end

    test "Create a service" do
      create_service_params = {
        name: 'lights',
        on_duration: 12,
        off_duration: 13
      }
      data = execute(create_service_params).to_h
      service = data['service']

      assert_equal 'lights', service["name"]
      assert_equal 12, service["onDuration"]
      assert_equal 13, service["offDuration"]
    end

    test "Returns correct errors for each field if no fields are provided" do
        create_service_params = {}
        data = execute(create_service_params).to_h

        user_errors = data['userErrors']

        assert_includes(user_errors, "message" => "Name can't be blank")
        assert_includes(user_errors, "message" => "On duration can't be blank")
        assert_includes(user_errors, "message" => "Off duration can't be blank")
    end
  end
end