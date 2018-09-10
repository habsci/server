# frozen_string_literal: true

# Adapted from
# https://github.com/Shopify/shopify/blob/8d924a3c3e9c067a00d99b46118673a7c6bc14b3/components/platform/app/models/graph_api/user_error.rb
module Types
    class UserErrorType < BaseObject
      description "Represents an error in the input of a mutation."
  
      field :message, String, "The error message.", null: false
      field :field, [String], "Path to input field which caused the error.",
        null: false
  
      Data = Struct.new(:message, :field)
  
      class << self
        def errors_from(obj)
          return [] unless obj
          user_errors = []
          obj.errors.messages.each do |field, messages|
            error_field_name = field_name(field)
  
            messages.each do |message|
              message = obj.errors.full_message(field, message)
              user_errors << Data.new(message, error_field_name)
            end
          end
          user_errors
        end
  
        def errors_from_hash(errors)
          user_errors = []
          errors.each do |field, message|
            user_errors << Data.new(message, field_name(field))
          end
          user_errors
        end
  
        private
  
        def field_name(field)
          field_name = [field]
          field_name.map! { |segment| segment.to_s.camelize(:lower) }
        end
      end
    end
  end
  