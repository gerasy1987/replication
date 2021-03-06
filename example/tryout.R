rm(list = ls())

devtools::install_github("gerasy1987/replicate",
                         auth_token = "b5f3f71208ad132982a9217c60690b1164534b09")

library(replicate)

load(file = "example/replication_data.Rdata")

x <-
  create_replication(
    data_list =
      list(data_admin = data_admin,
           data_individual = data_individual),
    packages =
      c("plyr", "dplyr", "broom", "Hmisc",
        "lfe", "multiwayvcov", "lmtest",
        "wakefield", "magrittr"),
    project_path = "example/",
    function_script_path = "replication_functions.R",
    replication_script_path = "replication_script.R",
    description_list =
      list(study_name = "Fake Study",
           study_authors = c("Georgiy Syunyaev", "Someone Else"),
           study_affiliations = c("Columbia University",
                                  "Some Other University"),
           rep_authors = c("Georgiy Syunyaev"),
           study_abstract = "The aim of this study is to test the create_replication() functionality. This is the first attempt at creating replication class of objects in [R] for systematic storage and access to study replication materials."),
    quietly = TRUE,
    checks = FALSE
  )

summary(x)
summary(x, table = "table_1", reported = TRUE, registered = FALSE)
summary(x, table = "table_2", reported = TRUE, registered = TRUE)
summary(x, script = TRUE)
summary(x, table = "table_1", script = TRUE)
