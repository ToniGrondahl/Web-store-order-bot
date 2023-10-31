*** Settings ***
Documentation       Web store order checkout bot. Places orders at https://www.pizzaspeed.fi

Library             RPA.Browser.Selenium    auto_close=${FALSE}
Library             Process
Library             RPA.Desktop
Library             RPA.Email.ImapSmtp    smtp_server=smtp.gmail.com    smtp_port=587

Task Setup          Authorize    account=${GMAIL_ACCOUNT}    password=${GMAIL_PASSWORD}


*** Variables ***
${GMAIL_ACCOUNT}        ACCOUNT_NAME
${GMAIL_PASSWORD}       APP_PASSWORD
${RECIPIENT_ADDRESS}    RECIPIENT
${BODY_IMG1}            ${IMAGEDIR}${/}approved.png
${BODY_IMG2}            ${IMAGEDIR}${/}invoice.png
${EMAIL_BODY}           <h1>Heading</h1><p>Status: <img src='approved.png' alt='approved image'/></p>
...                     <p>INVOICE: <img src='invoice.png' alt='invoice image'/></p>


*** Tasks ***
Open website
    Open pizza speed website

Click order
    Click order online

Add to cart
    Add the selected item to the cart

Fill in customer details
    Fill the form

Choose payment
    choose payment option

Other details
    Fill details

Sending email
    Send Message    sender=${GMAIL_ACCOUNT}
    ...    recipients=${RECIPIENT_ADDRESS}
    ...    subject=Message from RPA Robot
    ...    body=RPA Robot message body

Sending HTML Email With Image
    [Documentation]    Sending email with HTML content and attachment
    Send Message
    ...    sender=${GMAIL_ACCOUNT}
    ...    recipients=${RECIPIENT_ADDRESS}
    ...    subject=HTML email with body images (2) plus one attachment
    ...    body=${EMAIL_BODY}
    ...    html=${TRUE}
    ...    images=${BODY_IMG1}, ${BODY_IMG2}
    ...    attachments=example.png


*** Keywords ***
Open pizza speed website
    Open Available Browser    www.pizzaspeed.fi
    Go To    https://pizzaspeed.cityfood.fi/AllProducts.aspx

Click order online
    Click Element    xpath://*[@id="divProductsAjax"]/div[1]/div[2]/div[2]
    Click Element    xpath://*[@id="btnAdd2BasketModal"]

Add the selected item to the cart
    Click Element    xpath://*[@id="navbar"]/ul/li[4]/a
    Go To    https://pizzaspeed.cityfood.fi/Order.aspx
    Sleep    5s

Fill the form
    Input Text    xpath://*[@id="ContentPlaceHolder1_ContentPlaceHolder1_txtFirstname"]    Toni
    Input Text    xpath://*[@id="ContentPlaceHolder1_ContentPlaceHolder1_txtLastname"]    Gröndahl
    Input Text    xpath://*[@id="ContentPlaceHolder1_ContentPlaceHolder1_txtPhone"]    toni.grondahl@outlook.com
    Input Text    xpath://*[@id="ContentPlaceHolder1_ContentPlaceHolder1_txtEmail"]    0445476298
    Input Text    xpath://*[@id="ContentPlaceHolder1_ContentPlaceHolder1_AddressForm_pacinput"]    Hernetie 4 A 9

Choose payment option
    Click Element    xpath://*[@id="ContentPlaceHolder1_ContentPlaceHolder1_rblPaymentType"]/tbody/tr[2]/td/label

Fill details
    Input Text    xpath://*[@id="ContentPlaceHolder1_ContentPlaceHolder1_txtOrderNote"]    Ovikoodi: 1234
    Screenshot    filename=orderready.png
