# Windows 10 & Windows 11

* [Download](#download)
* [Activate](#activate)

## Download

Official download links:

* [Windows 10](https://www.microsoft.com/en-us/software-download/windows10)
* [Windows 11](https://www.microsoft.com/en-us/software-download/windows11)


## Activate

For automatic activation you can use the [multinstall.ps1](https://github.com/audrum/multinstall/releases/download/v0.1/multinstall.ps1) script or use the corresponding Windows script located in this repository

For activating either Windows 10 or Windows 11, open CMD with admin rights and run the following commands **(recommended run one by one)**:

**Please change *PRODUCT_KEY* for the corresponding serial key depending on you Windows version, for a list of serial keys [enter here](https://docs.microsoft.com/en-us/windows-server/get-started/kms-client-activation-keys)**.

```cmd
slmgr /ipk PRODUCT_KEY
slmgr /skms kms8.msguides.com
slmgr /ato
```

If you get error **0x80070005** it means the activation server is busy, just try again running ```slmgr /ato``` until it is successful.