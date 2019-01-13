# Code placed in this file fill be executed every time the
# lesson is started. Any variables created here will show up in
# the user's working directory and thus be accessible to them
# throughout the lesson.

swirl_options(swirl_logging = TRUE)

install.packages("devtools")
devtools::install_github("data-steve/googleformr", dependencies = TRUE)