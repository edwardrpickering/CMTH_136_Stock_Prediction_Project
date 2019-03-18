# Install R packages for Stock Technical Analysis
install.packages("BatchGetSymbols")
install.packages("TTR")
#install.packages("quantmod")
#install.packages("PerformanceAnalytics")

#Load R packages for Stock Technical Analysis
library("BatchGetSymbols")
library("TTR")
#library("quantmod")
#ibrary("PerformanceAnalytics")

# Download Stock Data

my.tickers <- c("A", "AAL", "AAP", "AAPL", "ABBV", "ABC", "ABMD", "ABT", "ACN", "ADBE", "ADI", "ADM", "ADP", "ADS", "ADSK", "AEE", "AEP", "AES", "AFL", "AGN", "AIG", "AIV", "AIZ", "AJG", "AKAM", "ALB", "ALGN", "ALK", "ALL", "ALLE", "ALXN", "AMAT", "AMD", "AME", "AMG", "AMGN", "AMP", "AMT", "AMZN", "ANET", "ANSS", "ANTM", "AON", "AOS", "APA", "APC", "APD", "APH", "APTV", "ARE", "ARNC", "ATVI", "AVB", "AVGO", "AVY", "AWK", "AXP", "AZO", "BA", "BAC", "BAX", "BBT", "BBY", "BDX", "BEN", "BF.B", "BHF", "BHGE", "BIIB", "BK", "BKNG", "BLK", "BLL", "BMY", "BR", "BRK.B", "BSX", "BWA", "BXP", "C", "CAG", "CAH", "CAT", "CB", "CBOE", "CBRE", "CBS", "CCI", "CCL", "CDNS", "CE", "CELG", "CERN", "CF", "CFG", "CHD", "CHRW", "CHTR", "CI", "CINF", "CL", "CLX", "CMA", "CMCSA", "CME", "CMG", "CMI", "CMS", "CNC", "CNP", "COF", "COG", "COO", "COP", "COST", "COTY", "CPB", "CPRI", "CPRT", "CRM", "CSCO", "CSX", "CTAS", "CTL", "CTSH", "CTXS", "CVS", "CVX", "CXO", "D", "DAL", "DE", "DFS", "DG", "DGX", "DHI", "DHR", "DIS", "DISCA", "DISCK", "DISH", "DLR", "DLTR", "DOV", "DRE", "DRI", "DTE", "DUK", "DVA", "DVN", "DWDP", "DXC", "EA", "EBAY", "ECL", "ED", "EFX", "EIX", "EL", "EMN", "EMR", "EOG", "EQIX", "EQR", "ES", "ESS", "ETFC", "ETN", "ETR", "EVRG", "EW", "EXC", "EXPD", "EXPE", "EXR", "F", "FANG", "FAST", "FB", "FBHS", "FCX", "FDX", "FE", "FFIV", "FIS", "FISV", "FITB", "FL", "FLIR", "FLR", "FLS", "FLT", "FMC", "FOX", "FOXA", "FRC", "FRT", "FTI", "FTNT", "FTV", "GD", "GE", "GILD", "GIS", "GLW", "GM", "GOOG", "GOOGL", "GPC", "GPN", "GPS", "GRMN", "GS", "GT", "GWW", "HAL", "HAS", "HBAN", "HBI", "HCA", "HCP", "HD", "HES", "HFC", "HIG", "HII", "HLT", "HOG", "HOLX", "HON", "HP", "HPE", "HPQ", "HRB", "HRL", "HRS", "HSIC", "HST", "HSY", "HUM", "IBM", "ICE", "IDXX", "IFF", "ILMN", "INCY", "INFO", "INTC", "INTU", "IP", "IPG", "IPGP", "IQV", "IR", "IRM", "ISRG", "IT", "ITW", "IVZ", "JBHT", "JCI", "JEC", "JEF", "JKHY", "JNJ", "JNPR", "JPM", "JWN", "K", "KEY", "KEYS", "KHC", "KIM", "KLAC", "KMB", "KMI", "KMX", "KO", "KR", "KSS", "KSU", "L", "LB", "LEG", "LEN", "LH", "LIN", "LKQ", "LLL", "LLY", "LMT", "LNC", "LNT", "LOW", "LRCX", "LUV", "LW", "LYB", "M", "MA", "MAA", "MAC", "MAR", "MAS", "MAT", "MCD", "MCHP", "MCK", "MCO", "MDLZ", "MDT", "MET", "MGM", "MHK", "MKC", "MLM", "MMC", "MMM", "MNST", "MO", "MOS", "MPC", "MRK", "MRO", "MS", "MSCI", "MSFT", "MSI", "MTB", "MTD", "MU", "MXIM", "MYL", "NBL", "NCLH", "NDAQ", "NEE", "NEM", "NFLX", "NFX", "NI", "NKE", "NKTR", "NLSN", "NOC", "NOV", "NRG", "NSC", "NTAP", "NTRS", "NUE", "NVDA", "NWL", "NWS", "NWSA", "O", "OKE", "OMC", "ORCL", "ORLY", "OXY", "PAYX", "PBCT", "PCAR", "PEG", "PEP", "PFE", "PFG", "PG", "PGR", "PH", "PHM", "PKG", "PKI", "PLD", "PM", "PNC", "PNR", "PNW", "PPG", "PPL", "PRGO", "PRU", "PSA", "PSX", "PVH", "PWR", "PXD", "PYPL", "QCOM", "QRVO", "RCL", "RE", "REG", "REGN", "RF", "RHI", "RHT", "RJF", "RL", "RMD", "ROK", "ROL", "ROP", "ROST", "RSG", "RTN", "SBAC", "SBUX", "SCHW", "SEE", "SHW", "SIVB", "SJM", "SLB", "SLG", "SNA", "SNPS", "SO", "SPG", "SPGI", "SRE", "STI", "STT", "STX", "STZ", "SWK", "SWKS", "SYF", "SYK", "SYMC", "SYY", "T", "TAP", "TDG", "TEL", "TFX", "TGT", "TIF", "TJX", "TMK", "TMO", "TPR", "TRIP", "TROW", "TRV", "TSCO", "TSN", "TSS", "TTWO", "TWTR", "TXN", "TXT", "UA", "UAA", "UAL", "UDR", "UHS", "ULTA", "UNH", "UNM", "UNP", "UPS", "URI", "USB", "UTX", "V", "VAR", "VFC", "VIAB", "VLO", "VMC", "VNO", "VRSK", "VRSN", "VRTX", "VTR", "VZ", "WAT", "WBA", "WCG", "WDC", "WEC", "WELL", "WFC", "WHR", "WLTW", "WM", "WMB", "WMT", "WRK", "WU", "WY", "WYNN", "XEC", "XEL", "XLNX", "XOM", "XRAY", "XRX", "XYL", "YUM", "ZBH", "ZION", "ZTS")

