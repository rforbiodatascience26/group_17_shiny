# Load needed libraries
library("shiny")

# Load needed functions
source(file = "app_functions.R")

# Define the Server (Backend)
server <- function(input, output) {
  
  #Generate output
  dna_string <- reactive({
    gene_dna(length = input$n_bases, base_probs = c(input$prob_A, input$prob_T, input$prob_C, input$prob_G))
  })
  
  rna_string <- reactive({
    transcribe_dna(dna_string())
  })
  
  protein_string <- reactive({
    translate_rna(rna_string())
  })
  
  #Display output
  output$dna <- renderText({
    dna_string()
  })
  
  output$rna <- renderText({
    rna_string()
  })
  
  output$protein <- renderText({
    protein_string()
  })
  
}