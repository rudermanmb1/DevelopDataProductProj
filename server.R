library(shiny)
library(datasets)
data(mtcars)

CarChoices <- function(BrandNames = c()){
    
    mtcar <- mtcars
    if(!is.null(BrandNames)){
        BrandNames <- paste(BrandNames, collapse = "|")
        mtcar <- mtcars[grepl(BrandNames,rownames(mtcars)),]
    }
    else{
        mtcar <- mtcars
    }
    
    list(MeanMPG = mean(mtcar$mpg), Models = rownames(mtcar), 
         BestMPG = mtcar[mtcar$mpg == max(mtcar$mpg),"mpg"], 
         BestCar =  rownames(mtcar[mtcar$mpg == max(mtcar$mpg),]), 
         WorstMPG =  mtcar[mtcar$mpg == min(mtcar$mpg),"mpg"], 
         WorstCar = rownames(mtcar[mtcar$mpg == min(mtcar$mpg),]))
}

shinyServer(function(input,output){
    output$models <- renderPrint({CarChoices(input$BrandNames)$Models})
    output$mean <- renderPrint({CarChoices(input$BrandNames)$MeanMPG})
    output$bestCar <- renderPrint({CarChoices(input$BrandNames)$BestCar})
    output$bestMPG <- renderPrint({CarChoices(input$BrandNames)$BestMPG})
    output$worstCar <- renderPrint({CarChoices(input$BrandNames)$WorstCar})    
    output$worstMPG <- renderPrint({CarChoices(input$BrandNames)$WorstMPG})
})