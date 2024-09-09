class User < ApplicationRecord
  has_many :journals, dependent: :destroy
end
