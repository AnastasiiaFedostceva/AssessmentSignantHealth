# Assessment (SignantHealth) #

## Project Description ##
This repository contains tests for Signant Health Assessment task.

The project consists of:
- /tests module: files in this module describe test cases to meet the acceptance criteria
- /utils module: files in this module describe different helpers for API methods, API requests and utils for randomizing.
- /PageObject module: robotFramework files for Page Object pattern
- /ui-tests: robotFramework files for UI testing

# HOW-TO run the tests #
## Prerequisites ##

Platform limitation - current version of the tests and documentation assumes to run them under Linux.    

The following software and packages need to be installed and configured to run the tests:
- Python 3.7 or above
- PIP 22 or above
- Robot Framework 5.0 or above
- Selenium: robotframework-seleniumlibrary 6.0.0 or above
- Drivers (Chrome driver and Geckodriver) are provided in /ui_tests/drivers directory. If something wrong, you can download it from official websites:
-- Chrome driver: https://chromedriver.chromium.org/downloads (choose your OS)
-- Gecko driver: https://github.com/mozilla/geckodriver/releases
-- Rename Chrome driver as 'Chrome' and Gecko driver as 'Firefox', then store them in /ui_tests/drivers directory

## Start demo Flasky project server

Clone demo Flasky repository:

```
git clone https://github.com/SH-interview/Flasky.git
```

After that, configure and run it on local machine according to the project's documentation
https://github.com/SH-interview/Flasky/blob/master/README.md. 

If you run it locally without Docker, you can see the following error when try to initialize the db:

```
 flask init-db
Traceback (most recent call last):
  File "/home/user/.local/bin/flask", line 5, in <module>
...
    from itsdangerous import json as _json
ImportError: cannot import name 'json' from 'itsdangerous'
```

It can be caused by version conflict in libraries used. This error can be resolved by downgrading the version of one 
of them:

```
pip install itsdangerous==2.0.1
```

After successfull installation and start, the demo server should be available by address http://127.0.0.1:8080. 

## Prepare and run the tests

Run the following commands to clone the repository and install required dependencies.

Clone the repository into a separate folder:

```
git clone https://github.com/AnastasiiaFedostceva/AssessmentSignantHealth.git
```
Install required dependencies:

```
cd AssessmentSignantHealth/
pip install -r requirements.txt
```

Run the API tests from console: from the project folder, run

```
pytest
```

Test execution progress and results will be shown on console. 


To run test in Chrome, run
```
sh robot_chrome.sh 
```
To run test in Firefox, run
```
sh robot_firefox.sh 
```

## Test results ##
Test Results could be found:
- for API tests: /AssessmentSignantHealth/report.html
- for UI tests: /AssessmentSignantHealth/ui_tests/report.html
- for UI tests (log): /AssessmentSignantHealth/ui_tests/log.html

## Assumptions and limitations ##
The following assumptions and limitations were made:
Common: not all possible test cases are presented in this project. Only positive test cases are presented to meet the acceptance criteria. Some negative test cases are also presented to show the experience.
### For API tests ###
1) Positive test cases will be run first to meet the acceptance criteria.
2) Tests do not take into account internal design and implementation details like, for example, db column type and limits, UI components format and type, etc, and, therefore, many edge cases may not be covered by the tests.
3) Only HTTP methods, mentioned in demo task, are covered. Just as an example, non described DELETE method added to check that the HTTP error code in this case is 405. All other methods are omitted.
4) Actual implementation of the API method GET /api/users does not require TOKEN parameter. The tests (/tests/test_get_all_users.py) were designed according to this imprecision, so this parameter is not needed.
5) Some libraries, referenced in the Flasky project are not mentioned in requirements.txt, so when installing Flasky locally, you may need to downgrade versions of some libraries. This also mentions in corresponded section.
### For UI tests ###
1) Only positive tests are implemented. Any kind of negative cases might be done by the same manner, for example, trying to register with the same username will cause an error - we can check this error.
2) Parametrization implemented only for negative test cases for the 'Login' action
3) Cross-browser testing aspects are not fully covered. That is, only a limited set of browsers is supported (actually, Chrome and Firefox without strict version requirements for both). Any other browsers (Edge, Safai, Opera, etc.) can be supported in the same way (download driver, rename it to the same as browsername, put it to the /drivers folder)
4) 3 type of locators are implemented -  'id', 'xpath' and 'css'
## Test Cases ##
Checklist for API tests. Basic assertions are presented in the table. Specific assertions are also made in tests

| Function                     | Test Case                                                                                   | Priority |
|------------------------------|---------------------------------------------------------------------------------------------|----------|
| POST /api/user               | Register new user, check error code = 201                                                   | 0        |
| POST /api/user               | Register new user with duplicate username, check error code = 400                           | 1        |
| GET /api/users               | Get the list of users, check error code = 200                                               | 0        |
| GET /api/users               | Register new user and check that he appears in the ist of all users, check error code = 200 | 0        |
| GET /api/auth/token          | Get token for valid user, check error code = 200                                            | 0        |
| GET /api/auth/token          | Get token for invalid user (wrong credentials), check error code = 400                      | 0        |
| GET /api/users/{username}    | Get user info for valid user, check error code = 200                                        | 0        |
| GET /api/users/{username}    | Get user info for invalid user (without token), check error code = 401                      | 0        |
| POST /api/users/{username}   | Update user's profile with 1 field, check error code = 200                                  | 0        |
| POST /api/users/{username}   | Update user's profile with 2 fields, check error code = 200                                 | 0        |
| POST /api/users/{username}   | Update user's profile with 3 fields, check error code = 200                                 | 0        |
| POST /api/users/{username}   | Update user's profile with 'username', check error code = 403 (username cannot be updated)  | 0        |
| POST /api/users/{username}   | Update user's profile without sending TOKEN (without authorization), check error code = 401 | 0        |
| DELETE /api/users/{username} | Check additional method that is not described, 405 error code                               | 1        |

## Technical details ##
This project contains 'requests' library, so we don't need to send header 'Content-Type': 'application/json'.
This project uses pytest to run the tests in structure.
File config.py contains variable that describes the URL to test environment.
### Logging and reporting ###
Report is provided as html-file (by pytest-html). If you want to get run report, execute command
```
py.test --html=report.html -s --capture=tee-sys
```

