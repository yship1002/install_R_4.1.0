#!/bin/bash

############################################################################

#This script will install R packages on your home directory

############################################################################




cd ~
module load pcre/8.39
module load bzip2/1.0.6
module load zlib/1.2.8
module load xz/5.2.2
module load jags/4.3.0

module unload gcc/4.7.4 #Unload older version of GCC to avoid compiler error
module load gcc/6.3.0


module load intel-psxe/2019-update1  #Installation of rjags(a dependency of infercnv) requires a intel compiler



###########################################################################################

#Download the R package from internet, decompress and configure the packages

############################################################################################


wget https://cran.r-project.org/src/base/R-4/R-4.1.0.tar.gz
tar -xf R-4.1.0.tar.gz
cd R-4.1.0
./configure --prefix=$HOME/R CPPFLAGS="-I/share/apps/bzip2/1.0.6/include -I/share/apps/xz/5.2.2/include -I/share/apps/pcre/8.3/include" LDFLAGS="-L/share/apps/bzip2/1.0.6/lib -L/share/apps/xz/5.2.2/lib -L/share/apps/pcre/8.3/lib" --with-readline=no --with-pcre1
make


###########################################################################################

#Export path to bashrc so that we can run R on login node

###########################################################################################

path_to_R="export PATH=\"$HOME/R-4.1.0/bin\":$"
export_path_to_R=${path_to_R}PATH 
echo "${export_path_to_R} >> ~/.bashrc
