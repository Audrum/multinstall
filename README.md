# multinstall

This is a [PowerShell](https://docs.microsoft.com/en-us/powershell) script create for making easier the post Windows installations tasks such as:

* Install browsers ([Firefox](https://www.mozilla.org/en-US/firefox/new/) and [Chrome](https://www.google.com/chrome/index.html))
* Install [7-zip](https://www.7-zip.org)
* Install [Microsoft Office](https://www.office.com)
* Install [Microsoft PowerToys](https://docs.microsoft.com/en-us/windows/powertoys/)
* Activate Windows 10 and Windows 11
* Activate Office

## How to use

Open PowerShell as admin and set your execution policy to **Unrestricted** executing the command:

```PowerShell
Set-ExecutionPolicy Unrestricted
```

![Execution policy unrestricted](/Assets/SCR-20220620-2z9.jpg)

Use the option **A** for "Yes to All".

Then donwload the [multinstall.ps1](https://github.com/audrum/multinstall/releases/download/v0.1/multinstall.ps1) file, right click on it and select the option **Run with PowerShell**

![Run with PowerShell](/Assets/SCR-20220620-2uy.jpg)

If [Winget](https://github.com/microsoft/winget-cli) is not installed, then will install it. Just follow the installation steps.

![Update AppInstaller](/Assets/SCR-20220620-46a.jpg)

![Updating AppInstaller](/Assets/SCR-20220620-46g.jpg)

Finally, enter the corresponding number or numbers for the action or actions that you want to execute.

![Options](/Assets/SCR-20220620-48u.jpg)

## Support

If you have a suggestion or comment, you can reach out to me on Telegram [@audrum](https://t.me/audrum). 