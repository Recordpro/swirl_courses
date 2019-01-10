# Put custom tests in this file.
      
# Uncommenting the following line of code will disable
# auto-detection of new variables and thus prevent swirl from
# executing every command twice, which can slow things down.
      
AUTO_DETECT_NEWVAR <- FALSE
      
# However, this means that you should detect user-created
# variables when appropriate. The answer test, creates_new_var()
# can be used for for the purpose, but it also re-evaluates the
# expression which the user entered, so care must be taken.

# Get the swirl state
# getState <- function(){
#   # Whenever swirl is running, its callback is at the top of its call stack.
#   # Swirl's state, named e, is stored in the environment of the callback.
#   environment(sys.function(1))$e
# }
# 
# # Retrieve the log from swirl's state
# getLog <- function(){
#   getState()$log
# }
# 
# submit_log <- function(){
#   
#   # Please edit the link below
#   pre_fill_link <- "https://docs.google.com/forms/d/e/1FAIpQLSdBBdCxXUimKq5sMFN8U1MrRgBn6aDuAqp0QBnVCtJci4Y9hA/viewform?usp=pp_url"
#   
#   # Do not edit the code below
#   if(!grepl("=$", pre_fill_link)){
#     pre_fill_link <- paste0(pre_fill_link, "=")
#   }
#   
#   p <- function(x, p, f, l = length(x)){if(l < p){x <- c(x, rep(f, p - l))};x}
#   
#   temp <- tempfile()
#   log_ <- getLog()
#   nrow_ <- max(unlist(lapply(log_, length)))
#   log_tbl <- data.frame(user = rep(log_$user, nrow_),
#                         course_name = rep(log_$course_name, nrow_),
#                         lesson_name = rep(log_$lesson_name, nrow_),
#                         question_number = p(log_$question_number, nrow_, NA),
#                         correct = p(log_$correct, nrow_, NA),
#                         attempt = p(log_$attempt, nrow_, NA),
#                         skipped = p(log_$skipped, nrow_, NA),
#                         datetime = p(log_$datetime, nrow_, NA),
#                         stringsAsFactors = FALSE)
#   write.csv(log_tbl, file = temp, row.names = FALSE)
#   encoded_log <- base64encode(temp)
#   browseURL(paste0(pre_fill_link, encoded_log))
# }

# ======================================================================================
# Try entering their name only
# ======================================================================================
# Get the swirl state
getState <- function(){
  # Whenever swirl is running, its callback is at the top of its call stack.
  # Swirl's state, named e, is stored in the environment of the callback.
  environment(sys.function(1))$e
}

# Get the value which a user either entered directly or was computed
# by the command he or she entered.
getVal <- function(){
  getState()$val
}

# Get the last expression which the user entered at the R console.
getExpr <- function(){
  getState()$expr
}

submit_google_form <- function(){
  selection <- getState()$val
  if(selection == "Yes"){
    fname <- readline("What is your First Name? ")
    lname <- readline("What is your Last Name? ")
    
    myurl <- 'https://docs.google.com/forms/d/e/1FAIpQLSdBBdCxXUimKq5sMFN8U1MrRgBn6aDuAqp0QBnVCtJci4Y9hA/viewform?usp=pp_url'
    
    log_name <- c(fname, lname)
    temp <- tempfile()
    write.csv(log_name, file = temp, row.names = FALSE)
    encoded_log <- base64encode(temp)
    
    browseURL(paste0(myurl, encoded_log))
    
    # payload <- sprintf('{  
    #   "assignmentKey": "D0n8Va8cEeWRRQpQejjiSw",
    #   "submitterEmail": "%s",  
    #   "secret": "%s",  
    #   "parts": {  
    #     "ZKl2O": {  
    #       "output": "correct"  
    #     }  
    #   }  
    # }', fname, lname)
    
    
    # respone <- httr::POST(url, body = payload)
    # if(respone$status_code >= 200 && respone$status_code < 300){
    #   message("Grade submission succeeded!")
    # } else {
    #   message("Grade submission failed.")
    #   message("Press ESC if you want to exit this lesson and you")
    #   message("want to try to submit your grade at a later time.")
    #   return(FALSE)
    # }
  }
  TRUE
}
