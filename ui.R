# Load needed libraries
library("shiny")
library("bslib")

# Define the User Interface (Frontend)
ui <- page_fluid(
  layout_columns(
    col_widths = 12,
    card(
      titlePanel("Virtual Central Dogma"),
      style = "background-color: #f0f0f0; padding: 15px;"
    )),
  layout_columns(
    col_widths = 12,
    card(
      titlePanel("About"),
      helpText("The Virtual Central Dogma application is an interactive R Shiny tool designed to simulate the core flow of molecular biology: DNA to RNA to Protein. It provides an environment where users can control the length of a generated DNA sequence using an interactive slider and adjust the probability distribution for individual bases (A, T, C, and G) to simulate various nucleotide biases. The app generates the DNA sequence, automatically transcribes it into its corresponding RNA transcript, translates the RNA into an amino acid protein sequence, and calculates the base frequencies displayed in a structured data table.")
    )),
  layout_columns(
    col_widths = 12,
    card(
      card_header("Virtual Sequence Generator"),
      sliderInput(inputId = "n_bases",
                  label = "Number of bases:",
                  min = 1,
                  max = 60,
                  value = 30,
                  width = "100%"),
      layout_columns(
        col_widths = c(3, 3, 3, 3),
        numericInput(inputId = "prob_A",
                     label = "Probability of A",
                     value = 0.25,
                     min = 0,
                     max = 1,
                     step = 0.1),
        numericInput(inputId = "prob_T",
                     label = "Probability of T",
                     value = 0.25,
                     min = 0,
                     max = 1,
                     step = 0.1),
        numericInput(inputId = "prob_C",
                     label = "Probability of C",
                     value = 0.25,
                     min = 0,
                     max = 1,
                     step = 0.1),
        numericInput(inputId = "prob_G",
                     label = "Probability of G",
                     value = 0.25,
                     min = 0,
                     max = 1,
                     step = 0.1)
      ))),
  layout_columns(
    col_widths = 12,
    card(
      card_header("Virtual Sequence output"),
      mainPanel(
        strong("DNA sequence"),
        verbatimTextOutput(outputId = "dna"),
        
        strong("RNA sequence"),
        verbatimTextOutput(outputId = "rna"),
        
        strong("Protein sequence"),
        verbatimTextOutput(outputId = "protein"),
        
        strong("Base Frequencies"),
        tableOutput(outputId = "base_table")
      )
    ))
)