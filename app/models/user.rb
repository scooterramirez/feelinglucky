class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :all_except, ->(user) { where.not(id: user) }
  
  has_many :likes
  acts_as_liker
  acts_as_likeable

   acts_as_followable
   acts_as_follower

   acts_as_messageable

   def mailboxer_name
    self.name
  end

  def mailboxer_email(object)
    self.email
  end
  
end
