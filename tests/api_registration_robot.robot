*** Settings ***
Library       Collections
Library       RequestsLibrary
Library       String

*** Variables ***
${base_url}         http://0.0.0.0:8081/


*** Test Cases ***
Create new user
    [Tags]      API
    Set suite variables
    &{data}=    Create Dictionary     username=${username}   password=${password}   firstname=${first_name}      lastname=${family_name}   phone=${phone}
    log     ${data}
    Dictionary Should Contain Key     ${data}     username
    log     ${data}[username]

Register new user
    [Tags]      API
    &{req_body}=  Create Dictionary    username=${username}   password=${password}   firstname=${first_name}      lastname=${family_name}   phone=${phone}
    ${response}=     POST        ${base_url}api/users     json=${req_body}    expected_status=201
    log      ${response.json()}
    Dictionary Should Contain Key     ${response.json()}     message
    Should be equal as Strings     SUCCESS      ${response.json()}[status]
    Should be equal as Strings     Created      ${response.json()}[message]
    status should be       201     ${response}

Register user with name that already exists
    [Tags]      API
    &{req_body}=  Create Dictionary    username=${double_user}   password=${password}   firstname=${first_name}      lastname=${family_name}   phone=${phone}
    ${response}=     POST        ${base_url}api/users     json=${req_body}    expected_status=201
    log      ${response.json()}
    &{req_body_duplicate}=  Create Dictionary    username=${double_user}   password=${password}   firstname=${first_name}      lastname=${family_name}   phone=${phone}
    ${response_duplicate}=     POST        ${base_url}api/users     json=${req_body_duplicate}    expected_status=400
    log      ${response_duplicate.json()}
    Should be equal as Strings     FAILURE      ${response_duplicate.json()}[status]
    Should be equal as Strings     User exists      ${response_duplicate.json()}[message]
    status should be       400     ${response_duplicate}

Register user with null username
    [Tags]      API
    # ERROR!!!!!
    &{req_body}=  Create Dictionary    username=${None}   password=${password}   firstname=${first_name}      lastname=${family_name}   phone=${phone}
    ${response}=     POST        ${base_url}api/users     json=${req_body}    expected_status=500
    #log      ${response.json()}
    # ERROR!!!!!


Register user with null password
    [Tags]      API
    # ERROR!!!!!
    Set suite variables
    &{req_body}=  Create Dictionary    username=${username}   password=${None}   firstname=${first_name}      lastname=${family_name}   phone=${phone}
    ${response}=     POST        ${base_url}api/users     json=${req_body}    expected_status=500
    #log      ${response.json()}

Register user with empty username
    [Tags]      API
    # ERROR!!!!!
    &{req_body}=  Create Dictionary    username=''   password=${password}   firstname=${first_name}      lastname=${family_name}   phone=${phone}
    ${response}=     POST        ${base_url}api/users     json=${req_body}    expected_status=400
    #log      ${response.json()}
    # ERROR!!!!!


Register user with empty password
    [Tags]      API
    # ERROR!!!!!
    Set suite variables
    &{req_body}=  Create Dictionary    username=${username}   password=''   firstname=${first_name}      lastname=${family_name}   phone=${phone}
    ${response}=     POST        ${base_url}api/users     json=${req_body}    expected_status=201
    #log      ${response.json()}

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

















