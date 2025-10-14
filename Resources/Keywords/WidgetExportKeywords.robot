*** Settings ***
Documentation    this is a demo testing file
Library    Selenium2Library
Resource    ../WidgetExportVariables.robot
#Resource    ../Variables.robot
Resource    General.robot


*** Keywords ***
Open the synapse analyst url
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    ${LOCATOR_EMAIL}    ${EMAIL_LOGIN}
    Input Password  ${LOCATOR_PASSWORD}    ${PASSWORD}
    Sleep    1
    Wait Until Element Is Visible     ${LOCATOR_LOGIN_BUTTON}
    Click Element    ${LOCATOR_LOGIN_BUTTON}
    Wait Until Element Is Visible    ${LOCATOR_APP_LOGO}    45
    ${element_present}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${LOCATOR_ALLOW_LOCATION_BUTTON}    10
    Run Keyword If    ${element_present}    Click Element    ${LOCATOR_ALLOW_LOCATION_BUTTON}
    Wait Until Element Is Visible    ${LOCATOR_DASHBOARDS_HEADER}    15
    Page Should Contain Element    ${LOCATOR_DASHBOARDS_HEADER}



Navigate To Event Module
     Wait Until Element Is Visible    ${LOCATOR_EVENTS_NAVBAR}    10
     Click Element    ${LOCATOR_EVENTS_NAVBAR}

Go To All Records Page
    Wait Until Element Is Visible    ${LOCATOR_ALL_RECORDS}    10
    Click Element      ${LOCATOR_ALL_RECORDS}

Event widget Export
    Wait Until Element Is Visible    ${LOCATOR_EXPORT_CSV_BUTTON}   20
    Sleep    3
    Click Element    ${LOCATOR_EXPORT_CSV_BUTTON}
    Wait Until Page Contains    ${LOCATOR_EXPORT_NOTIFICATION}     20
    Wait Until Page Contains    ${LOCATOR_EXPORT_COMPLETE}     20
    Click Element    ${LOCATOR_VIEW_BUTTON}
    Wait Until Element Is Visible    ${LOCATOR_SAVED_REPORT}    10
    Wait Until Element Is Visible    ${LOCATOR_EXPORT_CSV_BUTTON}
    Click Element    ${LOCATOR_EXPORT_CSV_BUTTON}
    Sleep    3


Navigate To Tasks Module
    Wait Until Element Is Visible    ${LOCATOR_TASKS_NAVBAR}
    Click Element    ${LOCATOR_TASKS_NAVBAR}


Go To Tasks Page Under Tasks Module
    Wait Until Element Is Visible      ${LOCATOR_TASKS_PAGE_TITLE}
    Click Element      ${LOCATOR_TASKS_PAGE_TITLE}


Task Widget Export
    Wait Until Element Is Visible   ${LOCATOR_EXPORT_CSV_BUTTON}    15
    Sleep    3
    Click Element    ${LOCATOR_EXPORT_CSV_BUTTON}
#    ${Current_Time}=    Get Current Date    result_format= %d/%m/%Y %H:%M
#    log to console   date and time of task export:${Current_Time}
    Wait Until Page Contains    ${LOCATOR_EXPORT_NOTIFICATION}    15
    Wait Until Page Contains    ${LOCATOR_EXPORT_COMPLETE}   20
    Click Element    ${LOCATOR_VIEW_BUTTON}
    Wait Until Element Is Visible    ${LOCATOR_SAVED_REPORT}    10
    Wait Until Element Is Visible    ${LOCATOR_EXPORT_CSV_BUTTON}    10
#    ${Task_exported_time}=    Get Current Date    result_format=Note added on %d/%m/%Y at %H:%M
#    Log To Console    date and time on task export page:${Task_exported_time}
    Click Element    ${LOCATOR_EXPORT_CSV_BUTTON}
    Sleep    3
#    [Return]  ${Current_Time}    ${Task_exported_time}


#Verify Total Row Count for Task Widget Export
#    ${task_row_count}    Get Text     ${LOCATOR_TOTAL_ROW_COUNT}
#    Should Be Equal As Numbers    ${task_row_count}    ${HARDCODED_TASK_ROW_COUNT}
#    Log To Console    ${task_row_count}


Go To Notifications module
    Scroll Element Into View    ${LOCATOR_NOTIFICATIONS_NAVBAR}
    Wait Until Element Is Visible    ${LOCATOR_NOTIFICATIONS_NAVBAR}
    Click Element    ${LOCATOR_NOTIFICATIONS_NAVBAR}

Notifications Widget Export
    Wait Until Element Is Visible    ${LOCATOR_EXPORT_CSV_BUTTON}      15
    Sleep    3
    Click Element    ${LOCATOR_EXPORT_CSV_BUTTON}
    Wait Until Page Contains    ${LOCATOR_EXPORT_NOTIFICATION}   15
    Wait Until Page Contains    ${LOCATOR_EXPORT_COMPLETE}   25
    Click Element    ${LOCATOR_VIEW_BUTTON}
    Wait Until Element Is Visible    ${LOCATOR_SAVED_REPORT}    10
    Wait Until Element Is Visible    ${LOCATOR_EXPORT_CSV_BUTTON}
    Click Element    ${LOCATOR_EXPORT_CSV_BUTTON}
    Sleep    2

#Suspect Widget Export
Go To Dashboard
    Wait Until Element Is Visible    ${LOCATOR_DASHBOARDS_NAVBAR}
    Click Element    ${LOCATOR_DASHBOARDS_NAVBAR}


Navigate to Suspect List Widget
    Wait Until Element Is Visible    ${LOCATOR_DASHBOARD_TITLE}
    Click Element     ${LOCATOR_DASHBOARD_TITLE}
    Sleep    5
    Wait Until Element Is Visible    ${TESTING_SUSPECT_LIST_WIDGET}
    Click Element    ${LOCATOR_TOGGLE_LIST_WIDGET_GRID_BUTTON}
    Sleep    3

Dashboard Suspect Export
    Click Element    ${LOCATOR_EXPORT_CSV_BUTTON}
    Wait Until Page Contains    ${LOCATOR_EXPORT_NOTIFICATION}   15
    Wait Until Page Contains    ${LOCATOR_EXPORT_COMPLETE}   20
    Click Element    ${LOCATOR_VIEW_BUTTON}
    Wait Until Element Is Visible    ${LOCATOR_SAVED_REPORT}    5
    Wait Until Element Is Visible    ${LOCATOR_EXPORT_CSV_BUTTON}
    Click Element    ${LOCATOR_EXPORT_CSV_BUTTON}
    Sleep    3


#Witness
Navigate To Dashboard
    Go To Dashboard
    Wait Until Element Is Visible     ${LOCATOR_DASHBOARD_TITLE}
    Click Element      ${LOCATOR_DASHBOARD_TITLE}
    Sleep    5

