// import data set
clear
import delimited "C:\Users\aob39\OneDrive - University of Bath\Documents\final_tidy.csv"
tab res_area startup, chi2
tab res_area startup if type == "company", chi2
