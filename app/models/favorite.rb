class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :stray_cat

  
end
