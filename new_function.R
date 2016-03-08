library(psychro)
ls("package:psychro")


temp.list <- get_data()

vec.t <- c(40,50,60,70,80)
vec.rh <- c(55,60,75,80, 85)

mix.multi.air <- function(vet.t, vet.rh, temp.list) {
  
  length <- length(vec.t)
  fix.p <- 1/length
  initial.p <- fix.p
  
  while(length > 1){
    print(length)
    print(initial.p)
    
    t1 <- vec.t[[1]]
    rh1 <- vec.rh[[1]]
    
    t2 <- vec.t[[2]]
    rh2 <- vec.rh[[2]]
    
    t1.percent <- initial.p/(initial.p + fix.p)
    
    mix <- mix_air(t1, rh1, t2, rh2, t1.percent, temp.list)
    t.mix <- mix$Temp
    rh.mix <- mix$RH
    
    vec.t <- vec.t[-c(1,2)]
    vec.t <- append(vec.t, t.mix, 0)
    vec.rh <- append(vec.rh, rh.mix, 0)
    
    length <- length - 1
    initial.p <- initial.p + fix.p
    
  }
  
  return(list(vet.t, vet.rh))
  
}
  
