class Contribution < ApplicationRecord
  belongs_to :user
  has_many :votes, dependent: :destroy
  has_many :voters, through: :votes, source: :user

  validates :title, :description, presence:  true

  def self.contributions
    where(contribution_type: 'contribution')
  end

  def self.interests
    where(contribution_type: 'interest')
  end

end
