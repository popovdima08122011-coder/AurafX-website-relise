$ErrorActionPreference = 'Stop'
Set-Location -LiteralPath $PSScriptRoot
Write-Host 'AuraFX site: http://localhost:4173'
Write-Host 'Press Ctrl+C to stop.'
python -m http.server 4173 --bind 127.0.0.1
