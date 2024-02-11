$packages = @(
    @{id="Git.Git"; name="Git"},
    @{id="OpenJS.NodeJS"; name="Node.js"},
    @{id="Python.Python.3"; name="Python"},
    @{id="Neovim.Neovim"; name="Neovim"},
    @{id=" Microsoft.WindowsTerminal"; name="Windows Terminal"}
   
)

foreach ($package in $packages) {
    $isInstalled = winget list --id $package.id -e | Out-String
    if ($isInstalled -match $package.name) {
        Write-Output "$($package.name) is already installed."
    } else {
        Write-Output "Installing $($package.name)..."
        winget install --id $package.id -e --silent

    }
}

# Verificación post-instalación para Python y pip
$pythonInstalled = Get-Command python -ErrorAction SilentlyContinue
if ($pythonInstalled) {
    Write-Output "Python installed."
    # Verificar la instalación de pip
    $pipInstalled = python -m pip -V
    if ($pipInstalled) {
        Write-Output "pip is avaiable"
    } else {
        Write-Error "pip is not avaiable."
    }
} else {
    Write-Error "Couldn't install Python"
}



$nvimConfigPath = "$env:LOCALAPPDATA\nvim"
if (Test-Path $nvimConfigPath) {
    Write-Output "Folder already exists: $nvimConfigPath"
} else {
    git clone https://github.com/<tu_usuario>/nvim-config.git $nvimConfigPath
}

# Obtener el PATH actual del usuario o del sistema
$currentUserPath = [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::User)
$systemPath = [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::Machine)

# La ruta que quieres añadir
$newPath = "$env:LOCALAPPDATA\nvim-data\mason\bin"

if (-not $systemPath.Contains($newPath)) {
    $updatedSystemPath = $systemPath + ";" + $newPath
   [Environment]::SetEnvironmentVariable("Path", $updatedSystemPath, [EnvironmentVariableTarget]::Machine)
}

