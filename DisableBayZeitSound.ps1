# DEACTIVATE SOUND OF BAYZEIT
# BAYZEIT saves the current date as binary value in registry. If this date is not current date it plays sound!
# Registry Date is HEX like "84 C5 33 01". This must be reverted to "01 33 C5 84" and then converted to Decimal (int) results in "20170116" which is YEARMONTHDAY as string.

# Get registry key as byte array
$key = "HKCU:\Software\Breitenbach Software Engineering\DMS\DMSW 1.0\Settings"
$binDate = (Get-ItemProperty -Path $key -Name Date).Date;
write-host "Old bin (dec) date: " $binDate;

# must be reverted
[array]::Reverse($binDate)

# hex to dec
$date = [Convert]::ToString("0x" + $binDate[0].ToString("X2") + $binDate[1].ToString("X2")  + $binDate[2].ToString("X2") + $binDate[3].ToString("X2"),10)
write-host "Old date: " $date;

# Determine new date
$currentDate = Get-Date
# Date as DEC like 20170116
$newDate =  $currentDate.Year.ToString("0000") + $currentDate.Month.ToString("00") + $currentDate.Day.ToString("00")
write-host "New date: " $newDate
# Convert to Int32
$newDateInt = [Convert]::ToInt32($newDate)

# Convert new date to hex string
#$newbinDate = [Convert]::ToString($newDate, 16)
$newbinString = "{0:x8}" -f $newDateInt

# Convert hex string to hex byte array
$newbinHex = New-Object byte[] 4
$newbinHex[0] = "0x" + $newbinString.substring(0,2);
$newbinHex[1] = "0x" + $newbinString.substring(2,2);
$newbinHex[2] = "0x" + $newbinString.substring(4,2);
$newbinHex[3] = "0x" + $newbinString.substring(6,2);

# must be reverted
[array]::Reverse($newbinHex)

# Write registry key as byte array
write-host "New bin (dec) date: " $newbinHex;
Set-ItemProperty -Path $key -Name Date -Value $newbinHex