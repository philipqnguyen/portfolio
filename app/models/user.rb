# User data and dependent on devise
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :articles, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, foreign_key: 'author_id'

  def author?
    role == 'author'
  end

  def editor?
    role == 'editor'
  end
end
