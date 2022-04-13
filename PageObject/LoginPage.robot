*** Settings ***
Documentation       All page objects and keywords for Landing Page.
Library             SeleniumLibrary
Library             OperatingSystem
Library             String

*** Variables ***
${Page_Title_login}         Log In - Demo App
${Link_login_locator}       css:a[href='/login']
${input_username_locator}       id:username
${input_password_locator}       id:password
${btn_submit_locator}           xpath://input[@type='submit']
${Link_logout_locator}          css:a[href='/logout']

*** Keywords ***
Open Login Page
    Click Link          ${Link_login_locator}
    Title Should Be     ${Page_Title_login}


User login
    [arguments]     ${username}     ${password}
    Title Should Be     ${Page_Title_login}
    Input Text          ${input_username_locator}      ${username}
    Input Text          ${input_password_locator}     ${password}
    Click Button        ${btn_submit_locator}

User Logout
    Wait Until Element Is Visible   ${Link_logout_locator}
    Title Should Be      ${Page_User_info}
    Click Link      ${Link_logout_locator}
