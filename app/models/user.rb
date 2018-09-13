class User < ApplicationRecord
<<<<<<< HEAD
=======
  validates :email, presence: true
  validates :firebase_id, presence: true
  validates :username, presence: true

>>>>>>> fixes merge conflict in user
  has_many :itineraries
  validates :email, presence: true
  validates :uid, presence: true
end
