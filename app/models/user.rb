class User < ApplicationRecord
<<<<<<< HEAD
<<<<<<< HEAD
  validates :email, presence: true
  validates :firebase_id, presence: true
  validates :username, presence: true

=======
<<<<<<< HEAD
>>>>>>> Resolves merge conflict in schema
=======
>>>>>>> resolves merge conflicts in user model
  has_many :itineraries
  validates :email, presence: true
  validates :uid, presence: true
end
