# Project data
class Project < ActiveRecord::Base
  validates :technologies_used, presence: true
  validates :name, length: { in: 4..255 }

  belongs_to :author, class_name: 'User'
  has_many :comments,  as: :commentable
end
