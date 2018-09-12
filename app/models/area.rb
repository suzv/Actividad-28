class Area < ApplicationRecord
  has_many :employees, dependent: :destroy
end
