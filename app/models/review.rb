class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie

  # def user
  #   User.find(self.user_id)
  # end

end

# some_review = Review.find(5)
# # <Review id: 5, user_id: 4>
# some_review.user
# # <User id: 4 #>


# Review.create (user_id: user.id, movie_id: movie.id, rating: "5", comments: "hihihi")