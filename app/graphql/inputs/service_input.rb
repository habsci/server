# frozen_string_literal: true
module Inputs
    class ServiceInput < BaseInput
      argument :name, String, required: false
      argument :on_duration, Integer, required: false
      argument :off_duration, Integer, required: false
    end
  end
  