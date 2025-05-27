:: run command prompt as admin
winget install --force --id Google.Chrome
winget install -e --id=Google.GoogleDrive
winget install --id OSGeo.QGIS_LTR
winget install --id Anaconda.Miniconda3
winget install --id Notepad++.Notepad++
winget install --id git.git
winget install --id jetbrains.pycharm.community
winget install -e --id SumatraPDF.SumatraPDF
winget install -e --id StrawberryPerl.StrawberryPerl
winget install --id=MiKTeX.MiKTeX  -e
winget install --id bitwarden.bitwarden
winget install --id 7zip.7zip
winget install --id inkscape.inkscape
winget install -e --id tailscale.tailscale
winget install --id TheDocumentFoundation.LibreOffice
winget install --id=DigitalScholar.Zotero  -e

:: optional installs
:: winget install --id Microsoft.Office  :: this will break feflow 7.2.5
:: winget install --id manictime.manictime :: unsure if this will break feflow 7.2.5

:: net user USER_NAME PASSWORD /add
:: net localgroup administrators USER_ACCOUNT /add

:: special installs for Bund  
:: Feflow --> software_packages
:: Stepmaster --> software_packages
:: aqutesolv --> software_packages
