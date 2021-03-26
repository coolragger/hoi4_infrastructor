New-Item -Name history -ItemType directory
New-Item -Name common -ItemType directory
New-Item -Name localisation -ItemType directory
New-Item -Name events -ItemType directory
New-Item -Name map -ItemType directory
New-Item -Name gfx -ItemType directory
Set-Location -Path history
New-Item -Name countries -ItemType directory
New-Item -Name states -ItemType directory
New-Item -Name units -ItemType directory
Set-Location -Path ".."
Set-Location -Path common
New-Item -Name national_focus -ItemType directory
New-Item -Name decisions -ItemType directory
New-Item -Name country_tags -ItemType directory
New-Item -Name ideas -ItemType directory
New-Item -Name countries -ItemType directory
Set-Location -Path decisions
New-Item -Name categories -ItemType directory
Set-Location -Path ".."
Set-Location -Path ".."
New-Item -Name decisions_l_english.yml -ItemType File 
New-Item -Name countries_l_english.yml -ItemType File 
New-Item -Name countries_cosmetic_l_english.yml -ItemType File 
New-Item -Name events_l_english.yml -ItemType File 
New-Item -Name factons_l_english.yml -ItemType File 
New-Item -Name focus_l_english.yml -ItemType File 
New-Item -Name ideas_l_english.yml -ItemType File
New-Item -Name victory_points_l_english.yml -ItemType File
Add-Content -Path *_l_english.yml -Value 'l_english:' -Encoding "utf8"
$vab = Get-ChildItem -Filter "*.yml" -Recurse 
$vab | Rename-Item -NewName { $_.Directory.Name+'_'+$_.Name }
Move-Item "*.yml" -Destination localisation 
Set-Location -Path map
New-Item -Name strategicregions -ItemType directory
New-Item -Name supplyareas -ItemType directory
New-Item -Name terrain -ItemType directory
Set-Location -Path ".."
Set-Location -Path gfx
New-Item -Name flags -ItemType directory
New-Item -Name leaders -ItemType directory
New-Item -Name loadingscreens -ItemType directory
New-Item -Name event_pictures -ItemType directory
Set-Location -Path flags
New-Item -Name medium -ItemType directory
New-Item -Name small -ItemType directory
Set-Location -Path ".."
Set-Location -Path ".."
