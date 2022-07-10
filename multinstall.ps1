if (-Not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    if ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000) {
        Start-Process PowerShell -Verb RunAs -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"";
        Exit;
    }
}

function menu {
Clear-Host
$admin = [Security.Principal.WindowsIdentity]::GetCurrent().Groups -contains 'S-1-5-32-544'
$host.UI.RawUI.WindowTitle = "multinstall v0.1 - Menu - Administrator: $admin"
Write-Host "Select the actions:"
Write-Host "1. Install Google Chrome"
Write-Host "2. Install Firefox"
Write-Host "3. Install 7-zip"
Write-Host "4. Install Office"
Write-Host "5. Install Power Toys"
Write-Host "6. Activate Windows 10/11"
Write-Host "7. Activate Office"
Write-Host "8. Exit"
Write-Host

$option = Read-Host

$actions = $option.ToCharArray()

foreach ($num in $actions) {
        if ($num -eq "1") {
            $host.UI.RawUI.WindowTitle = "multinstall v0.1 - Installing Google Chrome"
            winget install Google.Chrome --accept-source-agreements
        }

        elseif($num -eq "2") {
            $host.UI.RawUI.WindowTitle = "multinstall v0.1 - Installing Mozilla Firefox"
            winget install Mozilla.Firefox --accept-source-agreements
        } 

        elseif($num -eq "3") {
            $host.UI.RawUI.WindowTitle = "multinstall v0.1 - Installing 7-zip"
            winget install 7zip.7zip --accept-source-agreements
        }

        elseif($num -eq "4") {
            $host.UI.RawUI.WindowTitle = "multinstall v0.1 - Installing Microsoft Office"
            Write-Host "==========================================================" -ForegroundColor Yellow
            Write-Host "= Wait until black Office installation window closes =" -ForegroundColor Yellow
            Write-Host "==========================================================" -ForegroundColor Yellow

            $wshell = New-Object -ComObject Wscript.Shell
            $wshell.Popup("Wait until black Office installation window closes",0,"Microsoft Office Installation",48+0)

            winget install Microsoft.Office --accept-source-agreements
        }

        elseif($num -eq "5") {
            $host.UI.RawUI.WindowTitle = "multinstall v0.1 - Installing Microsoft PowerToys"
            winget install Microsoft.PowerToys --accept-source-agreements
        }

        elseif($num -eq "6") {
            $host.UI.RawUI.WindowTitle = "multinstall v0.1 - Activating Windows"
            $version = (Get-ItemProperty HKLM:'SOFTWARE\Microsoft\Windows NT\CurrentVersion').ProductName

            if ($version -eq "Windows 10 Home Single Language") {
                Write-Host "Activating $version..." -ForegroundColor Yellow
                Write-Host "Installing Windows key..."
                slmgr /ipk 7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH
                Start-Sleep -Seconds 5
                Write-Host "Conecting to activation server..."
                slmgr /skms s8.uk.to
                Start-Sleep -Seconds 5
                Write-Host "Trying to activate Windows..."
                slmgr /ato
            }

            elseif ($version -eq "Windows 10 Home") {
                Write-Host "Activating $version..." -ForegroundColor Yellow
                Write-Host "Installing Windows key..."
                slmgr /ipk TX9XD-98N7V-6WMQ6-BX7FG-H8Q99
                Start-Sleep -Seconds 5
                Write-Host "Conecting to activation server..."
                slmgr /skms s8.uk.to
                Start-Sleep -Seconds 5
                Write-Host "Trying to activate Windows..."
                slmgr /ato
            }

            elseif ($version -eq "Windows 10 Pro") {
                Write-Host "Activating $version..." -ForegroundColor Yellow
                Write-Host "Installing Windows key..."
                slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
                Start-Sleep -Seconds 5
                Write-Host "Conecting to activation server..."
                slmgr /skms s8.uk.to
                Start-Sleep -Seconds 5
                Write-Host "Trying to activate Windows..."
                slmgr /ato
            }

            elseif ($version -eq "Windows 11 Home Single Language") {
                Write-Host "Activating $version..." -ForegroundColor Yellow
                Write-Host "Installing Windows key..."
                slmgr /ipk 7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH
                Start-Sleep -Seconds 5
                Write-Host "Conecting to activation server..."
                slmgr /skms s8.uk.to
                Start-Sleep -Seconds 5
                Write-Host "Trying to activate Windows..."
                slmgr /ato
            }

            elseif ($version -eq "Windows 11 Home") {
                Write-Host "Activating $version..." -ForegroundColor Yellow
                Write-Host "Installing Windows key..."
                slmgr /ipk TX9XD-98N7V-6WMQ6-BX7FG-H8Q99
                Start-Sleep -Seconds 5
                Write-Host "Conecting to activation server..."
                slmgr /skms s8.uk.to
                Start-Sleep -Seconds 5
                Write-Host "Trying to activate Windows..."
                slmgr /ato
            }

            elseif ($version -eq "Windows 11 Pro") {
                Write-Host "Activating $version..." -ForegroundColor Yellow
                Write-Host "Installing Windows key..."
                slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
                Start-Sleep -Seconds 5
                Write-Host "Conecting to activation server..."
                slmgr /skms s8.uk.to
                Start-Sleep -Seconds 5
                Write-Host "Trying to activate Windows..."
                slmgr /ato
            }

            else {
                Write-Host "$version is not supported for activation, contact @audrum"
            }
        }

        elseif($num -eq "7") {
            $host.UI.RawUI.WindowTitle = "multinstall v0.1 - Activating Microsoft Office"

            if (Test-Path -Path "${env:ProgramFiles(x86)}\Microsoft Office\Office16") {
                Set-Location "${env:ProgramFiles(x86)}\Microsoft Office\Office16" 

                Get-ChildItem ..\root\Licenses16\ProPlus2021VL_KMS*.xrm-ms | ForEach-Object -Process {cscript ospp.vbs /inslic:$_}

                cscript ospp.vbs /setprt:1688
                cscript ospp.vbs /unpkey:6F7TH >nul
                cscript ospp.vbs /inpkey:FXYTK-NJJ8C-GB6DW-3DYQT-6F7TH
                cscript ospp.vbs /sethst:s8.uk.to
                cscript ospp.vbs /act
            }

            elseif (Test-Path -Path "$env:ProgramFiles\Microsoft Office\Office16") {
                Set-Location "$env:ProgramFiles\Microsoft Office\Office16"

                Get-ChildItem ..\root\Licenses16\ProPlus2021VL_KMS*.xrm-ms | ForEach-Object -Process {cscript ospp.vbs /inslic:$_}

                cscript ospp.vbs /setprt:1688
                cscript ospp.vbs /unpkey:6F7TH >nul
                cscript ospp.vbs /inpkey:FXYTK-NJJ8C-GB6DW-3DYQT-6F7TH
                cscript ospp.vbs /sethst:s8.uk.to
                cscript ospp.vbs /act
            }

            else {
                Write-Host "Office is not installed, use option 4 for installing it." -ForegroundColor Yellow
            }
        }

        elseif($num -eq "8") {
            exit
        }
    }

    Start-Sleep -Seconds 5
    menu
} 

 if (Test-Path -Path $Env:USERPROFILE\AppData\Local\Microsoft\WindowsApps\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe\winget.exe) {
    menu
}

else {
    $host.UI.RawUI.WindowTitle = "multinstall v0.1 - Updating WinGet"
    Write-Host "Getting ready environment..." -ForegroundColor Yellow
    $WingetURL = "https://github.com/microsoft/winget-cli/releases/download/v1.2.10271/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"
    Start-BitsTransfer $WingetURL
    .\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
    Start-Sleep -Seconds 30
    menu
}   