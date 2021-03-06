# install snow and Rmpi on all nodes
#   sudo R
#   install.packages("Rmpi", repos="http://cran.stat.ucla.edu", configure.args="--with-mpi=/usr/lib/arm-linux-gnueabihf/openmpi")
#   install.packages("snow", repos="http://cran.stat.ucla.edu")
# ssh into all nodes to set the fingerprint
#   sudo nano /etc/openmpi/openmpi-default-hostfile
# Add N01, N02, ..., N05 on separate lines
#

require(snow)
require(Rmpi)
cl <- makeMPIcluster(5)


nodes <- paste0("N0", 1:5)
setDefaultClusterOptions("homogeneous"=FALSE, type="SOCK")
pinode <- list(host="N01", 
                       rscript="/usr/local/lib/R/bin/Rscript", 
                       snowlib="/usr/local/lib/R/library"#,
                       #rhome="/usr/local/lib/R",
                       #rprog="/usr/local/lib/R/bin/R",
                       #scriptdir="/usr/local/lib/R/library/snow"
                       )
pinode2 <- pinode; pinode$host <- "N02"
nodespecs <- list(pinode,
                  pinode2)
cl <- makeSOCKcluster(nodespecs)

## aLL Wrong
