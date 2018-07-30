# Forest Park Conservancy - Vegetation Survey
## Dataset
Data is taken from vegetation monitoring surveys conducted by the Forest Park Conservancy (FPC) to assess the impact of invasive plant removal on a grid of observation sites in the Balch Creek section of Forest Park, using point-intercept, zig-zag, and coarse wood methods for data collection (only point-intercept for pre-treatment). Three excel files from FPC serve as the source, stored in `datafiles/raw/`:

`BALCH I SUMMARY.xlsx`: post-treatment observations (2017 monitoring)

`Balch North 2016 .xlsx` and `Balch South 2016.xlsx`: pre-treatment observations (2016 monitoring)

These are extracted and compiled into two R list objects, stored in `datafiles/` as `processed_data_list_pretreatment` and `processed_data_list_posttreatment`, with the nested list format:

`
-> SITE_NAME [[#]]
--> POINT-INTERCEPT [1]
--> ZIG-ZAG [2]
--> COARSE-WOOD [3]
`

## Visualization and analysis
Implemented via Shiny, documentation pending
