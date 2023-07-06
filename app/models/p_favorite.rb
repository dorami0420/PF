class PFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :protective_cat
  
end
