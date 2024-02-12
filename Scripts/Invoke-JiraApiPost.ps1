param
(
    $ApiEndpoint,
    $BodyJson
)

$secureApiKey = ConvertTo-SecureString -String $Env:JIRA_API_TOKEN -AsPlainText -Force
$credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $Env:JIRA_USER_EMAIL, $secureApiKey

$parameters = @{
    Uri = "$($Env:JIRA_BASE_URL)/rest/api/2/$ApiEndpoint"
    Method = 'Post'
    ContentType = 'application/json'
    Headers = @{
        'Accept' = 'application/json'
    }
    Authentication = 'Basic'
    Credential = $credential
    Body = $BodyJson
}

Invoke-RestMethod @parameters