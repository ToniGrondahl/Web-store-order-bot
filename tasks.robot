*** Settings ***
Documentation       Web store order checkout bot. Places orders at https://www.prisma.fi.

Library             RPA.Browser.Selenium    auto_close=${FALSE}
Library             Process
Library             RPA.Desktop
Library             RPA.Email.Exchange
# *** Variables ***
# ${URL}    https://epayment.nets.eu/terminal/default.aspx?merchantId=947981&transactionId=0d4c0b2d2cfa4c59983629c43af84318
# ${BROWSER}    Chrome
# ${SAVE_SCREENSHOT_LOCATION}    /tonigrondahl/pictures
# ${EMAIL_FROM}    grondahltoni@gmail.com
# ${EMAIL_TO}    toni.grondahl@outlook.com
# ${EMAIL_SUBJECT}    Order screenshot
# ${EMAIL_BODY}    <h1>Heading</h1><p>Status:</p>


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

# Capture Screenshot and Send it Through Email
#    Open Browser    ${URL}    ${BROWSER}
#    Sleep    2s
#    Capture Page Screenshot    ${SAVE_SCREENSHOT_LOCATION}
#    Send Email With Screenshot    ${EMAIL_FROM}    ${EMAIL_TO}    ${EMAIL_SUBJECT}    ${SAVE_SCREENSHOT_LOCATION}
#    [Teardown]    Close Browser


*** Keywords ***
Open Prisma website
    Open Available Browser    https://www.prisma.fi/

Close the cookies modal by selecting accept
    Click Button    xpath://*[@id="uc-center-container"]/div[2]/div/div/div/div/button[2]

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

# *** Tasks ***
# Sending email
#    Send Message    sender=${GMAIL_ACCOUNT}
#    ...    recipients=${RECIPIENT_ADDRESS}
#    ...    subject=Message from RPA Robot
#    ...    body=RPA Robot message body

# *** Keywords ***
# Send Email With Screenshot
#    [Arguments]    ${email_from}    ${email_to}    ${email_subject}    ${screenshot_location}
#    Connect To Exchange Server    /path/to/credentials.txt
#    Add File To Email Attachments    ${screenshot_location}
#    Send Email    ${email_from}    ${email_to}    ${email_subject}    body=This email contains a screenshot of the current webpage.
# html_body=This email contains a screenshot of the current webpage.    attachment_name=screenshot.png
