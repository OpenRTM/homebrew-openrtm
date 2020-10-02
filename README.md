<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Homebrew_logo.svg/159px-Homebrew_logo.svg.png" width="300">
![](https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Homebrew_logo.svg/159px-Homebrew_logo.svg.png){.pull-right}
テキストを左側に回りこませられます。
<div class="clearfix"></div>

# homebrew-tap
Homebrew tap repository including OpenRTM-aist-* and related formula

Currently the following versions of OpenRTM-aist are provided.

- OpenRTM-aist-1.2.2
  - C++ version
  - Python version

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

