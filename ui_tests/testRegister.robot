*** Settings ***
Test Setup         Open browser on the main page
Test Teardown      Close browser session
Resource        ../PageObject/resource.robot


*** Variables ***
${Page_Title_register}      Register - Demo App
${Page_Title_login}         Log In - Demo App
${Page_Title_main}          index page - Demo App
${Page_User_info}           User Information - Demo App
${Register Button Locator}  //input[@value='Register']


*** Test Cases ***

Register new user
    Open Register page
    Fill in Username    ${username}
    Fill in Password    ${password}
    Fill in First name  ${first_name}
    Fill in Family name     ${family_name}
    Fill in Phone number    ${phone}
    Click the button Register
    User login  ${username}     ${password}
    User logout


View user information
    Open Login Page
    User login  ${username}     ${password}
    Check user info     ${username}     ${password}     ${first_name}       ${family_name}    ${phone}
    User logout


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

Open Login Page
    Click Link          css:a[href='/login']
    Title Should Be     ${Page_Title_login}

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

User login
    [arguments]     ${username}     ${password}
    Title Should Be     ${Page_Title_login}
    Input Text          id:username     ${username}
    Input Text          id:password     ${password}
    Click Button        xpath://input[@type='submit']

User Logout
    Wait Until Element Is Visible   css:a[href='/logout']
    Title Should Be      ${Page_User_info}
    Click Link      css:a[href='/logout']


Check user info
    [arguments]     ${username}     ${password}     ${first_name}       ${family_name}    ${phone}
    Page Should Contain      ${username}
    Page Should Not Contain      ${password}
    Page Should Contain      ${first_name}
    Page Should Contain      ${family_name}
    Page Should Contain      ${phone}


