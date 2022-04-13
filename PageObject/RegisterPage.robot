*** Settings ***
Documentation       All page objects and keywords for Register Page.
Library             SeleniumLibrary
Library             OperatingSystem
Library             String

*** Variables ***
${Page_Title_register}          Register - Demo App
${Register Button Locator}      //input[@value='Register']
${Register_Link_locator}        css:a[href='/register']
${input_username_locator}       id:username
${input_password_locator}       id:password
${input_firstname_locator}      id:firstname
${input_familyname_locator}     id:lastname
${input_phone_locator}          id:phone
${btn_Register}                 xpath://input[@value='Register']


*** Keywords ***
Open Register page

    Click Link          ${Register_Link_locator}
    Title Should Be     ${Page_Title_register}

Fill in Username
    [arguments]     ${username}
    Input Text      ${input_username_locator}      ${username}

Fill in Password
    [arguments]     ${password}
    Input Text      ${input_password_locator}     ${password}

Fill in First name
    [arguments]     ${first_name}
    Input Text      ${input_firstname_locator}    ${first_name}

Fill in Family name
    [arguments]     ${family_name}
    Input Text      ${input_familyname_locator}   ${family_name}

Fill in Phone number
    [arguments]     ${phone}
    Input Text      ${input_phone_locator}        ${phone}

Click the button Register
    Click Button        ${btn_Register}

