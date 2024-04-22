class HandType < ApplicationRecord
  has_many :hand_results, dependent: :destroy
end
