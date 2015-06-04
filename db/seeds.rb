
user = User.create(username: "test", email:"test@test.com", password: "test")

user.movies.create(
  name: "Jurassic world",
  director: "Colin Trevorrow",
  year: "2015",
  poster_url: "http://ia.media-imdb.com/images/M/MV5BMTQ5MTE0MTk3Nl5BMl5BanBnXkFtZTgwMjczMzk2NTE@._V1_SX640_SY720_.jpg"  
)

user.movies.create(
  name: "Avengers: Age of Ultron",
  director: "Jose Whedon",
  year: "2015",
  poster_url: "http://ia.media-imdb.com/images/M/MV5BMTU4MDU3NDQ5Ml5BMl5BanBnXkFtZTgwOTU5MDUxNTE@._V1_SX640_SY720_.jpg"
)

user.movies.create(
  name: "The Avengers",
  director: "Joss Whedon",
  year: "2012",
  poster_url: "http://ia.media-imdb.com/images/M/MV5BMTk2NTI1MTU4N15BMl5BanBnXkFtZTcwODg0OTY0Nw@@._V1_SX640_SY720_.jpg"
)

user.movies.create(
  name: "Iron Man",
  director: "Jon Favreau",
  year: "2008",
  poster_url: "http://ia.media-imdb.com/images/M/MV5BMTczNTI2ODUwOF5BMl5BanBnXkFtZTcwMTU0NTIzMw@@._V1_SX640_SY720_.jpg"
)

user.movies.create(
  name: "Iron Man 2",
  director: "Jon Favreau",
  year: "2010",
  poster_url: "http://ia.media-imdb.com/images/M/MV5BMTM0MDgwNjMyMl5BMl5BanBnXkFtZTcwNTg3NzAzMw@@._V1_SX640_SY720_.jpg"
)

user.movies.create(
  name: "Iron Man 3",
  director: "Shane Black",
  year: "2013",
  poster_url: "http://ia.media-imdb.com/images/M/MV5BMTQwNTQ2NTgwNF5BMl5BanBnXkFtZTcwMzg4NzAyOQ@@._V1__SX640_SY720_.jpg"
)