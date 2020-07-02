$culture = get-culture
                                                           #  Value being is changed
                                                           # --------------------------
$culture.dateTimeFormat.shortDatePattern = 'yyyy-MM-dd'    #  sShortDate, sDate, iDate
$culture.dateTimeFormat.shortTimePattern = 'hh:mm'         #    ???

$culture.numberFormat.CurrencyPositivePattern =  2         #  iCurrency
$culture.numberFormat.CurrencySymbol          = 'EUR'      #  sCurrency

set-culture $culture
