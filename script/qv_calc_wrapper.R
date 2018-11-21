# wrapper around qvcal::qvcalc() function to produce tidy dataframe

qv_calc <- function(model, factor){
  
  tmp <- 
    qvcalc::qvcalc(model, factor) %>% 
    .$qvframe %>% 
    as.data.frame() %>% 
    tibble::rownames_to_column()
  
  tmp$estimate <- as.vector(tmp$estimate)
  
  return(tmp)
}

# a test run
data(iris)

model1 <- lm(Sepal.Width ~ Species, data = iris)

qv_calc(model1, "Species")
