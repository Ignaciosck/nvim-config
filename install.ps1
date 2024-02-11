Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

$packages = @(
    @{id="git"; name="Git"},
    @{id="nodejs"; name="Node.js"},
    @{id="python3"; name="Python"},
    @{id="neovim"; name="Neovim"},
    @{id="mingw"; name="MinGW"},
    @{id="microsoft-windows-terminal"; name="Windows Terminal"}
)

foreach ($package in $packages) {
    $isInstalled = choco list --local-only | Select-String "$($package.id)"
    if ($isInstalled) {
        Write-Output "$($package.name) is already installed."
    } else {
        Write-Output "Installing $($package.name)..."
        choco install $($package.id) -y
    }
}

$pythonInstalled = Get-Command python -ErrorAction SilentlyContinue
if ($pythonInstalled) {
    Write-Output "Python installed."
    # Verificar la instalación de pip
    $pipInstalled = python -m pip -V
    if ($pipInstalled) {
        Write-Output "pip is available"
    } else {
        Write-Error "pip is not available."
    }
} else {
    Write-Error "Couldn't install Python"
}

$nvimConfigPath = "$env:LOCALAPPDATA\nvim"
if (Test-Path $nvimConfigPath) {
    Write-Output "Folder already exists: $nvimConfigPath"
} else {
    git clone https://github.com/Ignaciosck/nvim-config.git $nvimConfigPath
}


$currentUserPath = [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::User)
$systemPath = [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::Machine)

$newPath = "$env:LOCALAPPDATA\nvim-data\mason\bin"

if (-not $systemPath.Contains($newPath)) {
    $updatedSystemPath = $systemPath + ";" + $newPath
    [Environment]::SetEnvironmentVariable("Path", $updatedSystemPath, [EnvironmentVariableTarget]::Machine)
}
