*** Settings ***
Documentation       Web store order checkout bot. Places orders at https://www.verkkokauppa.com/.

Library             RPA.Browser.Selenium    auto_close=${FALSE}
Library             Process
Library             RPA.Desktop


*** Tasks ***
Open Verkkokauppa.com
    Open verkkokauppa website

Product Search and Selection
    Search for products on the website

Accept cookies
    Close the cookies modal by selecting accept

Availability
    Limit based on availability

Add to cart
    Add the selected item to the cart

Log in to the site
    Log in


*** Keywords ***
Open Verkkokauppa website
    Open Available Browser    https://www.verkkokauppa.com/

Search for products on the website
    Input Text    name:query    playstation 5
    Click Button    name:submit

Close the cookies modal by selecting accept
    Click Button    id:allow-cookies

Limit based on availability
    Click Button    xpath://*[@id="main"]/div/div[1]/div[1]/div/span/div/button[4]
    Click Element    xpath://*[@id="accordion-filters-section-AvailableImmediatelyAllChannels"]/ol/li[1]/label/span[2]
    Click Button    xpath://*[@id="search-filters"]/div/footer/button[2]

Add the selected item to the cart
    Click Element    xpath://*[@id="main"]/div/div[2]/div[1]/ol/li[1]/article/a
    Click Button    xpath://*[@id="main"]/div/div[2]/aside/div[2]/div/div[4]/div[1]/div[2]/button[1]/svg/use
    Click Link    xpath://*[@id="app"]/div/div/header/div[2]/div[3]/div/div[3]/div/div[2]/a
    Click Button    xpath://*[@id="main"]/div[2]/div[3]/div[3]/section/button

Log in
    Input Text    name:email    laurif.forss@gmail.com
    Click Button    id:login-button
    Input Password    name:password    Koulutöitä1
    Click Button    id:login-button
