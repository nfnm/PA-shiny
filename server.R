
# Developing Data Products 
#
#

library(shiny)

#
# Preprocessed titanic data from http://lib.stat.cmu.edu/S/Harrell/data/descriptions/titanic.html
#
passengers <- read.table(header = TRUE, text = "
                         survived age sex
                         1 29 female
                         0 2 female
                         0 30 male
                         0 25 female
                         1 1 male
                         1 47 male
                         1 63 female
                         0 39 male
                         1 58 female
                         0 71 male
                         0 47 male
                         1 19 female
                         1 50 female
                         0 24 male
                         0 36 male
                         1 37 male
                         1 47 female
                         1 26 male
                         0 25 male
                         1 25 male
                         1 19 female
                         1 28 male
                         0 45 male
                         1 39 male
                         1 30 female
                         1 58 female
                         1 45 female
                         1 22 female
                         0 41 male
                         0 48 male
                         1 44 female
                         1 59 female
                         1 60 female
                         0 45 male
                         1 53 female
                         1 58 female
                         1 36 male
                         0 33 male
                         1 36 male
                         1 36 female
                         1 14 female
                         1 11 male
                         0 49 male
                         0 36 male
                         0 46 male
                         1 47 female
                         1 27 male
                         1 31 female
                         0 27 male
                         1 26 female
                         1 64 female
                         0 37 male
                         1 39 female
                         1 55 female
                         0 70 male
                         1 69 female
                         1 36 female
                         0 39 male
                         1 38 female
                         1 27 male
                         0 31 male
                         1 27 female
                         1 31 male
                         1 17 female
                         1 4 male
                         1 27 female
                         0 50 male
                         1 48 female
                         1 49 male
                         1 48 female
                         0 39 male
                         1 23 female
                         1 53 female
                         0 36 female
                         0 30 male
                         1 24 female
                         0 19 male
                         1 28 female
                         1 23 female
                         0 64 male
                         1 60 female
                         1 49 male
                         1 44 male
                         1 22 female
                         1 60 male
                         1 48 female
                         0 37 male
                         1 35 female
                         0 47 male
                         1 22 female
                         1 45 female
                         1 49 male
                         0 71 male
                         1 54 male
                         0 38 male
                         1 19 female
                         1 58 female
                         1 45 female
                         1 23 male
                         0 46 male
                         1 25 male
                         1 21 female
                         1 48 male
                         1 49 female
                         0 45 male
                         1 36 female
                         0 55 male
                         1 52 female
                         1 24 female
                         1 16 female
                         1 44 female
                         1 51 female
                         0 42 male
                         1 35 female
                         1 35 male
                         1 38 male
                         1 35 female
                         0 50 female
                         1 49 male
                         0 46 male
                         0 58 male
                         0 41 male
                         1 42 male
                         1 40 female
                         0 42 male
                         1 55 female
                         1 50 female
                         1 16 female
                         0 29 male
                         1 21 female
                         0 30 male
                         1 15 female
                         0 30 male
                         0 46 male
                         0 54 male
                         1 36 male
                         0 28 male
                         0 65 male
                         1 33 female
                         0 44 male
                         1 37 female
                         0 55 male
                         0 47 male
                         0 36 male
                         0 58 male
                         1 31 female
                         1 23 female
                         1 19 female
                         0 64 male
                         0 64 male
                         1 22 female
                         0 28 male
                         0 22 male
                         0 18 male
                         1 17 female
                         1 52 male
                         0 46 male
                         1 56 female
                         1 43 female
                         0 31 male
                         1 33 female
                         1 27 female
                         0 55 male
                         1 54 female
                         0 61 male
                         1 48 female
                         1 18 female
                         1 13 male
                         1 21 female
                         1 34 male
                         1 40 female
                         1 36 male
                         0 50 male
                         1 39 female
                         1 56 male
                         1 28 male
                         0 56 male
                         0 56 male
                         0 24 male
                         1 18 female
                         1 24 male
                         1 23 female
                         1 45 male
                         1 40 female
                         1 6 male
                         0 57 male
                         1 32 male
                         0 62 male
                         1 54 male
                         1 43 female
                         1 52 female
                         1 62 female
                         0 67 male
                         0 63 female
                         0 61 male
                         1 46 female
                         0 52 male
                         1 39 female
                         1 18 female
                         1 48 male
                         0 49 male
                         1 39 female
                         1 17 male
                         0 46 male
                         1 31 male
                         0 61 male
                         0 47 male
                         0 64 male
                         1 60 female
                         0 60 male
                         1 55 female
                         0 54 male
                         0 21 male
                         0 57 male
                         1 45 female
                         1 31 female
                         0 50 male
                         1 50 female
                         0 27 male
                         1 20 female
                         0 51 male
                         1 21 male
                         1 36 female
                         0 40 male
                         0 32 male
                         0 33 male
                         0 30 male
                         1 28 female
                         0 18 male
                         0 34 male
                         1 32 female
                         0 57 male
                         0 18 male
                         0 23 male
                         1 36 female
                         0 28 male
                         0 51 male
                         1 32 male
                         1 19 female
                         0 28 male
                         1 36 female
                         1 4 female
                         1 1 male
                         1 12 female
                         1 34 male
                         1 19 female
                         0 23 male
                         0 26 male
                         0 27 male
                         1 15 female
                         0 45 male
                         1 40 female
                         1 20 female
                         0 25 male
                         1 36 female
                         0 25 male
                         1 42 female
                         1 26 male
                         1 26 female
                         1 1 male
                         1 31 female
                         0 19 male
                         0 54 male
                         0 44 female
                         0 52 male
                         0 30 male
                         0 30 female
                         0 29 male
                         0 29 male
                         0 27 male
                         1 24 male
                         0 35 male
                         1 31 female
                         1 8 female
                         0 22 female
                         0 30 female
                         0 20 male
                         0 21 male
                         1 49 female
                         1 8 male
                         1 28 female
                         0 18 male
                         0 28 male
                         1 22 female
                         0 25 male
                         0 18 male
                         1 32 female
                         1 18 female
                         0 42 male
                         1 34 female
                         1 8 male
                         0 23 male
                         0 21 male
                         0 19 male
                         0 38 male
                         0 38 female
                         0 35 male
                         0 35 male
                         0 38 male
                         1 24 female
                         0 16 male
                         0 26 male
                         0 45 male
                         0 24 male
                         0 21 male
                         0 22 male
                         0 34 male
                         0 30 male
                         0 50 male
                         0 30 male
                         1 23 female
                         1 1 male
                         0 44 male
                         0 28 male
                         1 6 female
                         1 30 male
                         0 43 male
                         1 45 female
                         1 7 female
                         1 24 female
                         1 24 female
                         0 49 male
                         1 48 female
                         0 34 male
                         0 32 male
                         0 21 male
                         0 18 female
                         1 53 female
                         0 23 male
                         1 21 female
                         0 52 male
                         0 42 male
                         1 36 female
                         0 21 male
                         1 41 male
                         0 33 male
                         1 17 female
                         1 23 female
                         0 34 male
                         0 22 female
                         1 45 female
                         0 31 male
                         0 30 male
                         0 26 female
                         1 34 female
                         0 26 male
                         1 22 female
                         1 1 female
                         1 3 female
                         0 25 male
                         0 48 male
                         0 57 female
                         1 2 male
                         0 27 male
                         1 19 female
                         0 30 male
                         0 20 male
                         0 45 male
                         0 46 male
                         1 41 female
                         1 13 female
                         1 19 male
                         0 30 male
                         0 48 male
                         0 71 male
                         0 54 male
                         0 64 male
                         0 32 male
                         1 18 female
                         1 2 male
                         0 32 male
                         1 3 male
                         0 26 male
                         0 19 male
                         1 20 male
                         1 29 female
                         0 39 male
                         1 22 male
                         0 24 male
                         0 28 male
                         1 50 female
                         0 20 male
                         0 40 male
                         1 42 female
                         0 21 male
                         1 32 female
                         0 34 male
                         1 33 female
                         1 2 female
                         1 8 female
                         0 36 male
                         0 34 male
                         1 30 female
                         1 28 female
                         0 23 male
                         1 1 male
                         1 25 female
                         1 3 male
                         1 50 female
                         1 21 female
                         1 25 female
                         1 18 female
                         1 20 female
                         1 30 female
                         0 59 male
                         1 30 female
                         0 35 male
                         0 22 male
                         0 25 male
                         0 41 male
                         0 25 male
                         0 14 male
                         1 50 female
                         0 22 male
                         1 27 female
                         0 29 male
                         0 27 female
                         0 30 male
                         0 22 male
                         1 35 female
                         0 30 male
                         1 28 female
                         0 23 male
                         1 12 female
                         1 40 female
                         1 36 female
                         0 28 male
                         1 32 female
                         1 29 female
                         1 4 female
                         1 2 male
                         0 36 male
                         1 33 female
                         1 32 male
                         1 26 female
                         0 30 male
                         1 24 female
                         0 18 male
                         0 42 male
                         0 13 male
                         0 16 male
                         1 35 female
                         1 16 female
                         1 25 male
                         1 18 female
                         1 20 male
                         0 30 male
                         0 26 male
                         0 40 female
                         0 24 male
                         0 41 male
                         1 18 female
                         1 1 male
                         0 23 male
                         0 20 male
                         0 25 male
                         0 35 male
                         0 17 male
                         0 32 male
                         0 20 male
                         0 39 male
                         0 39 female
                         0 6 female
                         0 2 female
                         1 17 female
                         0 38 female
                         0 9 female
                         0 26 male
                         0 11 female
                         0 4 male
                         0 20 male
                         0 26 male
                         0 25 male
                         0 18 female
                         0 24 male
                         0 35 male
                         0 40 male
                         1 38 female
                         0 5 male
                         0 9 male
                         1 3 male
                         0 13 male
                         1 23 male
                         1 5 female
                         1 45 female
                         0 23 male
                         0 17 female
                         0 27 male
                         0 23 male
                         0 20 male
                         0 32 male
                         1 33 female
                         1 3 female
                         1 18 female
                         0 40 male
                         0 26 male
                         1 15 female
                         0 45 female
                         0 18 female
                         0 27 female
                         0 22 male
                         0 19 male
                         0 26 male
                         0 22 male
                         0 20 male
                         1 32 male
                         0 21 male
                         0 18 male
                         0 26 male
                         0 6 male
                         0 9 female
                         0 40 male
                         0 32 female
                         0 26 male
                         1 18 female
                         0 20 female
                         0 29 male
                         0 22 male
                         0 22 male
                         0 35 male
                         1 21 male
                         0 20 female
                         0 19 male
                         0 18 female
                         0 18 male
                         0 38 male
                         0 30 male
                         0 17 male
                         0 21 female
                         0 21 male
                         0 21 male
                         0 24 male
                         0 33 male
                         0 33 male
                         0 28 male
                         1 16 female
                         0 37 female
                         0 28 male
                         0 24 male
                         0 21 male
                         0 32 male
                         0 29 male
                         0 26 male
                         0 18 male
                         0 20 male
                         1 19 male
                         0 24 male
                         0 24 male
                         0 36 male
                         0 31 male
                         0 31 male
                         0 30 female
                         1 22 female
                         0 43 male
                         0 35 male
                         0 27 male
                         0 19 male
                         0 30 male
                         1 36 female
                         1 3 male
                         1 9 male
                         0 59 male
                         0 19 male
                         0 44 male
                         1 17 female
                         1 45 male
                         0 22 female
                         0 19 male
                         1 29 male
                         1 30 female
                         0 34 male
                         0 28 female
                         0 1 male
                         0 27 male
                         0 25 male
                         0 24 male
                         0 22 male
                         0 21 male
                         0 17 male
                         0 26 male
                         1 33 female
                         1 1 male
                         1 1 female
                         0 25 male
                         1 36 male
                         1 36 female
                         1 30 male
                         0 23 male
                         0 26 male
                         1 19 female
                         0 65 male
                         0 42 male
                         0 43 male
                         0 32 male
                         1 19 male
                         1 30 female
                         0 24 female
                         1 23 female
                         1 24 female
                         1 24 male
                         0 23 male
                         1 22 female
                         0 18 male
                         0 16 male
                         0 45 male
                         0 47 male
                         1 5 female
                         0 21 female
                         0 18 male
                         0 9 female
                         0 48 female
                         0 16 male
                         0 25 male
                         0 22 male
                         1 16 female
                         0 33 male
                         1 9 male
                         0 41 male
                         0 38 male
                         0 40 male
                         0 43 female
                         0 14 male
                         0 16 female
                         0 9 male
                         0 10 female
                         0 6 male
                         0 11 male
                         0 40 male
                         0 32 male
                         0 20 male
                         0 37 male
                         0 28 male
                         0 19 male
                         ")
passengersMale = passengers["male" == passengers$sex, ]
passengersFemale = passengers["female" == passengers$sex, ]
maleSurvivors <-aggregate(passengersMale[,c("survived","age")],by=list(passengersMale$age),FUN=mean)
femaleSurvivors <-aggregate(passengersFemale[,c("survived","age")],by=list(passengersFemale$age),FUN=mean)
allSurvivors <-aggregate(passengers[,c("survived","age")],by=list(passengers$age),FUN=mean)

doPlot <- function(p, symbol, title, pch=" ", col="black")
{
  main = paste(title, "survivors of the Titanic")
  reg <- lm(p$survived ~ p$age)
  plot(p$age, p$survived, pch=pch, xlab="Age", ylab="Survival Rate", main=main)
  text(p$age, p$survived, symbol, vfont=c("sans serif symbol","plain"), cex=1,col=col)
  abline(reg)
}

shinyServer(function(input, output) {
  
  output$chart <- renderPlot({    
    if (input$Gender == "Male")
      doPlot(maleSurvivors, "\\MA", col="blue", title="Male")
    else
      if (input$Gender == "Female")
        doPlot(femaleSurvivors, "\\VE", col="red", title="Female")
      else
        doPlot(allSurvivors, '.', pch=19, title="All")
  })

})
