# Server File for Flare Detection App V2
library(shiny)
library(latex2exp)
library(gridExtra)
library(tidyverse)

# loading in GOES data
#GOES <- read_csv("data/GOES_clean.csv")
#GOES$cycle <- as.factor(GOES$cycle)
#GOES$flrtotalenergy <- GOES$Gflrtotalenergy

# loading in RHESSI data
#RHESSI <- read_csv("data/RHESSI_clean.csv")
#RHESSI$cycle <- as.factor(RHESSI$cycle)
#RHESSI$flrtotalenergy <- RHESSI$RFlrTotalEnergy

server <- function(input, output, session){
  
  # years to select for data determined by years_ll slider
  years <- reactive({
    
    seq(input$years[1], input$years[2], 1)
    
  })
  
  data_fit <- reactive({
    
    years <- years()
    
    if (input$data_select == "GOES"){
      
      data <- GOES[which(GOES$year %in% years),]
      data <- data.frame(Gflrtotalenergy = GOES["Gflrtotalenergy"])
      
    } else if(input$data_select == "RHESSI"){
      
      data <- RHESSI[which(RHESSI$year %in% years),]
      data <- data.frame(Gflrtotalenergy = RHESSI["RFlrTotalEnergy"][1])
      colnames(data) <- c("Gflrtotalenergy")
      
    } else{
      
      show_modal_spinner() # show the modal window
      
      H0 <- input$H0_2
      xi <- input$xi_2
      gamma <- input$gamma_2
      beta <- input$beta_2
      alpha <- input$alpha_2
      kappa <- input$kappa_2
      
      theta <- c(alpha, kappa, beta, gamma, xi)
      
      data <- data.frame(Gflrtotalenergy = 10^rmu_bs(input$n, theta, H0, input$n*1000))
      
      remove_modal_spinner() # remove spinner when done
      
    }
    
    data
    
  })
  
  # ML fit algorithm called by Run ML Fit button
  observeEvent(input$ML, {
    
    data <- data_fit()
    
    df <- ggplot(data = data, aes(x=log(Gflrtotalenergy, 10))) + geom_histogram(center = input$H0_2, binwidth = input$bins)
    bins_data <- ggplot_build(df)$data[[1]]
    bins_data <- data.frame(y = bins_data$count, lb = bins_data$xmin, ub = bins_data$xmax, mids = bins_data$x)
    
    show_modal_spinner() # show the modal window
    
    # run ML optim
    theta0 = c(1.8, 2, 2, 0.001, max(bins_data$lb))
    
    ML_results <- optim(par = theta0, fn = ll_bs, df = bins_data, H0 = input$H0_2,
                        lower = c(1.001, 0, 1, 0.0001, min(bins_data$ub)), upper = c(3, 12, 20, 10, 35),
                        hessian = TRUE, control = list(fnscale = -1), method = "L-BFGS-B")
    
    # results of model fit
    theta_hat <- ML_results$par
    var_cov_mat <- cov2cor(solve(-ML_results$hessian))
    theta_se <- sqrt(diag(solve(-ML_results$hessian)))
    
    remove_modal_spinner() # remove spinner when done
    
    # update user parameter box
    updateNumericInput(session, "alpha_2", value = theta_hat[1])
    updateNumericInput(session, "kappa_2", value = theta_hat[2])
    updateNumericInput(session, "beta_2", value = theta_hat[3])
    updateNumericInput(session, "gamma_2", value = theta_hat[4])
    updateNumericInput(session, "xi_2", value = theta_hat[5])
    
  })
  
  # graphs for probability-discounted power-law model
  output$fit_graphs1 <- renderPlot({
    
    # data to display and fit to
    data <- data_fit()
    
    # Defining input objects as variables
    min_data <- input$range_2[1]
    max_data <- input$range_2[2]
    H0 <- input$H0_2
    xi <- input$xi_2
    gamma <- input$gamma_2
    beta <- input$beta_2
    alpha <- input$alpha_2
    kappa <- input$kappa_2
    theta <- c(alpha, kappa, beta, gamma, xi)
    
    pi_fun <- function(x){
      # bounded sigmoid pi function
      f <- (H - H0)/(xi - H)
      pi <- (gamma * f^beta)/(1 + gamma * f^beta)
      pi[H <= H0] <- 0
      pi[H >= xi] <- 1
      pi[is.infinite(pi)] <- 1
    }
    
    lambda_fun <- function(x){
      (10^H0)^(alpha - 1)*(alpha - 1) * (10^H)^(-alpha) * log(10) * 10^H * 10^kappa
    }
    
    mu_fun <- function(x){
      pi <- pi_fun(x)
      lambda <- lambda_fun(x)
      mu <- lambda * pi
    }
    
    if (input$range_control == FALSE){
      
      df <- ggplot(data = data, aes(x=log(Gflrtotalenergy, 10))) + geom_histogram(center = H0, binwidth = input$bins, fill = "aquamarine4", color = "black")
      bins_data <- ggplot_build(df)$data[[1]]
      bins_data <- data.frame(y = bins_data$count, lb = bins_data$xmin, ub = bins_data$xmax, mids = bins_data$x)
      
      mu_vals <- apply(bins_data[,c(2,3)], 1, function(x) integral(fun = mu_bs, method = "Kron", xmin = x[1], xmax = x[2], theta = theta, H0 = H0))
      bins_data$mu_vals <- mu_vals / (bins_data[,"ub"] - bins_data[,"lb"])
      
      p1 <- ggplot(data = data, aes(x = log(Gflrtotalenergy, 10))) + 
        geom_histogram(center = H0, binwidth = input$bins, fill = "aquamarine4", color = "black") +
        geom_point(data = bins_data, aes(x = mids, y = mu_vals)) +
        xlim(input$range_2[1], input$range_2[2]) +
        theme_bw(base_size = 20) + 
        labs(x = "H", y = TeX("Observed Count and $\\mu_i$"), title = "Discrete Model Overlay") +
        geom_vline(xintercept = xi, color = "sienna2")
      
      if (input$residuals == FALSE){
        p2 <- ggplot(data = data, aes(x = log(Gflrtotalenergy, 10))) + 
          geom_histogram(center = H0, binwidth = input$bins, fill = "aquamarine4", color = "black") + 
          geom_function(fun = lambda_fun) +
          xlim(input$range_2[1], input$range_2[2]) +
          theme_bw(base_size = 20) + 
          labs(x = "H", y = TeX("Observed Count and $\\mu$"), title = "Continuous Model Overlay") +
          geom_vline(xintercept = xi, color = "sienna2")
        
        
        grid.arrange(p1, p2, ncol=2)
      } else {
        
        # calculuating residuals
        bins_data$residuals <- (bins_data[,"y"] - bins_data[,"mu_vals"])
        
        # residuals plot
        p3 <- ggplot(data = bins_data, aes(x = mids, y = residuals)) + 
          geom_point() + 
          geom_hline(yintercept = 0, linetype = "dotted") +
          xlim(input$range_2[1], input$range_2[2]) +
          theme_bw(base_size = 20) + 
          labs(x = "H", y = TeX("Observed Counts - $\\mu_i$"), title = "Residuals Plot") +
          geom_vline(xintercept = xi, color = "sienna2")
        
        grid.arrange(p1,p3, ncol=2)
        
      }
      
    } else{
      
      df <- ggplot(data = data, aes(x=log(Gflrtotalenergy, 10))) + geom_histogram(center = H0, binwidth = input$bins, fill = "aquamarine4", color = "black")
      bins_data <- ggplot_build(df)$data[[1]]
      bins_data <- data.frame(y = bins_data$count, lb = bins_data$xmin, ub = bins_data$xmax, mids = bins_data$x)
      
      mu_vals <- apply(bins_data[,c(2,3)], 1, function(x) integral(fun = mu_bs, method = "Kron", xmin = x[1], xmax = x[2], theta = theta, H0 = H0))
      bins_data$mu_vals <- mu_vals / (bins_data[,"ub"] - bins_data[,"lb"])
      
      p1 <- ggplot(data = data, aes(x = log(Gflrtotalenergy, 10))) + 
        geom_histogram(center = H0, binwidth = input$bins, fill = "aquamarine4", color = "black") +
        geom_point(data = bins_data, aes(x = mids, y = mu_vals)) +
        xlim(23, 32) +
        theme_bw(base_size = 20) + 
        labs(x = "H", y = TeX("Observed Count and $\\mu_i$"), title = "Discrete Model Overlay") +
        geom_vline(xintercept = xi, color = "sienna2")
      
      if (input$residuals == FALSE){
        p2 <- ggplot(data = data, aes(x = log(Gflrtotalenergy, 10))) + 
          geom_histogram(center = H0, binwidth = input$bins, fill = "aquamarine4", color = "black") + 
          geom_function(fun = lambda_fun) +
          xlim(23, 32) +
          theme_bw(base_size = 20) + 
          labs(x = "H", y = TeX("Observed Count and $\\mu$"), title = "Continuous Model Overlay") +
          geom_vline(xintercept = xi, color = "sienna2")
        
        
        grid.arrange(p1, p2, ncol=2)
      } else {
        
        # calculuating residuals
        bins_data$residuals <- (bins_data[,"y"] - bins_data[,"mu_vals"])
        
        # residuals plot
        p3 <- ggplot(data = bins_data, aes(x = mids, y = residuals)) + 
          geom_point() + 
          geom_hline(yintercept = 0, linetype = "dotted") +
          xlim(23, 32) +
          theme_bw(base_size = 20) + 
          labs(x = "H", y = TeX("Observed Counts - $\\mu_i$"), title = "Residuals Plot") +
          geom_vline(xintercept = xi, color = "sienna2")
        
        grid.arrange(p1,p3, ncol=2)
        
      }
      
    }
    
  })
  
  
  
  # graphs for probability-discounted power-law model
  output$model_graphs1 <- renderPlot({
    
    # Defining input objects as variables
    min_data <- input$range_1[1]
    max_data <- input$range_1[2]
    H0 <- input$H0_1
    xi <- input$xi_1
    gamma <- input$gamma_1
    beta <- input$beta_1
    alpha <- input$alpha_1
    kappa <- input$kappa_1
    
    pi_fun <- function(x){
      pi <- ifelse(x <= H0, 0, 
                   ifelse(x >= xi, 1, 
                          (gamma*((x - H0)/(xi - x))^beta)/(1 + gamma*((x - H0)/(xi - x))^beta)))
      pi[x <= H0] <- 0
      pi[x >= xi] <- 1
      pi[is.infinite(pi)] <- 1
      pi
      
    }
    
    f_fun <- function(x){
      ifelse(x == xi, NA, 
             (x - H0)/(xi - x))
    }
    
    lambda_fun <- function(x){
      (10^H0)^(alpha - 1)*(alpha - 1) * (10^x)^(-alpha) * log(10) * 10^x * 10^kappa
    }
    
    mu_fun <- function(x){
      pi <- pi_fun(x)
      lambda <- lambda_fun(x)
      mu <- lambda * pi
    }
    
    pi_plot <- ggplot() + 
      xlim(min_data, max_data) + 
      geom_function(fun = pi_fun, n = 1000) + 
      theme_bw(base_size = 20) + 
      labs(x = "H", y = TeX("$\\pi$")) +
      geom_vline(xintercept = xi, color = "sienna2")
    
    f_plot <- ggplot() + 
      xlim(min_data, max_data) + 
      geom_function(fun = f_fun, n = 700) + 
      theme_bw(base_size = 20) + 
      labs(x = "H", y = "f") +
      geom_vline(xintercept = xi, color = "sienna2")
    
    lambda_plot <- ggplot() + 
      xlim(min_data, max_data) + 
      geom_function(fun = lambda_fun, n = 1000) + 
      theme_bw(base_size = 20) + 
      labs(x = "H", y = TeX("$\\lambda$")) +
      geom_vline(xintercept = xi, color = "sienna2")
    
    mu_plot <- ggplot() + 
      xlim(min_data, max_data) + 
      geom_function(fun = mu_fun, n = 1000) + 
      theme_bw(base_size = 20) + 
      labs(x = "H", y = TeX("$\\mu$")) +
      geom_vline(xintercept = xi, color = "sienna2")
    
    grid.arrange(lambda_plot, pi_plot, mu_plot, f_plot, ncol = 2)
    
  })
  
}