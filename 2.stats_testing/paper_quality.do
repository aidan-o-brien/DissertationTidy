// import data set
clear
import delimited "C:\Users\aob39\OneDrive - University of Bath\Documents\final_tidy.csv"

// citation count
sum cites_10_yrs if startup == 1												// mean and std. of startups
sum cites_10_yrs if startup != 1												// mean and std. of everyone else
sum cites_10_yrs if startup != 1 & type == "company"							// mean and std. of companies
ranksum cites_10_yrs, by(startup)												// test startups against everyone else
ranksum cites_10_yrs if type == "company", by(startup)							// test startups against companies

// journal quality metrics
sum cs_2011 if startup == 1
sum cs_2011 if startup == 0
sum cs_2011 if startup != 1 & type == "company"
// histogram cs_2011, bin(20)
ranksum cs_2011, by(startup)
ranksum cs_2011 if type == "company", by(startup)

sum res_area_perc if startup == 1
sum res_area_perc if startup == 0
sum res_area_perc if startup != 1 & type == "company"
// histogram res_area_perc, bin(30)
ranksum res_area_perc, by(startup)
ranksum res_area_perc if type == "company", by(startup)

sum sci_jr if startup == 1
sum sci_jr if startup == 0
sum sci_jr if startup != 1 & type == "company"
// histogram sci_jr, bin(30)
ranksum sci_jr, by(startup)
ranksum sci_jr if type == "company", by(startup)

sum snip if startup == 1
sum snip if startup == 0
sum snip if startup != 1 & type == "company"
// histogram snip, bin(50)															// snip is more normally dist. > maybe use ttest
ranksum snip, by(startup)
ranksum snip if type == "company", by(startup)

// citation and journal quality comparison for 
levelsof res_area, local(myareas)
foreach ra of local myareas{

	// citations summary
	summarize cites_10_yrs if res_area == "`ra'" & startup == 1
	summarize cites_10_yrs if res_area == "`ra'" & startup == 0
	summarize cites_10_yrs if res_area == "`ra'" & startup == 0 & type == "company"
	ranksum cites_10_yrs if res_area == "`ra'", by(startup)
	ranksum cites_10_yrs if res_area == "`ra'" & type == "company", by(startup)
	
	// citescore summary
	summarize cs_2011 if res_area == "`ra'" & startup == 1
	summarize cs_2011 if res_area == "`ra'" & startup == 0
	summarize cs_2011 if res_area == "`ra'" & startup == 0 & type == "company"
	ranksum cs_2011 if res_area == "`ra'", by(startup)
	ranksum cs_2011 if res_area == "`ra'" & type == "company", by(startup)
	
	// citescore percentile summary
	summarize res_area_perc if res_area == "`ra'" & startup == 1
	summarize res_area_perc if res_area == "`ra'" & startup == 0
	summarize res_area_perc if res_area == "`ra'" & startup == 0 & type == "company"
	ranksum res_area_perc if res_area == "`ra'", by(startup)
	ranksum res_area_perc if res_area == "`ra'" & type == "company", by(startup)
	
	// scimago jr summary
	summarize sci_jr if res_area == "`ra'" & startup == 1
	summarize sci_jr if res_area == "`ra'" & startup == 0
	summarize sci_jr if res_area == "`ra'" & startup == 0 & type == "company"
	ranksum sci_jr if res_area == "`ra'", by(startup)
	ranksum sci_jr if res_area == "`ra'" & type == "company", by(startup)
	
	// snip summary
	summarize snip if res_area == "`ra'" & startup == 1
	summarize snip if res_area == "`ra'" & startup == 0
	summarize snip if res_area == "`ra'" & startup == 0 & type == "company"
	ranksum snip if res_area == "`ra'", by(startup)
	ranksum snip if res_area == "`ra'" & type == "company", by(startup)
}
