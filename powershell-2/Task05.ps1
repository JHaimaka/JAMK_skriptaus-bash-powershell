<#
Create a script that simulates pinging a remote server. 
It takes two named parameters. The first parameter is the 
IP-address of a server, second how many times the ping is tried. 
The script also ask the permission to make ping with. 
Pings are made only if a user says Yes. Give default values for the parameters, 
so if the script will be run without the arguments, it will try to ping **192.168.1.1** only once. 
Because **ping** is blocked in the labranet, we simulate only pinging.

**Testing**
*.\Task05.ps1*
*.\Task05.ps1 192.168.8.8 4*

#>
 

param (
[string]$server_IP = '192.168.1.1',
[int]$pings=1
)

Write-Host("I will ping address $server_IP $pings time, Okay ?")
$lupa='n'
$lupa = Read-Host("[Y/n] ")
if ($lupa -eq 'Y')
{
    if ($pings -eq 1)
        {
        Write-Host("try $pings to ping $server_IP")
            # ping.exe -n $pings $server_IP
        }  # 1-pings
    else 
        {
        for ($i=1; $i -lt $pings+1; $i++)
            {
            Write-Host("try $i to ping $server_IP")
            }
        }  # else, many pings
}  # lupa