Navigate to Witness List Widget
    Wait Until Element Is Visible    ${TESTING_WITNESS_LIST_WIDGET}
    Click Element    ${LOCATOR_TOGGLE_LIST_WIDGET_GRID_BUTTON}
    Sleep    3

Dashboard Witness Export
    Click Element    ${LOCATOR_EXPORT_CSV_WIDGET_BUTTON_WITNESS}
    Wait Until Page Contains    ${LOCATOR_EXPORT_NOTIFICATION}   15
    Wait Until Page Contains    ${LOCATOR_EXPORT_COMPLETE}   20
    Click Element    ${LOCATOR_VIEW_BUTTON}
    Wait Until Element Is Visible      ${LOCATOR_SAVED_REPORT}    5
    Wait Until Element Is Visible     ${LOCATOR_EXPORT_CSV_BUTTON}
    Click Element     ${LOCATOR_EXPORT_CSV_BUTTON}
    Sleep    3
    
#Verify Total Row Count for Witness Widget Export
#    ${witness_count}    Get Text    ${LOCATOR_TOTAL_ROW_COUNT}
#    Should Be Equal As Numbers    ${HARDCODED_ROW_COUNT_WITNESS_EXPORT}    ${witness_count}
#    Log To Console    ${witness_count}
#


Navigating to Dashboard
    Go To Dashboard

Go to Dashboard Page
    Wait Until Element Is Visible    ${LOCATOR_DASHBOARD_TITLE}
    Click Element    ${LOCATOR_DASHBOARD_TITLE}

Dashboard Victim Export
    Wait Until Element Is Visible     ${TESTING_SUSPECT_LIST_WIDGET}    15
    Scroll Element Into View    ${TESTING_VICTIM_LIST_WIDGET}
    Wait Until Element Is Visible    ${TESTING_VICTIM_LIST_WIDGET}
    Click Element    ${LOCATOR_TOGGLE_LIST_WIDGET_GRID_BUTTON}
    Sleep    3
    Click Element    ${LOCATOR_EXPORT_CSV_WIDGET_BUTTON_VICTIM}
    Wait Until Page Contains    ${LOCATOR_EXPORT_NOTIFICATION}   15
    Wait Until Page Contains    ${LOCATOR_EXPORT_COMPLETE}   20
    Click Element    ${LOCATOR_VIEW_BUTTON}
    Wait Until Element Is Visible      ${LOCATOR_SAVED_REPORT}    5
    Wait Until Element Is Visible     ${LOCATOR_EXPORT_CSV_BUTTON}
    Click Element     ${LOCATOR_EXPORT_CSV_BUTTON}
    Sleep    3


Remove Timeframe applied filter
    Navigate To Event Module
    Go To All Records Page
    Wait Until Element Is Visible   ${SELECT_TIMEFRAME_FILTER_BUTTON}    10    timeframe filter button was not visible
    Click Element    ${SELECT_TIMEFRAME_FILTER_BUTTON}
    Click Element    ${LAST_MONTH_TIMEFRAME_FILTER}
    Click Element    ${TIMEFRAME_FILTER_APPLY_BUTTON}
    Wait Until Element Is Visible    ${NEWLY_ADDED_INCIDENT_REFERENCE_ON_NOTIFICATIONS_WIDGET}    10    the newly added incident was not visible





Select Time Frame Filter And Perform Event Widget Export
    Navigate To Event Module
    Go To All Records Page
    Wait Until Element Is Visible   ${SELECT_TIMEFRAME_FILTER_BUTTON}    10    timeframe filter button was not visible
    Click Element    ${SELECT_TIMEFRAME_FILTER_BUTTON}
    Click Element    ${LAST_MONTH_TIMEFRAME_FILTER}
    Click Element    ${TIMEFRAME_FILTER_APPLY_BUTTON}
    Wait Until Element Is Visible    ${NEWLY_ADDED_INCIDENT_REFERENCE_ON_NOTIFICATIONS_WIDGET}    10    the newly added incident was not visible
    ${incident_list_widget_row_count}    Get Text    ${ROW_COUNT}
    Event Widget Export
    ${extracted_event_export_row_count}    Get Text    ${EXPORTED_TASK_ROW_COUNT}
    Should Be Equal    ${incident_list_widget_row_count}    ${extracted_event_export_row_count}
    Remove Timeframe Applied Filter






Go to Widget Export Page
     Navigate To Event Module
     Go To All Records Page
     Wait Until Element Is Visible    ${LOCATOR_EXPORT_CSV_BUTTON}   20
     Sleep    3
     Click Element    ${LOCATOR_EXPORT_CSV_BUTTON}
     Wait Until Page Contains    ${LOCATOR_EXPORT_NOTIFICATION}     20
     Wait Until Page Contains    ${LOCATOR_EXPORT_COMPLETE}     20
     Click Element    ${LOCATOR_VIEW_BUTTON}
     Wait Until Element Is Visible    ${LOCATOR_SAVED_REPORT}    15
     

verify the naming convention of the file while exporting the event widget
    Go To Widget Export Page
    Wait Until Element Is Visible     ${incident_widget_export_naming_convention}    10
    ${extracted_incident_widget_export_naming_convention}    Get Text    ${incident_widget_export_naming_convention}
    Log To Console    ${extracted_incident_widget_export_naming_convention}

Verify the data source dropdown in the incident export page
    Go To Widget Export Page
    Wait Until Element Is Visible    ${DATA_SOURCE_INCIDENT_EXPORT_PAGE}    5
    Capture Page Screenshot

Verify breadcrumb in the export page
    Go To Widget Export Page
    Wait Until Element Is Visible    ${EXPORT_PAGE_BREADCRUMB}    10
    ${breadcrumb_text}    Get Text    ${EXPORT_PAGE_BREADCRUMB}
    Log To Console    ${breadcrumb_text}

