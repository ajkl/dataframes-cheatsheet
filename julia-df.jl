using DataFrames
u_col_names=[symbol("user_id"), symbol("age"), symbol("sex"), symbol("occupation"), symbol("zip_code")]
###
#a twisted way to do the same without adding each entry as a symbol
col_names=["user_id", "age", "sex", "occupation", "zip_code"]
u_col_names[symbol(m_col_names[i]) for i in 1:size(col_names)[1]]
###
#As pointed out by Valentin and in the HN comments section the easiest way to do this is
u_col_names=[:user_id,  :age,  :sex,  :occupation,  :zip_code]
users = DataFrames.readtable("data/ml-100k/u.user", separator='|', header=false, names=u_col_names)

eltypes(users)
describe(users)

head(users, 3)

users[50:55,:]

head(users[:occupation])

head(users[:,[:occupation, :sex, :age]])

users[users[:occupation] .== "writer", :]


r_col_names = ['user_id', 'movie_id', 'rating', 'unix_timestamp']
ratings = DataFrames.readtable('data/ml-100k/u.data', sep='\t', names=r_col_names)
# let's only load the first five columns for movies using "usecols" param
m_col_names = ["movie_id", "title", "release_date", "video_release_date", "imdb_url"]
movies = read.table('data/ml-100k/u.item', sep='|', colClasses=c("integer", "character", "factor", "factor", "character", rep("NULL", 19)))#http://stackoverflow.com/questions/5788117/only-read-limited-number-of-columns-in-r
#cannot specify col.names in read.table as we are skipping 19 columns. R will complain with "more columns than column names"
colnames(movies) <- m_col_names
