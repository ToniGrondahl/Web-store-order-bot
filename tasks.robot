*** Settings ***
Documentation       Web store order checkout bot. Places orders at https://www.verkkokauppa.com/.

Library             RPA.Browser.Selenium


*** Tasks ***
Open Verkkokauppa.com
    Open verkkokauppa website
    Log in


*** Keywords ***
Open Verkkokauppa website
    Open Available Browser    https://www.verkkokauppa.com/

Log in
    Input Text    username    ${laurif.forss@gmail.com}
    Input Password    password    Koulutöitä1
    Click Button    login-button
