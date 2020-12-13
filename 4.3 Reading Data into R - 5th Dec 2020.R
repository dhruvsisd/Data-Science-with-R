# Most common way to get data is reading comma separated values(CSV)

# Reading CSVs
Tomato="http://www.jaredlander.com/data/Tomato%20First.csv"
dataTomato=read.table(file=Tomato,header=TRUE, sep=",")
head(dataTomato)

getwd()