Verify the Column headers in incident export page
    Go To Widget Export Page
    Wait Until Element Is Visible   ${INCIDENT_EXPORT_DATE_COLUMN_HEADER}    10
    ${extracted_date_column}    Get Text    ${INCIDENT_EXPORT_DATE_COLUMN_HEADER}
    Log To Console    ${extracted_date_column}

    Wait Until Element Is Visible   ${INCIDENT_EXPORT_REFERENCE_COLUMN_HEADER}    10
    ${extracted_reference_column}    Get Text    ${INCIDENT_EXPORT_REFERENCE_COLUMN_HEADER}
    Log To Console    ${extracted_reference_column}

    Wait Until Element Is Visible    ${INCIDENT_EXPORT_CATEGORY_COLUMN_HEADER}    10
    ${extracted_category_column}    Get Text    ${INCIDENT_EXPORT_CATEGORY_COLUMN_HEADER}
    Log To Console    ${extracted_category_column}

    Wait Until Element Is Visible    ${INCIDENT_EXPORT_OUTCOME_COLUMN_HEADER}    10
    ${extracted_outcome_column}        Get Text    ${INCIDENT_EXPORT_OUTCOME_COLUMN_HEADER}
    Log To Console    ${extracted_outcome_column}

    Wait Until Element Is Visible    ${INCIDENT_EXPORT_TYPE_COLUMN_HEADER}    10
    ${extracted_type_column}    Get Text    ${INCIDENT_EXPORT_TYPE_COLUMN_HEADER}
    Log To Console    ${extracted_type_column}

    Scroll Element Into View    ${INCIDENT_EXPORT_PRIORITY_COLUMN_HEADER}
    Wait Until Element Is Visible    ${INCIDENT_EXPORT_PRIORITY_COLUMN_HEADER}    10
    ${extracted_priority_column}    Get Text    ${INCIDENT_EXPORT_PRIORITY_COLUMN_HEADER}
    Log To Console    ${extracted_priority_column}

    Click Element    ${DATE_COLUMN_SELECTION_BUTTON}
    Click Element    ${REFERENCE_COLUMN_SELECTION_BUTTON}
    Scroll Element Into View    ${INCIDENT_EXPORT_STATUS_COLUMN_HEADER}
    Wait Until Element Is Visible    ${INCIDENT_EXPORT_STATUS_COLUMN_HEADER}    10
    ${extracted_status_column}    Get Text    ${INCIDENT_EXPORT_STATUS_COLUMN_HEADER}
    Log To Console    ${extracted_status_column}

    Scroll Element Into View    ${INCIDENT_EXPORT_SCORE_COLUMN_HEADER}
    Wait Until Element Is Visible    ${INCIDENT_EXPORT_SCORE_COLUMN_HEADER}     15
    ${extracted_score_column}    Get Text    ${INCIDENT_EXPORT_SCORE_COLUMN_HEADER}
    Log To Console    ${extracted_score_column}

    Scroll Element Into View    ${INCIDENT_EXPORT_VENUE_COLUMN_HEADER}
    Wait Until Element Is Visible    ${INCIDENT_EXPORT_VENUE_COLUMN_HEADER}    15
    ${extracted_venue_column}    Get Text    ${INCIDENT_EXPORT_VENUE_COLUMN_HEADER}
    Log To Console    ${extracted_venue_column}

    Click Element    ${CATEGORY_COLUMN_SELECTION_BUTTON}
    Click Element    ${OUTCOME_COLUMN_SELECTION_BUTTON}
    Scroll Element Into View    ${INCIDENT_EXPORT_REPORTED_BY_COLUMN_HEADER}
    Wait Until Element Is Visible    ${INCIDENT_EXPORT_REPORTED_BY_COLUMN_HEADER}
    ${extracted_reported_by_column}    Get Text    ${INCIDENT_EXPORT_REPORTED_BY_COLUMN_HEADER}
    Log To Console    ${extracted_reported_by_column}

    Click Element    ${TYPE_COLUMN_SELECTION_BUTTON}
    Click Element    ${PRIORITY_COLUMN_SELECTION_BUTTON}
    Scroll Element Into View    ${INCIDENT_EXPORT_ASSIGNED_TO_COLUMN_HEADER}
    Wait Until Element Is Visible    ${INCIDENT_EXPORT_ASSIGNED_TO_COLUMN_HEADER}
    ${extracted_assigned_to_column}    Get Text    ${INCIDENT_EXPORT_ASSIGNED_TO_COLUMN_HEADER}
    Log To Console    ${extracted_assigned_to_column}

    Scroll Element Into View    ${INCIDENT_EXPORT_SEVERITY_COLUMN_HEADER}
    Wait Until Element Is Visible    ${INCIDENT_EXPORT_SEVERITY_COLUMN_HEADER}
    ${extracted_severity_column}    Get Text    ${INCIDENT_EXPORT_SEVERITY_COLUMN_HEADER}
    Log To Console    ${extracted_severity_column}

Verify deleting the incident saved report and then again performing export and verify the file name
    Navigate To Event Module
    Go To All Records Page
    Event Widget Export
    Wait Until Element Is Visible    ${incident_widget_export_naming_convention}   5    incident export csv file name is not visible
    ${exported_incident_csv_file_before_deletion}    Get Text    ${incident_widget_export_naming_convention}
    Click Element    ${THREE_DOTS_ON_EXPORT_PAGE}
    Click Element    ${DELETE_REPORT_BUTTON}
    Wait Until Element Is Visible    ${DELETE_DIALOG_BOX}    10    dialog box is not visible
    Click Element    ${DIALOG_BOX_DELETE_BUTTON}
    Wait Until Page Contains    Deleted    5    Deleted toast message is not visible
    Sleep    2
    Navigate To Event Module
    Go To All Records Page
    Event Widget Export
    Wait Until Element Is Visible    ${incident_widget_export_naming_convention}   5    the naming convention is not visible
    ${exported_incident_csv_file_after_deletion}    Get Text    ${incident_widget_export_naming_convention}
    Should Be Equal    ${exported_incident_csv_file_before_deletion}    ${exported_incident_csv_file_after_deletion}    the file name validation has failed


Verify the date and time at the time of event export
    [Documentation]    Verify the date and time while exporting the event widget
    Navigate To Event Module
    Go To All Records Page
    Wait Until Element Is Visible   ${LOCATOR_EXPORT_CSV_BUTTON}    15    export csv button is not visible     
    Sleep    3
    ${Event_exported_time_from_list_widget}    Get Current Date    result_format=%d/%m/%Y %H:%M
    log to console   Widget exported DateTime: ${Event_exported_time_from_list_widget}
    Click Element    ${LOCATOR_EXPORT_CSV_BUTTON}
    Wait Until Page Contains    ${LOCATOR_EXPORT_NOTIFICATION}    15    export toast message is not visible
    Wait Until Page Contains    ${LOCATOR_EXPORT_COMPLETE}   20    export completed toast message is not visible
    Click Element    ${LOCATOR_VIEW_BUTTON}
    Wait Until Element Is Visible    ${LOCATOR_SAVED_REPORT}    5    saved report section is not visible  
    Wait Until Element Is Visible    ${LOCATOR_EXPORT_CSV_BUTTON}    5     export csv button is not visible  
    Wait Until Element Is Visible    ${task_export_date_and_time}    5    date and time is not visible on export page
    ${date_and_time_in_event_export_page}    Get Text    ${task_export_date_and_time}
    Should Be Equal    ${Event_exported_time_from_list_widget}     ${date_and_time_in_event_export_page}    Date of export is not correct in export module


