class ProtectiveCat < ApplicationRecord
    has_one_attached :image
  belongs_to :user
  has_many :p_post_comments, dependent: :destroy
  has_many :p_favorites, dependent: :destroy

  validates :name, presence: true
  validates :image, presence: true

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def favorited_by?(user)
    p_favorites.exists?(user_id: user.id)
  end

  def self.ransackable_attributes(auth_object = nil)
    ["color", "place", "caption", "name", "neuter", "gender", "health" ]
  end

  def self.ransackable_associations(auth_object = nil)
    ["p_favorites", "image_attachment", "image_blob", "p_post_comments", "user"]
  end
end
