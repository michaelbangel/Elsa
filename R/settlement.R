settlement_pct <- function(original, settlement){

  if(original <= 0) return(0)

  ((original - settlement) / original) * 100
}

settlement_achievement <- function(original, settlement){
  pmin(settlement_pct(original, settlement), 100)
}

settlement_efficiency <- function(settled, flagged){

  if(flagged <= 0) return(100)

  pmin((settled / flagged) * 100, 100)
}

settlement_risk <- function(efficiency, achievement, backlog){

  score <- (
    (100 - efficiency) * 0.40 +
    backlog * 0.35 +
    (100 - achievement) * 0.25
  )

  pmin(score, 100)
}

settlement_trigger <- function(settled, variance){

  if(settled && variance > 0) return(100)

  return(0)
}
