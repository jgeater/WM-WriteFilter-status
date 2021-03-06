$LogFile = "c:\temp\WFilterstate.log"
$WFSTATUS = fbwfmgr /displayconfig

#write the entire config to the log
add-content $Logfile $WFSTATUS

#take the the second line in the array and see if it ends with enable. Then map the result to the a varible.
#the result will be True or False
$on = $WFSTATUS[2].EndsWith("enabled.")


#now check the value. If the filter is on the value will be true. So log it and exit with a code 1
if ($on -match "True")
{
add-content $Logfile "Write filter is currently on"
exit 1
}

#we didnt exiot from the statement above 
# so now check the value again. If the filter is off the value will be False. So log it and exit with a code 0
if ($on -match "False")
{
add-content $Logfile "Write filter is currently off"
exit 0
}

#If we get here the valuse is neither True nore False. this would be a Big problem. so lets log it as unknown state and exit with a code 2
else
{
add-content $Logfile "Write filter is unknown!"
exit 2
}