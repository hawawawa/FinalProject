class CreateTables < ActiveRecord::Migration

  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.timestamps
    end

    create_table :movies do |t|
      t.string :name
      t.string :director
      t.string :year
      t.string :poster_url
      t.timestamps

      t.references :user
    end

    create_table :reviews do |t|
      t.string :rating
      t.string :comments
      t.timestamps
      t.references :user
      t.references :movie
      # link user id to review id
    end

    create_table :favorites do |t|
      t.timestamps
      t.references :user
      t.references :movie
      # link user id to review id
    end

  end

end


# user > movies
#      > reviews



#One user can create multiple reviews
#One movie can have multiple reviews
#One review has one user and one movie


# One user can create mutiple movies
# One user can favorite mutiple movies
# One user can have many reviews
# One movie has many reviews


# movie has one user thru creators


    # create_table :creators do |t|
    #   t.references :users
    #   t.references :movies
    # end

    # create_table :favorites do |t|
    #   t.references :users
    #   t.references :movies
    # end
