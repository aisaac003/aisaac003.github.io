param(
  [string]$RemoteName = "origin",
  [string]$BranchName = "gh-pages"
)

$ErrorActionPreference = "Stop"

Write-Host "Preflight: revisando repositorio local..." -ForegroundColor Cyan
git status --short

$answer = Read-Host "¿Quieres publicar esta version en GitHub Pages empujando a '$BranchName'? [Y/N]"
if ($answer -notin @("Y", "y")) {
  Write-Host "Publicacion cancelada. No se realizo push." -ForegroundColor Yellow
  exit 0
}

git branch -M $BranchName
git push -u $RemoteName $BranchName
