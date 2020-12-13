# Correlation

# Prepare the Data
mydata <- mtcars[, c(1,3,4,5,6,7)]
head(mydata)

# Compute the correlation matrix - cor()
cormat <- round(cor(mydata),2)
head(cormat)

# Create the correlation heatmap with ggplot2
# The package reshape is required to melt the correlation matrix.
library(reshape2)
melted_cormat <- melt(cormat)
head(melted_cormat)

#The function geom_tile()[ggplot2 package] is used to visualize the correlation matrix :
library(ggplot2)
ggplot(data = melted_cormat, aes(x=Var1, y=Var2, fill=value)) + 
  geom_tile()

#Doesnot Look Great.. Let's Enhance the viz!

#Get the lower and upper triangles of the correlation matrix
## a correlation matrix has redundant information. We'll use the functions below to set half of it to NA.

# Get lower triangle of the correlation matrix
get_lower_tri<-function(cormat){
  cormat[upper.tri(cormat)] <- NA
  return(cormat)
}
# Get upper triangle of the correlation matrix
get_upper_tri <- function(cormat){
  cormat[lower.tri(cormat)]<- NA
  return(cormat)
}

upper_tri <- get_upper_tri(cormat)
upper_tri

#  Finished correlation matrix heatmap
## Melt the correlation data and drop the rows with NA values
# Melt the correlation matrix
library(reshape2)
melted_cormat <- melt(upper_tri, na.rm = TRUE)
# Heatmap
library(ggplot2)
ggplot(data = melted_cormat, aes(Var2, Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson\nCorrelation") +
  theme_minimal()+ 
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 12, hjust = 1))+
  coord_fixed()


# negative correlations are in blue color and positive correlations in red. 
# The function scale_fill_gradient2 is used with the argument limit = c(-1,1) as correlation coefficients range from -1 to 1.
# coord_fixed() : this function ensures that one unit on the x-axis is the same length as one unit on the y-axis.

# Reorder the correlation matrix

# This section describes how to reorder the correlation matrix according to the correlation coefficient. 
# This is useful to identify the hidden pattern in the matrix. 
# hclust for hierarchical clustering order is used in the example below.

reorder_cormat <- function(cormat){
  # Use correlation between variables as distance
  dd <- as.dist((1-cormat)/2)
  hc <- hclust(dd)
  cormat <-cormat[hc$order, hc$order]
}

# Reorder the correlation matrix
cormat <- reorder_cormat(cormat)
upper_tri <- get_upper_tri(cormat)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(Var2, Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson\nCorrelation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 12, hjust = 1))+
  coord_fixed()
# Print the heatmap
print(ggheatmap)

#Add correlation coefficients on the heatmap

## Use geom_text() to add the correlation coefficients on the graph
## Use a blank theme (remove axis labels, panel grids and background, and axis ticks)
## Use guides() to change the position of the legend title

ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 4) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.6, 0.7),
    legend.direction = "horizontal")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
