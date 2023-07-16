$Token = Get-AzAccessToken
$Headers = @{
    'Authorization' = "Bearer $($Token.Token)"
    'Content-Type' = 'application/json'
}
Invoke-RestMethod -Headers $Headers -Method Get -Uri "https://management.azure.com/subscriptions/7f735fc4-f2f3-41f3-bfce-4ecb4561d22d/resourcegroups/AKSdemo-rg/providers/Microsoft.Network/virtualNetworks/samplevnet?api-version=2015-06-15" | ConvertTo-Json | Out-File "C:\Users\naras\OneDrive\Desktop\challenges\output.txt"
