sudo apt-get install subversion
mkdir ~/repositories/rdevel

svn checkout https://svn.r-project.org/R/trunk/ ~/repositories/rdevel

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/'
sudo apt update

cat /etc/apt/sources.list | grep deb-src
sudo sed -i~orig -e 's/# deb-src/deb-src/' /etc/apt/sources.list   
sudo apt update

sudo apt-get build-dep r-base-core

cd ~/repositories/rdevel
./tools/rsync-recommended

mkdir ~/repositories/rdevel_build
./configure --prefix=~/repositories/rdevel_build

cd ~/repositories/rdevel_build
mkdir ~/repositories/rdevel_install
~/repositories/rdevel/configure --prefix=/home/rcc/repositories/rdevel_install
make
make check

sudo apt-get install r-base
