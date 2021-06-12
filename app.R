library(shiny)

ui <- fluidPage(
  fluidRow(
    column(width = 12,
           tags$h1('Dystopian Storytelling Activity')
           )
  ),
  fluidRow(
    column(width = 12,
           textInput('tech', 'Technology (e.g., YouTube)'),
           textInput('co', 'Company (e.g., Google)'),
           textInput('purpose', 'Explain what the technology does, starting with 
                     the verb (e.g., watch videos)'),
           textInput('motto', 'Write the company motto or state intention'),
           textInput('group1', 'Name a group in your country that is powerful or influential'),
           textInput('group2', 'Name a group in your country that lacks power or influence'),
           textInput('means', 'Explain how a group with power could use the technology 
                     to harm a vulnerable group, starting with a verb ending in "-ing"'),
           textInput('harm', 'Name a systemic inequality or harm'),
           textInput('worse', 'Explain how this is making the systemic inequality or harm worse'),
           textInput('end', 'Name a noun: Something that could be permanently destroyed'),
           textInput('laws', 'Describe laws that allow for continued abuse but give 
                     the appearance of making change'),
           textInput('profits', 'Explain how the company profits from their technology,
                     starting with a verb ending in "-ing"'),
           textInput('workers', 'Explain how the company exploits their workers or employees,
                     starting with a verb ending in "-ing"'),
           textInput('nature', 'Explain how the production of the technology could 
                     harm the environment, starting with a verb ending in "-ing"'),
           actionButton('submit', 'Submit')
           )
    ),
  fluidRow(
    column(width = 12,
           tags$h2('A Semi-true Tale of Technology...'),
           textOutput('madlib')
           )
  )
)

server <- shinyServer(function(input, output) {
  
  sentence <- eventReactive(input$submit, {
    paste0('Many people today use ', 
           input$tech, 
           ' to ', 
           input$purpose,
           '. It has become very popular, and many humans use ',
           input$tech,
           '. ',
           input$co,
           ' even explains that they "',
           input$motto,
           '". However, we have come from the future to tell you ',
           input$tech,
           ' is not a tool, but a weapon intended to hurt people! ',
           'We have learned that ',
           input$group1,
           ' is using ',
           input$tech,
           ' to harm ',
           input$group2,
           ' by ',
           input$means,
           '. Beyond these obviously intentional harms, ',
           input$tech,
           ' is even causing collateral damage that is worsening ',
           input$harm,
           ' by ',
           input$worse,
           '. If the use of this technology continues then this could lead to 
           the long-term destruction of ',
           input$end,
           '. ',
           input$co,
           ' is even trying to trick people into thinking they’re changing their ways 
           by pushing for legislation that ',
           input$laws,
           '. And it is all about profits for ',
           input$co,
           '! We discovered that they are making money by ',
           input$profits,
           '. They’re also exploiting their workers by ',
           input$workers,
           ' and harming the environment by ',
           input$nature,
           '. The consequences are widespread! We hope you can stop the evil use of ',
           input$tech,
           ' before it’s too late!'
           )
  })
  
  output$madlib <- renderText({
    sentence()
  })
})

shinyApp(ui, server)
  