Perform widget export after performing column selection and validate the column headers
    Navigate To Event Module
    Go To All Records Page
    Wait Until Element Is Visible    ${COLUMN_SELECTION_BUTTON}    10
    Click Element    ${COLUMN_SELECTION_BUTTON}
    Click Element    ${DATE_COLUMN_SELECTION_BUTTON}
    Click Element   ${REFERENCE_COLUMN_SELECTION_BUTTON}
    Click Element    ${LOCATOR_EXPORT_CSV_BUTTON}
    Wait Until Page Contains    ${LOCATOR_EXPORT_NOTIFICATION}     20
    Wait Until Page Contains    ${LOCATOR_EXPORT_COMPLETE}     20
    Click Element    ${LOCATOR_VIEW_BUTTON}
    Page Should Not Contain Element       ${INCIDENT_EXPORT_DATE_COLUMN_HEADER}    10    date column is visible which is incorrect
    Page Should Not Contain Element       ${INCIDENT_EXPORT_REFERENCE_COLUMN_HEADER}    10    reference column is visible which is not correct


Apply a task query filter and perform Export
    [Documentation]    Apply query builder and perform task widget export
    Navigate To Tasks Module
    Go To Tasks Page Under Tasks Module
    Wait Until Element Is Visible    ${TASKS_PAGE_Task_WIDGET}   10    widget named as tasks was not visible 
    Sleep    3
    Wait Until Element Is Visible    ${Add query}    5    add query button was not visible
    Click Element    ${Add query}
    Wait Until Element Is Visible    ${SELECT_SAVED_FILTER}    10    select saved filter was not visible 
    Click Element    ${SELECT_SAVED_FILTER}
    Click Element    ${SEARCH_SELECT_SAVED_FILTER}
    Input Text    ${SEARCH_SELECT_SAVED_FILTER}    sai
    Sleep    2
    Click Element    ${SAVED_FILTER_SELECTED_OPTION}
    Sleep     1
    Wait Until Element Is Visible    ${SAVE_AND_RUN_BUTTON}    10    save and run button was not visible
    Click Element   ${SAVE_AND_RUN_BUTTON}
    Wait Until Element Is Visible    ${OVERWRITE_BUTTON}     10    overwrite button is not visible
    Click Element     ${OVERWRITE_BUTTON}
    Wait Until Element Is Visible   ${APPLIED_QUERY_CHIP}    5    applied query chip was not visible
    Scroll Element Into View    ${TASK_WIDGET_ROW_COUNT}
    Wait Until Element Is Visible    ${TASK_WIDGET_ROW_COUNT}    10    task widget row count was not visible
    Sleep    5
    ${query_applied_task_row_count}    Get Text     ${TASK_WIDGET_ROW_COUNT}
    Task Widget Export
    ${query_applied_task_export_row_count}    Get Text    ${EXPORTED_TASK_ROW_COUNT}
    Should Be Equal As Numbers    ${query_applied_task_row_count}    ${query_applied_task_export_row_count}



Select overdue Query chip and perform task export
    [Documentation]    Apply overdue filter and perform task widget export
    Navigate To Tasks Module
    Go To Tasks Page Under Tasks Module
    Wait Until Element Is Visible    ${OVERDUE_QUERY_CHIP}    5    overdue query chip is not visible
    Click Element    ${OVERDUE_QUERY_CHIP}
    Wait Until Element Is Visible    ${TASK_REFERENCE_WIDGET_HEADER}    10    task reference header is not visible
    Scroll Element Into View     ${OVERDUE_TASK_WIDGET_ROW_COUNT}
    Sleep    3
    Scroll Element Into View     ${OVERDUE_TASK_WIDGET_ROW_COUNT}
    Wait Until Element Is Visible     ${OVERDUE_TASK_WIDGET_ROW_COUNT}     10    overdue record count is not visible
    ${overdue_chip_applied_count}    Get Text    ${OVERDUE_TASK_WIDGET_ROW_COUNT}
    Task Widget Export
    ${overdue_chip_applied_export_count}    Get Text    ${EXPORTED_TASK_ROW_COUNT}
    Should Be Equal As Numbers    ${overdue_chip_applied_count}    ${overdue_chip_applied_export_count}    the row count is not equal when overdue query is applied


Perform Task widget export and verify the data source in the export page
    [Documentation]    Verify the data source on the task export page
    Navigate To Tasks Module
    Go To Tasks Page Under Tasks Module
    Task Widget Export
    Wait Until Element Is Visible    ${DATA_SOURCE_TASK_EXPORT_PAGE}    5    data source is not visible after 5 seconds

Verify deleting the report in the export page and then performing new export and verifying the naming convention
    Navigate To Tasks Module
    Go To Tasks Page Under Tasks Module
    Task Widget Export
    Wait Until Element Is Visible    ${task_widget_export_naming_convention}    5    task export csv file is not visible
    ${exported_task_csv_file_before_deletion}    Get Text    ${task_widget_export_naming_convention}
    Click Element    ${THREE_DOTS_ON_EXPORT_PAGE}
    Click Element    ${DELETE_REPORT_BUTTON}
    Wait Until Element Is Visible    ${DELETE_DIALOG_BOX}    10    dialog box is not visible
    Click Element    ${DIALOG_BOX_DELETE_BUTTON}
    Wait Until Page Contains    Deleted    5    Deleted toast message is not visible
    Sleep    2
    Navigate To Tasks Module
    Go To Tasks Page Under Tasks Module
    Task Widget Export
    Wait Until Element Is Visible    ${task_widget_export_naming_convention}    5    the naming convention is not visible
    ${exported_task_csv_file_after_deletion}    Get Text    ${task_widget_export_naming_convention}
    Should Be Equal    ${exported_task_csv_file_before_deletion}    ${exported_task_csv_file_after_deletion}    the file name validation has failed
    
    

Go to notification widget export page
    Wait Until Element Is Visible    ${LOCATOR_EXPORT_CSV_BUTTON}   20    export csv button is not visible   
    Sleep    3
    Click Element    ${LOCATOR_EXPORT_CSV_BUTTON}
    Wait Until Page Contains    ${LOCATOR_EXPORT_NOTIFICATION}     20    export toast message is not visible
    Wait Until Page Contains    ${LOCATOR_EXPORT_COMPLETE}     20    export completed toast message is not visible 
    Click Element    ${LOCATOR_VIEW_BUTTON}
    Wait Until Element Is Visible    ${LOCATOR_SAVED_REPORT}    10    saved report section is not visible





