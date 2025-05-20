function Compare-PSCustomObject {
    <#
        .SYNOPSIS
        Compare two PSCustomObjects and return the comparison.

        .DESCRIPTION
        This function compares two PSCustomObjects and returns an overview of the differences.
        It can also filter to show only the properties that have changed.

        .EXAMPLE
        Compare-PSCustomObject -Left $object1 -Right $object2 -OnlyChanged

        .EXAMPLE
        $object1 = [PSCustomObject]@{
            Name  = 'Test'
            Value = 1
        }
        $object2 = [PSCustomObject]@{
            Name  = 'Test'
            Value = 2
        }
        $object1 | Compare-PSCustomObject $object2

        Output:
        ```powershell
        Property Left Right Changed
        -------- ---- ----- -------
        Name     Test Test    False
        Value    1    2        True
        ```

        .LINK
        https://psmodule.io/PSCustomObject/Functions/Compare-PSCustomObject
    #>
    [Alias('Compare-PSObject')]
    [CmdletBinding()]
    param (
        # The left object to compare
        [Parameter(Mandatory, ValueFromPipeline)]
        [object] $Left,

        # The right object to compare
        [Parameter(Mandatory, Position = 0)]
        [object] $Right,

        # Only show properties that have changed
        [Parameter()]
        [switch] $OnlyChanged
    )

    $diff = foreach ($propertyName in $Left.psobject.Properties.Name) {
        $leftValue = $Left.$propertyName
        $rightValue = $Right.$propertyName
        [PSCustomObject]@{
            Property = $propertyName
            Left     = "$leftValue"
            Right    = "$rightValue"
            Changed  = "$leftValue" -ne "$rightValue"
        }
    }

    if ($OnlyChanged) {
        return $diff | Where-Object { $_.Changed }
    }
    $diff
}
