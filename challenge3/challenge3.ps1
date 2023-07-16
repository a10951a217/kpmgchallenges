function Get-ValueFromNestedObject {
    param (
        [Parameter(Mandatory=$true)]
        [object]$Object,
        [Parameter(Mandatory=$true)]
        [string]$Key
    )
    $keys = $Key.Split('/')
    $value = $Object
    foreach ($k in $keys) {
        $value = $value.$k
    }
    return $value
}


$object = @{a=@{b=@{c='d'}}}
$key = 'a/b/c'
$value = Get-ValueFromNestedObject -Object $object -Key $key
Write-Host "Value: $($value)"