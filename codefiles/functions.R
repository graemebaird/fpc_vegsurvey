excel_function <- function(filename, sheetname,rows_in) {
  d <- read.xlsx(filename, sheet = sheetname, rows = rows_in, colNames = FALSE) %>%
    t() %>% 
    as.data.frame() %>% 
    slice(2:18)
  names(d) <- sheetname
  d
}