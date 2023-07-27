class StrayCat < ApplicationRecord
    has_one_attached :image
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :image, presence: true

   geocoded_by :address
   after_validation :geocode, if: :address_changed?

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.ransackable_attributes(auth_object = nil)
    ["color", "place", "caption"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["favorites", "image_attachment", "image_blob", "post_comments", "user"]
  end
end
