$file = Join-Path $PSScriptRoot 'bug_tracker.html'
$lines = Get-Content $file
# Remove the extra } on line 1437 (0-indexed: 1436)
$result = $lines[0..1435] + $lines[1437..($lines.Length-1)]
$result | Set-Content $file -Encoding UTF8
Write-Host "Removed extra closing brace on line 1437"
