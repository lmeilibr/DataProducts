library(shiny)

shinyUI(fluidPage(
  titlePanel("Swiss Fertility and Socioeconomic Indicators (1888) Data"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("Fert","Fertility range", 0,100, value = c(0,100)),
      sliderInput("Agri","Agriculture range", 0,100, value = c(0,100)),
      sliderInput("Exam","Examination range", 0,100, value = c(0,100)),
      sliderInput("Educ","Education range", 0,100, value = c(0,100)),
      sliderInput("Cath","Catholic range", 0,100, value = c(0,100)),
      sliderInput("Mort","Mortality range", 0,100, value = c(0,100))
      
    ),
    mainPanel(
      selectInput("xAxis", "Select the X axis", 
                  colnames(swiss), 
                  selected = colnames(swiss)[1]),
      selectInput("yAxis", "Select the Y Axis", 
                  colnames(swiss), 
                  selected = colnames(swiss)[2]),
      h3("Scatter Plot between variables"),
      submitButton("Submit"),
      plotOutput("plot1")
    )
    )
  )
)

