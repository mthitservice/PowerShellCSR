function Create-Csr ([string] $CsrTargetPath , [string] $FriendlyName="STandardcertifikat Name"){


    $template =(Get-Content .\VorlageCert.IAD) -join  "`n"
    $template = $template.Replace('$C$','Test')
    $template = $template.Replace('$Name$',$FriendlyName)
    $template = $template.Replace('$CN$','CN')
    $template = $template.Replace('$City$','City')
    $template = $template.Replace('$Region$','Region')
    $template
    
    Set-Content -Path ".\VorlageCert.inf" -Value $template -NoNewline
    
    Remove-Item -Path $CsrTargetPath -ErrorAction Ignore
    
    certreq.exe -new ".\VorlageCert.inf" $CsrTargetPath
     }
