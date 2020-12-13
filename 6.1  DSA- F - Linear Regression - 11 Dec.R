# Simple Linear Regression (SLR)

# Using fathers' heights to predict sons' heights using SLR.
# Fathers height as predictor(Indep - X) and 
# Son's height as the response /Target(Dep - Y)
require(UsingR)
require(ggplot2)
head(father.son) # Dataset: father.son. 
ggplot(father.son, aes(x=fheight, y=sheight))+geom_point()+
  geom_smooth(method="lm")+labs(x="Fathers", y="Sons")
heightsLM = lm(sheight ~ fheight, data = father.son)
heightsLM
summary(heightsLM)
