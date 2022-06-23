Function Get-Tenant {
    $tenantSaveDir = "$ENV:HOME/.azure"
    $tenantFile = "tenants.txt"
    $tenantFileFullPath = "$tenantSaveDir/$tenantFile"
    
    if( (Test-Path $tenantFileFullPath ) -eq $false){
        New-Item -ItemType "file" -Path $tenantFileFullPath 
    }

    $tenantContent = Get-Content -Path $tenantFileFullPath 

    $tenantContent
}

Function Add-Tenant {
    param(
        $TenantName
    )

    $tenantSaveDir = "$ENV:HOME/.azure"
    $tenantFile = "tenants.txt"
    $tenantFileFullPath = "$tenantSaveDir/$tenantFile"
    
    if( (Test-Path $tenantFileFullPath ) -eq $false){
        New-Item -ItemType "file" -Path $tenantFileFullPath 
    }

    $tenantContent = Get-Content -Path $tenantFileFullPath 

    if($tenantName -notin $tenantContent) {
        Add-Content -Value $tenantName -Path $tenantFileFullPath
        Write-Host "$TenantName added to $tenantFileFullPath"
    }else{
        Write-Error "$TenantName already exists in $tenantFileFullPath"
    }
}

Function Remove-Tenant {

}

Function Reconnect-Tenant {

}

Function Set-Tenant {
    $tenantSaveDir = "$ENV:HOME/.azure"
    $tenantFile = "tenants.txt"
    $tenantFileFullPath = "$tenantSaveDir/$tenantFile"

    $tenantContent = Get-Content -Path $tenantFileFullPath 
    
    $tenants = @()
    $index = 0
    $tenantContent | ForEach-Object {
        $obj = [PSCustomObject] @{ Number = $index; Tenant = $_}
        $tenants += $obj
        $index++
    }

    do {
        $tenants | Format-Table
        $select = Read-Host -Prompt 'Select a tenant'
        $chosenTenant = $tenants[$select]
    } until ($null -ne $chosenTenant)
    # Set the chosen tenant 
    Add-AzAccount -Tenant $chosenTenant.Tenant 
    Set-AzContext -Tenant $chosenTenant.Tenant | Format-List -Property Account, Tenant 
}

Function Set-Subscription {
    param(
        $Name,
        $TenantId = (Get-AzContext).Tenant.Id
    )
    $currentSub = Get-AzContext

    # Get subscriptions
    $Subscriptions = Get-AzSubscription -TenantId $TenantId -WarningAction Ignore | Where-Object name -Match $Name | Sort-Object -Property Name
    $Subs = @()
    # Add numbers to subscription
    $index = 0
    $Subscriptions | ForEach-Object {
        $obj = [PSCustomObject] @{ Number = $index; Name = $_.Name; Id = $_.id; TenantId = $_.TenantId; State = $_.State }
        $Subs += $obj
        $index++
    }
    # Choose subscription
    do {
        $Subs | Format-Table
        $select = Read-Host -Prompt 'Select a subscription'
        $ChosenSubscription = $Subs[$select]
    } until ($null -ne $ChosenSubscription)
    # Set the chosen subscription
    Set-AzContext -SubscriptionId $ChosenSubscription.Id -TenantId $ChosenSubscription.TenantId | Format-List -Property name, account, subscription, tenant
}
