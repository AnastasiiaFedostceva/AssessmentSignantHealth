*** Settings ***
Documentation       All page objects and keywords for Landing Page.
Library             SeleniumLibrary
Library             OperatingSystem
Library             String

*** Keywords ***
Check user info
    [arguments]     ${username}     ${password}     ${first_name}       ${family_name}    ${phone}
    Page Should Contain      ${username}
    Page Should Not Contain      ${password}
    Page Should Contain      ${first_name}
    Page Should Contain      ${family_name}
    Page Should Contain      ${phone}
