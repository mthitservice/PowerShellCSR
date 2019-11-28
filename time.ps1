cls
$a=(Get-date)
$b=(get-date ).AddHours(3)
$c=$b-$a
$c.GetType()
[DateTime]$d="00:03:01"
$d.ToString("HH:mm:ss.fff")

