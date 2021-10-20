library(shiny)

ui <- fluidPage(
  
  tags$head(
    tags$style(HTML("
      @import url('https://fonts.googleapis.com/css2?family=Caveat:wght@400&family=Rock+Salt&display=swap');
      
      body {
        background-color: #FFDD99;
        color: #474747;
        font-family: Caveat;
        font-size: 200%;
      }
      h2 {
        font-family: 'Rock Salt', sans-serif;
        font-size: 200%;
      }
      h3 {
        font-family: 'Rock Salt', sans-serif;
      }
      .shiny-input-container {
        color: #474747;
      }"
    )
    )
  ),
  
  titlePanel('Dystopian Storytelling'),
  
  fluidRow(
    column(width = 4,
           textInput('tech', 'Name a common technology you use (e.g., YouTube)'),
           textInput('co', 'Write the name of the company that makes the technology (e.g., Google)'),
           textInput('purpose', 'Explain what the technology allows you to do, starting with 
                     a verb (e.g., watch videos)'),
           textInput('motto', 'Write the motto or slogan of the company (e.g., Don\'t be evil)'),
           textInput('group1', 'Name a group of people that is popular or influential'),
           textInput('group2', 'Name a group of people that are unpopular or marginalized'),
           textInput('winning', 'Write a verb that is a synonym for winning big, ending in "-ing"'),
           textInput('losing', 'Write a verb that is a synonym for making worse, ending in "-ing"'),
           textInput('workers', 'Write a noun that is a synonym for "employees," ending in "-s"'),
           actionButton('submit', 'Weave the story')
           ),
    column(width = 8,
          tags$h3('Once upon a time, in the not-so-distant future...'),
          textOutput('madlib')
          )
    ),

)

server <- shinyServer(function(input, output) {
  
  sentence <- eventReactive(input$submit, {
    paste0('Lots of people use ', 
           input$tech, 
           ' to ', 
           input$purpose,
           '. ',
           input$tech,
           ' really has become very popular amongst humans. 
           The makers of ',
           input$tech,
           ', ',
           input$co,
           ', claims that they strive to "',
           input$motto,
           '". However, we know better. We\'ve come from the future to tell you that ',
           input$tech,
           ' is not actually a neutral tool, but a weapon intended 
           to exploit and even hurt people! 
           We traveled back in time to warn you when we learned that ',
           input$group1,
           ' are using ',
           input$tech,
           ' to harm ',
           input$group2,
           '. You see, ',
           input$co,
           ' offers its services for free because it records information 
           about everything everyone does with ',
           input$tech,
           '. They sell these records to other companies, 
           which is why they are able to offer the use of ',
           input$tech,
           ' for free. Seriously, ',
           input$co,
           ' surveils everything users do with the tool, 
           turns these observations into predictions about future behavior, 
           and sells all of this to other companies looking for advantages 
           in so-called \"targeted marketing.\" 
           It just so happens that ',
           input$group1,
           ' purchased a massive trove of data from ',
           input$co,
           ' about ',
           input$group2,
           ' (for not that much money, actually) 
           and have been using this insight as a means of ',
           input$winning,
           ' ',
           input$group2,
           '. In addition to this targeted, direct harm, ',
           input$tech,
           ' has also been causing collateral damage by ',
           input$losing,
           ' general trust between neighbors and co-workers. 
           If people keep going without reflection, assuming ',
           input$tech, 
           ' is a neutral tool, and ',
           input$co,
           ' is a benevolent, socially responsible company, 
           then any sense of privacy and civility will be left to the whims 
           of the highest bidder. This happens to all of you, 
           even though right now you might only see the effects on ',
           input$group2,
           '. Meanwhile, ',
           input$co,
           ' has been trying to show you and everyone else that they\'ve changed, 
           that they understand their past mistakes, that they\'re sorry, 
           and that these things won\'t happen again. ',
           input$co,
           ' executives have testified before government lawmakers 
           and donated millions to charities. 
           But don\'t be fooled, ',
           input$tech,
           ' is a tool to help ensure ',
           input$co,
           ' is ultimately the one ',
           input$winning,
           '. Profits come before the well-being of ',
           input$workers,
           ' or the health of the environment. 
           (Seriously, pause here to look up the effects of ',
           input$tech,
           ' on the environment, or how much they pay 
           their most marginalized tier of ',
           input$workers,
           '.) The consequences keep rippling outward! 
           The warning signs are there; take heed. 
           That\'s our message from the future. 
           We\'ve seen how this ends. 
           Please, please act now to stop the destructive use of ',
           input$tech,
           ' before things cascade further out of control and it\'s too late!'
           )
  })
  
  output$madlib <- renderText({
    sentence()
  })
})

shinyApp(ui, server)
  