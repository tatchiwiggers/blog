class Article < ApplicationRecord
  # has_one_attached :avatar (for user model)
  has_many_attached :photos # change the form

end
