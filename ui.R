library(shiny)

shinyUI(pageWithSidebar(
    headerPanel("Mean MPG Analysis"),
    
    sidebarPanel(
        h4("Select the car company name or names you are interested 
           in, or to select all companies leave all boxes unchecked:"),
        checkboxGroupInput("BrandNames", "Range of Weights",
                           c("AMC" =" AMC",
                             "Cadillac" = "Cadillac",
                             "Camaro" = "Camaro",
                             "Chrystler" = "Chrystler",
                             "Datsun" = "Datsun",
                             "Dodge" = "Dodge",
                             "Duster" = "Duster",
                             "Ferrari" = "Ferrari",
                             "Fiat" = "Fiat",
                             "Ford" = "Ford",
                             "Honda" = "Honda",
                             "Hornet" = "Hornet",
                             "Lincoln" = "Lincoln",
                             "Lotus" = "Lotus",
                             "Maserati" = "Maserati",
                             "Mazda" = "Mazda",
                             "Merc" = "Merc",
                             "Pontiac" = "Pontiac",
                             "Porche" = "Porche",
                             "Toyota" = "Toyota",
                             "Valiant" = "Valiant",
                             "Volvo" = "Volvo")),
        h4("Once you hit the submit button you will recieve a 
           readout of fuel efficiency information about all of 
           the cars made by the companies you selected:"),
        submitButton('Submit')
    ),
    
    mainPanel(
        h2("Results"),
        h3("List of Car Models Selected"),
        verbatimTextOutput("models"),
        h3("Mean MPG of Cars Selected:"),
        verbatimTextOutput("mean"),
        h3("Car(s) That Get(s) The Most Miles Per Gallon"),
        verbatimTextOutput("bestCar"),
        h3("MPG of the Best Car"),
        verbatimTextOutput("bestMPG"),
        h3("Car(s) That Get(s) The Fewest Miles Per Gallon"),
        verbatimTextOutput("worstCar"),
        h3("MPG of The Worst Car"),
        verbatimTextOutput("worstMPG")
    ) 
))
