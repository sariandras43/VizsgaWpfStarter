param(
    [string]$filePath
)

# Read the content of the file
$content = Get-Content $filePath -Raw

# Perform the replacement
$content = [regex]::Replace($content, '(public partial class )(\w+)(\s*\n\{)', { param($m) 
    $className = $m.Groups[2].Value
    return "public partial class $($className): INotifyPropertyChanged`n{`n    public event PropertyChangedEventHandler PropertyChanged;`n`n    static $($className)(){`n        AutoBinder.PatchAll<$($className)>();`n    `}"
})

# Add the 'using' statements at the beginning of the file
$prefix = "using BetterBinding;`nusing System.ComponentModel;`n"

# Combine the 'using' statements with the modified content
$content = $prefix + $content

# Write the modified content back to the file
Set-Content $filePath $content
