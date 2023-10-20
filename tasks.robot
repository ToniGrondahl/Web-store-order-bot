*** Settings ***
Documentation       Web store order checkout bot. Places orders at https://www.verkkokauppa.com/.

Library             RPA.Browser.Selenium
Library             Process


*** Tasks ***
Open Verkkokauppa.com
    Open verkkokauppa website
    Log in

Product Search and Selection:
    Search for products on the website


*** Keywords ***
Open Verkkokauppa website
    Open Available Browser    https://www.verkkokauppa.com/

Log in
    Input Text    email    laurif.forss@gmail.com
    Input Password    password    Koulutöitä1
    Click Button    login-button

Search for products on the website
    Input Text    name:query    playstation 5
    Click Button    name:submit
