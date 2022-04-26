*** Settings ***
Library       Collections
Library       RequestsLibrary
Library       String

*** Variables ***
${base_url}         http://0.0.0.0:8081/


*** Test Cases ***
Register new user
    [Tags]      API
    Set suite variables
    &{req_body}=  Create Dictionary    username=${username}   password=${password}   firstname=${first_name}      lastname=${family_name}   phone=${phone}
    ${response}=     POST        ${base_url}api/users     json=${req_body}    expected_status=201
    log      ${response.json()}
    Dictionary Should Contain Key     ${response.json()}     message
    Should be equal as Strings     SUCCESS      ${response.json()}[status]
    Should be equal as Strings     Created      ${response.json()}[message]
    status should be       201     ${response}

Get token info for valid user
    [Tags]      API
    ${auth}=    Create List     ${username}     ${password}
    Create Session      alias=getResp       url=${base_url}api/auth/token   auth=${auth}
    ${get_response}=   GET On Session      getResp       ${base_url}api/auth/token
    log    ${get_response.json()}
    Dictionary Should Contain Key     ${get_response.json()}     token
    Dictionary Should Contain Key     ${get_response.json()}     status
    Should be equal as Strings     SUCCESS      ${get_response.json()}[status]

Get token info for invalid user
    [Tags]      API
    ${auth}=    Create List     robot_user     ${password}
    Create Session      alias=getResp       url=${base_url}api/auth/token   auth=${auth}
    ${get_response}=   GET On Session      getResp       ${base_url}api/auth/token      expected_status=401
    log    ${get_response.json()}
    Dictionary Should Contain Key     ${get_response.json()}     message
    Dictionary Should Contain Key     ${get_response.json()}     status
    Should be equal as Strings     FAILURE      ${get_response.json()}[status]
    Should be equal as Strings     Invalid User      ${get_response.json()}[message]


*** Keywords ***
Set suite variables
    ${username}=    Generate Random String  8  [LETTERS]
    ${password}=    Generate Random String  8  [LETTERS]
    ${first_name} =  Generate Random String  8  [LETTERS]
    ${family_name} =  Generate Random String  8  [LETTERS]
    ${phone} =  Generate Random String  8  [NUMBERS]
    ${double_user}=     Generate Random String  8  [LETTERS]

    Set Suite Variable      ${username}
    Set Suite Variable      ${password}
    Set Suite Variable      ${first_name}
    Set Suite Variable      ${family_name}
    Set Suite Variable      ${phone}
    Set Suite Variable      ${double_user}

















