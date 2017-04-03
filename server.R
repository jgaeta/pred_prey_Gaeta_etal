
library(shiny)

function(input, output) {
  #########################
  #set reactive input parameters
  #########################
  

  units <- reactive({
    input$units_input
  })
  
  species <- reactive({
    input$species_input
  })
  
  units_pop <- reactive({
    input$units_pop_input
  })
  
  species_pop <- reactive({
    input$species_pop_input
  })
  
  pop_plot_type <- reactive({
    input$plot_type
  })
  
  show_percentile <- reactive({
    input$prey_percentile_check
  })
  
  pop_prey_percentile <- reactive({
    input$precentile_slider
  })

  

  #########################
  #plot
  #########################
  
  output$plot1 <- renderPlot({
    msk_alpha=c(2.38,2.26,2.2,2.14,2.19,2.19,2.29,2.27,2.33,2.21,2.23,2.1,2.09,2,2.07,2.12,2.1,2.14,2.12,2.07,1.91,1.9,1.89,1.82,1.85,1.85,1.84,1.86,1.83,1.82,1.71,1.69,1.7,1.65,1.7,1.67,1.7,1.77,1.8,1.86,1.89,1.93,1.96,1.98,2.01,2.04,2.01,2.01,2.03,2,2.04,2.03,2.06,2.09,2.1,2.19,2.22,2.31,2.43,2.48,2.49,2.52,2.55,2.59,2.56,2.53,2.56,2.55,2.57,2.61,2.63,2.67,2.67,2.67,2.67,2.72,2.73,2.81,2.85,2.88,2.99,2.98,2.94,3.02,3.08,3.11,2.96,2.98,2.93,2.92,3.04,3,3.1,3.14,3.36,3.24,3.22,3.41,3.62)
    msk_beta=c(5.42E-02,6.08E-02,6.40E-02,6.74E-02,6.58E-02,6.56E-02,6.24E-02,6.69E-02,6.54E-02,7.17E-02,7.14E-02,7.88E-02,7.94E-02,8.42E-02,8.23E-02,8.07E-02,8.17E-02,8.09E-02,8.26E-02,8.55E-02,9.42E-02,9.52E-02,9.61E-02,1.00E-01,9.94E-02,1.00E-01,1.01E-01,1.01E-01,1.03E-01,1.04E-01,1.10E-01,1.11E-01,1.11E-01,1.14E-01,1.13E-01,1.15E-01,1.14E-01,1.12E-01,1.11E-01,1.10E-01,1.09E-01,1.08E-01,1.07E-01,1.06E-01,1.05E-01,1.05E-01,1.07E-01,1.07E-01,1.07E-01,1.08E-01,1.07E-01,1.09E-01,1.08E-01,1.07E-01,1.07E-01,1.04E-01,1.03E-01,1.01E-01,9.65E-02,9.48E-02,9.45E-02,9.36E-02,9.32E-02,9.22E-02,9.40E-02,9.55E-02,9.47E-02,9.58E-02,9.51E-02,9.40E-02,9.36E-02,9.25E-02,9.36E-02,9.44E-02,9.48E-02,9.34E-02,9.31E-02,9.14E-02,9.00E-02,9.00E-02,8.63E-02,8.74E-02,8.98E-02,8.74E-02,8.52E-02,8.46E-02,9.26E-02,9.21E-02,9.55E-02,9.63E-02,9.26E-02,9.47E-02,9.20E-02,9.13E-02,8.43E-02,9.09E-02,9.19E-02,8.59E-02,7.92E-02)
    
    nop_alpha=c(3.366089, 3.460268, 3.528129, 3.520458, 3.484411, 3.477368, 3.485094, 3.493590, 3.501776, 3.510633, 3.523573, 3.541925, 3.563146, 3.586583, 3.608863, 3.629837, 3.649585, 3.667902, 3.683396, 3.698561, 3.713747, 3.730353, 3.746176, 3.760816, 3.775344, 3.788726, 3.800686, 3.812565, 3.823074, 3.832733, 3.841978, 3.851562, 3.860837, 3.869798, 3.878160, 3.886872, 3.895793, 3.904661, 3.914226, 3.924741, 3.936229, 3.947866, 3.959017, 3.969649, 3.978102, 3.984675, 3.989479, 3.993135, 3.996724, 4.001126, 4.007363, 4.015808, 4.027471, 4.040977, 4.056159, 4.071658, 4.087650, 4.105043, 4.121798, 4.140289, 4.158560, 4.176820, 4.195991, 4.213278, 4.230155, 4.243266, 4.253039, 4.258284, 4.262006, 4.263756, 4.267115, 4.270812, 4.276454, 4.282682, 4.289367, 4.297377, 4.302216, 4.308133, 4.308178, 4.307687, 4.314455, 4.327202, 4.340699, 4.351478, 4.358606, 4.363980, 4.372018, 4.385114, 4.400359, 4.415792, 4.434462, 4.457429, 4.487720, 4.527660, 4.572561, 4.624344, 4.693141, 4.785523, 4.917826)
    nop_beta=c(2.353408e-07,2.184611e-07,2.052394e-07,3.173544e-07,5.002051e-07,5.851097e-07,6.119311e-07,6.359401e-07,6.574068e-07,6.764655e-07,6.829558e-07,6.768755e-07,6.660450e-07,6.529526e-07,6.408207e-07,6.295765e-07,6.173532e-07,6.044725e-07,5.959689e-07,5.891063e-07,5.832189e-07,5.742311e-07,5.648784e-07,5.560639e-07,5.457697e-07,5.361749e-07,5.287247e-07,5.215570e-07,5.170217e-07,5.132963e-07,5.089191e-07,5.033630e-07,4.977639e-07,4.925096e-07,4.895483e-07,4.871078e-07,4.846872e-07,4.818475e-07,4.775764e-07,4.718217e-07,4.647790e-07,4.577625e-07,4.515279e-07,4.465493e-07,4.449536e-07,4.467541e-07,4.522178e-07,4.603893e-07,4.702467e-07,4.799447e-07,4.868627e-07,4.915315e-07,4.912569e-07,4.910608e-07,4.896966e-07,4.892583e-07,4.897293e-07,4.877538e-07,4.860956e-07,4.811333e-07,4.771412e-07,4.745583e-07,4.711140e-07,4.709221e-07,4.714647e-07,4.794595e-07,4.982651e-07,5.307342e-07,5.712707e-07,6.162679e-07,6.598933e-07,7.003335e-07,7.351291e-07,7.699003e-07,8.067946e-07,8.462099e-07,9.000536e-07,9.616614e-07,1.045841e-06,1.135319e-06,1.210499e-06,1.263685e-06,1.311618e-06,1.367023e-06,1.436998e-06,1.509125e-06,1.565180e-06,1.598805e-06,1.623110e-06,1.649269e-06,1.666387e-06,1.674611e-06,1.675381e-06,1.664914e-06,1.637630e-06,1.600872e-06,1.564059e-06,1.507512e-06,1.443457e-06)
    
    
    wae_alpha=c(2.31,2.48,2.67,2.78,2.89,2.93,2.95,2.99,3.03,3.07,3.08,3.1,3.12,3.14,3.17,3.16,3.17,3.18,3.2,3.21,3.23,3.26,3.27,3.27,3.29,3.3,3.31,3.32,3.32,3.33,3.35,3.36,3.38,3.39,3.39,3.4,3.41,3.42,3.43,3.44,3.46,3.46,3.48,3.48,3.49,3.5,3.51,3.51,3.52,3.52,3.53,3.54,3.55,3.55,3.56,3.56,3.56,3.57,3.57,3.58,3.58,3.58,3.59,3.59,3.61,3.61,3.61,3.61,3.61,3.61,3.61,3.62,3.61,3.62,3.6,3.6,3.6,3.6,3.59,3.59,3.58,3.57,3.55,3.54,3.55,3.56,3.56,3.54,3.52,3.52,3.53,3.5,3.46,3.45,3.44,3.42,3.4,3.36,3.3)
    wae_beta=c(3.79E-02,3.59E-02,3.02E-02,2.81E-02,2.51E-02,2.51E-02,2.56E-02,2.47E-02,2.40E-02,2.32E-02,2.35E-02,2.34E-02,2.32E-02,2.29E-02,2.23E-02,2.34E-02,2.36E-02,2.35E-02,2.34E-02,2.34E-02,2.32E-02,2.24E-02,2.25E-02,2.27E-02,2.26E-02,2.25E-02,2.25E-02,2.25E-02,2.30E-02,2.28E-02,2.26E-02,2.25E-02,2.21E-02,2.20E-02,2.22E-02,2.22E-02,2.21E-02,2.18E-02,2.16E-02,2.15E-02,2.12E-02,2.13E-02,2.11E-02,2.14E-02,2.11E-02,2.11E-02,2.12E-02,2.12E-02,2.14E-02,2.16E-02,2.14E-02,2.16E-02,2.15E-02,2.18E-02,2.18E-02,2.20E-02,2.22E-02,2.24E-02,2.27E-02,2.27E-02,2.30E-02,2.34E-02,2.37E-02,2.39E-02,2.37E-02,2.41E-02,2.45E-02,2.47E-02,2.54E-02,2.60E-02,2.63E-02,2.65E-02,2.75E-02,2.79E-02,2.92E-02,3.01E-02,3.08E-02,3.18E-02,3.27E-02,3.38E-02,3.53E-02,3.69E-02,3.87E-02,4.03E-02,4.08E-02,4.15E-02,4.30E-02,4.52E-02,4.72E-02,4.87E-02,4.99E-02,5.30E-02,5.64E-02,5.88E-02,6.13E-02,6.45E-02,6.81E-02,7.29E-02,8.05E-02)
    
    
    lmb_alpha=c(1.57,1.53,1.42,1.22,1.17,1.16,1.2,1.13,1.2,1.13,1.22,1.18,1.14,1.08,1.21,1.23,1.24,1.3,1.36,1.37,1.43,1.48,1.47,1.49,1.57,1.59,1.62,1.61,1.62,1.66,1.68,1.7,1.68,1.68,1.72,1.74,1.76,1.79,1.77,1.77,1.77,1.8,1.81,1.81,1.84,1.84,1.84,1.85,1.89,1.9,1.91,1.9,1.93,1.92,1.91,1.94,1.92,1.93,1.95,1.96,1.96,1.97,1.98,1.95,1.96,1.95,1.99,1.99,1.98,1.98,1.99,2,1.99,2.01,2.01,2.02,2.05,2.09,2.13,2.17,2.15,2.14,2.14,2.15,2.15,2.19,2.2,2.2,2.23,2.27,2.27,2.29,2.34,2.38,2.48,2.56,2.56,2.77,2.82)
    lmb_beta=c(5.47E-02,6.50E-02,7.64E-02,9.47E-02,1.02E-01,1.07E-01,1.06E-01,1.12E-01,1.10E-01,1.16E-01,1.12E-01,1.17E-01,1.21E-01,1.26E-01,1.21E-01,1.20E-01,1.22E-01,1.19E-01,1.17E-01,1.18E-01,1.15E-01,1.13E-01,1.15E-01,1.14E-01,1.11E-01,1.11E-01,1.10E-01,1.12E-01,1.12E-01,1.11E-01,1.10E-01,1.09E-01,1.12E-01,1.13E-01,1.12E-01,1.12E-01,1.11E-01,1.10E-01,1.12E-01,1.13E-01,1.14E-01,1.13E-01,1.13E-01,1.13E-01,1.12E-01,1.13E-01,1.14E-01,1.14E-01,1.12E-01,1.12E-01,1.12E-01,1.13E-01,1.13E-01,1.14E-01,1.15E-01,1.14E-01,1.16E-01,1.17E-01,1.17E-01,1.17E-01,1.17E-01,1.17E-01,1.18E-01,1.21E-01,1.21E-01,1.23E-01,1.21E-01,1.22E-01,1.24E-01,1.25E-01,1.25E-01,1.26E-01,1.27E-01,1.27E-01,1.28E-01,1.29E-01,1.28E-01,1.26E-01,1.24E-01,1.23E-01,1.25E-01,1.27E-01,1.28E-01,1.28E-01,1.29E-01,1.28E-01,1.27E-01,1.29E-01,1.28E-01,1.27E-01,1.28E-01,1.28E-01,1.26E-01,1.25E-01,1.21E-01,1.17E-01,1.19E-01,1.10E-01,1.11E-01)
    
    smb_alpha=c(1.29,1.33,1.17,1.1,0.78,1.16,1.35,1.46,1.39,0.92,0.97,0.76,0.62,0.46,0.25,0.14,0.33,0.52,1.82,1.74,1.62,1.66,2.12,2.08,2.55,2.47,2.44,2.26,2.33,2.31,2.23,2.17,2.1,2.07,2.08,2.04,2.12,2.12,2.06,2.15,2.25,2.22,2.18,2.15,2.15,2.09,2.01,1.97,2.03,1.99,1.97,1.86,1.81,1.92,1.85,1.85,1.87,1.89,1.87,1.84,1.78,1.86,1.83,1.92,1.91,1.94,1.92,1.98,1.94,1.93,1.86,1.96,1.83,1.93,2.04,2.06,2.03,1.92,1.85,1.79,1.73,1.73,1.76,1.64,2.1,2.04,1.86,2.24,2.3,2.06,2.03,1.87,1.75,1.63,1.74,2.44,1.07,1.48,2.31)
    smb_beta=c(3.25E-01,3.21E-01,3.56E-01,3.69E-01,4.34E-01,3.71E-01,3.42E-01,3.26E-01,3.42E-01,4.30E-01,4.25E-01,4.66E-01,4.93E-01,5.27E-01,5.68E-01,5.89E-01,5.61E-01,5.31E-01,3.23E-01,3.39E-01,3.62E-01,3.61E-01,2.86E-01,2.95E-01,2.17E-01,2.35E-01,2.41E-01,2.79E-01,2.68E-01,2.73E-01,2.89E-01,3.00E-01,3.12E-01,3.19E-01,3.18E-01,3.26E-01,3.15E-01,3.16E-01,3.28E-01,3.13E-01,2.98E-01,3.04E-01,3.14E-01,3.21E-01,3.22E-01,3.33E-01,3.48E-01,3.57E-01,3.48E-01,3.56E-01,3.62E-01,3.84E-01,3.95E-01,3.77E-01,3.92E-01,3.94E-01,3.93E-01,3.91E-01,3.95E-01,4.02E-01,4.14E-01,4.03E-01,4.10E-01,3.95E-01,3.97E-01,3.95E-01,3.99E-01,3.89E-01,3.98E-01,4.01E-01,4.14E-01,4.00E-01,4.24E-01,4.09E-01,3.92E-01,3.91E-01,3.99E-01,4.18E-01,4.33E-01,4.47E-01,4.60E-01,4.60E-01,4.55E-01,4.80E-01,4.06E-01,4.23E-01,4.58E-01,3.96E-01,3.88E-01,4.31E-01,4.44E-01,4.78E-01,5.09E-01,5.32E-01,5.20E-01,4.08E-01,6.55E-01,5.96E-01,4.61E-01)
    
    rkb_alpha=c(3.09,3.09,3.15,3.14,3.14,3.24,3.24,3.19,3.19,3.17,3.14,3.14,3.15,3.15,3.15,3.16,3.16,3.13,3.12,3.13,3.13,3.13,3.13,3.13,3.13,3.13,3.19,3.19,3.17,3.17,3.21,3.21,3.22,3.22,3.23,3.23,3.23,3.22,3.22,3.22,3.21,3.21,3.23,3.23,3.23,3.21,3.22,3.22,3.23,3.23,3.23,3.22,3.22,3.21,3.24,3.24,3.24,3.25,3.25,3.27,3.27,3.3,3.3,3.3,3.3,3.3,3.3,3.3,3.3,3.34,3.34,3.35,3.35,3.35,3.42,3.39,3.39,3.39,3.39,3.39,3.46,3.51,3.5,3.5,3.49,3.47,3.47,3.48,3.48,3.52,3.66,3.66,3.81,3.81,3.84,3.84,3.82,4.13,4.13)
    rkb_beta=c(6.78E-06,6.78E-06,5.67E-06,6.37E-06,6.37E-06,4.61E-06,4.61E-06,8.69E-06,8.97E-06,1.09E-05,1.23E-05,1.23E-05,1.19E-05,1.21E-05,1.21E-05,1.20E-05,1.20E-05,1.45E-05,1.47E-05,1.46E-05,1.46E-05,1.46E-05,1.47E-05,1.47E-05,1.52E-05,1.52E-05,1.40E-05,1.40E-05,1.54E-05,1.54E-05,1.44E-05,1.44E-05,1.43E-05,1.44E-05,1.42E-05,1.42E-05,1.42E-05,1.54E-05,1.54E-05,1.54E-05,1.62E-05,1.62E-05,1.59E-05,1.59E-05,1.58E-05,1.68E-05,1.67E-05,1.67E-05,1.64E-05,1.64E-05,1.68E-05,1.72E-05,1.72E-05,1.86E-05,1.77E-05,1.83E-05,1.83E-05,1.81E-05,1.81E-05,1.78E-05,1.80E-05,1.74E-05,1.74E-05,1.73E-05,1.73E-05,1.78E-05,1.78E-05,1.78E-05,1.78E-05,1.71E-05,1.71E-05,1.75E-05,1.75E-05,1.75E-05,1.62E-05,1.88E-05,1.91E-05,1.91E-05,1.91E-05,1.91E-05,1.79E-05,1.71E-05,1.78E-05,1.78E-05,1.90E-05,2.15E-05,2.15E-05,2.13E-05,2.13E-05,2.05E-05,1.80E-05,1.80E-05,1.59E-05,1.59E-05,1.55E-05,1.55E-05,1.70E-05,1.13E-05,1.13E-05)
    
    cpe_alpha=c(1.75,1.91,1.96,2.29,2.26,2.25,2.27,2.26,2.24,2.21,2.22,2.34,2.17,2.26,2.31,2.32,2.26,2.25,2.25,2.22,2.18,2.12,2.07,2.03,2,1.98,1.99,1.98,2.04,2.05,2.01,2.03,2.06,2.13,2.09,2.11,2.05,2.05,2.06,2.13,2.17,2.19,2.17,2.15,2.1,2.11,2.15,2.15,2.21,2.14,2.13,2.13,2.23,2.22,2.26,2.28,2.29,2.33,2.4,2.41,2.43,2.46,2.48,2.51,2.59,2.59,2.57,2.57,2.55,2.59,2.54,2.55,2.6,2.62,2.61,2.71,2.73,2.71,2.82,2.84,2.84,2.8,2.82,2.84,2.92,2.99,3.05,2.97,3.09,3.14,3.09,3.1,3.04,3.03,3.12,3.1,3.07,3.25,3.03)
    cpe_beta=c(3.62E-03,3.04E-03,3.07E-03,1.83E-03,2.05E-03,2.20E-03,2.12E-03,2.20E-03,2.30E-03,2.58E-03,2.56E-03,2.10E-03,2.91E-03,2.59E-03,2.42E-03,2.37E-03,2.79E-03,2.84E-03,2.85E-03,3.03E-03,3.27E-03,3.68E-03,3.96E-03,4.22E-03,4.53E-03,4.69E-03,4.65E-03,4.79E-03,4.65E-03,4.61E-03,4.86E-03,4.84E-03,4.73E-03,4.48E-03,4.72E-03,4.77E-03,5.10E-03,5.09E-03,5.05E-03,4.81E-03,4.66E-03,4.61E-03,4.80E-03,4.94E-03,5.41E-03,5.38E-03,5.27E-03,5.26E-03,5.09E-03,5.54E-03,5.70E-03,5.70E-03,5.39E-03,5.52E-03,5.47E-03,5.42E-03,5.43E-03,5.29E-03,5.10E-03,5.06E-03,5.06E-03,5.05E-03,5.00E-03,4.89E-03,4.62E-03,4.76E-03,4.93E-03,4.92E-03,5.07E-03,4.94E-03,5.24E-03,5.24E-03,5.09E-03,5.02E-03,5.09E-03,4.81E-03,4.77E-03,4.89E-03,4.56E-03,4.55E-03,4.59E-03,4.93E-03,4.86E-03,4.80E-03,4.55E-03,4.30E-03,4.07E-03,4.50E-03,4.10E-03,3.95E-03,4.27E-03,4.31E-03,4.74E-03,4.79E-03,4.52E-03,4.71E-03,4.90E-03,4.46E-03,5.91E-03)
    ##################
    
    
    
    #####################################
    # Calculations
    #####################################
    predator_list = c("Muskellunge", "Northern Pike" , "Walleye" , "Largemouth Bass" , "Smallmouth Bass" , "Rock Bass" , "Crappie")
    max_predator_length_in_data = c(1016, 1003, 789, 544.5, 524, 263, 403)
    min_predator_length_in_data = c(273, 225, 60, 40, 117, 93, 108)
    
    if(units()=="inches"){
      pred_tl <- reactive({
        as.numeric(strsplit(input$pred_tl_text, split = ",")[[1]])/0.0393701
      })
      max_predator_length_in_data = max_predator_length_in_data*0.0393701
      min_predator_length_in_data = min_predator_length_in_data*0.0393701
    }
    if(units()=="mm"){
      pred_tl <- reactive({
        as.numeric(strsplit(input$pred_tl_text, split = ",")[[1]])
      })
      max_predator_length_in_data = max_predator_length_in_data*1
      min_predator_length_in_data = min_predator_length_in_data*1
    }
    prey_tl = c()
    ind_pred_length=c()
    ind_prey_percentile=c()
    ind_pred_id=c()
    if(species() == "Muskellunge"){
      for(l in 1:length(pred_tl())){
        for(p in 1:99){
          prey_percentile_length = exp(msk_alpha[p] + msk_beta[p]*sqrt(pred_tl()[l]))
          prey_tl = c(prey_tl, prey_percentile_length)
          ind_prey_percentile=c(ind_prey_percentile, p)
        }
        ind_pred_length = c(ind_pred_length, rep(pred_tl()[l], times=99))
        ind_pred_id=c(ind_pred_id, rep(l, times=99))
      }
      max_predator_length = max_predator_length_in_data[which(predator_list=="Muskellunge")]
      min_predator_length = min_predator_length_in_data[which(predator_list=="Muskellunge")]
    }

    if(species() == "Northern Pike"){
      for(l in 1:length(pred_tl())){
        for(p in 1:99){
          prey_percentile_length = exp(nop_alpha[p] + nop_beta[p]*(pred_tl()[l]^2))
          prey_tl = c(prey_tl, prey_percentile_length)
          ind_prey_percentile=c(ind_prey_percentile, p)
        }
        ind_pred_length = c(ind_pred_length, rep(pred_tl()[l], times=99))
        ind_pred_id=c(ind_pred_id, rep(l, times=99))
      }
      max_predator_length = max_predator_length_in_data[which(predator_list=="Northern Pike")]
      min_predator_length = min_predator_length_in_data[which(predator_list=="Northern Pike")]
    }
    
    
    if(species() == "Walleye"){
      for(l in 1:length(pred_tl())){
        for(p in 1:99){
          prey_percentile_length = exp(wae_alpha[p] + wae_beta[p]*sqrt(pred_tl()[l]))
          prey_tl = c(prey_tl, prey_percentile_length)
          ind_prey_percentile=c(ind_prey_percentile, p)
        }
        ind_pred_length = c(ind_pred_length, rep(pred_tl()[l], times=99))
        ind_pred_id=c(ind_pred_id, rep(l, times=99))
      }
      max_predator_length = max_predator_length_in_data[which(predator_list=="Walleye")]
      min_predator_length = min_predator_length_in_data[which(predator_list=="Walleye")]
    }
    
    
    if(species() == "Largemouth Bass"){
      for(l in 1:length(pred_tl())){
        for(p in 1:99){
          prey_percentile_length = exp(lmb_alpha[p] + lmb_beta[p]*sqrt(pred_tl()[l]))
          prey_tl = c(prey_tl, prey_percentile_length)
          ind_prey_percentile=c(ind_prey_percentile, p)
        }
        ind_pred_length = c(ind_pred_length, rep(pred_tl()[l], times=99))
        ind_pred_id=c(ind_pred_id, rep(l, times=99))
      }
      max_predator_length = max_predator_length_in_data[which(predator_list=="Largemouth Bass")]
      min_predator_length = min_predator_length_in_data[which(predator_list=="Largemouth Bass")]
    }
    
    
    if(species() == "Smallmouth Bass"){
      for(l in 1:length(pred_tl())){
        for(p in 1:99){
          prey_percentile_length = exp(smb_alpha[p] + smb_beta[p]*log(pred_tl()[l]))
          prey_tl = c(prey_tl, prey_percentile_length)
          ind_prey_percentile=c(ind_prey_percentile, p)
        }
        ind_pred_length = c(ind_pred_length, rep(pred_tl()[l], times=99))
        ind_pred_id=c(ind_pred_id, rep(l, times=99))
      }
      max_predator_length = max_predator_length_in_data[which(predator_list=="Smallmouth Bass")]
      min_predator_length = min_predator_length_in_data[which(predator_list=="Smallmouth Bass")]
    }
    
    
    if(species() == "Rock Bass"){
      for(l in 1:length(pred_tl())){
        for(p in 1:99){
          prey_percentile_length = exp(rkb_alpha[p] + rkb_beta[p]*(pred_tl()[l]^2))
          prey_tl = c(prey_tl, prey_percentile_length)
          ind_prey_percentile=c(ind_prey_percentile, p)
        }
        ind_pred_length = c(ind_pred_length, rep(pred_tl()[l], times=99))
        ind_pred_id=c(ind_pred_id, rep(l, times=99))
      }
      max_predator_length = max_predator_length_in_data[which(predator_list=="Rock Bass")]
      min_predator_length = min_predator_length_in_data[which(predator_list=="Rock Bass")]
    }
    
    
    if(species() == "Crappie"){
      for(l in 1:length(pred_tl())){
        for(p in 1:99){
          prey_percentile_length = exp(cpe_alpha[p] + cpe_beta[p]*pred_tl()[l])
          prey_tl = c(prey_tl, prey_percentile_length)
          ind_prey_percentile=c(ind_prey_percentile, p)
        }
        ind_pred_length = c(ind_pred_length, rep(pred_tl()[l], times=99))
        ind_pred_id=c(ind_pred_id, rep(l, times=99))
      }
      max_predator_length = max_predator_length_in_data[which(predator_list=="Crappie")]
      min_predator_length = min_predator_length_in_data[which(predator_list=="Crappie")]
    }
    
    if(units()=="inches"){
      prey_tl = prey_tl*0.0393701
      pred_tl <- reactive({
        round(as.numeric(strsplit(input$pred_tl_text, split = ",")[[1]]), digits=2)
      })
    }
      

    if(units()=="mm"){
      prey_tl = prey_tl*1
      pred_tl <- reactive({
        round(as.numeric(strsplit(input$pred_tl_text, split = ",")[[1]]), digits=2)
      })
    }
    split_values = split(prey_tl, ceiling(seq_along(prey_tl)/99))
    
    mode_y=c()
    mode_x=c()
    y_max_pred = c()
    for(l in 1:length(pred_tl())){
      max_y = max(density(split_values[[l]])$y)
      y_max_pred = c(y_max_pred, max_y)
    }
    
    xlims = c(0, max(density(split_values[[which(pred_tl()==max(pred_tl()))]])$x))
    ylims = c(0, max(density(split_values[[which(pred_tl()==pred_tl()[which(y_max_pred==max(y_max_pred))])]])$y))
    for(l in 1:length(pred_tl())){
      mode_y_l = which(density(split_values[[l]])$y==max(density(split_values[[l]])$y))
      mode_x_l = density(split_values[[l]])$x[mode_y_l]
      mode_y=c(mode_y, mode_y_l)
      mode_x=c(mode_x, mode_x_l)
    }
    
    #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    ###############################
    #       Warnings
    ind_length_warning=c(0)
    ind_warning_text_1=NULL
    ind_warning_text_2a=NULL
    ind_warning_text_2b=NULL
    
    if(any(pred_tl()< min_predator_length | pred_tl()> max_predator_length)){
      ind_length_warning = c(1)
      ind_warning_text_1 = c("WARNING: 1 or more predator lengths outside of lengths used to calibrate models!")
      
    }
    
    if(units()=="mm" & ind_length_warning==1){
      if(max(pred_tl())> max_predator_length){
        ind_warning_text_2a= paste("(extrapolated > max", max_predator_length,
                               "mm)", sep=" ")
      }
      if(min(pred_tl())< min_predator_length){
        ind_warning_text_2b= paste("(extrapolated < min", min_predator_length,
                               "mm)", sep=" ")
      }
    }
    
    
    if(units()=="inches" & ind_length_warning==1){
      if(max(pred_tl())> max_predator_length){
        ind_warning_text_2a=  paste("(extrapolated > max", 
                                round(max_predator_length, digits=1),
                                "inches)", sep=" ")
      }
      if(min(pred_tl())< min_predator_length){
        ind_warning_text_2b=  paste("(extrapolated < min", 
                                round(min_predator_length, digits=1),
                                "inches)", sep=" ")
      }
    }
    output$ind_warning_text <- renderText({ 
      paste(ind_warning_text_1, ind_warning_text_2a, ind_warning_text_2b, sep=" ")
    })
    ################################
    #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
            #####################################
            # Plot
            #####################################
    
      par(mfrow=c(1,1), mar=c(4, 6, 2.5, 2))
      plot(x=xlims, y=ylims, las=1, ylab="",type='n',
           xlab="", main="", xlim=xlims, ylim=ylims)
      mtext(text = "Relative Frequency", line=3.5, side=2, cex=1.1)
      for(l in 1:length(pred_tl())){
        lines(density(split_values[[l]]) , lty=l, lwd=3)
      }
      mtext(text = species(), font=2, line=1, cex=1.5)
      points(mode_x, y=c(rep(0, times=length(pred_tl()))), pch = c(20+1:length(pred_tl())),
             cex=1, bg = c("gray75"), xpd=NA)
      density_legend = c()
      for(l in 1:length(pred_tl())){
        if(units()=="mm"){
          density_legend = c(density_legend, paste(pred_tl()[l],"mm", sep=" "))
          if(l==1){
            mtext(text = "Prey Total Length (mm)", line=2.25, side=1, cex=1.1)
          }
        }
        if(units()=="inches"){
          density_legend = c(density_legend, paste(pred_tl()[l],"inches", sep=" "))
          if(l==1){
            mtext(text = "Prey Total Length (inches)", line=2.25, side=1, cex=1.1)
          }
        }
      }
      legend("topright",legend = density_legend, lty=1:length(pred_tl()), lwd=2,inset=0.01, seg.len=3, bty='n', cex=1) # , pch = c(20+1:length(pred_tl())), pt.bg = c("gray75"), merge = FALSE
      
      text(((par('usr')[2]-par('usr')[1])*1.05)+par('usr')[1], ((par('usr')[4]-par('usr')[3])*-0.15)+par('usr')[3], "Figure credit: JW Gaeta", cex=0.8, xpd=NA, pos=2)
      text(((par('usr')[2]-par('usr')[1])*1.05)+par('usr')[1], ((par('usr')[4]-par('usr')[3])*-0.2)+par('usr')[3], "LakeEcologyLab.org", cex=0.8, xpd=NA, pos=2)
      
      
      plotInput <-function(){
        par(mfrow=c(1,1), mar=c(4, 6, 2.5, 2))
        plot(x=xlims, y=ylims, las=1, ylab="",type='n',
             xlab="", main="", xlim=xlims, ylim=ylims)
        mtext(text = "Relative Frequency", line=3.5, side=2, cex=1.1)
        for(l in 1:length(pred_tl())){
          lines(density(split_values[[l]]) , lty=l, lwd=3)
        }
        mtext(text = species(), font=2, line=1, cex=1.5)
        points(mode_x, y=c(rep(0, times=length(pred_tl()))), pch = c(20+1:length(pred_tl())),
               cex=1, bg = c("gray75"), xpd=NA)
        density_legend = c()
        for(l in 1:length(pred_tl())){
          if(units()=="mm"){
            density_legend = c(density_legend, paste(pred_tl()[l],"mm", sep=" "))
            if(l==1){
              mtext(text = "Prey Total Length (mm)", line=2.25, side=1, cex=1.1)
            }
          }
          if(units()=="inches"){
            density_legend = c(density_legend, paste(pred_tl()[l],"inches", sep=" "))
            if(l==1){
              mtext(text = "Prey Total Length (inches)", line=2.25, side=1, cex=1.1)
            }
          }
        }
        legend("topright",legend = density_legend, lty=1:length(pred_tl()), lwd=2,inset=0.01, 
               seg.len=3, bty='n', cex=1) # , pch = c(20+1:length(pred_tl())), pt.bg = c("gray75"), merge = FALSE
        
        text(((par('usr')[2]-par('usr')[1])*1.07)+par('usr')[1], ((par('usr')[4]-par('usr')[3])*-0.15)+par('usr')[3],
             "Figure credit: JW Gaeta", cex=0.7, xpd=NA, pos=2)
        text(((par('usr')[2]-par('usr')[1])*1.07)+par('usr')[1], ((par('usr')[4]-par('usr')[3])*-0.2)+par('usr')[3],
             "LakeEcologyLab.org", cex=0.7, xpd=NA, pos=2)
      }

      output$downloadPlot <- downloadHandler(
        filename = function() {
          paste(species(),'Gaeta_etal_InReview-', Sys.Date(), 'individual-level.tiff', sep='')
        },
        content = function(file) {
          tiff(file, width=7, height=4.5, units='in', compression="lzw", res=200)
          plotInput()
          dev.off()
        })   
      
      #####################################
      # Table
      #####################################
      # Generate a summary of the dataset
      
        if(units()=="mm"){
          table_cols = c("Predator total length (mm)", 
                         "Mode of ingested prey total length (mm; i.e., most common prey length)",
                         "Relative ingested mode of prey total length (% of predator length)",
                         "Minimum ingested prey length (mm, 1st-percentile)", 
                         "Relative minimum ingested prey length (% of predator length)",
                         "Median ingested prey length (mm, 50th-percentile)",
                         "Relative median ingested prey length (% of predator length)",
                         "Maximum ingested prey length (mm, 99th-percentile)",
                         "Relative maximum ingested prey length (% of predator length)")
          
        }
        if(units()=="inches"){
          table_cols = c("Predator total length (inches)", 
                         "Mode of prey total length (inches; i.e., most common prey length)",
                         "Relative ingested mode of prey total length (% of predator length)",
                         "Minimum ingested prey length (inches, 1st-percentile)", 
                         "Relative minimum ingested prey length (% of predator length)",
                         "Median ingested prey length (inches, 50th-percentile)",
                         "Relative median ingested prey length (% of predator length)",
                         "Maximum ingested prey length (inches, 99th-percentile)",
                         "Relative maximum ingested prey length (% of predator length)")
        }
        
        
        
        summary_table=matrix(nrow = length(pred_tl()), ncol = length(table_cols))
        
        for(l in 1:length(pred_tl())){
          summary_table[l,1]=pred_tl()[l]
          summary_table[l,2]=mode_x[l]
          summary_table[l,3] = summary_table[l,2]/summary_table[l,1]*100
          summary_table[l,4]=split_values[[l]][1]
          summary_table[l,5] = summary_table[l,4]/summary_table[l,1]*100
          summary_table[l,6]=split_values[[l]][50]
          summary_table[l,7] = summary_table[l,6]/summary_table[l,1]*100
          summary_table[l,8]=split_values[[l]][99]
          summary_table[l,9] = summary_table[l,8]/summary_table[l,1]*100
        }
        summary_table = data.frame(summary_table)
        summary_table=t(summary_table)
        rownames(summary_table) = table_cols
        summary_table = round(summary_table, digits=1)
        
        if(any(pred_tl()< min_predator_length | pred_tl()> max_predator_length)){
          warning_row = matrix(data=0, 
                               nrow = 1, ncol = length(summary_table[1,]))
          warning_row=data.frame(warning_row)
          colnames(summary_table)=colnames(warning_row)
          summary_table=rbind(warning_row, summary_table)
          row.names(summary_table)[1] = c("WARNING: 1 or more predator lengths outside of lengths used to calibrate models!   ")
          summary_table[1,] = rep("(within range)", times=length(pred_tl()))
        }
        
        
        col_names=c()
        if(units()=="mm"){
          for(l in 1:length(pred_tl())){
            if(pred_tl()[l]> max_predator_length){
              summary_table[1,l] = paste("(extrapolated > max", max_predator_length,
                                         "mm)", sep=" ")
            }
            if(pred_tl()[l]< min_predator_length){
              summary_table[1,l] = paste("(extrapolated < min", min_predator_length,
                                         "mm)", sep=" ")
            }
            col_name = paste(species(), l, sep=" ")
            col_names = c(col_names, col_name)
          }
        }
        
        if(units()=="inches"){
          for(l in 1:length(pred_tl())){
            if(pred_tl()[l]> max_predator_length){
              summary_table[1,l] = paste("(extrapolated > max", 
                                         round(max_predator_length, digits=1),
                                         "inches)", sep=" ")
            }
            if(pred_tl()[l]< min_predator_length){
              summary_table[1,l] = paste("(extrapolated < min", 
                                         round(min_predator_length, digits=1),
                                         "inches)", sep=" ")
            }
            col_name = paste(species(), l, sep=" ")
            col_names = c(col_names, col_name)
          }
        }
        
       
      
      output$summary <- renderPrint({   
        summary_table
        })
      output$table <- renderTable({   
        rendered_ind_table = data.frame(summary_table, row.names = c(rownames(summary_table)))
        colnames(rendered_ind_table)=col_names
        rendered_ind_table
      },rownames=TRUE)
      
      output$download_ind_Data <- downloadHandler(
        filename = function() { paste(species_pop(),'Gaeta_etal_InReview-',
                                      Sys.Date(), 'individual-level.csv', sep='') },
        content = function(file) {
          write.csv(data.frame(predator_species=rep(species_pop(), times = length(prey_tl)),
                               predator_number=ind_pred_id,
                               prey_percentile=ind_prey_percentile,
                               predator_total_length=ind_pred_length,                                                           prey_total_length=prey_tl), file)
        }
      )
      
      
      
    })#End of "render plot" level.
  #############################################
  #############################################
  #~ Poulation tab
  #############################################
  #############################################
  observe({
    file = input$csv_file_name
    if (is.null(file)) {
      return(NULL)
    }
    csv_file = read.csv(file$datapath)
    output$Pop_plot_1 <- renderPlot({
      msk_alpha=c(2.38,2.26,2.2,2.14,2.19,2.19,2.29,2.27,2.33,2.21,2.23,2.1,2.09,2,2.07,2.12,2.1,2.14,2.12,2.07,1.91,1.9,1.89,1.82,1.85,1.85,1.84,1.86,1.83,1.82,1.71,1.69,1.7,1.65,1.7,1.67,1.7,1.77,1.8,1.86,1.89,1.93,1.96,1.98,2.01,2.04,2.01,2.01,2.03,2,2.04,2.03,2.06,2.09,2.1,2.19,2.22,2.31,2.43,2.48,2.49,2.52,2.55,2.59,2.56,2.53,2.56,2.55,2.57,2.61,2.63,2.67,2.67,2.67,2.67,2.72,2.73,2.81,2.85,2.88,2.99,2.98,2.94,3.02,3.08,3.11,2.96,2.98,2.93,2.92,3.04,3,3.1,3.14,3.36,3.24,3.22,3.41,3.62)
      msk_beta=c(5.42E-02,6.08E-02,6.40E-02,6.74E-02,6.58E-02,6.56E-02,6.24E-02,6.69E-02,6.54E-02,7.17E-02,7.14E-02,7.88E-02,7.94E-02,8.42E-02,8.23E-02,8.07E-02,8.17E-02,8.09E-02,8.26E-02,8.55E-02,9.42E-02,9.52E-02,9.61E-02,1.00E-01,9.94E-02,1.00E-01,1.01E-01,1.01E-01,1.03E-01,1.04E-01,1.10E-01,1.11E-01,1.11E-01,1.14E-01,1.13E-01,1.15E-01,1.14E-01,1.12E-01,1.11E-01,1.10E-01,1.09E-01,1.08E-01,1.07E-01,1.06E-01,1.05E-01,1.05E-01,1.07E-01,1.07E-01,1.07E-01,1.08E-01,1.07E-01,1.09E-01,1.08E-01,1.07E-01,1.07E-01,1.04E-01,1.03E-01,1.01E-01,9.65E-02,9.48E-02,9.45E-02,9.36E-02,9.32E-02,9.22E-02,9.40E-02,9.55E-02,9.47E-02,9.58E-02,9.51E-02,9.40E-02,9.36E-02,9.25E-02,9.36E-02,9.44E-02,9.48E-02,9.34E-02,9.31E-02,9.14E-02,9.00E-02,9.00E-02,8.63E-02,8.74E-02,8.98E-02,8.74E-02,8.52E-02,8.46E-02,9.26E-02,9.21E-02,9.55E-02,9.63E-02,9.26E-02,9.47E-02,9.20E-02,9.13E-02,8.43E-02,9.09E-02,9.19E-02,8.59E-02,7.92E-02)
      
      nop_alpha=c(3.366089, 3.460268, 3.528129, 3.520458, 3.484411, 3.477368, 3.485094, 3.493590, 3.501776, 3.510633, 3.523573, 3.541925, 3.563146, 3.586583, 3.608863, 3.629837, 3.649585, 3.667902, 3.683396, 3.698561, 3.713747, 3.730353, 3.746176, 3.760816, 3.775344, 3.788726, 3.800686, 3.812565, 3.823074, 3.832733, 3.841978, 3.851562, 3.860837, 3.869798, 3.878160, 3.886872, 3.895793, 3.904661, 3.914226, 3.924741, 3.936229, 3.947866, 3.959017, 3.969649, 3.978102, 3.984675, 3.989479, 3.993135, 3.996724, 4.001126, 4.007363, 4.015808, 4.027471, 4.040977, 4.056159, 4.071658, 4.087650, 4.105043, 4.121798, 4.140289, 4.158560, 4.176820, 4.195991, 4.213278, 4.230155, 4.243266, 4.253039, 4.258284, 4.262006, 4.263756, 4.267115, 4.270812, 4.276454, 4.282682, 4.289367, 4.297377, 4.302216, 4.308133, 4.308178, 4.307687, 4.314455, 4.327202, 4.340699, 4.351478, 4.358606, 4.363980, 4.372018, 4.385114, 4.400359, 4.415792, 4.434462, 4.457429, 4.487720, 4.527660, 4.572561, 4.624344, 4.693141, 4.785523, 4.917826)
      nop_beta=c(2.353408e-07,2.184611e-07,2.052394e-07,3.173544e-07,5.002051e-07,5.851097e-07,6.119311e-07,6.359401e-07,6.574068e-07,6.764655e-07,6.829558e-07,6.768755e-07,6.660450e-07,6.529526e-07,6.408207e-07,6.295765e-07,6.173532e-07,6.044725e-07,5.959689e-07,5.891063e-07,5.832189e-07,5.742311e-07,5.648784e-07,5.560639e-07,5.457697e-07,5.361749e-07,5.287247e-07,5.215570e-07,5.170217e-07,5.132963e-07,5.089191e-07,5.033630e-07,4.977639e-07,4.925096e-07,4.895483e-07,4.871078e-07,4.846872e-07,4.818475e-07,4.775764e-07,4.718217e-07,4.647790e-07,4.577625e-07,4.515279e-07,4.465493e-07,4.449536e-07,4.467541e-07,4.522178e-07,4.603893e-07,4.702467e-07,4.799447e-07,4.868627e-07,4.915315e-07,4.912569e-07,4.910608e-07,4.896966e-07,4.892583e-07,4.897293e-07,4.877538e-07,4.860956e-07,4.811333e-07,4.771412e-07,4.745583e-07,4.711140e-07,4.709221e-07,4.714647e-07,4.794595e-07,4.982651e-07,5.307342e-07,5.712707e-07,6.162679e-07,6.598933e-07,7.003335e-07,7.351291e-07,7.699003e-07,8.067946e-07,8.462099e-07,9.000536e-07,9.616614e-07,1.045841e-06,1.135319e-06,1.210499e-06,1.263685e-06,1.311618e-06,1.367023e-06,1.436998e-06,1.509125e-06,1.565180e-06,1.598805e-06,1.623110e-06,1.649269e-06,1.666387e-06,1.674611e-06,1.675381e-06,1.664914e-06,1.637630e-06,1.600872e-06,1.564059e-06,1.507512e-06,1.443457e-06)
      
      
      wae_alpha=c(2.31,2.48,2.67,2.78,2.89,2.93,2.95,2.99,3.03,3.07,3.08,3.1,3.12,3.14,3.17,3.16,3.17,3.18,3.2,3.21,3.23,3.26,3.27,3.27,3.29,3.3,3.31,3.32,3.32,3.33,3.35,3.36,3.38,3.39,3.39,3.4,3.41,3.42,3.43,3.44,3.46,3.46,3.48,3.48,3.49,3.5,3.51,3.51,3.52,3.52,3.53,3.54,3.55,3.55,3.56,3.56,3.56,3.57,3.57,3.58,3.58,3.58,3.59,3.59,3.61,3.61,3.61,3.61,3.61,3.61,3.61,3.62,3.61,3.62,3.6,3.6,3.6,3.6,3.59,3.59,3.58,3.57,3.55,3.54,3.55,3.56,3.56,3.54,3.52,3.52,3.53,3.5,3.46,3.45,3.44,3.42,3.4,3.36,3.3)
      wae_beta=c(3.79E-02,3.59E-02,3.02E-02,2.81E-02,2.51E-02,2.51E-02,2.56E-02,2.47E-02,2.40E-02,2.32E-02,2.35E-02,2.34E-02,2.32E-02,2.29E-02,2.23E-02,2.34E-02,2.36E-02,2.35E-02,2.34E-02,2.34E-02,2.32E-02,2.24E-02,2.25E-02,2.27E-02,2.26E-02,2.25E-02,2.25E-02,2.25E-02,2.30E-02,2.28E-02,2.26E-02,2.25E-02,2.21E-02,2.20E-02,2.22E-02,2.22E-02,2.21E-02,2.18E-02,2.16E-02,2.15E-02,2.12E-02,2.13E-02,2.11E-02,2.14E-02,2.11E-02,2.11E-02,2.12E-02,2.12E-02,2.14E-02,2.16E-02,2.14E-02,2.16E-02,2.15E-02,2.18E-02,2.18E-02,2.20E-02,2.22E-02,2.24E-02,2.27E-02,2.27E-02,2.30E-02,2.34E-02,2.37E-02,2.39E-02,2.37E-02,2.41E-02,2.45E-02,2.47E-02,2.54E-02,2.60E-02,2.63E-02,2.65E-02,2.75E-02,2.79E-02,2.92E-02,3.01E-02,3.08E-02,3.18E-02,3.27E-02,3.38E-02,3.53E-02,3.69E-02,3.87E-02,4.03E-02,4.08E-02,4.15E-02,4.30E-02,4.52E-02,4.72E-02,4.87E-02,4.99E-02,5.30E-02,5.64E-02,5.88E-02,6.13E-02,6.45E-02,6.81E-02,7.29E-02,8.05E-02)
      
      
      lmb_alpha=c(1.57,1.53,1.42,1.22,1.17,1.16,1.2,1.13,1.2,1.13,1.22,1.18,1.14,1.08,1.21,1.23,1.24,1.3,1.36,1.37,1.43,1.48,1.47,1.49,1.57,1.59,1.62,1.61,1.62,1.66,1.68,1.7,1.68,1.68,1.72,1.74,1.76,1.79,1.77,1.77,1.77,1.8,1.81,1.81,1.84,1.84,1.84,1.85,1.89,1.9,1.91,1.9,1.93,1.92,1.91,1.94,1.92,1.93,1.95,1.96,1.96,1.97,1.98,1.95,1.96,1.95,1.99,1.99,1.98,1.98,1.99,2,1.99,2.01,2.01,2.02,2.05,2.09,2.13,2.17,2.15,2.14,2.14,2.15,2.15,2.19,2.2,2.2,2.23,2.27,2.27,2.29,2.34,2.38,2.48,2.56,2.56,2.77,2.82)
      lmb_beta=c(5.47E-02,6.50E-02,7.64E-02,9.47E-02,1.02E-01,1.07E-01,1.06E-01,1.12E-01,1.10E-01,1.16E-01,1.12E-01,1.17E-01,1.21E-01,1.26E-01,1.21E-01,1.20E-01,1.22E-01,1.19E-01,1.17E-01,1.18E-01,1.15E-01,1.13E-01,1.15E-01,1.14E-01,1.11E-01,1.11E-01,1.10E-01,1.12E-01,1.12E-01,1.11E-01,1.10E-01,1.09E-01,1.12E-01,1.13E-01,1.12E-01,1.12E-01,1.11E-01,1.10E-01,1.12E-01,1.13E-01,1.14E-01,1.13E-01,1.13E-01,1.13E-01,1.12E-01,1.13E-01,1.14E-01,1.14E-01,1.12E-01,1.12E-01,1.12E-01,1.13E-01,1.13E-01,1.14E-01,1.15E-01,1.14E-01,1.16E-01,1.17E-01,1.17E-01,1.17E-01,1.17E-01,1.17E-01,1.18E-01,1.21E-01,1.21E-01,1.23E-01,1.21E-01,1.22E-01,1.24E-01,1.25E-01,1.25E-01,1.26E-01,1.27E-01,1.27E-01,1.28E-01,1.29E-01,1.28E-01,1.26E-01,1.24E-01,1.23E-01,1.25E-01,1.27E-01,1.28E-01,1.28E-01,1.29E-01,1.28E-01,1.27E-01,1.29E-01,1.28E-01,1.27E-01,1.28E-01,1.28E-01,1.26E-01,1.25E-01,1.21E-01,1.17E-01,1.19E-01,1.10E-01,1.11E-01)
      
      smb_alpha=c(1.29,1.33,1.17,1.1,0.78,1.16,1.35,1.46,1.39,0.92,0.97,0.76,0.62,0.46,0.25,0.14,0.33,0.52,1.82,1.74,1.62,1.66,2.12,2.08,2.55,2.47,2.44,2.26,2.33,2.31,2.23,2.17,2.1,2.07,2.08,2.04,2.12,2.12,2.06,2.15,2.25,2.22,2.18,2.15,2.15,2.09,2.01,1.97,2.03,1.99,1.97,1.86,1.81,1.92,1.85,1.85,1.87,1.89,1.87,1.84,1.78,1.86,1.83,1.92,1.91,1.94,1.92,1.98,1.94,1.93,1.86,1.96,1.83,1.93,2.04,2.06,2.03,1.92,1.85,1.79,1.73,1.73,1.76,1.64,2.1,2.04,1.86,2.24,2.3,2.06,2.03,1.87,1.75,1.63,1.74,2.44,1.07,1.48,2.31)
      smb_beta=c(3.25E-01,3.21E-01,3.56E-01,3.69E-01,4.34E-01,3.71E-01,3.42E-01,3.26E-01,3.42E-01,4.30E-01,4.25E-01,4.66E-01,4.93E-01,5.27E-01,5.68E-01,5.89E-01,5.61E-01,5.31E-01,3.23E-01,3.39E-01,3.62E-01,3.61E-01,2.86E-01,2.95E-01,2.17E-01,2.35E-01,2.41E-01,2.79E-01,2.68E-01,2.73E-01,2.89E-01,3.00E-01,3.12E-01,3.19E-01,3.18E-01,3.26E-01,3.15E-01,3.16E-01,3.28E-01,3.13E-01,2.98E-01,3.04E-01,3.14E-01,3.21E-01,3.22E-01,3.33E-01,3.48E-01,3.57E-01,3.48E-01,3.56E-01,3.62E-01,3.84E-01,3.95E-01,3.77E-01,3.92E-01,3.94E-01,3.93E-01,3.91E-01,3.95E-01,4.02E-01,4.14E-01,4.03E-01,4.10E-01,3.95E-01,3.97E-01,3.95E-01,3.99E-01,3.89E-01,3.98E-01,4.01E-01,4.14E-01,4.00E-01,4.24E-01,4.09E-01,3.92E-01,3.91E-01,3.99E-01,4.18E-01,4.33E-01,4.47E-01,4.60E-01,4.60E-01,4.55E-01,4.80E-01,4.06E-01,4.23E-01,4.58E-01,3.96E-01,3.88E-01,4.31E-01,4.44E-01,4.78E-01,5.09E-01,5.32E-01,5.20E-01,4.08E-01,6.55E-01,5.96E-01,4.61E-01)
      
      rkb_alpha=c(3.09,3.09,3.15,3.14,3.14,3.24,3.24,3.19,3.19,3.17,3.14,3.14,3.15,3.15,3.15,3.16,3.16,3.13,3.12,3.13,3.13,3.13,3.13,3.13,3.13,3.13,3.19,3.19,3.17,3.17,3.21,3.21,3.22,3.22,3.23,3.23,3.23,3.22,3.22,3.22,3.21,3.21,3.23,3.23,3.23,3.21,3.22,3.22,3.23,3.23,3.23,3.22,3.22,3.21,3.24,3.24,3.24,3.25,3.25,3.27,3.27,3.3,3.3,3.3,3.3,3.3,3.3,3.3,3.3,3.34,3.34,3.35,3.35,3.35,3.42,3.39,3.39,3.39,3.39,3.39,3.46,3.51,3.5,3.5,3.49,3.47,3.47,3.48,3.48,3.52,3.66,3.66,3.81,3.81,3.84,3.84,3.82,4.13,4.13)
      rkb_beta=c(6.78E-06,6.78E-06,5.67E-06,6.37E-06,6.37E-06,4.61E-06,4.61E-06,8.69E-06,8.97E-06,1.09E-05,1.23E-05,1.23E-05,1.19E-05,1.21E-05,1.21E-05,1.20E-05,1.20E-05,1.45E-05,1.47E-05,1.46E-05,1.46E-05,1.46E-05,1.47E-05,1.47E-05,1.52E-05,1.52E-05,1.40E-05,1.40E-05,1.54E-05,1.54E-05,1.44E-05,1.44E-05,1.43E-05,1.44E-05,1.42E-05,1.42E-05,1.42E-05,1.54E-05,1.54E-05,1.54E-05,1.62E-05,1.62E-05,1.59E-05,1.59E-05,1.58E-05,1.68E-05,1.67E-05,1.67E-05,1.64E-05,1.64E-05,1.68E-05,1.72E-05,1.72E-05,1.86E-05,1.77E-05,1.83E-05,1.83E-05,1.81E-05,1.81E-05,1.78E-05,1.80E-05,1.74E-05,1.74E-05,1.73E-05,1.73E-05,1.78E-05,1.78E-05,1.78E-05,1.78E-05,1.71E-05,1.71E-05,1.75E-05,1.75E-05,1.75E-05,1.62E-05,1.88E-05,1.91E-05,1.91E-05,1.91E-05,1.91E-05,1.79E-05,1.71E-05,1.78E-05,1.78E-05,1.90E-05,2.15E-05,2.15E-05,2.13E-05,2.13E-05,2.05E-05,1.80E-05,1.80E-05,1.59E-05,1.59E-05,1.55E-05,1.55E-05,1.70E-05,1.13E-05,1.13E-05)
      
      cpe_alpha=c(1.75,1.91,1.96,2.29,2.26,2.25,2.27,2.26,2.24,2.21,2.22,2.34,2.17,2.26,2.31,2.32,2.26,2.25,2.25,2.22,2.18,2.12,2.07,2.03,2,1.98,1.99,1.98,2.04,2.05,2.01,2.03,2.06,2.13,2.09,2.11,2.05,2.05,2.06,2.13,2.17,2.19,2.17,2.15,2.1,2.11,2.15,2.15,2.21,2.14,2.13,2.13,2.23,2.22,2.26,2.28,2.29,2.33,2.4,2.41,2.43,2.46,2.48,2.51,2.59,2.59,2.57,2.57,2.55,2.59,2.54,2.55,2.6,2.62,2.61,2.71,2.73,2.71,2.82,2.84,2.84,2.8,2.82,2.84,2.92,2.99,3.05,2.97,3.09,3.14,3.09,3.1,3.04,3.03,3.12,3.1,3.07,3.25,3.03)
      cpe_beta=c(3.62E-03,3.04E-03,3.07E-03,1.83E-03,2.05E-03,2.20E-03,2.12E-03,2.20E-03,2.30E-03,2.58E-03,2.56E-03,2.10E-03,2.91E-03,2.59E-03,2.42E-03,2.37E-03,2.79E-03,2.84E-03,2.85E-03,3.03E-03,3.27E-03,3.68E-03,3.96E-03,4.22E-03,4.53E-03,4.69E-03,4.65E-03,4.79E-03,4.65E-03,4.61E-03,4.86E-03,4.84E-03,4.73E-03,4.48E-03,4.72E-03,4.77E-03,5.10E-03,5.09E-03,5.05E-03,4.81E-03,4.66E-03,4.61E-03,4.80E-03,4.94E-03,5.41E-03,5.38E-03,5.27E-03,5.26E-03,5.09E-03,5.54E-03,5.70E-03,5.70E-03,5.39E-03,5.52E-03,5.47E-03,5.42E-03,5.43E-03,5.29E-03,5.10E-03,5.06E-03,5.06E-03,5.05E-03,5.00E-03,4.89E-03,4.62E-03,4.76E-03,4.93E-03,4.92E-03,5.07E-03,4.94E-03,5.24E-03,5.24E-03,5.09E-03,5.02E-03,5.09E-03,4.81E-03,4.77E-03,4.89E-03,4.56E-03,4.55E-03,4.59E-03,4.93E-03,4.86E-03,4.80E-03,4.55E-03,4.30E-03,4.07E-03,4.50E-03,4.10E-03,3.95E-03,4.27E-03,4.31E-03,4.74E-03,4.79E-03,4.52E-03,4.71E-03,4.90E-03,4.46E-03,5.91E-03)
      #####################################
      # Calculations
      #####################################
      predator_list = c("Muskellunge", "Northern Pike" , "Walleye" , 
                        "Largemouth Bass" , "Smallmouth Bass" , "Rock Bass" , "Crappie")
      max_predator_length_in_data = c(1016, 1003, 789, 544.5, 524, 263, 403)
      min_predator_length_in_data = c(273, 225, 60, 40, 117, 93, 108)
      
      if(units_pop()=="inches"){
        pop_pred_tl <- reactive({
          as.numeric(csv_file[,1])/0.0393701
        })
        max_predator_length_in_data = max_predator_length_in_data*0.0393701
        min_predator_length_in_data = min_predator_length_in_data*0.0393701
      }
      if(units_pop()=="mm"){
        pop_pred_tl <- reactive({
          as.numeric(csv_file[,1])
        })
        max_predator_length_in_data = max_predator_length_in_data*1
        min_predator_length_in_data = min_predator_length_in_data*1
      }
      pop_prey_tl = c()
      pop_pred_length=c()
      pop_pred_id=c()
      pop_prey_percentile=c()
      
      if(species_pop() == "Muskellunge"){
        for(l in 1:length(pop_pred_tl())){
          for(p in 1:99){
            prey_percentile_length = exp(msk_alpha[p] + msk_beta[p]*sqrt(pop_pred_tl()[l]))
            pop_prey_tl = c(pop_prey_tl, prey_percentile_length)
            pop_prey_percentile=c(pop_prey_percentile, p)
          }
          pop_pred_length = c(pop_pred_length, rep(pop_pred_tl()[l], times=99))
          pop_pred_id=c(pop_pred_id, rep(l, times=99))
          
        }
        max_predator_length = max_predator_length_in_data[which(predator_list=="Muskellunge")]
        min_predator_length = min_predator_length_in_data[which(predator_list=="Muskellunge")]
      }
      
      if(species_pop() == "Northern Pike"){
        for(l in 1:length(pop_pred_tl())){
          for(p in 1:99){
            prey_percentile_length = exp(nop_alpha[p] + nop_beta[p]*(pop_pred_tl()[l]^2))
            pop_prey_tl = c(pop_prey_tl, prey_percentile_length)
            pop_prey_percentile=c(pop_prey_percentile, p)
          }
          pop_pred_length = c(pop_pred_length, rep(pop_pred_tl()[l], times=99))
          pop_pred_id=c(pop_pred_id, rep(l, times=99))
        }
        max_predator_length = max_predator_length_in_data[which(predator_list=="Northern Pike")]
        min_predator_length = min_predator_length_in_data[which(predator_list=="Northern Pike")]
      }
      
      
      if(species_pop() == "Walleye"){
        for(l in 1:length(pop_pred_tl())){
          for(p in 1:99){
            prey_percentile_length = exp(wae_alpha[p] + wae_beta[p]*sqrt(pop_pred_tl()[l]))
            pop_prey_tl = c(pop_prey_tl, prey_percentile_length)
            pop_prey_percentile=c(pop_prey_percentile, p)
          }
          pop_pred_length = c(pop_pred_length, rep(pop_pred_tl()[l], times=99))
          pop_pred_id=c(pop_pred_id, rep(l, times=99))
        }
        max_predator_length = max_predator_length_in_data[which(predator_list=="Walleye")]
        min_predator_length = min_predator_length_in_data[which(predator_list=="Walleye")]
      }
      
      
      if(species_pop() == "Largemouth Bass"){
        for(l in 1:length(pop_pred_tl())){
          for(p in 1:99){
            prey_percentile_length = exp(lmb_alpha[p] + lmb_beta[p]*sqrt(pop_pred_tl()[l]))
            pop_prey_tl = c(pop_prey_tl, prey_percentile_length)
            pop_prey_percentile=c(pop_prey_percentile, p)
          }
          pop_pred_length = c(pop_pred_length, rep(pop_pred_tl()[l], times=99))
          pop_pred_id=c(pop_pred_id, rep(l, times=99))
        }
        max_predator_length = max_predator_length_in_data[which(predator_list=="Largemouth Bass")]
        min_predator_length = min_predator_length_in_data[which(predator_list=="Largemouth Bass")]
      }
      
      
      if(species_pop() == "Smallmouth Bass"){
        for(l in 1:length(pop_pred_tl())){
          for(p in 1:99){
            prey_percentile_length = exp(smb_alpha[p] + smb_beta[p]*log(pop_pred_tl()[l]))
            pop_prey_tl = c(pop_prey_tl, prey_percentile_length)
            pop_prey_percentile=c(pop_prey_percentile, p)
          }
          pop_pred_length = c(pop_pred_length, rep(pop_pred_tl()[l], times=99))
          pop_pred_id=c(pop_pred_id, rep(l, times=99))
        }
        max_predator_length = max_predator_length_in_data[which(predator_list=="Smallmouth Bass")]
        min_predator_length = min_predator_length_in_data[which(predator_list=="Smallmouth Bass")]
      }
      
      
      if(species_pop() == "Rock Bass"){
        for(l in 1:length(pop_pred_tl())){
          for(p in 1:99){
            prey_percentile_length = exp(rkb_alpha[p] + rkb_beta[p]*(pop_pred_tl()[l]^2))
            pop_prey_tl = c(pop_prey_tl, prey_percentile_length)
            pop_prey_percentile=c(pop_prey_percentile, p)
          }
          pop_pred_length = c(pop_pred_length, rep(pop_pred_tl()[l], times=99))
          pop_pred_id=c(pop_pred_id, rep(l, times=99))
        }
        max_predator_length = max_predator_length_in_data[which(predator_list=="Rock Bass")]
        min_predator_length = min_predator_length_in_data[which(predator_list=="Rock Bass")]
      }
      
      
      if(species_pop() == "Crappie"){
        for(l in 1:length(pop_pred_tl())){
          for(p in 1:99){
            prey_percentile_length = exp(cpe_alpha[p] + cpe_beta[p]*pop_pred_tl()[l])
            pop_prey_tl = c(pop_prey_tl, prey_percentile_length)
            pop_prey_percentile=c(pop_prey_percentile, p)
          }
          pop_pred_length = c(pop_pred_length, rep(pop_pred_tl()[l], times=99))
          pop_pred_id=c(pop_pred_id, rep(l, times=99))
        }
        max_predator_length = max_predator_length_in_data[which(predator_list=="Crappie")]
        min_predator_length = min_predator_length_in_data[which(predator_list=="Crappie")]
      }
      
      if(units_pop()=="inches"){
        pop_prey_tl = pop_prey_tl*0.0393701
        pop_pred_tl <- reactive({
          round(as.numeric(csv_file[,1]), digits=2)#/0.0393701
        })
      }
      
      
      if(units_pop()=="mm"){
        pop_prey_tl = pop_prey_tl*1
        pop_pred_tl <- reactive({
          round(as.numeric(csv_file[,1]), digits=2)/1
        })
      }
      
      
      #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      ###############################
      #       Warnings
      pop_length_warning=c(0)
      warning_text_1=NULL
      warning_text_2a=NULL
      warning_text_2b=NULL
      
      if(any(pop_pred_tl()< min_predator_length | pop_pred_tl()> max_predator_length)){
        pop_length_warning = c(1)
        warning_text_1 = c("WARNING: 1 or more predator lengths outside of lengths used to calibrate models!")

      }

      if(units()=="mm" & pop_length_warning==1){
        if(max(pop_pred_tl())> max_predator_length){
          warning_text_2a= paste("(extrapolated > max", max_predator_length,
                                       "mm)", sep=" ")
          }
          if(min(pop_pred_tl())< min_predator_length){
            warning_text_2b= paste("(extrapolated < min", min_predator_length,
                                   "mm)", sep=" ")
          }
        }
      
      
      if(units()=="inches" & pop_length_warning==1){
          if(max(pop_pred_tl())> max_predator_length){
            warning_text_2a=  paste("(extrapolated > max", 
                                       round(max_predator_length, digits=1),
                                       "inches)", sep=" ")
          }
          if(min(pop_pred_tl())< min_predator_length){
            warning_text_2b=  paste("(extrapolated < min", 
                                       round(min_predator_length, digits=1),
                                       "inches)", sep=" ")
          }
      }
      output$warning_text <- renderText({ 
        paste(warning_text_1, warning_text_2a, warning_text_2b, sep=" ")
        })
        ################################
        #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      
      
      #######################
      # Run population plots
      ######################
      
      if(pop_plot_type() == "histogram_plot"){
        par(mar=c(4.5, 5, 1, 2)+0.1, mfrow=c(1,2), oma=c(0,0.5, 1.5, 0.5))
        hist(pop_pred_tl(), las=1,ylab="", xlab="", main="", col="gray90", yaxs='i',
             ylim = c(0, max(hist(pop_pred_tl(), plot=FALSE)$counts)*1.05))
        mtext(text = "Frequency", line=3.5, side=2, cex=1.1)
        if(units_pop()=="mm"){
          mtext(text = "Predator Total Length (mm)", line=2.25, side=1, cex=1.1)
        }
        if(units_pop()=="inches"){
          mtext(text = "Predator Total Length (inches)", line=2.25, side=1, cex=1.1)
        }

        box(which="plot")
        
        hist(pop_prey_tl, las=1,ylab="", xlab="", main="", col="gray90", yaxs='i',
             ylim = c(0, max(hist(pop_prey_tl, plot=FALSE)$counts)*1.05))
        mtext(text = "Frequency", line=3.75, side=2, cex=1.1)
        if(units_pop()=="mm"){
          mtext(text = "Prey Total Length (mm)", line=2.25, side=1, cex=1.1)
        }
        if(units_pop()=="inches"){
          mtext(text = "Prey Total Length (inches)", line=2.25, side=1, cex=1.1)
        }
        if(show_percentile()==TRUE){
          quantile_value = quantile(pop_prey_tl, probs = c(pop_prey_percentile()/100))
          abline(v = quantile_value, lwd = 7, col = gray(level = 0.1, alpha=0.6))
        }
        box(which="plot")
        text(((par('usr')[2]-par('usr')[1])*1.1)+par('usr')[1], 
             ((par('usr')[4]-par('usr')[3])*-0.15)+par('usr')[3], 
             "Figure credit: JW Gaeta", cex=0.8, xpd=NA, pos=2)
        text(((par('usr')[2]-par('usr')[1])*1.1)+par('usr')[1], 
             ((par('usr')[4]-par('usr')[3])*-0.2)+par('usr')[3], 
             "LakeEcologyLab.org", cex=0.8, xpd=NA, pos=2)
        mtext(text = species_pop(), font=2, line=0, cex=1.5, outer = TRUE)
      }
      
      #~~~~~~~
      
      if(pop_plot_type() == "density_plot"){
        par(mar=c(4.5, 5, 1, 2)+0.1, mfrow=c(1,2), oma=c(0,0.5, 1.5, 0.5))
        plot(density(pop_pred_tl(), adjust=1), las=1,ylab="", 
             xlab="", main="", yaxs='i',
             ylim = c(0, max(density(pop_pred_tl(), adjust = 1)$y)*1.05))
        polygon(density(pop_pred_tl(), adjust = 1), col="gray90")
        mtext(text = "Relative Frequency", line=3.95, side=2, cex=1.1)
        if(units_pop()=="mm"){
          mtext(text = "Predator Total Length (mm)", line=2.25, side=1, cex=1.1)
        }
        if(units_pop()=="inches"){
          mtext(text = "Predator Total Length (inches)", line=2.25, side=1, cex=1.1)
        }
        box(which="plot")
        
        plot(density(pop_prey_tl, adjust=1), las=1,ylab="", 
             xlab="", main="", yaxs='i',
             ylim = c(0, max(density(pop_prey_tl, adjust = 1)$y)*1.05))
        polygon(density(pop_prey_tl, adjust = 1), col="gray90")
        mtext(text = "Relative Frequency", line=3.75, side=2, cex=1.1)
        if(units_pop()=="mm"){
          mtext(text = "Prey Total Length (mm)", line=2.25, side=1, cex=1.1)
        }
        if(units_pop()=="inches"){
          mtext(text = "Prey Total Length (inches)", line=2.25, side=1, cex=1.1)
        }
        if(show_percentile()==TRUE){
          quantile_value = quantile(pop_prey_tl, probs = c(pop_prey_percentile()/100))
          abline(v = quantile_value, lwd = 7, col = gray(level = 0.1, alpha=0.6))
        }
        box(which="plot")
        
        text(((par('usr')[2]-par('usr')[1])*1.1)+par('usr')[1], 
             ((par('usr')[4]-par('usr')[3])*-0.15)+par('usr')[3], 
             "Figure credit: JW Gaeta", cex=0.8, xpd=NA, pos=2)
        text(((par('usr')[2]-par('usr')[1])*1.1)+par('usr')[1], 
             ((par('usr')[4]-par('usr')[3])*-0.2)+par('usr')[3], 
             "LakeEcologyLab.org", cex=0.8, xpd=NA, pos=2)
        mtext(text = species_pop(), font=2, line=0, cex=1.5, outer = TRUE)
      }
      if(show_percentile()==TRUE){
        percentile_table = data.frame(c(pop_prey_percentile(), quantile_value ))
        #colnames(percentile_table) = paste(species_pop(), "prey", sep=" ")
        
        output$prey_percentile_table <- renderTable({   
          rendered_pop_table = data.frame(percentile_table, 
                                          row.names = c("Percentile", "Prey Length"))
          colnames(rendered_pop_table) = paste(species_pop(), "prey", sep=" ")
          rendered_pop_table
        },rownames=TRUE, colnames=TRUE)
        
      }

      plotInputPopulation <-function(){
        if(pop_plot_type() == "histogram_plot"){
          par(mar=c(4.5, 5, 1, 2)+0.1, mfrow=c(1,2), oma=c(0,0.5, 1.5, 0.5))
          hist(pop_pred_tl(), las=1,ylab="", xlab="", main="", col="gray90", yaxs='i',
               ylim = c(0, max(hist(pop_pred_tl(), plot=FALSE)$counts)*1.05))
          mtext(text = "Frequency", line=3.5, side=2, cex=1.1)
          if(units_pop()=="mm"){
            mtext(text = "Predator Total Length (mm)", line=2.25, side=1, cex=1.1)
          }
          if(units_pop()=="inches"){
            mtext(text = "Predator Total Length (inches)", line=2.25, side=1, cex=1.1)
          }
          
          box(which="plot")
          
          hist(pop_prey_tl, las=1,ylab="", xlab="", main="", col="gray90", yaxs='i',
               ylim = c(0, max(hist(pop_prey_tl, plot=FALSE)$counts)*1.05))
          mtext(text = "Frequency", line=3.75, side=2, cex=1.1)
          if(units_pop()=="mm"){
            mtext(text = "Prey Total Length (mm)", line=2.25, side=1, cex=1.1)
          }
          if(units_pop()=="inches"){
            mtext(text = "Prey Total Length (inches)", line=2.25, side=1, cex=1.1)
          }
          if(show_percentile()==TRUE){
            quantile_value = quantile(pop_prey_tl, probs = c(pop_prey_percentile()/100))
            abline(v = quantile_value, lwd = 3, col = gray(level = 0.1, alpha=0.6))
          }
          box(which="plot")
          text(((par('usr')[2]-par('usr')[1])*1.15)+par('usr')[1], 
               ((par('usr')[4]-par('usr')[3])*-0.2)+par('usr')[3], 
               "Figure credit: JW Gaeta", cex=0.65, xpd=NA, pos=2)
          text(((par('usr')[2]-par('usr')[1])*1.15)+par('usr')[1], 
               ((par('usr')[4]-par('usr')[3])*-0.25)+par('usr')[3], 
               "LakeEcologyLab.org", cex=0.65, xpd=NA, pos=2)
          mtext(text = species_pop(), font=2, line=0, cex=1.5, outer = TRUE)
        }
        
        #~~~~~~~
        
        if(pop_plot_type() == "density_plot"){
          par(mar=c(4.5, 5, 1, 2)+0.1, mfrow=c(1,2), oma=c(0,0.5, 1.5, 0.5))
          plot(density(pop_pred_tl(), adjust=1), las=1,ylab="", 
               xlab="", main="", yaxs='i',
               ylim = c(0, max(density(pop_pred_tl(), adjust = 1)$y)*1.05))
          polygon(density(pop_pred_tl(), adjust = 1), col="gray90")
          mtext(text = "Relative Frequency", line=3.95, side=2, cex=1.1)
          if(units_pop()=="mm"){
            mtext(text = "Predator Total Length (mm)", line=2.25, side=1, cex=1.1)
          }
          if(units_pop()=="inches"){
            mtext(text = "Predator Total Length (inches)", line=2.25, side=1, cex=1.1)
          }
          box(which="plot")
          
          plot(density(pop_prey_tl, adjust=1), las=1,ylab="", 
               xlab="", main="", yaxs='i',
               ylim = c(0, max(density(pop_prey_tl, adjust = 1)$y)*1.05))
          polygon(density(pop_prey_tl, adjust = 1), col="gray90")
          mtext(text = "Relative Frequency", line=3.75, side=2, cex=1.1)
          if(units_pop()=="mm"){
            mtext(text = "Prey Total Length (mm)", line=2.25, side=1, cex=1.1)
          }
          if(units_pop()=="inches"){
            mtext(text = "Prey Total Length (inches)", line=2.25, side=1, cex=1.1)
          }
          if(show_percentile()==TRUE){
            quantile_value = quantile(pop_prey_tl, probs = c(pop_prey_percentile()/100))
            abline(v = quantile_value, lwd = 3, col = gray(level = 0.1, alpha=0.6))
          }
          box(which="plot")
          
          text(((par('usr')[2]-par('usr')[1])*1.15)+par('usr')[1], 
               ((par('usr')[4]-par('usr')[3])*-0.2)+par('usr')[3], 
               "Figure credit: JW Gaeta", cex=0.65, xpd=NA, pos=2)
          text(((par('usr')[2]-par('usr')[1])*1.15)+par('usr')[1], 
               ((par('usr')[4]-par('usr')[3])*-0.25)+par('usr')[3], 
               "LakeEcologyLab.org", cex=0.65, xpd=NA, pos=2)
          mtext(text = species_pop(), font=2, line=0, cex=1.5, outer = TRUE)
        }
      }
      
      output$downloadPlot_pop <- downloadHandler(
        filename = function() {
          paste(species(),'Gaeta_etal_InReview-', Sys.Date(), 'population-level.tiff', sep='')
        },
        content = function(file) {
          tiff(file, width = 10, height=4.5, units='in', compression="lzw", res=200)
          plotInputPopulation()
          dev.off()
        })
      output$pop_table <- renderTable({
        pop_table_df=data.frame(matrix(c(min(pop_prey_tl),
                   c(as.matrix(quantile(pop_prey_tl, probs=c(0.05, 0.1, 0.25, 0.5, 0.75,
                                                         0.9, 0.95)))),
                   max(pop_prey_tl)), nrow=1, ncol=9))
       colnames(pop_table_df) = c("Minimum", "5th %-tile", "10th %-tile",
                                  "25th %-tile", "50th %-tile", "75th %-tile",
                                  "90th %-tile", "95th %-tile", "Maximum") 
       pop_table_df
      })
      
      output$download_pop_Data <- downloadHandler(
        filename = function() { paste(species_pop(),'Gaeta_etal_InReview-',
                                      Sys.Date(), 'population-level.csv', sep='') },
        content = function(file) {
          write.csv(data.frame(predator_species=rep(species_pop(), times = length(pop_prey_tl)),
                               predator_number=pop_pred_id,
                               prey_percentile=pop_prey_percentile,
                               predator_total_length=pop_pred_length,                                                           prey_total_length=pop_prey_tl), file)
        }
      )
      
    })# End render plot
  })#End "observe"
 
}

  
  
  