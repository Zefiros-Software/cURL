if [[ "$TRAVIS_OS_NAME" == "linux" ]]; then 
    sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y
    sudo apt-get update -y

    sudo apt-get install gcc-${VERSION} g++-${VERSION} -y
    sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-${VERSION} 60
    sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-${VERSION} 60
    sudo update-alternatives --config gcc
    sudo update-alternatives --config g++
    sudo apt-get install gcc-${VERSION}-multilib g++-${VERSION}-multilib

    # needed for SFML
    sudo apt-get install freeglut3-dev 
    sudo apt-get install libjpeg-dev 
    sudo apt-get install libfreetype6-dev 
    sudo apt-get install libxrandr-dev 
    sudo apt-get install libglew-dev 
    sudo apt-get install libsndfile1-dev 
    sudo apt-get install libopenal-dev
    sudo apt-get install libudev-dev
fi