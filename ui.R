
library(shiny)
navbarPage("Predator-Prey Total Length Simulation:",
  tabPanel("Individual(s)",         
    fluidPage(
      verticalLayout(
        titlePanel(span(h4("Select the tabs above to switch between individual- and population-level simulations"), style=c("color:darkgreen"))),
        wellPanel(
              titlePanel(h3("Predator Settings:")),
              fluidRow(
              # Copy the line below to make a select box 
                column(3, 
                       selectInput("units_input", label = h4("Units of Total Length"), 
                              choices = list("Metric (mm)" = "mm", 
                                             "Standard (inches)" = "inches"), 
                              selected = 1)),
                column(3, offset=0.25,
                       selectInput("species_input", label = h4("Predator Species"), 
                                   choices = list("Muskellunge" = "Muskellunge",
                                                  "Northern Pike" = "Northern Pike",
                                                  "Walleye" = "Walleye",
                                                  "Largemouth Bass" = "Largemouth Bass",
                                                  "Smallmouth Bass"  = "Smallmouth Bass",
                                                  "Rock Bass" = "Rock Bass",
                                                  "Crappie" = "Crappie"), 
                                   selected = 1)
                    ),
    
                column(5, offset=0,
                       textInput("pred_tl_text", label=h4("Predator Total Length(s)"), 
                                 placeholder = c("insert total lengths seperated by commas"))
              )),
              fluidRow(
                helpText(span(textOutput("ind_warning_text"), style=c("color:red")))
              )
        ),
              wellPanel(
                   titlePanel(h3("Predator-Prey Length Relationship:")),
                   fluidRow(
                     # Copy the line below to make a select box 
                     column(8, 
                            plotOutput("plot1", width = 550, height=350),
                            downloadButton('downloadPlot', "Download Plot"),
                            downloadButton('download_ind_Data', "Download Data")
                     ),
                     column(3,offset=0.5,
                            titlePanel( h5("Figure: Predator total length-specific kernel density distributions (i.e., relative frequency) of ingested prey total lengths. Kernel densities at a given predator length were derived by estimating prey lengths from percentile regressions of every percentile from the 1st to the 99th (Gaeta et al. in review). The modes of each kernel density distribution (i.e., the most common prey length per predator length) are shown along the bottom axis as gray symbols."))
                            )
                     )),
              wellPanel(
                titlePanel(h3("Results Summary:")),
                titlePanel( h5("Table: Summary statistics of prey total length per predator length derived by estimating prey lengths from percentile regressions of every percentile from the 1st to the 99th (Gaeta et al. in review). Statistics include the mode (i.e., the most common prey total length), minimum ingested prey length (1st percentile; i.e., the smallest size prey ingested), the median ingested prey length (50th percentile), and the maximum ingested prey length (99th percentile; i.e., realized gape-limit). The relative lengths are calculated for each of these metrics as a percentage of predator total length.")),
                tableOutput("table"),
                helpText(h6("NOTE: a warning will appear in the top row of the table if input lengths are greater or less that the predator lengths used to develop these relationships; however, the estimates of prey size are still dervied. Use these extrapolated values with caution."))
              ),
              wellPanel(
                titlePanel(a(h5("Models, tables, and figures developed by Jereme W. Gaeta, Assistant Professor, Utah State University. LakeEcologyLab.org"), href="http://LakeEcologyLab.org", target="_blank"))
                  )
        ))#End FluidPage
  ),#End first tabPanel
    
  ##################################
    #### Population tab:
  ##################################  
  tabPanel("Population",
           fluidPage(
             verticalLayout(
               titlePanel(span(h4("Select the tabs above to switch between individual- and population-level simulations"), style=c("color:darkgreen"))),
               wellPanel(
                 titlePanel(h3("Predator Settings:")),
                 fluidRow(
                   column(3, 
                          selectInput("units_pop_input", label = h4("Units of Total Length"), 
                                      choices = list("Metric (mm)" = "mm", 
                                                     "Standard (inches)" = "inches"), 
                                      selected = 1)
                   ), #End column 1
                   column(3, offset=0.25,
                          selectInput("species_pop_input", label = h4("Predator Species"), 
                                      choices = list("Muskellunge" = "Muskellunge",
                                                     "Northern Pike" = "Northern Pike",
                                                     "Walleye" = "Walleye",
                                                     "Largemouth Bass" = "Largemouth Bass",
                                                     "Smallmouth Bass"  = "Smallmouth Bass",
                                                     "Rock Bass" = "Rock Bass",
                                                     "Crappie" = "Crappie"), 
                                      selected = 1)
                   ), #End colum 2
                   
                   column(5, offset=0,
                          fileInput("csv_file_name", label=h4("Choose a CSV File"), multiple = F,
                                    accept=c('text/csv','text/comma-separated-values,
                                             text/plain','.csv')),
                          helpText("Select a .csv file with a single column of predator lengths")
                   )# End Column 3
                 ),#End Fluid row
                fluidRow(
                  helpText(span(textOutput("warning_text"), style=c("color:red")))
                  )
              ),# End user well Panel
               wellPanel(
                 fluidRow(
                   column(5,titlePanel(h3("Predator-Prey Population-Level Plots:"))),
                   column(4,
                          radioButtons("plot_type", label = h5("Distribution type:"),
                                       choices = list("Histogram" = "histogram_plot", 
                                                      "Density" = "density_plot"), inline=TRUE)),
                   column(3,offset=0.1, br(),
                           checkboxInput("prey_percentile_check", label = "Show prey percentile", value = TRUE))
                   
                 ),#Fluid Row Close
                 conditionalPanel(
                   condition = "input.prey_percentile_check == true",
                   fluidRow(
                     column(9,
                            sliderInput("precentile_slider", label = h5("Prey percentile"), 
                                        min = 0, max = 100, value = 95))
                   )#Fluid Row Close 
                 ),#Conditional Panel close

                 plotOutput("Pop_plot_1", width = 850, height=350),
                 titlePanel( h5("Figure: (left) Predator population total length distribution and (right) the total length distribution of the prey ingested by the predator population. Prey lengths were derived from percentile regressions estimated in Gaeta et al. (in review). Ninety-nine prey fishes were simulatied per predator length (one per predator percentile regression; see Gaeta et al. (in review) for details).")),
                 conditionalPanel(
                   condition = "input.prey_percentile_check == true",
                   tableOutput("prey_percentile_table")
                 ),#close conditional panel
                 #plotOutput("pop_2_panel_plot", width = 0, height=0),
                 downloadButton('downloadPlot_pop', "Download Plot"),
                 downloadButton('download_pop_Data', "Download Data")
               ),# Well Panel close
               wellPanel(
                 titlePanel(h3("Ingested Prey Length Summary:")),
                 tableOutput("pop_table")
               ),# Well Panel close
               wellPanel(
                 titlePanel(a(h5("Models, tables, and figures developed by Jereme W. Gaeta, Assistant Professor, Utah State University. LakeEcologyLab.org"), href="http://LakeEcologyLab.org", target="_blank"))
               )# Well Panel close
              )# End vertical layout
           )#End fluid Page
        )#End tab Panel
)#End NavBarPage