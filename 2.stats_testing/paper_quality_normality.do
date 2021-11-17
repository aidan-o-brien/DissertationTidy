// import data set
clear
import delimited "C:\Users\aob39\OneDrive - University of Bath\Documents\final_tidy.csv"

// test start-ups
sktest cites_10_yrs if startup == 1
sktest cs_2011 if startup == 1
sktest res_area_perc if startup == 1

// test all others
sktest cites_10_yrs if startup == 0
sktest cs_2011 if startup == 0
sktest res_area_perc if startup == 0

// test only companies
sktest cites_10_yrs if startup == 0 & type == "company"
sktest cs_2011 if startup == 0 & type == "company"
sktest res_area_perc if startup == 0 & type == "company"
