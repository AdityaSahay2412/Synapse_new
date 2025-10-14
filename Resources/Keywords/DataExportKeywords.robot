*** Settings ***
Library    Selenium2Library
Library    Collections
Library    DateTime
Library    OperatingSystem
Library    String

Resource   ../Variables.robot
Resource   General.robot


*** Keywords ***
Navigate To Data Module
    scroll element into view   ${DATA_MODULE}
    wait until element is visible  ${DATA_MODULE}  5  Data module is not shown
    click element   ${DATA_MODULE}

Select Saved Template
    [Arguments]  ${template}=Events
    sleep  60
    wait until page contains element   xpath=//div[contains(@id,'div-saved-report')]/div[text()='${template}']  15  Save template with name '${template}' not shown, please check the template name
    scroll element into view    //div[contains(@id,'div-saved-report')]/div[text()='${template}']
    wait until element is visible    xpath=//div[contains(@id,'div-saved-report')]/div[text()='${template}']  10  Save template with name '${template}' not shown, please check the template name
    click element    xpath=//div[contains(@id,'div-saved-report')]/div[text()='${template}']

Generate And View Report
    [Arguments]  ${template}=Events
    sleep  3
    wait until element is visible  ${GENERATE_REPORT_BUTTON}  10  Generate Report button is not visible
    click element  ${GENERATE_REPORT_BUTTON}
    run keyword and warn on failure  wait until page contains  ${DATA_ON_ITS_WAY_MESSAGE}  15  Failed to show "${DATA_ON_ITS_WAY_MESSAGE}" after clicking on Generate Report button
#    wait until page contains  ${DATA_GENERATED_MESSAGE}  60  Failed to show "${DATA_GENERATED_MESSAGE}" after waiting for 60 seconds
    ${elapsed_time}=    Set Variable    0
    FOR    ${i}    IN RANGE    0    ${GENERATE_WAIT_TIME}/${CHECK_INTERVAL}
        ${element_present}=    Run Keyword And Return Status    wait until page contains   ${DATA_GENERATED_MESSAGE}  5
        Run Keyword If    '${element_present}'=='True'    Exit For Loop
        ${elapsed_time}=    Evaluate    ${elapsed_time} + ${CHECK_INTERVAL}
    END
    Run Keyword If    '${elapsed_time}'=='${GENERATE_WAIT_TIME}'   Run Keyword And Continue On Failure   Fail    Failed to show "${DATA_GENERATED_MESSAGE}" after waiting for ${GENERATE_WAIT_TIME} seconds
    click element  ${VIEW_BUTTON_IN_MESSAGE}
    sleep  1
    wait until element is visible  //div[contains(@class,'tab active')]/div[text()='${template}']  10  Failed to view '${template}' saved template

Export CSV And Wait For File To Download
    wait until element is visible  ${EXPORT_CSV_BUTTON}  10  Export CSV button is not visible
    run keyword and ignore error  Create Directory  ${DOWNLOAD_PATH}
    ${initial_file_count}=    Count Files In Directory    ${DOWNLOAD_PATH}
    click element  ${EXPORT_CSV_BUTTON}
    ${elapsed_time}=    Set Variable    0
    FOR    ${i}    IN RANGE    0    ${DOWNLOAD_WAIT_TIME}/${CHECK_INTERVAL}
        ${current_file_count}=    Count Files In Directory    ${DOWNLOAD_PATH}
        Run Keyword If    ${current_file_count} > ${initial_file_count}    Log    New file detected
        Run Keyword If    ${current_file_count} > ${initial_file_count}    Return From Keyword
        Sleep    ${CHECK_INTERVAL}
        ${elapsed_time}=    Evaluate    ${elapsed_time} + ${CHECK_INTERVAL}
    END
    Fail    No new file found in directory "${DOWNLOAD_PATH}" after ${DOWNLOAD_WAIT_TIME} seconds



