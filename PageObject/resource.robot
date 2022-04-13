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
${executable_path}      /Users/anastasiiakugach/PycharmProjects/AssessmentSignantHealth/chromedriver


*** Keywords ***
Open browser on the main page
    Create Webdriver    Chrome  executable_path=${executable_path}
    Go To               ${url}

Close browser session
    Close Browser
