# frozen_string_literal: true
module Inputs
    class SensorDataInput < BaseInput
      argument :temperature, Float, required: true
      argument :humidity, Float, required: true
    end
  end
  