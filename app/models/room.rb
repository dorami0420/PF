class Room < ApplicationRecord
  scope :myrooms, -> (user) { where(user_id: user.id).or(where(owner_id: user.id)) }
  
  belongs_to :user
  belongs_to :owner, class_name: "User", foreign_key: :owner_id
  
  has_many :messages, dependent: :destroy
  
  def room_partner(current_user)
    user_data = [owner_id, user_id]
    User.find(user_data.select{|id| id != current_user.id }).first
  end
  
  def self.myroom(current_user, user_id)
     where(owner_id: current_user.id, user_id: user_id).or(where(owner_id: user_id, user_id: current_user.id)).first
  end
end

