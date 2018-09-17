class Service < ApplicationRecord
    validates :name, :on_duration, :off_duration, presence: true
end
