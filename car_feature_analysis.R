
#CSV
toyota.df<- read.csv("car_data.csv")

str(toyota.df)

#Years to Factors 

toyota.df$Mfg_Year <- factor(toyota.df$Mfg_Year)


#Packages 

install.packages("dummies")
install.packages("GGally")
install.packages("gplots")
library(dummies)
library(GGally)
library(gplots)



#Excluded:-ID,Model,Mfg_month,Mfg_Year,color,Cylinders
#Age in months is similar to  Mfg_Month and Mfg_Year


toyotadummy.df <- dummy.data.frame(toyota.df[,-c(1,2,5,6,11,15)])
toyotadummy.df


#Correlation Matrix
Cor_Matrix <- round(cor(toyotadummy.df),2)
Cor_Matrix



#After analysing Variables which are not important seeing the Correlation matrix excluded-
#Radio_Cassette,Tow_Bar, Parking_Assistant,Mettalic_Rim, Backseat_Divider
#Sports_Model,Mistlamps,BOVAG_Guarantee, Mfr_Guarantee, Automatic, Met_Color
#Radio and radio_cassette have high correlation 0.99 correlation so only radio is considered
Toyota_a <- toyotadummy.df[,-c(8,9,15,16,29,30,31,32,33,34,35)]
Toyota_a

#Heatmap to analyse all data
heatmap.2(cor(Toyota_a), Rowv = FALSE, Colv = FALSE, dendrogram = "none",
          cellnote = round(cor(Toyota_a),2),
          notecol = "black", key = FALSE, trace = 'none', margins = c(10,10))

# All continuous variables
Toyota_Co.df <- toyotadummy.df[,c(1,2,3,7,10,11,12,13,14,17)]
Toyota_Co.df

#Heat Map for only continuous variables


heatmap.2(cor(Toyota_Co.df), Rowv = FALSE, Colv = FALSE, dendrogram = "none",
          cellnote = round(cor(Toyota_Co.df),2),
          notecol = "black", key = FALSE, trace = 'none', margins = c(10,10))


#After analysing data other highly Correalted variables which are dropped:-
#CC, Doors, Gears, Guarantee period

Toyota_Drop.df <- Toyota_Co.df[,-c(5,6,7,10)]
Toyota_Drop.df


#Heat Map of only relevant continuous variables
#Continous Variables relevant- Price,Age,KM,Quaterly_Tax,Weight,HP


heatmap.2(cor(Toyota_Drop.df), Rowv = FALSE, Colv = FALSE, dendrogram = "none",
          cellnote = round(cor(Toyota_Drop.df),2),
          notecol = "black", key = FALSE, trace = 'none', margins = c(10,10))



y<-Toyota_Drop.df
y
#Only Continuous variables for Correlation matrix:-
Cor_Matrix <- round(cor(y),2)
Cor_Matrix

#Matrix scatter plot Continous variables 
ggpairs(Toyota_Drop.df)

