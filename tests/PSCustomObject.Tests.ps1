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

        $diff | Should -HaveCount 2
        $diff.Property | Should -BeIn @('Name', 'Value')
        $diff.Left | Should -BeIn @('Test', 1)
        $diff.Right | Should -BeIn @('Test', 2)
        $diff.Changed | Should -Contain $true
    }

    It 'Function: Compare-PSCustomObject -OnlyChanged' {
        $Left = [PSCustomObject]@{
            Name  = 'Test'
            Value = 1
        }

        $Right = [PSCustomObject]@{
            Name  = 'Test'
            Value = 2
        }

        $diff = $Left | Compare-PSCustomObject $Right -OnlyChanged

        $diff | Should -HaveCount 1
        $diff.Property | Should -Be 'Value'
        $diff.Left | Should -Be 1
        $diff.Right | Should -Be 2
        $diff.Changed | Should -Be $true
    }
}
