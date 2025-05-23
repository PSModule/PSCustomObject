# PSCustomObject

This module provides a set of functions for working with PowerShell custom objects (PSCustomObject).

## Prerequisites

This uses the following external resources:
- The [PSModule framework](https://github.com/PSModule) for building, testing and publishing the module.

## Installation

To install the module from the PowerShell Gallery, you can use the following command:

```powershell
Install-PSResource -Name PSCustomObject
Import-Module -Name PSCustomObject
```

## Usage

Here is a list of example that are typical use cases for the module.

### Example 1: Compare two objects

This example shows how to compare two objects and get the differences between them.

```powershell
$object1 = [PSCustomObject]@{
    Name  = 'Test'
    Value = 1
}

$object2 = [PSCustomObject]@{
    Name  = 'Test'
    Value = 2
}

$object1 | Compare-PSCustomObject $object2

# Output:
# Property Left Right Changed
# -------- ---- ----- -------
# Name     Test Test    False
# Value    1    2        True

```

### Example 2: Compare two objects showing only changed properties

This example shows how to compare two objects and get the differences between them.

```powershell
$object1 = [PSCustomObject]@{
    Name  = 'Test'
    Value = 1
}

$object2 = [PSCustomObject]@{
    Name  = 'Test'
    Value = 2
}

$object1 | Compare-PSCustomObject $object2 -OnlyChanged

# Output:
# Property Left Right Changed
# -------- ---- ----- -------
# Value    1    2        True

```

### Find more examples

To find more examples of how to use the module, please refer to the [examples](examples) folder.

Alternatively, you can use the Get-Command -Module 'This module' to find more commands that are available in the module.
To find examples of each of the commands you can use Get-Help -Examples 'CommandName'.

## Contributing

Coder or not, you can contribute to the project! We welcome all contributions.

### For Users

If you don't code, you still sit on valuable information that can make this project even better. If you experience that the
product does unexpected things, throw errors or is missing functionality, you can help by submitting bugs and feature requests.
Please see the issues tab on this project and submit a new issue that matches your needs.

### For Developers

If you do code, we'd love to have your contributions. Please read the [Contribution guidelines](CONTRIBUTING.md) for more information.
You can either help by picking up an existing issue or submit a new one if you have an idea for a new feature or improvement.
