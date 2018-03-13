# Mycroft Plasma Mobile Plasmoid
#### Mycroft Ai Plasmoid and Skills for KDE Plasma Mobile

1. Installing Mycroft on Plasma Mobile (Nexus 5x):
  + git clone https://github.com/MycroftAI/mycroft-core
  + cd ~/mycroft-core/scripts/
  + nano install-mimic.sh
  + Replace everything after # download and install mimic comment in file with the following:
 ```
if [ ! -d ${MIMIC_DIR} ]; then
    git clone --branch ${MIMIC_VERSION} https://github.com/MycroftAI/mimic.git --depth=1
    cd ${MIMIC_DIR}
    ./autogen.sh
    ./configure --with-audio=portaudio --enable-shared --prefix=$(pwd) --disable-vid_gb_ap
    make
    make install
else
    # ensure mimic is up to date
    cd ${MIMIC_DIR}
    make clean 2> /dev/null || true
    git remote add all-branches https://github.com/mycroftai/mimic/ 2> /dev/null || true
    git fetch --all --tags --prune
    git checkout tags/${MIMIC_VERSION}
    ./autogen.sh
    ./configure --with-audio=portaudio --enable-shared --prefix=$(pwd) --disable-vid_gb_ap
    make clean
    make
    make install
fi
```  
  + Run: ./dev_setup.sh  
  + Download / Clone Mycroft Plasmoid from this Repository: git clone https://github.com/AIIX/plasma-mycroft-mobile 
  
  + Plasma Mobile KDE Neon Plasmoid Dependencies 
   ```
sudo apt-get install libkf5notifications-data libkf5notifications-dev qml-module-qtquick2 qml-module-qtquick-controls2 qml-module-qtquick-controls qml-module-qtwebsockets qml-module-qt-websockets qtdeclarative5-qtquick2-plugin qtdeclarative5-models-plugin cmake cmake-extras cmake-data qml-module-qtquick-layouts libkf5plasma-dev extra-cmake-modules qtdeclarative5-dev build-essential g++ gettext libqt5webkit5 libqt5webkit5-dev libkf5i18n-data libkf5i18n-dev libkf5i18n5 qml-module-qtgraphicaleffects libqt5dbus5 libkf5dbusaddons-dev libdbus-1-dev libdbus-glib-1-dev -y
 ```
 
2. Installation Instructions [Go To Downloaded Plasmoid Folder and run the following commands]
 ```
  cd plasma-mycroft-mobile
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release   -DKDE_INSTALL_LIBDIR=lib -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
  sudo make install
  sudo chmod +x /usr/share/plasma/plasmoids/org.kde.phone.mycroftplasmoid/contents/code/startservice.sh
  sudo chmod +x /usr/share/plasma/plasmoids/org.kde.phone.mycroftplasmoid/contents/code/stopservice.sh
  sudo chmod +x /usr/share/plasma/plasmoids/org.kde.phone.mycroftplasmoid/contents/code/pkgstartservice.sh
  sudo chmod +x /usr/share/plasma/plasmoids/org.kde.phone.mycroftplasmoid/contents/code/pkgstopservice.sh
   ```
  + Restart Device
