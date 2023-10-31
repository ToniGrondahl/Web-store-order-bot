*** Settings ***
Documentation       Web store order checkout bot. Places orders at https://www.pizzaspeed.fi

Library             RPA.Browser.Selenium    auto_close=${FALSE}
Library             Process
Library             RPA.Desktop
Library             RPA.JSON
# Library    DateTime
# Library    RPA.Email.ImapSmtp    smtp_server=smtp.mail.outlook.com    smtp_port=587    imap_server=outlook.office365.com
# Task Setup    Authorize    account=%{EMAIL}    password=%{PASSWORD}


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

Print Message
    Log To Console    Robot has completed the order process!

# Sending email
#    Send Message    sender=%{EMAIL}
#    ...    recipients=houiyksvbtaxevdhqh@cazlg.com
#    ...    subject=Message from RPA Robot
#    ...    body=Order confirmed
#    ...    attachments=orderready.png


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
    # Screenshot    filename=orderready.png
