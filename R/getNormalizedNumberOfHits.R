#' To obtain the number of hits during 'years', in database='db'
#' @param x
#' @return y
#' @export
#' @author HK
get.Normalized.Number.Of.Hits <- function(years=1980:2014, query="", db="pubmed", normalization_value=1000000){
  get.Normalized.Number.Of.Hits.For.This.Year <- function(query, year, db, normalization_value){
    cat(year, "\n")
    hits_object <- EUtilsSummary(query, db=db, mindate=year, maxdate=year)
    number_of_hits <- QueryCount(hits_object)
    #get total number of published papers per year
    total_hits_object <- EUtilsSummary("", db=db, mindate=year, maxdate=year)
    number_of_total_hits <- QueryCount(total_hits_object)
    normalized_hits    <- (number_of_hits/number_of_total_hits)*normalization_value
    normalized_hits
  }#get.Normalized.Number.Of.Hits.For.This.Year#
  
  number_of_hits <- lapply(years, get.Normalized.Number.Of.Hits.For.This.Year, query=query, db=db, normalization_value=normalization_value )
  number_of_hits <- as.numeric(number_of_hits)
  plot(number_of_hits~years, lwd=3, col='blue', xlab="years", ylab="numper of pulications per million", main="Trends in pubmed for your query")
  return(number_of_hits)
}#get.Normalized.Number.Of.Hits#


get_per_year_normalized_number_of_hits <- function(query, year, db, normalization_value){
  #cat(year, "\n")
  query_hits_object <- EUtilsSummary(query=query, db=db, mindate=year, maxdate=year)
  number_of_hits_query <- QueryCount(query_hits_object)
  
  # get total number of pulished paper for this year
  total_hits_object <- EUtilsSummary("", db=db, mindate=year, maxdate=year)
  total_number_of_hits <- QueryCount(total_hits_object)
  cat('year=', year, "absolute_number=", number_of_hits_query, 'total_papers=', total_number_of_hits, "normalized=", (number_of_hits_query/total_number_of_hits)*normalization_value, "\n")
  normalized_num_of_hits <- (number_of_hits_query/total_number_of_hits)*normalization_value
  return(normalized_num_of_hits)
}#get_per_year_normalized_number_of_hits#


get_normliazed_number_of_hits <- function(years, query="", db="pubmed",
                                          normalization_value=1000000){
  number_of_hits_during_years <- lapply(years, get_per_year_normalized_number_of_hits, query=query, db=db,
                                        normalization_value=normalization_value)
  number_of_hits_during_years <- as.numeric(number_of_hits_during_years)
  title <- paste('Trends in pubmed for', query, sep=' ')
  plot(number_of_hits_during_years~years, lwd=3, col='blue', xlab='year', ylab='numper of publication per million',
       main=title, type='b')
  
  return(number_of_hits_during_years)
}#get_normliazed_number_of_hits#