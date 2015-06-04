class User < ActiveRecord::Base
  has_many :reviews
  has_many :movies
  has_many :favorites


  # def reviews
  #   Review.where(user_id: self.id)
  # end

  # attr_reader + attr_writer = attr_accessor
  # attr_accessor :name, :address

  # def name
  #   @name
  # end

  # def name=(value)
  #   @name = value
  # end

  # def address
  #   @address
  # end
end


# user = User.create(username: "hi")
## create a new user with user name hi

# user.reviews.create(rating: "5")
## user "hi" creates a review



# user creates many reviews
# movie has many reviews
# review has one user and one movie
