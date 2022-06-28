# Office

* [Download](#download)
* [Activate](#activate)

## Download

Download via [winget](https://github.com/microsoft/winget-cli)
```PowerShell
winget install Microsoft.Office
```

Official download links

* Office 2021
    * [English](https://officecdn.microsoft.com/db/492350f6-3a01-4f97-b9c0-c7c6ddf67d60/media/en-us/ProPlus2021Retail.img)
    * [Spanish](https://officecdn.microsoft.com/db/492350f6-3a01-4f97-b9c0-c7c6ddf67d60/media/es-mx/ProPlus2021Retail.img)
* Office 2019 
    * [English](https://officecdn.microsoft.com/pr/492350f6-3a01-4f97-b9c0-c7c6ddf67d60/media/en-us/ProPlus2019Retail.img)
    * [Spanish](https://officecdn.microsoft.com/pr/492350f6-3a01-4f97-b9c0-c7c6ddf67d60/media/es-mx/ProPlus2019Retail.img)


## Activate

For automatic activation you can use the [multinstall.ps1](https://github.com/audrum/multinstall/releases/download/v0.1/multinstall.ps1) script or use the [Office.cmd](Office.cmd) script.

After installation, open Office for the first time and skip all the activation steps and close it again.

Then, open CMD with admin rights and run the following commands **(recommended run one by one)**:

```cmd
cd /d %ProgramFiles(x86)%\Microsoft Office\Office16
cd /d %ProgramFiles%\Microsoft Office\Office16
for /f %x in ('dir /b ..\root\Licenses16\ProPlus2021VL_KMS*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%x"
cscript ospp.vbs /setprt:1688
cscript ospp.vbs /unpkey:6F7TH >nul
cscript ospp.vbs /inpkey:FXYTK-NJJ8C-GB6DW-3DYQT-6F7TH
cscript ospp.vbs /sethst:s8.uk.to
cscript ospp.vbs /act
```