# Run "Get-Package | Select-Object Name" by itself to find the actual package name first.
$softwareName = "" 
 
# Enter the minimum software version needed
$minimumVersion = "X.X.X"



################# DO NOT TOUCH ##########################

# Show installed software using Get-Package | Show only results that contain $softwareName
$installedSoftware = Get-Package | Where-Object { $_.Name -like "*$softwareName*" }

#Check if software is installed
if ($installedSoftware -ne $null) {

    # Software is installed; check the version
    $installedVersion = $installedSoftware.Version

    #Check if installed version is greater than or equal to the minimum version
    if ($installedVersion -ge $minimumVersion) {

        # Software version is greater than or equal to desired version, skip install
        Write-Output "SUCCESS - Installed Version $installedVersion is Greater Than or Equal to $minimumVersion"
        exit 0 
    } else {

        # Software version is lower than desired version, run install
        Write-Output "FAIL - Installed Version $installedVersion is Less Than $minimumVersion"
        exit 1
    }
} else {

    # Software is not installed, run install
    Write-Output "FAIL - $softwareName is NOT installed"
    exit 1
}

################# DO NOT TOUCH ##########################
