# frozen_string_literal: true
module Inputs
    class SensorDataInput < BaseInput
      argument :temperature, Float, required: false
      argument :humidity, Float, required: false
    end
  end
  