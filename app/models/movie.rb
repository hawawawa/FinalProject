class Movie < ActiveRecord::Base
  has_many :reviews
  has_one :user
  has_many :favorites
end