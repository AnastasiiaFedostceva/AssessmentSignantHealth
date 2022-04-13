*** Settings ***
Documentation       All page objects and keywords for Landing Page.
Library             SeleniumLibrary
Library             OperatingSystem
Library             String

*** Keywords ***
Open Login Page
    Click Link          css:a[href='/login']
    Title Should Be     ${Page_Title_login}


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
