# Office

* [Download](#download)
* [Activate](#activate)

## Download

Download via [winget](https://github.com/microsoft/winget-cli)
```PowerShell
winget install Microsoft.Office
```

Official download links

* [Office 2021 (English)](https://officecdn.microsoft.com/db/492350f6-3a01-4f97-b9c0-c7c6ddf67d60/media/en-us/ProPlus2021Retail.img) [(Spanish)](https://officecdn.microsoft.com/db/492350f6-3a01-4f97-b9c0-c7c6ddf67d60/media/es-mx/ProPlus2021Retail.img)
* [Office 2019 (English)](https://officecdn.microsoft.com/pr/492350f6-3a01-4f97-b9c0-c7c6ddf67d60/media/en-us/ProPlus2019Retail.img)
* [Project 2021 (English)](http://officecdn.microsoft.com/pr/492350f6-3a01-4f97-b9c0-c7c6ddf67d60/media/en-us/ProjectPro2021Retail.img)
* [Project 2019 (English)](https://officecdn.microsoft.com/pr/492350f6-3a01-4f97-b9c0-c7c6ddf67d60/media/en-us/ProjectPro2019Retail.img)
* [Visio 2021 (English)](http://officecdn.microsoft.com/pr/492350f6-3a01-4f97-b9c0-c7c6ddf67d60/media/en-us/VisioPro2021Retail.img)
* [Visio 2019 (English)](https://officecdn.microsoft.com/pr/492350f6-3a01-4f97-b9c0-c7c6ddf67d60/media/en-us/VisioPro2019Retail.img)
* [Office for macOS (16.67.22111300)](https://officecdnmac.microsoft.com/pr/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/Microsoft_Office_16.67.22111300_Installer.pkg)


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

## Activate Office for macOS

The Office activator for macOS has been taken from [alsyundawy](https://github.com/alsyundawy/Microsoft-Office-For-MacOS) repository, clic below for starting download:

* [Office for macOS serializer](https://raw.githubusercontent.com/alsyundawy/Microsoft-Office-For-MacOS/master/DATA/Microsoft_Office_LTSC_2021_VL_Serializer.pkg)