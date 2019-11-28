[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
$f1=new-object System.Windows.Forms.Form
$f1.Text="PowerShell IAD"
$f1.StartPosition="CenterScreen"
#$f1.WindowState=2


# Label hinzufügen
$l1=New-Object System.Windows.Forms.Label
$l1.Location=New-Object System.Drawing.Size(20,60)
$l1.Size=New-Object System.Drawing.Size(1000,20)
$l1.Text="Bitte Nutzernamen eingeben"

$f1.Controls.Add($l1);

# Text Box hinzufügen
$t1=New-Object System.Windows.Forms.TextBox
$t1.Location=New-Object System.Drawing.Size(20,80)
$t1.Size=New-Object System.Drawing.Size(200,20)
$t1.Text="Bitte Nutzernamen eingeben"

$f1.Controls.Add($t1);

# ComboBox Box hinzufügen
$c1=New-Object System.Windows.Forms.ComboBox
$c1.Location=New-Object System.Drawing.Size(20,110)
$c1.Size=New-Object System.Drawing.Size(200,20)

$Computers= Get-ADComputer -Filter *

$c1.Items.AddRange($Computers.Name)


$f1.Controls.Add($c1);





# Button hinzufügen
$b1=New-Object System.Windows.Forms.Button
$b1.Location=New-Object System.Drawing.Size(20,140)
$b1.Size=New-Object System.Drawing.Size(200,20)
$b1.Text ="CSR anfordern"

$b1.Add_Click({ New-LocalUser -Name $t1.Text -FullName $t1.Name -Description "Über PS UI angelegter Nutzer" -NoPassword  })



$f1.Controls.Add($b1);

# Button hinzufügen
$b2=New-Object System.Windows.Forms.Button
$b2.Location=New-Object System.Drawing.Size(20,180)
$b2.Size=New-Object System.Drawing.Size(200,20)
$b2.Text ="Beenden"

$b2.Add_Click({ $f1.Close()  })



$f1.Controls.Add($b2);


[void] $f1.ShowDialog()
