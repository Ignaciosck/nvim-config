function Refresh-EnvironmentPath {
    $pathFromSystem = [System.Environment]::GetEnvironmentVariable("Path", "Machine")
    $pathFromUser = [System.Environment]::GetEnvironmentVariable("Path", "User")
    $combinedPath = $pathFromSystem + ";" + $pathFromUser
    [System.Environment]::SetEnvironmentVariable("Path", $combinedPath, "Process")
}

# Set the execution policy to Unrestricted for this session
Set-ExecutionPolicy Unrestricted -Scope Process -Force

# Configure the security protocol
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072

# Install Chocolatey
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Define the packages to install with optional installation parameters
# Define the packages to install with optional installation parameters
$packages = @(
    @{id="git.install"; name="Git"; params="/NoShellIntegration /NoAutoCrlf"},
    @{id="nodejs"; name="Node.js"},
    @{id="python3"; name="Python"},
    @{id="neovim"; name="Neovim"},
    @{id="mingw"; name="MinGW"},
    @{id="microsoft-windows-terminal"; name="Windows Terminal"}
)

# Install the packages using Chocolatey
foreach ($package in $packages) {
    $isInstalled = choco list --local-only | Select-String "$($package.id)"
    if ($isInstalled) {
        Write-Output "$($package.name) is already installed."
    } else {
        Write-Output "Installing $($package.name)..."
        $params = if ($package.params) { "--params=`"$($package.params)`"" } else { "" }
        $installCommand = "choco install $($package.id) -y $params"
        Write-Output "Running: $installCommand"
        Invoke-Expression $installCommand
    }
}
Refresh-EnvironmentPath

# Check and report on the installation of Python and pip
$pythonInstalled = Get-Command python -ErrorAction SilentlyContinue
if ($pythonInstalled) {
    Write-Output "Python installed."
    $pipInstalled = python -m pip -V
    if ($pipInstalled) {
        Write-Output "pip is available"
    } else {
        Write-Error "pip is not available."
    }
} else {
    Write-Error "Couldn't install Python"
}

# Clone Neovim configuration if it doesn't exist
$nvimConfigPath = "$env:LOCALAPPDATA\nvim"
if (Test-Path $nvimConfigPath) {
    Write-Output "Folder already exists: $nvimConfigPath"
} else {
    git clone https://github.com/Ignaciosck/nvim-config.git $nvimConfigPath
}

# Update the Path environment variable
$currentUserPath = [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::User)
$systemPath = [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::Machine)
$newPath = "$env:LOCALAPPDATA\nvim-data\mason\bin"

if (-not $systemPath.Contains($newPath)) {
    $updatedSystemPath = $systemPath + ";" + $newPath
    [Environment]::SetEnvironmentVariable("Path", $updatedSystemPath, [EnvironmentVariableTarget]::Machine)
}
