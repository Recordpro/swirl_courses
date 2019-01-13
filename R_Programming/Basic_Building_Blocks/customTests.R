submit_log <- function(){
  ping <- googleformr::gformr('https://docs.google.com/forms/d/e/1FAIpQLSc132bnxpF-fSV6MGy-a1JLXLkdLOef_SRNXXa5xibIGO8AjA/viewform?usp=pp_url')
  ping('employee1234')
}