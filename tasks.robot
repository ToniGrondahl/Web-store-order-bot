*** Settings ***
Documentation       Web store order checkout bot. Places orders at https://www.prisma.fi.

Library             RPA.Browser.Selenium    auto_close=${FALSE}
Library             Process
Library             RPA.Desktop


*** Tasks ***
Open Prisma.fi
    Open prisma website

Accept cookies
    Close the cookies modal by selecting accept

Product Search and Selection
    Search for products on the website

# Availability
    # Limit based on availability

Add to cart
    Add the selected item to the cart

Fill customer details
    Fill the form


*** Keywords ***
Open Prisma website
    Open Available Browser    https://www.prisma.fi/

Close the cookies modal by selecting accept
    Click Button    css=.sc-eDvSVe dkGsnv

Search for products on the website
    Input Text    xpath://*[@id="__next"]/header/div/div[2]/form/div[1]/input    playstation 5
    Go To    https://www.prisma.fi/haku?search=playstation%205
    CLick Element    xpath://*[@id="main-content"]/div[1]/div[1]/div[2]/div/ul/li[1]/div

# Limit based on availability
    # Click Button    xpath://*[@id="main"]/div/div[1]/div[1]/div/span/div/button[4]
    # Click Element    xpath://*[@id="accordion-filters-section-AvailableImmediatelyAllChannels"]/ol/li[1]/label/span[2]
    # Click Button    xpath://*[@id="search-filters"]/div/footer/button[2]

Add the selected item to the cart
    Click Button    id:add-to-cart-button
    Click Element    xpath://*[@id="__next"]/header/div/a
    Go To    https://www.prisma.fi/tilaus

Fill the form
    Input Text    xpath://input[@id="input-firstName"]    Toni
    Input Text    xpath://input[@id="input-lastName"]    Gröndahl
    Input Text    xpath://input[@id="input-email"]    toni.grondahl@outlook.com
    Input Text    xpath://input[@id="input-telephoneNumber"]    0445476298
    Input Text    xpath://input[@id="input-streetName"]    Hernetie 4
    Input Text    xpath://input[@id="input-postCode"]    00130
    Input Text    xpath://input[@id="input-city"]    Vantaa
    CLick Button    xpath://button[@data-test-id="contact-information-step-continue-button"]
