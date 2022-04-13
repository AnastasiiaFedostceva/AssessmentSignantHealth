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

To run the UI tests from console, you need to change the directory. From the project folder, run:

```
cd ui_tests
```
Remember the absolute path to the folder where you stored with application - {PATH_TO_THE_ROOT_FOLDER}

To run test in Chrome, run
```
robot --variable browser_name:Chrome {PATH_TO_THE_ROOT_FOLDER}/AssessmentSignantHealth 
```
To run test in Firefox, run
```
robot --variable browser_name:Firefox {PATH_TO_THE_ROOT_FOLDER}/AssessmentSignantHealth 
```

## Assumptions and limitations ##
The following assumptions and limitations were made:
### For API tests ###
1) positive test cases will be run, tests with zero (highest) priority were described to meet the acceptance criteria. Parameterized tests (for test data) can be done with pytest.
2) not all information about error codes and corner cases is available
3) not all API methods are described in Assessment task. Test for DELETE method is present, and it checks that the error code is 405. All other methods were not covered.
4) the task may have imprecision in description:
   1) API method GET /api/users does not require TOKEN parameter. The tests (/tests/test_get_all_users.py) were designed according to this imprecision, so this parameter is not needed .
   2) some libraries in Flasky project are not described in requirements.txt, so when installing Flasky locally, you may need to downgrade versions of some libraries.
### For UI tests ###
1) positive test cases will be run, negative test cases could be done in the same way (in example, trying to register with the same username will cause an error - we can check this error)
2) parametrization is done for negative test cases for login
3) Nothing is mentioned about crossbrowser testing, so only Chrome and Firefox are supported for this task. Other browsers (Edge, Safai, Opera, etc.) can be supported in the same way (download driver, rename it to the same as browsername, put it to the /drivers folder)
4) 3 types of locators are presented - 'id', 'xpath' and 'css'

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
README.md
Отображается файл "README.md"
