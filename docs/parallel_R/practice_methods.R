# install snow on all nodes
# install.packages("snow", repos=http://cran.stat.ucla.edu")

require(snow)
nodes <- c("N01","N02","N03","ThinkPad")
nodes <- c("192.168.0.151","192.168.0.152","192.168.0.153","192.168.0.149")

cl <- makeCluster(nodes, type="SOCK")

## aLL Wrong
