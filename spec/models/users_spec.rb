require 'rails_helper'

RSpec.describe User, type: :model do
  it {should validate_presence_of :email}
<<<<<<< HEAD
<<<<<<< HEAD
  it {should validate_presence_of :uid}
=======
  it {should validate_presence_of :firebase_id}
  it {should validate_presence_of :username}
>>>>>>> resolves merge conflict
=======
  it {should validate_presence_of :uid}
>>>>>>> Resolves merge conflicts in Schema
end