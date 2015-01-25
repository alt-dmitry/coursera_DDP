shinyUI(pageWithSidebar(
    headerPanel("Visual comparison of smoothing methods"),
    sidebarPanel(
        p('This small shiny app visualizes different smothing methods. 
          Our test dataset is mtcars and we will fit models with mpg (miles per gallon) as
          output and weight as input. Any knowledge about this methods is not necessary,
          just look at the ways of approximation.'),
        checkboxGroupInput('param', 'Smoothing method:',
            c("lm"=paste("lm","blue"),"glm"=paste("glm","red"),
                "rlm"=paste("rlm","green"),"gam"=paste("gam","yellow"),
              "loess"=paste("loess","violet")),
            selected = c("loess violet")
                           )
    ),
    mainPanel(
        plotOutput('myPlot')
    )
))