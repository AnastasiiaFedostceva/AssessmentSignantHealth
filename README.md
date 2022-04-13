# AssessmentSignantHealth #

## Project Description ##
This repository contains tests for Signant Health Assessment task.

The project consists of:
 - /tests module: files in this module describe test cases to meet the acceptance criteria
 - /utils module: files in this module describe different helpers for API methods, API requests and utils for randomizing.
 - /PageObject module: robotFramework files for Page Object pattern
 - /ui-tests: robotFramework files for UI testing

## Assumptions and limitations ##
During this task some assumptions and limitations were made:
### For API tests ###
1) positive test cases will be run, tests with zero (highest) priority were described to meet the acceptance criteria. Parameterized tests (for test data) can be done with pytest.
2) not all information about error codes and corner cases is available
3) not all API methods are described in Assessment task. Test for DELETE method is presented and it checks that error code is 405. All other methods were not checked.
4) the task may have imprecision in description:
   1) API method GET /api/users does not require TOKEN parameter. The tests (/tests/test_get_all_users.py) were designed according to this imprecision, so this parameter is not needed .
   2) some libraries in Flasky project are not described  in requirements.txt, so when installing Flasky you need to downgarde versions of some libraries.
### For UI tests ###
1) positive test cases will be run, negative test cases could be done in the same way (in example, trying to register with the same username will cause an error - we can check this error)
2) parametrization can be done for negative test cases (with csv file)
3) Nothing is mentioned about crossbrowser testing, so only Chrome and Firefox are supprted for this task. Other browsers (Edge, Safai, Opera< etc.) can be supported in the same way (download driver, rename it to the same as browsername, put it to the /drivers folder --> profit!)
4) 3 types of locators are presented - id, xpath and css
   


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

# HOW-TO run the tests #
## Prerequisites ##
To run the application you need Python 3.7 to be installed

# Build and run #

Clone demo Flasky project according to the instruction: https://github.com/SH-interview/Flasky/blob/master/README.md

```
git clone https://github.com/SH-interview/Flasky.git
```

Download this project in zip locally or pull in to your repository 

```
git clone https://github.com/AnastasiiaFedostceva/AssessmentSignantHealth.git
```

Install the required libraries by running PIP

``` 
pip install requirements.txt 
```

Run the API tests from console: from the project folder, run

```
pytest
```

Run the UI tests from console, you need to change the direcory: from the project folder, run

```
cd /ui_tests
```
To run test in Chrome, run
```
robot --variable browser_name:Chrome tests.robot
```
To run test in Firefox, run
```
robot --variable browser_name:Firefox tests.robot
```

