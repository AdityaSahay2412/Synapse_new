*** Settings ***
Library  OperatingSystem
Library  String
Library  Collections
Library  Selenium2Library
Library  DateTime
Library           random
Library  ../MyLibrary.py
#Library  ../ScreenRecorder.py
Library    Process
Library    BuiltIn
#Library    ScreenCapLibrary
#Library    ScreenCapLibrary   screenshot_module=PyGTK    # PtGTK is used for jenkins as display is virtual
Resource   ../Variables.robot
Resource   LoginKeywords.robot

*** Keywords ***
Open Browser And Navigate To Analyst Login Page
    [Arguments]    ${url}
    ${option}=     run keyword    chrome_open  ${DOWNLOAD_PATH}  headless=${HEADLESS}
    ${path}=       run keyword    get_chromedriver_path
#   ${path}  set variable  ${EXECDIR}/Resources/Driver/chromedriver
#    log to console  "====${path}"
    open browser    ${url}    ${BROWSER}  options=${option}
    run keyword if    '${HEADLESS}'=='True'  Set Dummy Geolocation
    maximize browser window
    set selenium implicit wait  5

Set Dummy Geolocation  # This keyword is used to add geolocation manually to run on headless mode as chromeoption "profile.default_content_setting_values.geolocation": 1 wont work in headless mode
    ${latitude}=    Set Variable    37.7749
    ${longitude}=    Set Variable    -122.4194
    Execute JavaScript    navigator.geolocation.getCurrentPosition = function(success){var position = {coords: {latitude: ${latitude}, longitude: ${longitude}}};success(position);}

