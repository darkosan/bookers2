class Book < ApplicationRecord
  has_one_attached :book
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true

   def get_image
    if image.attached?
      file_path = Rails.root.join('app/assets/images/profile_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
   end

end