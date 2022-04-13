*** Settings ***
Documentation       All page objects and keywords for Landing Page.
Library             SeleniumLibrary
Library             OperatingSystem
Library             String

*** Keywords ***
Open Register page
    ${username}=    Generate Random String  8  [LETTERS]
    ${password}=    Generate Random String  8  [LETTERS]
    ${first_name} =  Generate Random String  8  [LETTERS]
    ${family_name} =  Generate Random String  8  [LETTERS]
    ${phone} =  Generate Random String  8  [NUMBERS]
    Set Suite Variable      ${username}
    Set Suite Variable      ${password}
    Set Suite Variable      ${first_name}
    Set Suite Variable      ${family_name}
    Set Suite Variable      ${phone}
    Click Link          css:a[href='/register']
    Title Should Be     ${Page_Title_register}

Fill in Username
    [arguments]     ${username}
    Input Text      id:username     ${username}

Fill in Password
    [arguments]     ${password}
    Input Text      id:password     ${password}

Fill in First name
    [arguments]     ${first_name}
    Input Text      id:firstname    ${first_name}

Fill in Family name
    [arguments]     ${family_name}
    Input Text      id:lastname   ${family_name}

Fill in Phone number
    [arguments]     ${phone}
    Input Text      id:phone        ${phone}

Click the button Register
    Click Button        xpath://input[@value='Register']

