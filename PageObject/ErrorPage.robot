*** Settings ***
Documentation       All page objects and keywords for Error Page.
Library             SeleniumLibrary
Library             OperatingSystem
Library             String

*** Variables ***
${Header_Error_Locator}         //h1[.='Login Failure']
${Header_Title_Error_Page}      Login Failure - Demo App

*** Keywords ***
Check for error page
    Wait Until Element Is Visible   ${Header_Error_Locator}
    Title Should Be     ${Header_Title_Error_Page}