Go to tasks widget export page
    Navigate To Tasks Module
    Go To Tasks Page Under Tasks Module
    Wait Until Element Is Visible    ${LOCATOR_EXPORT_CSV_BUTTON}   20    export csv button is not visible   
    Sleep    3
    Click Element    ${LOCATOR_EXPORT_CSV_BUTTON}
    Wait Until Page Contains    ${LOCATOR_EXPORT_NOTIFICATION}     20    export toast message is not visible
    Wait Until Page Contains    ${LOCATOR_EXPORT_COMPLETE}     20    export completed toast message is not visible 
    Click Element    ${LOCATOR_VIEW_BUTTON}
    Wait Until Element Is Visible    ${LOCATOR_SAVED_REPORT}    10    saved report section is not visible
    
    

verify the naming convention of the file while exporting the task widget
    [Documentation]    Verify the file name under saved reports while exporting the task widget
    Navigate To Tasks Module
    Go To Tasks Page Under Tasks Module
    Go To Tasks Widget Export Page
    Wait Until Element Is Visible    ${task_widget_export_naming_convention}    10    the naming convention is not visible   
    ${extracted_task_widget_export_naming_convention}    Get Text     ${task_widget_export_naming_convention}
    Log To Console    ${extracted_task_widget_export_naming_convention}
    
    
Verify date and time of the task export
    [Documentation]    Verify the date and time while exporting the task widget
    Navigate To Tasks Module
    Go To Tasks Page Under Tasks Module
    Wait Until Element Is Visible   ${LOCATOR_EXPORT_CSV_BUTTON}    15    export csv button is not visible     
    Sleep    3
    ${Exported_Time}=    Get Current Date    result_format=%d/%m/%Y %H:%M
    log to console   Widget exported DateTime: ${Exported_Time}
    Click Element    ${LOCATOR_EXPORT_CSV_BUTTON}
    Wait Until Page Contains    ${LOCATOR_EXPORT_NOTIFICATION}    15
    Wait Until Page Contains    ${LOCATOR_EXPORT_COMPLETE}   20
    Click Element    ${LOCATOR_VIEW_BUTTON}
    Wait Until Element Is Visible    ${LOCATOR_SAVED_REPORT}    5    saved report section is not visible  
    Wait Until Element Is Visible    ${LOCATOR_EXPORT_CSV_BUTTON}    5     export csv button is not visible  
    Wait Until Element Is Visible    ${task_export_date_and_time}    5    date and time is not visible on export page
    ${date_and_time_in_Export_Module}    Get Text    ${task_export_date_and_time}
    Log To Console    ${date_and_time_in_Export_Module}
    should be equal  ${Exported_Time}  ${date_and_time_in_Export_Module}  Date of export is not correct in export module
#    Navigate To Tasks Module
#    Go To Tasks Page Under Tasks Module
#    Go To Tasks Widget Export Page
#    Wait Until Element Is Visible    ${task_export_date_and_time}    5
#    ${extracted_task_export_date_and_time}    Get Text    ${task_export_date_and_time}
#    Log To Console    ${extracted_task_export_date_and_time}

Add a new task and perform task widget export
    [Documentation]    Adding a new task and post it performing task export
    [Arguments]  ${add_attachment}=no
    Navigate To Tasks Module
    Go To Tasks Page Under Tasks Module
    wait until element is visible  ${ADD_NEW_TASK}   10   Add new task button (+) is not shown
    sleep  1
    click element  ${ADD_NEW_TASK}
    wait until element is visible  ${ASSIGN_TASK_SLIDEOUT}   10  Assign task slideout is not shown
    wait until element is visible  ${TASK_TITLE_HEADER}   10  Task title header is not shown
    wait until element is visible  ${TASK_TITLE_TEXTBOX}   10  Task title text field is not shown
    input text   ${TASK_TITLE_TEXTBOX}    AdityaAutomatedTask
    wait until element is visible   ${TASK_TYPE_HEADER}  10  Task type header is not shown
    wait until element is visible   ${TASK_TYPE_DROPDOWN}  10  Task type drop down is not shown
    click element  ${TASK_TYPE_DROPDOWN}
    ${dropdown_options}  CREATE LIST  Audit / Review   Incident Response  Operational Task  Dispatch
    ${task_type_selected}=  Evaluate  random.choice($dropdown_options)
    log to console  ${task_type_selected}
    wait until element is visible  //div[@role='option' and contains(text(),'${task_type_selected}')]   10  Task type '${task_type_selected}' is not shown
    click element   //div[@role='option' and contains(text(),'${task_type_selected}')]
    wait until page contains element  ${TASK_ASSIGNED_TO_LABEL}  10  Assigned To label is not shown
    click element  ${TASK_ASSIGNED_TO_FIELD}
    wait until element is visible  ${TASK_ASSIGNED_TO_SEARCH_BOX}  5  Search box is not shown
    input text  ${TASK_ASSIGNED_TO_SEARCH_BOX}    Aditya
    wait until element is visible  ${TASK_ASSIGNED_TO_SEARCHED_RESULT}  10
    click element  ${TASK_ASSIGNED_TO_SEARCHED_RESULT}
    wait until page contains element  ${TASK_DUE_DATE_TIME_LABEL}  5
    click element  ${TASK_DUE_DATE_TIME}
    SLEEP  2
    ${Tomorrow_Date} =    Get Current Date   increment=1 Day  result_format=%d/%m/%Y %H:%M
    log to console  ${Tomorrow_Date}
    Set_Date_And_Time  ${Tomorrow_Date}
    sleep  1
    ${Due_Date_Selected}   get element attribute  ${TASK_DUE_DATE_TIME}  value
    wait until page contains element  ${TASK_INSTRUCTIONS_LABEL}  10  Instructions label is not shown
    wait until page contains element  ${TASK_INSTRUCTIONS_TEXTBOX}  10   Instructions textbox is not shown
    input text  ${TASK_INSTRUCTIONS_TEXTBOX}  This is automated instruction added
    capture page screenshot
    wait until page contains element  ${TASK_SLIDEOUT_CLOSE_BUTTON}  5  Close button not shown in Add task slideout
    wait until page contains element  ${TASK_SLIDEOUT_SAVE_BUTTON}  5  Save button not shown in Add task slideout
    click element  ${TASK_SLIDEOUT_SAVE_BUTTON}
    wait until page contains  has been added successfully  15   Toast message is not shown
    Sleep    4

Verify the task reference of newly added task
    [Documentation]    Verify task reference of the newly added task on the task export page
    Click Element    ${LOCATOR_EXPORT_CSV_BUTTON}
    Wait Until Page Contains    ${LOCATOR_EXPORT_NOTIFICATION}     30
    Wait Until Page Contains    ${LOCATOR_EXPORT_COMPLETE}     30
    Click Element    ${LOCATOR_VIEW_BUTTON}
    Wait Until Element Is Visible    ${LOCATOR_SAVED_REPORT}    10
    ${extracted_task_reference}    Get Text    xpath://div[@row-id='0']
    Log To Console    ${extracted_task_reference}


