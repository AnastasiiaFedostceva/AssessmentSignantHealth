# AssessmentSignantHealth #

## Project Description ##
This repository contains tests for Signant Health Assessment task.

The project consists of:
 - /tests module: files in this module describe test cases to meet the acceptance criteria
 - /utils module: files in this module describe different helpers for API methods, API requests and utils for randomizing.

## Assumptions and limitations ##
During this task some assumptions and limitations were made:
1) positive test cases will be run first, tests with zero (highest) priority were described to meet the acceptance criteria
2) not all information about error codes and corner cases is available
3) not all API methods are described in Assessment task. Test for DELETE method is presented and it checks that error code is 405. All other methods were not checked.
4) the task may have imprecision in description:
   1) API method GET /api/users does not require TOKEN parameter. The tests (/tests/test_get_all_users.py) were designed according to this imprecision, so this parameter is not needed .
   2) some libraries in Flasky project are not described  in requirements.txt, so when installing Flasky you need to downgarde versions of some libraries.


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

# HOW-TO run the tests #
To run the application you need Python 3.7 to be installed.
1. Start demo Flasky project by instruction: https://github.com/SH-interview/Flasky/blob/master/README.md
2. Download this project locally or pull in to your repository 
3. Install the libraries by

``` pip install requirements.txt ```


4. Run the tests from console: enter to folder with the project and type 'pytest' and print Enter

