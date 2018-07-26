## Set the input filename
filename <- "datafiles/raw/BALCH I SUMMARY.xlsx"

## Sheetnames from filename
samplenames <- getSheetNames(filename)[c(-1,-2)]

## Index of species codes and latin/common names
nameindex <- read.xlsx(filename, cols = 2:4, sheet = 2)

## Extract data into lists
transect_list <- lapply(samplenames, function(x) {
  d <- excel_function(filename, x, c(3,4,5)) %>% na.omit
  colnames(d) <- c("speciescode","count","pct")
  d %<>% mutate(speciescode = as.character(speciescode), count = as.numeric(count), pct = as.numeric(pct))
  d
  })
names(transect_list) <- samplenames

zig_list <- lapply(samplenames, function(x) {
  d <- excel_function(filename, x, 14:17)
  cut <- min(which(d[,1] == "average" | is.na(d[,1])))
  colnames(d) <- c("speciescode","dist_ft","diam_in","basal")
  d <- d[1:cut-1,]
  d %<>% mutate(speciescode = as.character(speciescode), dist_ft = as.numeric(dist_ft), diam_in = as.numeric(diam_in), basal = as.numeric(basal))
  d
  })
names(zig_list) <- samplenames

coarse_list <- lapply(samplenames, function(x) {
  d <- excel_function(filename, x, 25:30)
  cut <- min(which(d[,6] == " 0"))
  colnames(d) <- c("lettercode","length_ft","sm_diam_in","lg_diam_in","class", "volume")
  d <- d[1:cut-1,]
  d %<>% mutate(lettercode = as.character(lettercode), 
                length_ft = as.numeric(length_ft), 
                sm_diam_in = as.numeric(sm_diam_in), 
                lg_diam_in = as.numeric(lg_diam_in), 
                class = as.character(class), 
                volume = as.numeric(volume))
  d
})
names(coarse_list) <- samplenames

## Sample assembled lists for abberant codenames
abcodes <- transect_list %>% 
  sapply(.,function(x) x[,1]) %>% Reduce(c,.) %>%
  allcodes[!(allcodes %in% nameindex$Code)] %>% 
    unique

## Combine lists into a single index
all_list <- lapply(samplenames, function(x){
  list(transect_list[[x]], zig_list[[x]], coarse_list[[x]])
})
names(all_list) <- samplenames

save(all_list,file = "datafiles/processed_data_list")











