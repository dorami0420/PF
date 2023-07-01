class PostComment < ApplicationRecord
   belongs_to :user
  belongs_to :stray_cat
  belongs_to :protective_cat
  
end
