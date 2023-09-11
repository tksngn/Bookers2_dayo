class Book < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, uniqueness: true, length: { maximum: 100 }
  validates :opinion, presence: { message: "Opinion can't be blank" }, length: { maximum: 200, message: "Opinion is too long (maximum is 200 characters)" }

end
