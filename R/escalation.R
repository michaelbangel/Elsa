double_trigger <- function(variance, incidence, settlement, legal){

  if((variance >= 60 && incidence >= 60) ||
     (settlement && variance >= 20) ||
     (legal && (variance >= 50 || incidence >= 50))){
    return(1.25)
  }

  return(1.0)
}

triple_trigger <- function(variance, incidence, legal){

  if(variance >= 60 && incidence >= 60 && legal){
    return(1.5)
  }

  return(1.0)
}

fraud_risk_indicator <- function(variance, incidence, exception, trigger){

  score <- (
    variance * 0.35 +
    incidence * 0.30 +
    exception * 0.20 +
    trigger * 0.15
  )

  pmin(score, 100)
}
