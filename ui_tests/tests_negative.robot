*** Settings ***
Test Setup         Open browser on page
Test Teardown      Close browser session
Resource        ../PageObject/resource.robot
Resource        ../PageObject/RegisterPage.robot
Resource        ../PageObject/LoginPage.robot
Resource        ../PageObject/UserInfoPage.robot
Resource        ../PageObject/ErrorPage.robot
Test Template   Validate UnSuccesful Login


*** Test Cases ***      username_par           password_par
Invalid username        some_user          12345
Invalid password        ${username}        12345
special characters      @'/*&^'            learning

*** Keywords ***
Validate UnSuccesful Login
    [arguments]     ${username_par}     ${password_par}
    Resource.Set suite variables
    LoginPage.Open Login Page
    LoginPage.User login  ${username_par}     some_pass
    ErrorPage.Check for error page










