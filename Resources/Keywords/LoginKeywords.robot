*** Settings ***
Library    Selenium2Library
Library    Collections
Resource   ../Variables.robot

*** Keywords ***
Verify Login Page Elements
    [Documentation]    Verifies elements on the login page.
    Verify Page Title    Synapse
    Wait Until Element Is Visible    ${LOGO_IMAGE}  30
    Verify Element Text    ${HEADER_TEXT}    Secure Login
    Page Should Contain Element   ${USERNAME_FIELD}
    Page Should Contain Element    ${PASSWORD_FIELD}
    Page Should Contain Element   ${FORGOT_PASSWORD_BUTTON}
    Page Should Contain Element    ${LOGIN_BUTTON}

Login With Valid Credentials
    [Documentation]    Logs in with valid username and password.
    Input Text    ${USERNAME_FIELD}    ${VALID_USERNAME.${env}}
    Input Password    ${PASSWORD_FIELD}    ${VALID_PASSWORD.${env}}
    sleep  1
    wait until element is visible  ${LOGIN_BUTTON}  5
    click element   ${LOGIN_BUTTON}

Verify Login Successful
    [Documentation]    Verifies that the login was successful.
    WAIT UNTIL ELEMENT IS VISIBLE    ${HOME_BUTTON}     45      Home Button not visible, Login failed
#    sleep  5
    ${element_present}=    Run Keyword And Return Status    Page Should Contain Element    ${ALLOW_BUTTON}
    RUN KEYWORD IF    ${element_present}   click element    ${ALLOW_BUTTON}
    WAIT UNTIL ELEMENT IS VISIBLE  ${DASHBOARD_HEADER}
    PAGE SHOULD CONTAIN ELEMENT  ${DASHBOARD_HEADER}

Login With Invalid Credentials
    [Documentation]    Attempts to login with invalid username and password.
    Input Text    ${USERNAME_FIELD}    ${INVALID_USERNAME}
    Input Password    ${PASSWORD_FIELD}    ${INVALID_PASSWORD}
    wait until element is visible  ${LOGIN_BUTTON}  5
    sleep  1
    click element   ${LOGIN_BUTTON}

Verify Login Failure
    [Documentation]    Verifies that the login failed.
    Page Should Contain    Invalid username or password

Verify Page Title
    [Arguments]    ${expected_title}
    ${actual_title}=    Get Title
    Should Be Equal As Strings    ${actual_title}    ${expected_title}

Verify Element Text
    [Arguments]    ${locator}    ${expected_text}
    ${actual_text}=    Get Text    ${locator}
    Should Be Equal As Strings    ${actual_text}    ${expected_text}

Verify Login Page Shown
    [Documentation]    Verifies login page is displayed
    Wait Until Element Is Visible    ${LOGIN_BUTTON}  30  Failed to shown Login button hence login page not shown

Logout Of The Application
    [Documentation]    Logs out the application and verifies login paage
    wait until element is visible  ${MY_PROFILE_MODULE}  5
    click element   ${MY_PROFILE_MODULE}
    wait until element is visible  ${LOGOUT_OPTION}  5
    click element   ${LOGOUT_OPTION}
