  

$path=read-host "Enter the path to get a list of servers" 

try{ 

 $servers=Get-Content -path $path -ErrorAction stop 

foreach($server in $servers) 

{ 

$net=Test-Connection $server -Quiet 

if($net -eq 'true') 

{ 

$process=Invoke-Command -ScriptBlock { get-process|sort-object CPU -descending |select-object -first 10 } -ComputerName $server 

$process 

$process|out-file ".\desktop\process1.txt" -append -force 

$process|Export-Csv ".\desktop\process4.csv" -Append -Force 

} 

else 

{ 

write-host "not found"} 
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

 