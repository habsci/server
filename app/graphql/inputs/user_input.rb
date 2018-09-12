# frozen_string_literal: true
module Inputs
    class UserInput < BaseInput
      argument :email, String, required: true
      argument :full_name, String, required: true
    end
  end
  