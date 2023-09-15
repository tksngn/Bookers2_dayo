class Book < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, uniqueness: true, length: { maximum: 100 }
  validates :opinion, presence: true, uniqueness: true, length: { maximum: 200, message: "Opinion is too long (maximum is 200 characters)" }


  has_one_attached :profile_image

  def get_profile_image(width,height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

end
