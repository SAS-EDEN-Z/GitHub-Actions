param (
    [Parameter(Mandatory = $true, Position = 0)]
    [string] $PathPattern
)

$matchedItems = Get-ChildItem $PathPattern
$matchCount = ($matchedItems | Measure-Object).Count

if ($matchCount -ne 1)
{
    $errorMessage =
        "The solution or project path pattern `"$PathPattern`" matches $matchCount items, see below. Fix the pattern " +
        "so it matches exactly one file.
$($matchedItems | Select-Object $PSItem.Name)"

    if ($matchCount -eq 0)
    {
        $errorMessage =
            "The solution or project path pattern `"$PathPattern`" matches no items. Fix the pattern so it matches " +
            "exactly one file."
    }

    Write-Error $errorMessage

    exit 1
}

$matchedItems.FullName
