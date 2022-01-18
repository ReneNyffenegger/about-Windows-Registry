$culture = get-culture
                                                             #  Value being is changed
                                                             # --------------------------
$culture.dateTimeFormat.shortDatePattern      = 'yyyy-MM-dd' #  sShortDate, sDate, iDate
$culture.dateTimeFormat.shortTimePattern      = 'HH:mm'      #  HH is supposed to be 24 hours, why does it not seem to be working.
$culture.dateTimeFormat.pmDesignator          = ''           #  Don't show AM/PM

$culture.numberFormat.currencyPositivePattern =  2           #  iCurrency
$culture.numberFormat.CurrencySymbol          = 'EUR'        #  sCurrency

#
# Changing the list separator seems to
# be broken.
#   https://github.com/dotnet/runtime/issues/43795
# use list-separator.ps1 instead.
#  
#
$culture.textInfo.listSeparator               = ','          #  sList

set-culture $culture
