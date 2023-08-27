class Book < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  attribute :Opinion, :text
  validates :Opinion, length: { maximum: 200 }
end