Verify Task Reference column header in task export page
    Go To Tasks Widget Export Page
    Wait Until Element Is Visible    ${TASK_REFERENCE_EXPORT_PAGE_COLUMN_HEADER}    10
    ${extracted_task_reference_column_header}    Get Text    ${TASK_REFERENCE_EXPORT_PAGE_COLUMN_HEADER}
    Log To Console    ${extracted_task_reference_column_header}

Verify Task Title column header in task export page
    Wait Until Element Is Visible    ${TASK_TITLE_EXPORT_PAGE_COLUMN_HEADER}
    ${extracted_task_title_column_header}    Get Text    ${TASK_TITLE_EXPORT_PAGE_COLUMN_HEADER}
    Log To Console    ${extracted_task_title_column_header}

Verify Task Type column header in task export page
    Wait Until Element Is Visible    ${TASK_TYPE_EXPORT_PAGE_COLUMN_HEADER}
    ${extracted_task_type_column_header}    Get Text    ${TASK_TYPE_EXPORT_PAGE_COLUMN_HEADER}
    Log To Console    ${extracted_task_type_column_header}

Verify Assigned To column header in task export page
    Wait Until Element Is Visible    ${ASSIGNED_TO_EXPORT_PAGE_COLUMN_HEADER} 
    ${extracted_assigned_to_column_header}    Get Text    ${ASSIGNED_TO_EXPORT_PAGE_COLUMN_HEADER} 
    Log To Console    ${extracted_assigned_to_column_header}

Verify Created By column header in task export page
    Wait Until Element Is Visible    ${CREATED_BY_EXPORT_PAGE_COLUMN_HEADER}
    ${extracted_created_by_column_header}    Get Text    ${CREATED_BY_EXPORT_PAGE_COLUMN_HEADER}
    Log To Console    ${extracted_created_by_column_header}

Verify Created date and time column header in task export page
    Wait Until Element Is Visible    ${CREATED_DATE_AND_TIME_EXPORT_PAGE_COLUMN_HEADER}
    ${extracted_created_date_and_time_column_header}    Get Text    ${CREATED_DATE_AND_TIME_EXPORT_PAGE_COLUMN_HEADER}
    Log To Console    ${extracted_created_date_and_time_column_header}

Verify Due date and time column header in task export page
    Scroll Element Into View    ${DUE_DATE_AND_TIME_EXPORT_PAGE_COLUMN_HEADER}
    Wait Until Element Is Visible    ${DUE_DATE_AND_TIME_EXPORT_PAGE_COLUMN_HEADER}
    ${extracted_due_date_time_column_header}    Get Text    ${DUE_DATE_AND_TIME_EXPORT_PAGE_COLUMN_HEADER}
    Log To Console    ${extracted_due_date_time_column_header}
    
Verify Event Reference column header in task export page
    Click Element    ${TASK_REFERENCE_CHECKBOX}
    Click Element    ${TASK_TITLE_CHECKBOX}
    Click Element    ${TASK_TYPE_CHECKBOX} 
    Click Element    ${ASSIGNED_TO_CHECKBOX}
    Wait Until Element Is Visible    ${EVENT_REFERENCE_EXPORT_PAGE_COLUMN_HEADER}    10
    ${extracted_event_reference_column_header}    Get Text    ${EVENT_REFERENCE_EXPORT_PAGE_COLUMN_HEADER}
    Log To Console    ${extracted_event_reference_column_header}

Verify Teams column header in task export page
    Click Element    ${CREATED_BY_CHECKBOX}  
    Wait Until Element Is Visible    ${TEAMS_EXPORT_PAGE_COLUMN_HEADER}
    ${extracted_teams_column_header}    Get Text    ${TEAMS_EXPORT_PAGE_COLUMN_HEADER}
    Log To Console    ${extracted_teams_column_header}

Verify Task Status column header in task export page
    Wait Until Element Is Visible    ${TASK_STATUS_EXPORT_PAGE_COLUMN_HEADER} 
    ${extracted_task_status_column_header}    Get Text    ${TASK_STATUS_EXPORT_PAGE_COLUMN_HEADER} 
    Log To Console    ${extracted_task_status_column_header}


Perform task export after performing column selection and verify the column headers in the export page
    Navigate To Tasks Module
    Go To Tasks Page Under Tasks Module
    Wait Until Element Is Visible    ${EDIT_BUTTON_LIST_WIDGET}    10
    Wait Until Element Is Visible    ${COLUMN_TOOLBOX}    10
    Click Element     ${COLUMN_TOOLBOX}
    Click Element    ${TASK_REFERENCE_CHECKBOX}
    Click Element    ${TASK_TITLE_CHECKBOX}
    Click Element    ${TASK_TYPE_CHECKBOX}
    Click Element    ${LOCATOR_EXPORT_CSV_BUTTON}
    Wait Until Page Contains    ${LOCATOR_EXPORT_NOTIFICATION}     20
    Wait Until Page Contains    ${LOCATOR_EXPORT_COMPLETE}     20
    Click Element    ${LOCATOR_VIEW_BUTTON}
    Page Should Not Contain Element    ${TASK_REFERENCE_EXPORT_PAGE_COLUMN_HEADER}     Task Reference is visible which is not correct
    Page Should Not Contain Element    ${TASK_TITLE_EXPORT_PAGE_COLUMN_HEADER}     Task Title is visible which is not correct
    Page Should Not Contain Element    ${TASK_TYPE_EXPORT_PAGE_COLUMN_HEADER}    Task Type is visible which is not correct


Verify the Notifications module and the notifications widget
    Scroll Element Into View    ${NOTIFICATIONS_MODULE}
    Click Element    ${NOTIFICATIONS_MODULE}
    Wait Until Element Is Visible    ${NOTIFICATIONS_LIST_WIDGET}    10    notifications widget was not visible after 10 seconds

verify the notifications page title
    Verify The Notifications Module And The Notifications Widget

