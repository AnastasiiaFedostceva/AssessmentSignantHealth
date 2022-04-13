*** Settings ***
Documentation       A resource file with the reusable keywords and parameters.
...                 The system specific keywords should be described here.
...                 Assumptions&Limitations: no checks for input format is presented.
...                 These checks can be done on format (string lenght, special symbols, digits, etc.)
Library             SeleniumLibrary
Library             OperatingSystem
Library             String

*** Variables ***
${url}                  http://0.0.0.0:8080/
${browser_name}         Firefox
${path} =   /Users/anastasiiakugach/PycharmProjects


*** Keywords ***
Set suite variables
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


Open browser on page
    Create Webdriver    ${browser_name}  executable_path=${path}/AssessmentSignantHealth/ui_tests/drivers/${browser_name}
    Go To               ${url}

Close browser session
    Close Browser
