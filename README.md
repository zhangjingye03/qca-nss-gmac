# qca-nss-gmac

This is a kernel driver for Qualcomm Network Sub System (NSS) GMAC.

Pulled from [CodeAurora](https://us.codeaurora.org/cgit/quic/qsdk/oss/lklm/nss-gmac), tag [NHSS.CC.1.0-00348-O](https://us.codeaurora.org/cgit/quic/qsdk/oss/lklm/nss-gmac/tag/?h=NHSS.CC.1.0-00348-O).

This kernel module requires [qca-nss-drv](https://github.com/zhangjingye03/qca-nss-drv).

# How to use

* Change to your OpenWrt DD Trunk's root directory

* Change to `./package/kernel`

* Clone this repo

* Back to the root directory, `make menuconfig`, select

```
Kernel modules --->
        Qualcomm Network Sub System (NSS) --->
            <M> kmod-qca-nss-gmac..................... Qualcomm NSS
```

* Build
