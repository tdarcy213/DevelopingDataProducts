library(shiny)

shinyUI(navbarPage("OPTIONS:",
                   tabPanel("App",
                            titlePanel("Generate a table of ZIP codes within a distance of another ZIP"),
                            sidebarPanel(
                              textInput("zip1", "ENTER ZIP CODE:", value = "01001"),
                              numericInput("howfar", "ENTER DISTANCE:", value = "5"),
                              #     submitButton("SUBMIT"),
                              actionButton("SUBMIT","SUBMIT"),
                              downloadButton('downloadData', label = "Download Table", class = NULL)
                            ),
                            mainPanel(
                              dataTableOutput("ziptable")   
                            )
                   ),
                   tabPanel("Instructions",
                            mainPanel(
                              includeHTML("instructions.html")))
))