Go To Home Page
    set selenium implicit wait  1
    press keys    None     ESC
    Start Test Case Recording
    go to     ${DASHBOARD_PAGE_URL.${env}}
    ${status}=    run keyword and return status    element should be visible   ${DASHBOARD_CLOSE_BUTTON}
    run keyword if    '${status}'=='True'       Execute JavaScript    document.evaluate("//*[@id='btn-slide-out-close']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()
    ${dstatus}=    run keyword and return status    element should be visible    ${DISCARD_BUTTON}
    run keyword if    '${dstatus}'=='True'        Execute JavaScript    document.evaluate("//button[normalize-space()='Discard']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()
    ${dstatus}=    run keyword and return status    element should be visible    ${YES_LEAVE_OPTION}
    run keyword if    '${dstatus}'=='True'        Execute JavaScript    document.evaluate("//button[text()='Yes, Leave']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()
    WAIT UNTIL ELEMENT IS VISIBLE  ${DASHBOARD_HEADER}  30  Failed to go to dashboard page after 30 secs
    set selenium implicit wait  5
    capture page screenshot

#Go To Home Page
#    set selenium implicit wait  1
#    press keys    None     ESC
#    ${status}=    run keyword and return status    element should be visible   ${DASHBOARD_CLOSE_BUTTON}
#    run keyword if    '${status}'=='True'       click element    ${DASHBOARD_CLOSE_BUTTON}
#    ${status}=    run keyword and return status    element should be visible     ${HOME_BUTTON}
#    run keyword if    '${status}'=='True'       click element    ${HOME_BUTTON}
#    ${dstatus}=    run keyword and return status    element should be visible    ${DISCARD_BUTTON}
#    run keyword if    '${dstatus}'=='True'       click element    ${DISCARD_BUTTON}
##    run keyword if    '${dstatus}'=='False'      go to     ${DASHBOARD_PAGE_URL}
#    WAIT UNTIL ELEMENT IS VISIBLE  ${DASHBOARD_HEADER}  30  Failed to go to dashboard page after 30 secs
#    set selenium implicit wait  5

Verify_Elements_In_Page                 #Can pass any list as argument or multiple variables
    [Arguments]    @{All_Locators}
    FOR  ${locators}  IN  @{All_Locators}
        log to console   Verifying "${locators}" is present or not
        run keyword and ignore error  scroll element into view  ${locators}
        run keyword and continue on failure     Wait Until Page Contains Element   ${locators}   8    ${locators} is not shown
    END

Open Browser And Login To Analyst App
     Open Browser And Navigate To Analyst Login Page  ${LOGIN_PAGE_URL.${env}}
     Login With Valid Credentials
     Verify Login Successful

Get Random Value From Dropdown
     [Arguments]  ${platform}
     sleep  5
     Wait Until Page Contains Element    ${platform}  5  Search Result not shown
     @{results}    Get Webelements    ${platform}
     ${first_six_options}=  get slice from list   ${results}  end=-5
     ${element}=  Evaluate  random.choice($first_six_options)
     ${value}  get text  ${element}
     FOR  ${v}  IN  @{results}
               ${actual} =   get text    ${v}
               log to console  Value='${actual}'
    END
     log to console  Random Selected Value='${element}'
     [Return]  ${value}

Get Cost Without Currency Code
    [Arguments]  ${Cost}
    ${numeric_part}    Replace String  ${Cost}  ,  ${EMPTY}
    ${numeric_part}  extract number   ${numeric_part}
    ${converted_number}=    Convert To Number    ${numeric_part}
    [Return]  ${converted_number}

Reload Page And Allow Location Access
    reload page
    sleep  2
    ${element_present}=    Run Keyword And Return Status    Page Should Contain Element    ${ALLOW_BUTTON}
    RUN KEYWORD IF    ${element_present}   click element    ${ALLOW_BUTTON}

Set_Date_And_Time
    [Arguments]    ${Date of Entry}
    ${month}=    Convert Date	   ${Date of Entry}    result_format=%m  date_format=%d/%m/%Y %H:%M
    ${date}=     Convert Date	   ${Date of Entry}    result_format=%d  date_format=%d/%m/%Y %H:%M
    ${year}=     Convert Date	   ${Date of Entry}    result_format=%Y  date_format=%d/%m/%Y %H:%M
    ${hour}=     Convert Date	   ${Date of Entry}    result_format=%H  date_format=%d/%m/%Y %H:%M
    ${minute}=   Convert Date	   ${Date of Entry}    result_format=%M  date_format=%d/%m/%Y %H:%M
    Log To Console   ${Date of Entry}==month= ${month}, date=${date}, year=${year},hour=${hour}, minute=${minute}
    sleep  1
    run keyword and continue on failure  Set Year  ${year}
    run keyword and continue on failure  Set Month  ${month}
    run keyword and continue on failure  Set Date  ${date}
#    run keyword and continue on failure  Set Hour  ${hour}
#    run keyword and continue on failure  Set Minute  ${minute}
    press keys    None     ENTER
    sleep  1
    capture page screenshot


Set Date
    [Arguments]  ${required_date}
    sleep  2
    FOR    ${index}    IN RANGE    10
        ${required_date}    Convert To Integer    ${required_date}
        ${locator}    Set Variable    xpath=//div[@aria-label='Day']//div[@data-val="${required_date}"]
        ${visible}    Run Keyword And Return Status    Element Should Be Visible   ${locator}
        run keyword and ignore error  Run Keyword If    '${visible}' == 'True'  Click Element    ${locator}
        sleep  0.5
        ${selected_date}    Get Text    //div[@aria-label='Day']//div[@aria-selected="true"]
        ${selected_date}    Convert To Integer    ${selected_date}
        log to console  required_date=${required_date}=${selected_date}
        Run Keyword If    ${required_date} == ${selected_date}  exit for loop
        ${date_lesser}     Evaluate    ${required_date} < ${selected_date}
        ${date_greater}    Evaluate    ${required_date} > ${selected_date}
        run keyword if   '${date_greater}' == 'True'  Click Element    xpath=//div[@aria-label='Day']//div[@data-val="${selected_date+3}"]
        run keyword if   '${date_lesser}' == 'True'  Click Element    xpath=//div[@aria-label='Day']//div[@data-val="${selected_date-3}"]
        Sleep    2
    END

Set Month
    [Arguments]  ${required_month}
    sleep  2
    ${required_month}    Convert To Integer    ${required_month}
    ${required_month}    Set Variable    ${required_month-1}
    FOR    ${index}    IN RANGE    10
        ${locator}    Set Variable    xpath=//div[@aria-label='Month']//div[@data-val="${required_month}"]
        ${visible}    Run Keyword And Return Status    Element Should Be Visible   ${locator}
        run keyword and ignore error  Run Keyword If    '${visible}' == 'True'  Click Element    ${locator}
        sleep  0.5
        ${selected_month}    get element attribute   //div[@aria-label='Month']//div[@aria-selected="true"]  data-val
        ${selected_month}    Convert To Integer    ${selected_month}
        log to console  required_month=${required_month}=${selected_month}
        Run Keyword If    ${required_month} == ${selected_month}  exit for loop
        ${date_lesser}     Evaluate    ${required_month} < ${selected_month}
        ${date_greater}    Evaluate    ${required_month} > ${selected_month}
        run keyword if   '${date_greater}' == 'True'  Click Element    xpath=//div[@aria-label='Month']//div[@data-val="${selected_month+3}"]
        run keyword if   '${date_lesser}' == 'True'  Click Element    xpath=//div[@aria-label='Month']//div[@data-val="${selected_month-3}"]
        Sleep    2
    END

Set Year
    [Arguments]  ${required_year}
    sleep  2
    FOR    ${index}    IN RANGE    10
        ${required_year}    Convert To Integer    ${required_year}
        ${locator}    Set Variable    xpath=//div[@aria-label='Year']//div[@data-val="${required_year}"]
        ${visible}    Run Keyword And Return Status    Element Should Be Visible   ${locator}
        run keyword and ignore error  Run Keyword If    '${visible}' == 'True'  Click Element    ${locator}
        sleep  0.5
        ${selected_year}    Get Text    //div[@aria-label='Year']//div[@aria-selected="true"]
        ${selected_year}    Convert To Integer    ${selected_year}
        log to console  required_year=${required_year}, selected_year=${selected_year}
        Run Keyword If    ${required_year} == ${selected_year}  exit for loop
        ${date_lesser}     Evaluate    ${required_year} < ${selected_year}
        ${date_greater}    Evaluate    ${required_year} > ${selected_year}
        run keyword if   '${date_greater}' == 'True'  Click Element    xpath=//div[@aria-label='Year']//div[@data-val="${selected_year+3}"]
        run keyword if   '${date_lesser}' == 'True'  Click Element    xpath=//div[@aria-label='Year']//div[@data-val="${selected_year-3}"]
        Sleep    2
    END

Set Hour
    [Arguments]  ${required_hr}
    sleep  2
    FOR    ${index}    IN RANGE    15
        ${required_hr}    Convert To Integer    ${required_hr}
        ${locator}    Set Variable    xpath=//div[@aria-label='Hours']//div[@data-val="${required_hr}"]
        ${visible}    Run Keyword And Return Status    Element Should Be Visible   ${locator}
        run keyword and ignore error  Run Keyword If    '${visible}' == 'True'  Click Element    ${locator}
        sleep  0.5
        ${selected_hr}    Get Text    //div[@aria-label='Hours']//div[@aria-selected="true"]
        ${selected_hr}    Convert To Integer    ${selected_hr}
        log to console  required_hour=${required_hr}, selected_hour=${selected_hr}
        Run Keyword If    ${required_hr} == ${selected_hr}  exit for loop
        ${date_lesser}     Evaluate    ${required_hr} < ${selected_hr}
        ${date_greater}    Evaluate    ${required_hr} > ${selected_hr}
        run keyword if   '${date_greater}' == 'True'  Click Element    xpath=//div[@aria-label='Hours']//div[@data-val="${selected_hr+3}"]
        run keyword if   '${date_lesser}' == 'True'  Click Element    xpath=//div[@aria-label='Hours']//div[@data-val="${selected_hr-3}"]
        Sleep    2
    END

Set Minute
    [Arguments]  ${required_min}
    sleep  2
    FOR    ${index}    IN RANGE    20
        ${required_min}    Convert To Integer    ${required_min}
        ${locator}    Set Variable    xpath=//div[@aria-label='Minutes']//div[@data-val="${required_min}"]
        ${visible}    Run Keyword And Return Status    Element Should Be Visible   ${locator}
        run keyword and ignore error  Run Keyword If    '${visible}' == 'True'  Click Element    ${locator}
        sleep  1
        ${selected_min}    Get Text    //div[@aria-label='Minutes']//div[@aria-selected="true"]
        ${selected_min}    Convert To Integer    ${selected_min}
        log to console  required_minute=${required_min}, selected_minute=${selected_min}
        Run Keyword If    ${required_min} == ${selected_min}  exit for loop
        ${date_lesser}     Evaluate    ${required_min} < ${selected_min}
        ${date_greater}    Evaluate    ${required_min} > ${selected_min}
        Wait Until Keyword Succeeds    10s    1s    Run Keyword If    '${date_greater}' == 'True'  Click Element    xpath=//div[@aria-label='Minutes']//div[@data-val="${selected_min+3}"]
        Wait Until Keyword Succeeds    10s    1s    Run Keyword If    '${date_lesser}' == 'True'  Click Element    xpath=//div[@aria-label='Minutes']//div[@data-val="${selected_min-3}"]
        Sleep    3
    END

Browse File And Upload
    sleep  1
    scroll element into view    xpath=//h3[text()=' No files uploaded ']
    ${FILE_PATH}=    set variable    ${EXECDIR}/Resources/1234.jpeg
    Choose File  ${VEHICLE_BROWSE_FILES}  ${FILE_PATH}
    scroll element into view    ${VEHICLE_UPLOAD_BUTTON}
    wait until element is visible  ${VEHICLE_FILE_NAME}  10   File name is not shown after browse file
    wait until element is visible  ${VEHICLE_FILE_CLOSE}  10   File close button is not shown after browse file
    scroll element into view    ${VEHICLE_UPLOAD_BUTTON}
    sleep  1
    click element  ${VEHICLE_UPLOAD_BUTTON}
    sleep  20
   ${wait_result}   run keyword and return status   wait until page does not contain element  ${VEHICLE_FILE_UPLOAD_PROGRESS_BAR}   60  File is still uploading after 80 seconds
    run keyword and continue on failure   wait until page does not contain element  ${VEHICLE_FILE_UPLOAD_PROGRESS_BAR}   2  File is still uploading after 80 seconds
    Run Keyword If    '${wait_result}' == 'False'    Cancel Uploading Media
    Run Keyword If    '${wait_result}' == 'True'   Verify File Upload Toast Message
    [Return]   ${wait_result}

Verify File Upload Toast Message
    run keyword and continue on failure  wait until element is visible  ${VEHICLE_FILE_UPLOAD_SUCCESS}  15  File upload success message not shown not shown
    click element  ${VEHICLE_FILE_UPLOAD_CLOSE}

Cancel Uploading Media
     Wait Until Page Contains Element    ${VEHICLE_FILE_UPLOAD_CANCEL}  5  Upload cancel button is not shown
     @{results}    Get Webelements    ${VEHICLE_FILE_UPLOAD_CANCEL}
     ${last_element}    Set Variable    ${results[-1]}    # Get the last element
     Click Element    ${last_element}
     click element  ${VEHICLE_FILE_UPLOAD_CLOSE}


Start Test Case Recording
    Run Keyword If    '${USE_PYGTK}'=='True'    run keyword and ignore error  Import Library    ScreenCapLibrary    screenshot_module=PyGTK
    ...    ELSE    run keyword and ignore error  Import Library    ScreenCapLibrary
    ${Current_Time} =    Get Current Date    result_format=%m_%d_%H_%M_%S
    ${recording_file} =    Set Variable    ${TEST NAME}_${Current_Time}
    run keyword and ignore error  start video recording   alias=None  name=${recording_file}  fps=None  size_percentage=0.8  embed=True  embed_width='800px'  monitor=0
    ${recording_file}     set test variable     ${recording_file}

Stop Test Case Recording
    Sleep    2
    run keyword and ignore error    Stop Video Recording
#    ${original_file} =    Set Variable    ${recording_file}
#    ${new_file} =    Set Variable    ${recording_file}_${test_status}
#    run keyword and ignore error  Move File    ${original_file}_1.webm    ./Test_Recordings/${new_file}.webm


