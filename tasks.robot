*** Settings ***
Documentation       Web store order checkout bot. Places orders at https://www.verkkokauppa.com/.

Library             RPA.Browser.Selenium


*** Tasks ***
Open Verkkokauppa.com
    Log    Done.


*** Keywords ***
Open Verkkokauppa website
    Open Available Browser
    Go To    https://www.verkkokauppa.com/
