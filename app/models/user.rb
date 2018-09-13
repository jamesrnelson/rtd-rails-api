class User < ApplicationRecord
  validates :email, presence: true
  validates :firebase_id, presence: true
  validates :username, presence: true
end