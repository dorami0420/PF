class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_one_attached :profile_image
  has_many :stray_cats, dependent: :destroy
  has_many :protective_cats, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :p_post_comments, dependent: :destroy
  has_many :p_favorites, dependent: :destroy

validates :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, presence: true
  #validates :first_name, presence: true
  #validates :last_name_kana, presence: true

    def get_profile_image(width, height)
    unless profile_image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
  profile_image.variant(resize_to_limit: [width, height]).processed
    end

end
