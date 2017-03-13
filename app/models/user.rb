class User < ApplicationRecord
  has_secure_password
#  has_many :posts,foreign_key: "user_id"
  #has_many :follow, foreign_key: "user_id"
end
