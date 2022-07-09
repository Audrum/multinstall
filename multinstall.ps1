 function menu {
Clear-Host
Write-Host "Select the actions to perform:"
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
            winget install Google.Chrome --accept-source-agreements

            Start-Sleep -Seconds 5
            menu
        }

        elseif($num -eq "2") {
            winget install Mozilla.Firefox --accept-source-agreements

            Start-Sleep -Seconds 5
            menu
        } 

        elseif($num -eq "3") {
            winget install 7zip.7zip --accept-source-agreements

            Start-Sleep -Seconds 5
            menu
        }

        elseif($num -eq "4") {
            Write-Host "===================================================" -ForegroundColor Yellow
            Write-Host "= Wait until the Office installation window close =" -ForegroundColor Yellow
            Write-Host "===================================================" -ForegroundColor Yellow

            winget install Microsoft.Office --accept-source-agreements

            Start-Sleep -Seconds 5
            menu
        }

        elseif($num -eq "5") {
            winget install Microsoft.PowerToys --accept-source-agreements

            Start-Sleep -Seconds 5
            menu
        }

        elseif($num -eq "6") {
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

                Start-Sleep -Seconds 5
                menu
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

                Start-Sleep -Seconds 5
                menu
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

                Start-Sleep -Seconds 5
                menu
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

                Start-Sleep -Seconds 5
                menu
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

                Start-Sleep -Seconds 5
                menu
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

                Start-Sleep -Seconds 5
                menu
            }

            else {
                Write-Host "$version is not supported for activation, contact @audrum"
                Start-Sleep -Seconds 5
                menu
            }
        }

        elseif($num -eq "7") {

            if (Test-Path -Path "${env:ProgramFiles(x86)}\Microsoft Office\Office16") {
                Set-Location "${env:ProgramFiles(x86)}\Microsoft Office\Office16" 

                Get-ChildItem ..\root\Licenses16\ProPlus2021VL_KMS*.xrm-ms | ForEach-Object -Process {cscript ospp.vbs /inslic:$_}

                cscript ospp.vbs /setprt:1688
                cscript ospp.vbs /unpkey:6F7TH >nul
                cscript ospp.vbs /inpkey:FXYTK-NJJ8C-GB6DW-3DYQT-6F7TH
                cscript ospp.vbs /sethst:s8.uk.to
                cscript ospp.vbs /act

                Start-Sleep -Seconds 5
                menu
            }

            elseif (Test-Path -Path "$env:ProgramFiles\Microsoft Office\Office16") {
                Set-Location "$env:ProgramFiles\Microsoft Office\Office16"

                Get-ChildItem ..\root\Licenses16\ProPlus2021VL_KMS*.xrm-ms | ForEach-Object -Process {cscript ospp.vbs /inslic:$_}

                cscript ospp.vbs /setprt:1688
                cscript ospp.vbs /unpkey:6F7TH >nul
                cscript ospp.vbs /inpkey:FXYTK-NJJ8C-GB6DW-3DYQT-6F7TH
                cscript ospp.vbs /sethst:s8.uk.to
                cscript ospp.vbs /act

                Start-Sleep -Seconds 5
                menu
            }

            else {
                Write-Host "Office is not installed" -ForegroundColor Yellow
            }
        }

        elseif($num -eq "8") {
            exit
        }
    }
} 

 if (Test-Path -Path $Env:USERPROFILE\AppData\Local\Microsoft\WindowsApps\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe\winget.exe) {
    menu
}

else {
    Write-Host "Getting ready environment..." -ForegroundColor Yellow
    $WingetURL = "https://github.com/microsoft/winget-cli/releases/download/v1.2.10271/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"
    Start-BitsTransfer $WingetURL
    .\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
    Start-Sleep -Seconds 30
    menu
}  