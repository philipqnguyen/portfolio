# Commment model...
class Comment < ActiveRecord::Base
  # belongs_to :article
  # belongs_to :user

  belongs_to :commentable, polymorphic: true
end
