[Diagnostics.CodeAnalysis.SuppressMessageAttribute(
    'PSReviewUnusedParameter', '',
    Justification = 'Required for Pester tests'
)]
[Diagnostics.CodeAnalysis.SuppressMessageAttribute(
    'PSUseDeclaredVarsMoreThanAssignments', '',
    Justification = 'Required for Pester tests'
)]
[CmdletBinding()]
param()

Describe 'PSCustomObject' {
    It 'Function: Compare-PSCustomObject' {
        $Left = [PSCustomObject]@{
            Name  = 'Test'
            Value = 1
        }

        $Right = [PSCustomObject]@{
            Name  = 'Test'
            Value = 2
        }

        $diff = $Left | Compare-PSCustomObject $Right

        $diff.Property | Should -BeIn @('Name', 'Value')
        $diff.Left | Should -BeIn @('Test', 1)
        $diff.Right | Should -BeIn @('Test', 2)
        $diff.Changed | Should -Contain $true
    }
}
