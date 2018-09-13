class User < ApplicationRecord
<<<<<<< HEAD
  validates :email, presence: true
  validates :firebase_id, presence: true
  validates :username, presence: true

=======
<<<<<<< HEAD
>>>>>>> Resolves merge conflict in schema
  has_many :itineraries
end
=======
  validates :email, presence: true
  validates :firebase_id, presence: true
  validates :username, presence: true
end
>>>>>>> Adds email, firebase_id, and username to User model
