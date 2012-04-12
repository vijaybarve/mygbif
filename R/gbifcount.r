#'getgbifcountxml - Description
#'@import RCurl
#'@param scname scientitic name 
#'@export
#'@examples \dontrun{
#'getgbifcountxml('Danaus plexippus')
#'}
getgbifcountxml <-function (scname){
 url="http://data.gbif.org/ws/rest/occurrence/count?scientificname="
 url1=paste(url, gsub(" ", "+", scname),sep = "")
 out = getURLContent(url1)
 out
}

#'procgbifcountxml - Description
#'@import XML
#'@param outxml XML returned by GBIF Count API 
#'@export
#'@examples \dontrun{
#'procgbifcountxml(outxml)
#'}
procgbifcountxml <-function (outxml){
 outxmltree=xmlInternalTreeParse(outxml)
 n1<-xpathApply(outxmltree,"//gbif:summary",xmlAttrs)
 out=as.numeric(n1)
 out
}

#'gbifcount - Description
#'@param scname scientitic name 
#'@export
#'@examples \dontrun{
#'gbifcount('Graphium *')
#'gbifcount('Danaus plexippus')
#'}
gbifcount <-function (scname){
 tmpxml=getgbifcountxml(scname)
 out=procgbifcountxml(tmpxml)
 out
}

#'sgbifcount - Description
#'@import RCurl XML
#'@param scname scientitic name 
#'@export
#'@examples \dontrun{
#'sgbifcount('Graphium antiphates')
#'sgbifcount('Danaus *')
#'}
sgbifcount <-function (scname){
 url="http://data.gbif.org/ws/rest/occurrence/count?scientificname="
 url1=paste(url, gsub(" ", "+", scname),sep = "")
 tmpxml = getURLContent(url1)
 tmpxmltree=xmlInternalTreeParse(tmpxml)
 n1<-xpathApply(tmpxmltree,"//gbif:summary",xmlAttrs)
 out=as.numeric(n1)
 out
}