library(shiny)
library(ggplot2)
data(mtcars)

shinyServer(
    function(input, output) {
        output$myPlot <- renderPlot({
            sp <- ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point(shape=1)
            par <- input$param
            if(class(par)=="character"){
            m <- NULL
            col <- NULL
            for(i in 1:length(par)){
                tmp <- unlist(strsplit(par[i]," "))
                m <- c(m,tmp[1])
                col <- c(col,tmp[2])
            }
            
            for (i in 1:length(par)){
                sp <- sp + stat_smooth(method=m[i], colour = col[i])
            }
            }
            sp+scale_x_continuous(limits = c(1, 6)) + scale_y_continuous(limits=c(5,35))
        })
    }
)
