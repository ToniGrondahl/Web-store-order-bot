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
    Input Text    username    ${USERNAME}
    Input Password    password    xxx
    Click Button    login-button
