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
