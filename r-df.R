u_col_names <- c('user_id', 'age', 'sex', 'occupation', 'zip_code')
users <- read.csv('data/ml-100k/u.user', sep='|', col.names=u_col_names)
r_col_names = c('user_id', 'movie_id', 'rating', 'unix_timestamp')
ratings = read.csv('data/ml-100k/u.data', sep='\t', col.names=r_col_names)
# let's only load the first five columns for movies using "usecols" param
m_col_names = c('movie_id', 'title', 'release_date', 'video_release_date', 'imdb_url')
movies = read.table('data/ml-100k/u.item', sep='|', colClasses=c("integer", "character", "factor", "factor", "character", rep("NULL", 19)), quote="")#http://stackoverflow.com/questions/5788117/only-read-limited-number-of-columns-in-r also quotes in strings cause importing errors so you need quote="" 
#cannot specify col.names in read.table as we are skipping 19 columns. R will complain with "more columns than column names"
colnames(movies) <- m_col_names

class(users)
lapply(users, class)
#better way to get class of all columns is using str
str(users)
summary(users)

head(movies)
tail(movies)

head(movies, n=3)

movies[50:55,]
head(movies$title)
head(movies[,c('title', 'release_date', 'imdb_url')])
movies[movies$title == 'Toy Story (1995)',]

