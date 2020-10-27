<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Homebrew_logo.svg/159px-Homebrew_logo.svg.png" align="right">

# homebrew OpenRTM
This is [homebrew](https://brew.sh/) tap repository including OpenRTM-aist-* and related formula.

Currently the following versions of OpenRTM-aist are provided.

- OpenRTM-aist-1.2.2
  - C++ version
  - Python version
  - OpenRTP

## How to install

### OpenRTM-aist (C++)
```shell
$ brew update
$ brew tap openrtm/omniorb
$ brew tap openrtm/openrtm
$ brew install openrtm/openrtm-aist
$ brew link openrtm-aist
```

### OpenRTM-aist (Python)
```shell
$ brew update
$ brew tap openrtm/omniorb
$ brew tap openrtm/openrtm
$ brew install openrtm/openrtm-aist-python
$ brew link openrtm-aist-python
```

### OpenRTP-aist (Eclipse tool)
```shell
$ brew update
$ brew tap openrtm/openrtm
$ brew cask install openrtp
```

