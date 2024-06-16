
### calculator_with_powershell.ps1 ###

function addition {
    param (
    [parameter(mandatory=$true)]
    [int]$first_number,
    [parameter(mandatory=$true)]
    [int]$second_number
    )
    return $first_number + $second_number
}

function subtraction {
    param (
    [parameter(mandatory=$true)]
    [int]$first_number,
    [parameter(mandatory=$true)]
    [int]$second_number
    )
    return $first_number - $second_number
}

function multiplication {
    param (
    [parameter(mandatory=$true)]
    [int]$first_number,
    [parameter(mandatory=$true)]
    [int]$second_number
    )
    return $first_number * $second_number
}

function division {
    param (
    [parameter(mandatory=$true)]
    [int]$first_number,
    [parameter(mandatory=$true)]
    [int]$second_number
    )

    if ($first_number -eq 0 -or $second_number -eq 0) {Write-Host -ForegroundColor Red 'ZeroDivisionError'} else {return $first_number / $second_number}
}

while ($true) {

Clear-Host -ErrorAction SilentlyContinue
$type_the_operation = Read-Host 'Type the operation'

if ($type_the_operation -eq '+' -or $type_the_operation -eq '-' -or $type_the_operation -eq '*' -or $type_the_operation -eq '/') {

Clear-Host -ErrorAction SilentlyContinue
$first_number = Read-Host 'First number'
$second_number = Read-Host 'Second number'
Clear-Host -ErrorAction SilentlyContinue

if ($type_the_operation -eq '+') {
    $result = addition -first_number $first_number -second_number $second_number
} elseif ($type_the_operation -eq '-') {
    $result = subtraction -first_number $first_number -second_number $second_number
} elseif ($type_the_operation -eq '*') {
    $result = multiplication $first_number -second_number $second_number
} elseif ($type_the_operation -eq '/') {
    $result = division -first_number $first_number -second_number $second_number
}

$result_the_operation = Write-Host -ForegroundColor Green "$result"
Write-Output $result_the_operation
Start-Sleep -Seconds 2.5 -ErrorAction SilentlyContinue
Clear-Host Clear-Host -ErrorAction SilentlyContinue

} else {

Clear-Host Clear-Host -ErrorAction SilentlyContinue
Write-Host -ForegroundColor Red 'Wrong operation'
Start-Sleep -Seconds 2.5 -ErrorAction SilentlyContinue

}
}