library(shiny)
library(dplyr)

shinyServer(function(input, output) {
  output$plot1 <- renderPlot({
    base <- swiss
    base <- filter(base, base$Fertility > input$Fert[1] & base$Fertility < input$Fert[2])
    base <- filter(base, base$Agriculture > input$Agri[1] & base$Agriculture < input$Agri[2])
    base <- filter(base, base$Examination > input$Exam[1] & base$Examination < input$Exam[2])
    base <- filter(base, base$Education > input$Educ[1] & base$Education < input$Educ[2] )
    base <- filter(base, base$Catholic > input$Cath[1] & base$Catholic < input$Cath[2] )
    base <- filter(base, base$Infant.Mortality > input$Mort[1] & base$Infant.Mortality < input$Mort[2] )
    dataX <- base[,input$xAxis]
    dataY <- base[,input$yAxis]
    plot(dataX, dataY, 
         xlab = input$xAxis, 
         ylab = input$yAxis,
         xlim = c(0,100),
         ylim = c(0,100))
    model <- lm(dataY ~ dataX)
    abline(model, col = "blue", lwd=2)
  })

  

})
