$file = "C:\Users\G PAPA\.gemini\antigravity\scratch\PrimBooks\bug_tracker.html"
$newBugs = Get-Content "C:\Users\G PAPA\.gemini\antigravity\scratch\PrimBooks\new_bugs.txt" -Raw
$content = Get-Content $file -Raw
$pattern = '(?s)// ===BEGIN_BUG_DATA===.*?// ===END_BUG_DATA==='
$content = $content -replace $pattern, $newBugs
Set-Content $file $content -NoNewline
Write-Host "Bug data updated successfully"
