*** Settings ***
Resource    ../Resources/Variables.robot
Resource    ../Resources/Keywords/General.robot
Resource    ../Resources/Keywords/LoginKeywords.robot


Test Setup    Run keywords  Open Browser And Navigate To Analyst Login Page  ${LOGIN_PAGE_URL.${env}}  AND  Start Test Case Recording
Test Teardown   Run Keywords    Stop Test Case Recording  AND  Close Browser

*** Test Cases ***
Valid Login Test
    [Documentation]    Test the login functionality with valid credentials.
    [Tags]  login
    Verify Login Page Elements
    Login With Valid Credentials
    Verify Login Successful

Valid Logout Test
    [Documentation]    Test the login functionality with valid credentials.
    [Tags]  login
    Login With Valid Credentials
    Verify Login Successful
    Logout Of The Application
    Verify Login Page Shown

Invalid Login Test
    [Documentation]    Test the login functionality with invalid credentials.
    [Tags]  login
    Login With Invalid Credentials
    Verify Login Failure


