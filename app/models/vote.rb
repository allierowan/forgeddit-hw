class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :share
  validates :value, numericality: { greater_than: -2, less_than: 2 }
  validates :user, uniqueness: { scope: :share, message: "User can only vote on a share once" }

end
