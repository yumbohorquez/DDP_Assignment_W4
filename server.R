library(shiny)
data("covid19_co")

# Define server logic required to plot the data
shinyServer(function(input, output) {
    # 1
    covid19_co <- read.csv("./COVID19V2.csv", header = TRUE)
    covid19_co <- aggregate(cbind(Casa, Hospital, UCI, Recuperado, Fallecido)~Departamento, covid19_co, sum)
    deaths <- covid19_co$Fallecido
    UCI <- covid19_co$UCI
    fitmodel <- lm(deaths ~ UCI)
    # 2
    fitmodelpred<-reactive({
        UCIInput<-input$sliderUCI
        predict(fitmodel, newdata=data.frame(UCI=UCIInput))
    })
    
    # 4
    output$plot1<-renderPlot({
        UCIInput<-input$sliderUCI
        plot(covid19_co$UCI, covid19_co$Fallecido, xlab = "UCI Patient Qty", ylab = "Deaths", bty = "n", pch = 16)
        points(UCIInput, fitmodelpred(), col="blue", pch=16, cex=2)
    })
    
    # 5
    output$pred1<-renderText({
        fitmodelpred()
    })
    
})