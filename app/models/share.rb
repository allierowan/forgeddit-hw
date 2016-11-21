class Share < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :votes
  validates :title, presence: true, length: { maximum: 200 }

  def net_votes
    self.votes.reduce(0) { |sum, vote| sum + vote.value }
  end

end