Receive a new notification and perform export
    Wait Until Element Is Visible    ${INCIDENT_REFERENCE_NUMBER_ON_INCIDENT_DETAIL_PAGE}    10    the incident reference number was not visible
    ${extracted_incident_reference_number}    Get Text    ${INCIDENT_REFERENCE_NUMBER_ON_INCIDENT_DETAIL_PAGE}
    Log To Console    ${extracted_incident_reference_number}
    Verify The Notifications Module And The Notifications Widget
    Wait Until Element Is Visible    ${NEWLY_ADDED_INCIDENT_REFERENCE_ON_NOTIFICATIONS_WIDGET}    15    the reference number was not visible
    ${extracted_incident_reference_number_on_notifications_widget}    Get Text    ${NEWLY_ADDED_INCIDENT_REFERENCE_ON_NOTIFICATIONS_WIDGET}
    Notifications Widget Export
    ${extracted_incident_reference_number_on_notification_export_page}    Get Text    xpath:(//zs-aggrid-cell-render-data[@class='ng-star-inserted'])[1]
    Should Be Equal    ${extracted_incident_reference_number_on_notifications_widget}    ${extracted_incident_reference_number_on_notification_export_page}    the two extracted reference numbers are not equal

Verify date and time column header in notification export page
    Verify The Notifications Module And The Notifications Widget
    Notifications Widget Export 
    Wait Until Element Is Visible    ${NOTIFICATION_EXPORT_DATE_AND_TIME_COLUMN_HEADER}   5    Date & time column is not visible
    
Verify Event reference column header in notification export page
    Wait Until Element Is Visible    ${NOTIFICATION_EXPORT_EVENT_REFERENCE_COLUMN_HEADER}  5    Event reference column is not visible

Verify subject column header in notification export page
    Wait Until Element Is Visible    ${NOTIFICATION_EXPORT_SUBJECT_COLUMN_HEADER}    5    Subject column is not visible

Verify reference column header in notification export page
    Click Element    ${NOTIFICATION_EXPORT_DATE_AND_TIME_COLUMN_CHECKBOX}
    Wait Until Element Is Visible    ${NOTIFICATION_EXPORT_REFERENCE_COLUMN_HEADER}    5    reference column is not visible

Verify Type column header in notification export page
    Click Element    ${NOTIFICATION_EXPORT_EVENT_REFERENCE_COLUMN_CHECKBOX}
    Wait Until Element Is Visible    ${NOTIFICATION_EXPORT_TYPE_COLUMN_HEADER}    5    type column is not visible
    

Verify the data source dropdown on the notification export page
    Verify The Notifications Module And The Notifications Widget
    Notifications Widget Export
    Wait Until Element Is Visible    ${DATA_SOURCE_NOTIFICATION_EXPORT_PAGE}    5    notifications data source is not visible

Verify the notification list widget data count on the export page
    Verify The Notifications Module And The Notifications Widget
    Wait Until Element Is Visible    ${NEWLY_ADDED_INCIDENT_REFERENCE_ON_NOTIFICATIONS_WIDGET}    15    the notifications data was not visible
    Scroll Element Into View    ${ROW_COUNT}    
    ${extracted_list_widget_row_count}    Get Text    ${ROW_COUNT}
    Log To Console    ${extracted_list_widget_row_count}
    Notifications Widget Export
    Wait Until Element Is Visible    ${NOTIFICATION_EXPORT_DATA_COUNT}
    ${extracted_export_data_count}    Get Text    ${NOTIFICATION_EXPORT_DATA_COUNT}
    Should Be Equal    ${extracted_list_widget_row_count}    ${extracted_export_data_count}    the data count is not equal hence validation failed
    
Perform column selection and try notifications widget export and verify the column headers
    Verify The Notifications Module And The Notifications Widget
    Wait Until Element Is Visible    ${NEWLY_ADDED_INCIDENT_REFERENCE_ON_NOTIFICATIONS_WIDGET}    15    the notifications data was not visible
    Click Element    ${COLUMN_TOOLBOX}
    Click Element    ${NOTIFICATION_LIST_WIDGET_DATE_AND_TIME_CHECKBOX}
    Click Element    ${NOTIFICATION_LIST_WIDGET_EVENT_REFERENCE_CHECKBOX}
    Click Element    ${NOTIFICATION_LIST_WIDGET_SUBJECT_CHECKBOX}
    Notifications Widget Export
    Page Should Not Contain Element    ${NOTIFICATION_EXPORT_DATE_AND_TIME_COLUMN_HEADER}    page contains date and time column which is a issue
    Page Should Not Contain Element    ${NOTIFICATION_EXPORT_EVENT_REFERENCE_COLUMN_HEADER}    page contains event reference column which is a issue
    Page Should Not Contain Element    ${NOTIFICATION_EXPORT_SUBJECT_COLUMN_HEADER}    page contains subject column which is a issue


Perform date and time column filtering and try notification widget export
    Verify The Notifications Module And The Notifications Widget
    Wait Until Element Is Visible    ${NEWLY_ADDED_INCIDENT_REFERENCE_ON_NOTIFICATIONS_WIDGET}    15    the notifications data was not visible
    Click Element    ${DATE_AND_TIME_COLUMN_FILTERING_BUTTON}
    Input Text    ${DATE_AND_TIME_SELECTION_FIRST_BOX}    ${FIRST_DATE}
    Click Element    ${DATE_AND_TIME_SELECTION_SECOND_BOX}
    Input Text    ${DATE_AND_TIME_SELECTION_SECOND_BOX}    ${SECOND_DATE}
    Click Element    ${APPLY_BUTTON}
    Wait Until Element Is Visible    ${NEWLY_ADDED_INCIDENT_REFERENCE_ON_NOTIFICATIONS_WIDGET}    15    the notifications data was not visible
    ${extracted_date_and_time_filter_widget_rowcount}    Get Text    ${date_and_time_column_filtered_row_count}
    Notifications Widget Export
    ${extracted_date_and_time_filter_export_rowcount}    Get Text    ${EXPORTED_NOTIFICATION_ROW_COUNT} 
    Should Be Equal    ${extracted_date_and_time_filter_widget_rowcount}    ${extracted_date_and_time_filter_export_rowcount}    the validation has failed
    

Extract and Log Row Data
    [Arguments]    ${item}
    ${text}    Get Text    ${item}
    Log To Console    ${text}

Verify the data before and after sorting the incident list widget
    Navigate To Event Module
    Go To All Records Page
    Wait Until Element Is Visible    ${NEWLY_ADDED_INCIDENT_REFERENCE_ON_NOTIFICATIONS_WIDGET}    15    the event list widget data was not visible
    ${items_before_sorting}    Get Webelements    xpath://zs-ag-grid-cell-render-date
    ${item_count}    Get Length    ${items_before_sorting}
    FOR    ${index}    IN RANGE    0    ${MAX_VISIBLE_ROWS}
        Run Keyword If    ${index} < ${item_count}    Extract And Log Row Data    ${items_before_sorting}[${index}]
    END
    Click Element    xpath://span[@ref='eText' and text()='Date']
    Wait Until Element Is Visible    ${NEWLY_ADDED_INCIDENT_REFERENCE_ON_NOTIFICATIONS_WIDGET}    15    the event list widget data was not visible
    ${items_after_sorting}    Get Webelements    xpath://zs-ag-grid-cell-render-date
    ${item_count}    Get Length    ${items_after_sorting}
    FOR    ${index}    IN RANGE    0    ${MAX_VISIBLE_ROWS}
        Run Keyword If    ${index} < ${item_count}    Extract And Log Row Data    ${items_after_sorting}[${index}]
    END

Verify the data before and after sorting the task list widget
    Navigate To Tasks Module
    Go To Tasks Page Under Tasks Module
    Wait Until Element Is Visible    xpath://div[@row-id='0']    10    task widget data was not loaded



Verify date and time of notification export
    Verify The Notifications Module And The Notifications Widget
    Wait Until Element Is Visible    ${LOCATOR_EXPORT_CSV_BUTTON}    15    export button is not visible
    ${Notification_Exported_Time_from_list_widget}    Get Current Date    result_format=%d/%m/%Y %H:%M
    log to console   Widget exported DateTime: ${Notification_Exported_Time_from_list_widget}
    Go To Notification Widget Export Page
    Wait Until Element Is Visible    ${notification_export_date_and_time}     5    date and time is not visible on export page
    ${notification_date_and_time_in_Export_Module}    Get Text    ${notification_export_date_and_time} 
    Log To Console     ${notification_date_and_time_in_Export_Module}
    Should Be Equal    ${Notification_Exported_Time_from_list_widget}    ${notification_date_and_time_in_Export_Module}  Date of export is not correct in export module

Verify the exported notification file naming convention
    Verify The Notifications Module And The Notifications Widget
    Go To Notification Widget Export Page
    Wait Until Element Is Visible    ${notification_widget_export_naming_convention}    10    the naming convention is not visible
    ${extracted_notification_widget_export_naming_convention}    Get Text    ${notification_widget_export_naming_convention}
    Log To Console    ${extracted_notification_widget_export_naming_convention}

Deleting the report and then performing notification export and verifying the export file naming convention
    Verify The Notifications Module And The Notifications Widget
    Go To Notification Widget Export Page
    Wait Until Element Is Visible    ${notification_widget_export_naming_convention}  5    notification export csv file is not visible
    ${exported_notification_csv_file_before_deletion}    Get Text    ${notification_widget_export_naming_convention} 
    Click Element    ${THREE_DOTS_ON_EXPORT_PAGE}
    Click Element    ${DELETE_REPORT_BUTTON}
    Wait Until Element Is Visible    ${DELETE_DIALOG_BOX}    10    dialog box is not visible
    Click Element    ${DIALOG_BOX_DELETE_BUTTON}
    Wait Until Page Contains    Deleted    5    Deleted toast message is not visible
    Sleep    2
    Verify The Notifications Module And The Notifications Widget
    Go To Notification Widget Export Page
    Wait Until Element Is Visible     ${notification_widget_export_naming_convention}   5    the naming convention is not visible
    ${exported_notification_csv_file_after_deletion}    Get Text     ${notification_widget_export_naming_convention}
    Should Be Equal       ${exported_notification_csv_file_before_deletion}      ${exported_notification_csv_file_after_deletion}    the file name validation has failed














      
    


    
    


    

    


    

    
    





    





    







































#
#Apply a event query filter and perform event widget export
#     Navigate To Event Module
#     Go To All Records Page
#     Wait Until Element Is Visible    ${OPEN_IN_PROGRESS_WIDGET}    10
#     Wait Until Element Is Visible    xpath://mat-chip[@id='add-query']
#     Click Element    xpath://mat-chip[@id='add-query']
#     Wait Until Element Is Visible    xpath://input[@placeholder='Select saved filter']    10
#     Click Element    xpath://input[@placeholder='Select saved filter']
#     Click Element    xpath://input[@placeholder='Search']
#     Input Text    xpath://input[@placeholder='Search']    aditya_filter
#     Sleep    2
#     Click Element    xpath://div[text()='aditya_filter ']
#     Sleep    2
#     Wait Until Element Is Visible    xpath://button[@id='btn-slide-out-run-save-confirm']    10
#     Click Element    xpath://button[@id='btn-slide-out-run-save-confirm']
#     Wait Until Element Is Visible    xpath://button[contains(text(),'Overwrite')]    10
#     Click Element     xpath://button[contains(text(),'Overwrite')]
#     Wait Until Element Is Visible     ${expected_query_filter_row_count_value}    15
#     ${expected_row_count}    Get Text    ${expected_query_filter_row_count_value}
#     Log To Console    ${expected_row_count}
#     Click Element    ${LOCATOR_EXPORT_CSV_BUTTON}
#     Wait Until Page Contains    ${LOCATOR_EXPORT_NOTIFICATION}    20
#     Wait Until Page Contains    ${LOCATOR_EXPORT_COMPLETE}    20
#     Click Element    ${LOCATOR_VIEW_BUTTON}
#     Wait Until Element Is Visible    ${LOCATOR_SAVED_REPORT}    15
#     ${actual_row_count}    Get Text    ${LOCATOR_TOTAL_ROW_COUNT}
#     Should Be Equal As Numbers    ${expected_row_count}    ${actual_row_count}    validation is successful

    
    
     
    

     














#Export And View Report
#    sleep  3
#    wait until element is visible  ${GENERATE_REPORT_BUTTON}  10  Generate Report button is not visible
#    click element  ${GENERATE_REPORT_BUTTON}
#    run keyword and warn on failure  wait until page contains  ${DATA_ON_ITS_WAY_MESSAGE}  15  Failed to show "${DATA_ON_ITS_WAY_MESSAGE}" after clicking on Generate Report button
##    wait until page contains  ${DATA_GENERATED_MESSAGE}  60  Failed to show "${DATA_GENERATED_MESSAGE}" after waiting for 60 seconds
#    ${elapsed_time}=    Set Variable    0
#    FOR    ${i}    IN RANGE    0    ${GENERATE_WAIT_TIME}/${CHECK_INTERVAL}
#        ${element_present}=    Run Keyword And Return Status    wait until page contains   ${DATA_GENERATED_MESSAGE}  5
#        Run Keyword If    '${element_present}'=='True'    Exit For Loop
#        ${elapsed_time}=    Evaluate    ${elapsed_time} + ${CHECK_INTERVAL}
#    END
#    Run Keyword If    '${elapsed_time}'=='${GENERATE_WAIT_TIME}'   Run Keyword And Continue On Failure   Fail    Failed to show "${DATA_GENERATED_MESSAGE}" after waiting for ${GENERATE_WAIT_TIME} seconds
#    click element  ${VIEW_BUTTON_IN_MESSAGE}
#    sleep  1
#    wait until element is visible  //div[contains(@class,'tab active')]/div[text()='${template}']  10  Failed to view '${template}' saved template
#
#

