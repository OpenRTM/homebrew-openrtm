<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Homebrew_logo.svg/159px-Homebrew_logo.svg.png" align="right">

# homebrew OpenRTM
This is [homebrew](https://brew.sh/) tap repository including OpenRTM-aist-* and related formula.

Currently the following versions of OpenRTM-aist are provided.

- OpenRTM-aist-1.2.2
  - C++ version
  - Python version
  - Java version
  - OpenRTP-aist (RTCBuildler, RTSystemEditor on Eclipse)

These packages supports the following macOS versions

- Catalina

Currently, OpenRTM-aist (C++, Java, Python) partially supports the "macOS Big Sur", but OpenRTP does not work on the Big Sur. 

## How to install

### OpenRTM-aist (C++)

Please install the omniORB bottle "[omniorb-ssl](https://github.com/OpenRTM/homebrew-omniorb)" provided us instead of official "omniorb" bottle.
```shell
$ brew update
$ brew uninstall omniorb <= if you already installed omniorb
$ brew install openrtm/openrtm/openrtm-aist
$ brew link openrtm-aist
and then please try to run sample components 
$ /usr/local/share/openrtm-1.2/components/c++/examples/ConsoleInComp
```

### OpenRTM-aist (Python)
Please install the omniORBpy bottle "[omniorbpy](https://github.com/OpenRTM/homebrew-omniorb)" provided us.
```shell
$ brew update
$ brew install openrtm/openrtm-aist-python
$ brew link openrtm-aist-python
and then please try to run sample components
$ python3 /usr/local/share/openrtm-1.2/components/python3/SimpleIO/ConsoleIn.py 
```

### OpenRTM-aist (Java)
Java8 is necesarry for OpenRTM-aist-Java and OpenRTP.
```shell
$ brew update
$ brew cask install adoptopenjdk8
$ brew install openrtm/openrtm/openrtm-aist-java
$ cat /usr/local/etc/profile.d/openrtm-aist-java.sh >> ~/.profile
$ source ~/.profile
and then please try to run sample components
$ /usr/local/share/openrtm-1.2/components/java/ConsoleIn.sh
```

### OpenRTP-aist (Eclipse tool)
Due to the OpenRTP dependency, the Cask of adoptopenjdk8 will be installed automatically.

```shell
$ brew update
$ brew tap openrtm/openrtm
$ brew cask install openrtp
$ open -a OpenRTP
```
or launch OpenRTP from "Applications".

When opening OpenRTP, the following dialog window might appear.
In that case, please click the "Open" button.

![Screen Shot 2020-10-27 at 15 59 16](https://user-images.githubusercontent.com/11814060/97267621-ca54f780-186d-11eb-9d88-6a41258286fd.png)

If the "Open" button does not exist, please open the "System Preferences" and go to the "Security and Privacy", "General" submenu.
Here please click the "Allow" button to give the privilege to execute the target application.



