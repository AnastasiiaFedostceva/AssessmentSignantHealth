*** Settings ***
Test Setup         Open browser on page
Test Teardown      Close browser session
Resource        ../PageObject/resource.robot
Resource        ../PageObject/RegisterPage.robot
Resource        ../PageObject/LoginPage.robot
Resource        ../PageObject/UserInfoPage.robot
Resource        ../PageObject/ErrorPage.robot


*** Test Cases ***

Register new user
    Set suite variables
    RegisterPage.Open Register page
    RegisterPage.Fill in Username    ${username}
    RegisterPage.Fill in Password    ${password}
    RegisterPage.Fill in First name  ${first_name}
    RegisterPage.Fill in Family name     ${family_name}
    RegisterPage.Fill in Phone number    ${phone}
    RegisterPage.Click the button Register
    LoginPage.User login  ${username}     ${password}
    LoginPage.User logout


View user information
    LoginPage.Open Login Page
    LoginPage.User login  ${username}     ${password}
    UserInfoPage.Check user info     ${username}     ${password}     ${first_name}       ${family_name}    ${phone}
    LoginPage.User logout











