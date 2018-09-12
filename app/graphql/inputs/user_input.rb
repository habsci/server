# frozen_string_literal: true
module Inputs
    class UserInput < BaseInput
      argument :email, String, required: false
      argument :full_name, String, required: false
    end
  end
  