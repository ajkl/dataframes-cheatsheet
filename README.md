I have been playing a lot lately with [Julia]()
In past I have used python and R a lot for my data analysis tasks. I always tend to have some cheatsheets open for basic dataframe operations in pandas and R as its hard to make that context switch in the syntax from one language to another.
With Julia, my brain was just not ready to accept another set of syntax.
So I thought a quick reference comparing the basic dataframe manipulation syntax for all 3 languages would be nice.
Most of my data tasks start with some ETL tasks on dataframes.

I took this awesome tutorial by [Greg Reda]() on ["Working with DataFrames"]() and tried to port the example to all R and Julia.

All the code from this post can be found at this [github repo dataframes-compare]()

We start with the [MovieLens dataset](). From the README you can see :

'''
This data set consists of:
	* 100,000 ratings (1-5) from 943 users on 1682 movies. 
	* Each user has rated at least 20 movies. 
        * Simple demographic info for the users (age, gender, occupation, zip)
'''

## Data import
Lets start with loading the data into our dataframe.

Julia
'''
using DataFrames
u_col_names=[symbol("user_id"), symbol("age"), symbol("sex"), symbol("occupation"), symbol("zip_code")]
###
#another way to do the same without adding each entry as a symbol. Thanks to [Jubobs](http://stackoverflow.com/users/2541573/jubobs) from this [stackoverflow post](http://stackoverflow.com/questions/27629206/why-does-this-list-comprehension-return-an-arrayany-1-instead-of-an-arraysymb/27629609#27629609) for the suggestion.
col_names=["user_id", "age", "sex", "occupation", "zip_code"]
u_col_names=map(symbol, col_names)
###
users = DataFrames.readtable("data/ml-100k/u.user", separator='|', header=false, names=u_col_names)
'''

Python
'''
import pandas as pd
u_col_names = ['user_id', 'age', 'sex', 'occuptation', 'zip_code']
users = pd.read_csv('data/ml-100k/u.user', sep = '|', names=u_col_names)
r_col_names = ['user_id', 'movie_id', 'rating', 'unix_timestamp']
ratings = pd.read_csv('data/ml-100k/u.data', sep='\t', names=r_col_names)

# let's only load the first five columns of the file with usecols
m_col_names = ['movie_id', 'title', 'release_date', 'video_release_date', 'imdb_url']
movies = pd.read_csv('data/ml-100k/u.item', sep='|', names=m_col_names, usecols=range(5))
'''

R
'''
u_col_names <- c('user_id', 'age', 'sex', 'occupation', 'zip_code')
users <- read.csv('data/ml-100k/u.user', sep='|', col.names=u_col_names)
r_col_names = c('user_id', 'movie_id', 'rating', 'unix_timestamp')
ratings = read.csv('data/ml-100k/u.data', sep='\t', col.names=r_col_names)
# let's only load the first five columns for movies using "usecols" param
m_col_names = c('movie_id', 'title', 'release_date', 'video_release_date', 'imdb_url')
movies = read.table('data/ml-100k/u.item', sep='|', colClasses=c("integer", "character", "factor", "factor", "character", rep("NULL", 19)), quote="")#http://stackoverflow.com/questions/5788117/only-read-limited-number-of-columns-in-r also quotes in strings cause importing errors so you need quote="" 
#cannot specify col.names in read.table as we are skipping 19 columns. R will complain with "more columns than column names"
colnames(movies) <- m_col_names
'''

## Sanity check
Now that we have the data loaded in our dataframes, its usually good practice to see the classes/types of each column.

Julia
'''
eltypes(users)
describe(users)
'''

Python
'''
type(users)
users.dtypes
users.describe
'''

R
'''
class(users)
lapply(users, class)
summary(users)
'''



Julia
'''
'''

Python
'''
'''

R
'''
'''

Julia
'''
'''

Python
'''
'''

R
'''
'''
