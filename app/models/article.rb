# Article data
class Article < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  # has_many :comments, dependent: :destroy
  has_many :comments, as: :commentable
end
