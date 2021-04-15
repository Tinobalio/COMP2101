'####################  Hardware Descrption  ####################'
Get-WmiObject -Class win32_computersystem |
Select-Object Description, Manufacturer, Model, Name,
@{n="Physical Memory(GB)"; e={$_.TotalPhysicalMemory/1gb -as [int]}}|
Format-List
'####################  Operating System  ####################'
Get-WmiObject -Class win32_operatingsystem | Select-Object Name, Version|
Format-List
'####################  Processor Information  ####################'
Get-WmiObject -Class win32_processor |
Select-Object @{n="Speed(GHz)"; e={$_.MaxClockSpeed/1000}} ,NumberofCores |
Format-List
'####################  Network Adapter Configuration  ####################'
get-ciminstance win32_networkadapterconfiguration |
Where-Object IPEnabled -eq $True |
Select-Object Description, Index, IPAddress,
@{n="Subnet Mask";e={$_.IPSubnet}},
@{n="DNS Domain Name";e={$_.DNSHostName}},
@{n="DNS Server";e={$_.DNSServerSearchOrder}} |
Format-Table
'####################  Video Card Information  ####################'
$service = Get-WmiObject -Class win32_videocontroller -Filter "Name='Manufacturer'"
Get-WmiObject -Class win32_videocontroller | 
Select-Object Description |fl
$verticalpixles= (Get-WmiObject win32_videocontroller).CurrentVerticalResolution
$horizontalpixles= (Get-WmiObject win32_videocontroller).CurrentHorizontalResolution
Write-Output "Current Screen Resloution:"$horizontalpixles'x'$verticalpixles
if ($service -eq $null) {'Manufacturer: Data Unavailable'}
