# Exploratory Data Analysis with R + bnlearn
# This has been replaced with python code
# and only serves to document initial data exploration

library(tidyverse)
library(bnlearn)

a_h <- read_delim(file = "~/Downloads/Arabidopsis_data_for_network_analyses/20191122_F_mixed_standardized.txt",
                      delim = "\t")
summarize(a_h)
nona_a_h <- na.omit(a_h)


#sanity check for network test dataset
# colnames(nona_a_h)[6:length(colnames(nona_a_h))]

#only use code for subject description, drop first 5 cols
test_set <- as.data.frame(nona_a_h[,6:length(colnames(nona_a_h))])
#convert to factors
test_set[] <- lapply(test_set, as.factor)

#test learning structure

## make an empty graph
ah_graph <- empty.graph(colnames(test_set))

## embed expert knowledge by including a priori links through "white list"
t = length(colnames(test_set))-1
m = cbind(rep(colnames(test_set)[1],times = t),colnames(test_set)[2:length(colnames(test_set))])

m <- as.matrix(m)
colnames(m) <- c("from", "to")
wl <- m



#hillclimb
ah_hc <- hc(test_set, start = ah_graph, whitelist = wl)
plot(ah_hc)
## Treatment = Metal or No Metal
## Stratified = Location 
#-------
# Testing for continuous variable quantiles
#-------
library(tidyverse)
dum_df <- read_delim(file = "~/a_halleri/data/a_halleri_dummy_df.txt",
                      delim = "\t")

con_var <- select(dum_df, contains("F_"))

convar_sum <- list(con_var, con_var) %>% 
    map(gather, var, val) %>% 
    map(group_by, var) %>% 
    map(summarise, 
        val = list(fivenum(val)), 
        label = list(c('min', 'q1', 'med', 'q3', 'max'))) %>% 
    map(unnest) %>% 
    map(spread, label, val)

head(convar_sum)

# It is worth using the outliers method for causal nex descritization
