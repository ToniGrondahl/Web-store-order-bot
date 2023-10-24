*** Settings ***
Documentation       Web store order checkout bot. Places orders at https://www.prisma.fi.

Library             RPA.Browser.Selenium    auto_close=${FALSE}
Library             Process
Library             RPA.Desktop


*** Tasks ***
Open Prisma.fi
    Open prisma website

Product Search and Selection
    Search for products on the website

Accept cookies
    Close the cookies modal by selecting accept

Availability
    Limit based on availability

Add to cart
    Add the selected item to the cart


*** Keywords ***
Open Prisma website
    Open Available Browser    https://www.prisma.fi/

Search for products on the website
    Input Text    xpath://*[@id="__next"]/header/div/div[2]/form/div[1]/input    playstation 5
    Click Button    xpath://*[@id="__next"]/header/div/div[2]/form/div[1]/button[3]

Close the cookies modal by selecting accept
    Click Button    xpath://*[@id="uc-center-container"]/div[2]/div/div/div/div/button[3]

Limit based on availability
    Click Button    xpath://*[@id="main"]/div/div[1]/div[1]/div/span/div/button[4]
    Click Element    xpath://*[@id="accordion-filters-section-AvailableImmediatelyAllChannels"]/ol/li[1]/label/span[2]
    Click Button    xpath://*[@id="search-filters"]/div/footer/button[2]

Add the selected item to the cart
    Click Button    xpath://*[@id="main"]/div/div[2]/div[1]/ol/li[1]/article/div/div[1]/div/div[2]/div/button
    Click Element    xpath://*[@id="main-content"]/div[1]/div[1]/div[2]/div/ul/li[1]/div/div[3]/h2/a
    Click Button    xpath://*[@id="add-to-cart-button"]
    Click Link    xpath://*[@id="app"]/div/div/header/div[2]/div[3]/div/div[3]/div/div[2]/a
    Click Button    xpath://*[@id="main"]/div[2]/div[3]/div[3]/section/button