first.date <- '2014-01-01'
last.date <- '2019-03-08'

l.out <- BatchGetSymbols(tickers = my.tickers,
                         first.date = first.date,
                         last.date = last.date)

print(l.out$df.control)
print(l.out$df.tickers)

df.control <- l.out$df.control
df.tickers <- l.out$df.tickers

class(df.control)
class(df.tickers)

# Count total number of rows
nrow(df.control)
nrow(df.tickers)

# Display head and tail of data
head(df.control)
tail(df.control)

head(df.tickers)
tail(df.tickers)

# Look at the structure of the data
str(df.tickers)
str(df.control)

## Decisions/Discussion
## BatchGetSymbols attribute, thresh.bad.data, has a default of 0.75.  Therefore, tickers with missing data
## of greater than 75% are not downloaded to the tickers dataframe.  The threshold can be changed but I have 
## no reason to change it for the current work. 

## Tickers that have less than 25% missing data are filled by their closest price with preference for the
## previous price.  Therefore there should be no missing data in the df.tickers dataframe

## Looking at the output from the two lines of code above we can see a number of things:
## 1. There is missing data in the df.tickers dataframe
## 2. The total.obs variable in the df.control dataframe shows that there are a total of 1303 data points 
##    for each of the first 6 attributes of the df.tickers dataframe.
## 3. The threshold.decision attribute in the df.control dataframe is a binary factor with 2 levels of 
##    "KEEP" and "OUT". 

## Consequesntly the missing data in the df.tickers data frame will need to be investigated and some work
## is required to find out how many of the 505 stock tickers made it into the final data. 

# Look at the summary of df.control
summary(df.control)

## We can see that historical price data was successfully downloaded for 503 of the 505 original tickers.
## In addition to the 2 stock tickers for which data could not be downloaded there were an additional 12 tickers
## that had more than 25% missing data.  Therefore, a total of 491 individual tickers exceeded the 0.75 
## threshold for inclusion in the final data and a total of 14 were filtered out. 

# Look at the summary of df.tickers
summary(df.tickers)

## We see that there are a total of 531 missing data points for 6 of the 10 attributes.  2 have no missing
## data and 2 have 1038 missing data points.  In order to get to the bottom of the NAs it is necessary to 
## export the df.tickers dataframe to csv and explore the data in a spreadsheet.

# Get location of working directory
getwd()

# Set location of working directory
setwd("/home/edward/Documents/CMTH136_Capstone_Course/Stock Technical Analysis/Stock Technical Analysis")

# Confirm location of workiong directory
getwd()

# Write data to .csv
write.csv(df.tickers, file = "df.tickers.csv")

## Exploration of the data in a spreadsheet showed that the ticker BHF had 531 NA missing values.  
## As all the missing values are from the same stock and the percentage of missing data was 41%, much greater
## that allowed for the remainder of tickers to be included it was decided to remove the BHF ticker from the
## final data rather than impute it.

# Remove BHF ticker
df.tickers1 <- subset.data.frame(df.tickers, df.tickers$ticker != "BHF")

## Check that the final data contains data for 490 total tickers

# Check structure
str(df.tickers1)

# Make copy of the dataframe
df.tickers2 <- df.tickers1

# Save df.ticker2$ticker as factor
df.tickers2$ticker <- as.factor(df.tickers2$ticker)

# Drop unused factor level
df.tickers2 <- droplevels.data.frame(df.tickers2) 

# Check structure again
str(df.tickers2)


