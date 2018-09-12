class User < ApplicationRecord
    validates :full_name, :email, presence: true
end
