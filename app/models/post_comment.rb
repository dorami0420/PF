class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :stray_cat
  
  
end
