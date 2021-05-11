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