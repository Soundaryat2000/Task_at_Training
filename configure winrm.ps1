$path=read-host "Enter the path to get a list of servers" 

try{ 

 $servers=Get-Content -path $path -ErrorAction stop 

$array=@('dc1','jumphost','localhost','win1','wfa') 

$value1="True" 

while($value1 -eq 'True'){ 

[string]$hostname=read-host "enter a value" 

$value=$hostname -in $array 

if($value -EQ 'True') 

{foreach($server in $servers){ 

try 

{ 

$test=Test-Connection $server -ErrorAction stop 

} 

catch [System.net.networkinformation.pingException] 

{ 

Write-Host "$server not connected" -ForegroundColor Red 

} 

[string]$test=hostname 

if($test -ne $SERVER){ 

invoke-command -ComputerName $server  -scriptblock { 

set-item WSMan:\localhost\Client\TrustedHosts –value $Using:hostname -force -ErrorAction Stop 

write-host "The hostname $uSING:hostname added to a trustedhost ON A $USING:SERVER successfully" -ForegroundColor Green 

} 

} 

ELSE 

{ 

set-item WSMan:\localhost\Client\TrustedHosts –value $hostname -force -ErrorAction Stop 

write-host "The hostname $hostname added to a trustedhost ON A $SERVER successfully" -ForegroundColor Green 

} 

  

} 

  

$value1="False" 

} 

else 

{ 

write-host "Enter a valid hostname which was available in a list  $array" -ForegroundColor red 

$array 

$value1="True" 

} 

} 

} 

catch [System.Management.Automation.ItemNotFoundException] 

{ 

write-host "The path was not found" -ForegroundColor Red 

  

} 

catch [UnauthorizedAccessException] 

{ 

write-host "The access was denied to that path" -ForegroundColor Red 

} 

  

  

  

 

 