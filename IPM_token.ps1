
$resourceAppIdURI = 'https://database.windows.net/'

$tokenResponse = Invoke-RestMethod -Method Post -UseBasicParsing -Uri "https://login.windows.net/$($args[0])/oauth2/token" -Body @{resource=$resourceAppIdURI 
client_id=$args[1] 
grant_type='client_credentials' 
client_secret=$args[2]} -ContentType 'application/x-www-form-urlencoded'

if ($tokenResponse) {
Write-debug “Access token type is $($tokenResponse.token_type), expires $($tokenResponse.expires_on)”
$Token = $tokenResponse.access_token | Out-file .env
}