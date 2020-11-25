# Natural Language Processing

#importing the dataset

dataset=read.csv('Restaurant_Reviews.tsv',sep = '\t',quote = '',stringsAsFactors = FALSE)
# we can use also delim function with default separator '\t'
#dataset=read.delim('Restaurant_Reviews.tsv')
dataset_original=read.csv('Restaurant_Reviews.tsv',sep = '\t',quote = '',stringsAsFactors = FALSE)

View(dataset)

# Cleaning the texts
#install.packages("tm")
library(tm)
#initiate corpus
corpus=VCorpus(VectorSource(dataset$Review))
#Step 1: switch to lower case
corpus=tm_map(corpus,content_transformer(tolower))
#Step 2: remove numbers
corpus=tm_map(corpus,removeNumbers)
#Step 3: remove punctuation
corpus=tm_map(corpus,removePunctuation)
#Step 4: remove non relevant words (words returned by stopwords() function)
# SnowballC package for stopwords() function
#install.packages("SnowballC")
library(SnowballC)
corpus=tm_map(corpus,removeWords,stopwords())
#Step 5: Stemming
corpus=tm_map(corpus,stemDocument)
#Step 6: Strip whitespace
corpus=tm_map(corpus,stripWhitespace)

# creating the Bag of Words model
dtm=DocumentTermMatrix(corpus)
# filter and keep 99% procent of the most frequent words
dtm=removeSparseTerms(dtm,0.999)

# transform back to dataframe
dataset=as.data.frame(as.matrix(dtm))
dataset$Liked=dataset_original$Liked

# applying Random Forest Classification

# Encoding the target feature as factor
dataset$Liked = factor(dataset$Liked, levels = c(0, 1))

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Liked, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Fitting classifier to the Training set
#install.packages('randomForest')
library(randomForest)
classifier=randomForest(x=training_set[-692],y=training_set$Liked,ntree=10)

# Predicting the Test set results
y_pred = predict(classifier, newdata = test_set[-692])

# Making the Confusion Matrix
cm = table(test_set[, 692], y_pred)
cm

new_corpus=VCorpus(VectorSource("Well donn"))
new_corpus=tm_map(new_corpus,content_transformer(tolower))
new_corpus=tm_map(new_corpus,removeNumbers)
new_corpus=tm_map(new_corpus,removePunctuation)
new_corpus=tm_map(new_corpus,removeWords,stopwords())
new_corpus=tm_map(new_corpus,stemDocument)
new_corpus=tm_map(new_corpus,stripWhitespace)


dtm=DocumentTermMatrix(new_corpus)
# filter and keep 99% procent of the most frequent words
dtm=removeSparseTerms(dtm,0.999)

# transform back to dataframe
test_dataset=as.data.frame(as.matrix(dtm))
test_dataset$Liked=0
classifier=randomForest(x=test_dataset[-3],y=test_dataset$Liked,ntree=10)

pred=predict(classifier, newdata = test_dataset[-3])

pred