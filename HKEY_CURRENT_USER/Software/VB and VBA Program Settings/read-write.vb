option explicit

const appName     = "tq84 appliction"
const section     = "some settings"
const keyName     = "initialization date"

sub main() ' {

    dim initDate as string
    initDate = getSetting(appName, section, keyName)

    if initDate <> "" then
       debug.print("App was initialized on " & initDate)
    else
       debug.print("App is not yet initialized")
       saveSetting appName, section, keyName, format(now, "yyyy-mm-dd hh:nn:ss")
    end if

end sub ' }

sub removeApp() ' {
     deleteSetting appName, section
end sub ' }
