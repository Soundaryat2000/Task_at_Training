$user_input=""  

$array=@('name','lastname','email','password','exit') 

while($user_input -ne "exit")  

{  

$user_input=read-host " Name `n Lastname `n Email `n Password `n exit `n  Enter the Choice which you want to change"  

if($user_input -in $array) 

{ 

try{ 

if($user_input -eq "Name")  

{  

$username=read-host "enter the username"  

$name=read-host "enter the Name"  

Set-ADUser -Identity $username -GivenName $name -ErrorAction Stop  

write-host " $name added to a user $username as a name successfully" -ForegroundColor Green 

}  

if($user_input -eq "lastname")  

{  

$username=read-host "enter the username"  

$name=read-host "enter the lastname"  

Set-ADUser -Identity $username -Surname $name -ErrorAction stop 

write-host " $name added to a user $username as a lastname successfully" -ForegroundColor Green 

}  

if($user_input -eq "Email")  

{  

$username=read-host "enter the username"  

$name=read-host "enter the Email"  

Set-ADUser -Identity sounda -EmailAddress s -ErrorAction stop 

write-host " $name added to a user $username as a emailaddress successfully" -ForegroundColor green 

}  

if($user_input -eq "password")  

{  

$username=read-host "enter the username"  

$password=read-host "enter the password" -AsSecureString  

Set-ADAccountPassword -Identity $Username -NewPassword $Password -Reset -ErrorAction stop 

write-host " password changed successfully" -foregroundcolor green 

}  

} 

catch [Microsoft.ActiveDirectory.Management.ADIdentityNotFoundException] 

{ 

write-host "The user does not exist" 

}  

} 

else 

{ 

write-host " Enter the choice only available in the list `n If you want to exit Enter 'Exit' " -ForegroundColor Red } 

}   

 