class Book < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :Opinion, presence: true, length: { maximum: 200 }
end
