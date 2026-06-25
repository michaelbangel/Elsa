legal_action <- function(flag){
  ifelse(flag == TRUE, 1, 0)
}

litigation_risk <- function(legal, variance, incidence, settlement){

  if(!legal) return(0)

  score <- (
    variance * 0.35 +
    incidence * 0.35 +
    settlement * 0.30
  )

  pmin(score, 100)
}
