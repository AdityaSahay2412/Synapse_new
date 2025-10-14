*** Settings ***
Documentation    Test suite for exporting data from various widgets on Synapse Analyst.
#Resource    ../Resources/Variables.robot
Resource    ../Resources/Keywords/General.robot
#Resource    ../Resources/Keywords/NewEventKeywords.robot
#Resource    ../Resources/Keywords/SearchKeywords.robot
#Resource    ../Resources/Keywords/TasksKeywords.robot
#Resource    ../Resources/Keywords/DashboardKeywords.robot
Resource    ../Resources/Keywords/WidgetExportKeywords.robot
Resource     ../Resources/Keywords/NewEventKeywords.robot


Suite Setup      Open The Synapse Analyst Url
Test Setup       Go To Home Page
Test Teardown    Stop Test Case Recording
Suite Teardown   Close Browser

#Resource    Resources/WidgetExportVariables.robot
#

*** Test Cases ***
#Export Data From Event Widget
#    Navigate To Event Module
#    Go To All Records Page
#    Event Widget Export
##    Verify Total Row Count for Event Widget Export
#
#Export Data From Task Widget
#    Navigate To Tasks Module
#    Go To Tasks Page Under Tasks Module
#    Task Widget Export
#    Verify Total Row Count for Task Widget Export
#
#Export Data From Notification Widget
#    Go To Notifications module
#    Notifications Widget Export
##    Verify Total Row Count for Notification Widget Export
#
#Export Data From Dashboard Suspect Widget
#    Go To Dashboard Page
#    Navigate To Suspect List Widget
#    Dashboard Suspect Export
##    Verify Total Row Count For Suspect Widget Export
#
#Export Data From Dashboard Witness Widget
#    Navigate To Dashboard
#    Navigate To Witness List Widget
#    Dashboard Witness Export
##    Verify Total Row Count For Witness Widget Export
#
#Export Data From Dashboard Victim Widget
#    Navigating To Dashboard
#    Go To Dashboard Page
#    Dashboard Victim Export
#    Verify Total Row Count for Victim Widget Export
#





#Validate UI elements in the incident export page
#    Verify The Data Source Dropdown In The Incident Export Page
#    Verify Breadcrumb In The Export Page
#    Verify The Column Headers In Incident Export Page

#
#Widget Export Post Column Selection
#      Perform Widget Export After Performing Column Selection And Validate The Column Headers

#Incident Widget Export Data Validation
#    Verify Incident Widget Export Data




















EWE_01_Verify naming convention at the event export page
    [Documentation]    Verify the file name in the incident export page
    [Tags]    EventExportFileName
    Verify The Naming Convention Of The File While Exporting The Event Widget
    Verify The Data Source Dropdown In The Incident Export Page
    Verify Breadcrumb In The Export Page

EWE_02_verify the naming convention of the incident export file before and after deletion
    [Documentation]    Validate the event export file name before and after deletion
    [Tags]    EventExportDeletedFileName
    Verify Deleting The Incident Saved Report And Then Again Performing Export And Verify The File Name

EWE_03_verify the date and time during event export from the list widget page and compare with date and time on the event export page
    [Documentation]    Verify the date and time on the list widget page and compare the date and time shown on the export page
    [Tags]    ExportDateTime
    Verify The Date And Time At The Time Of Event Export

EWE_04_Adding the Timeframe filter and performing export
    [Documentation]    Select a timeframe filter and perform export
    [Tags]    EventExport
    Select Time Frame Filter And Perform Event Widget Export

EWE_05_Verify all the column headers present on the export page
    [Documentation]    After performing event export verify the presence of all the column headers
    [Tags]    EventColumns
    Verify The Column Headers In Incident Export Page
    Perform Widget Export After Performing Column Selection And Validate The Column Headers

EWE_06_Perform sorting and verify the data is shown as expected
    [Documentation]    While accessing the list widget for the first time the data present in the list widget is sorted
    ...                and displayed in descending order,perform a sorting operation and sort the data in ascending order
    ...                and verify the data has been sorted correctly
    [Tags]    Sorting
    Verify The Data Before And After Sorting The Incident List Widget






#----new-----#
TWE_01_Adding a new task and the perform task widget export
    [Documentation]    Adding a new task and post it performing task export
    [Tags]    AddTaskAndExport
    Add A New Task And Perform Task Widget Export
    Verify The Task Reference Of Newly Added Task

TWE_02_Verify all the column headers on the task export page
    [Documentation]    Verify all the columns on the task export page
    [Tags]    ColumnHeaders
    Verify Task Reference Column Header In Task Export Page
    Verify Task Title Column Header In Task Export Page
    Verify Task Type Column Header In Task Export Page
    Verify Assigned To Column Header In Task Export Page
    Verify Created By Column Header In Task Export Page
    Verify Created Date And Time Column Header In Task Export Page
    Verify Due Date And Time Column Header In Task Export Page
    Verify Event Reference Column Header In Task Export Page
    Verify Teams Column Header In Task Export Page
    Verify Task Status Column Header In Task Export Page

TWE_03_Verify data source at the time of task widget export in the export page
    [Documentation]    Verify the data source on the task export page
    [Tags]    DataSource
    Perform Task Widget Export And Verify The Data Source In The Export Page

TWE_04_Verify the task export csv file name in the task export page
    [Documentation]    Verify the file name under saved reports while exporting the task widget
    [Tags]    TaskExportFilename
    Verify The Naming Convention Of The File While Exporting The Task Widget

TWE_05_Verify the date and time component while performing task export
    [Documentation]    Verify the date and time while exporting the task widget
    [Tags]    DateTime
    Verify Date And Time Of The Task Export

TWE_06_Task widget export post applying overdue query chip
    [Documentation]    Apply overdue filter and perform task widget export
    [Tags]    QueryApplied
    Select Overdue Query Chip And Perform Task Export


TWE_07_Verify task widget export column headers after performing column selection
    [Documentation]    Perform  column selection and verify the column headers
    [Tags]    ColumnSelection
    Perform Task Export After Performing Column Selection And Verify The Column Headers In The Export Page


TWE_08_Task widget export post applying query filter
    [Documentation]    Apply query builder and perform task widget export
    [Tags]    Query
    Apply A Task Query Filter And Perform Export

TWE_09_Verify deleting report and perform export
    [Documentation]    Delete saved report and perform export again to verify the exported file name
    [Tags]    Verify-delete-report
    Verify deleting the report in the export page and then performing new export and verifying the naming convention

TWE_10_Perform sorting and verify the data is shown as expected
    [Tags]    TaskSorting
    Verify The Data Before And After Sorting The Task List Widget



#----new----
NWE_01_Perform notification widget export post receiving a new notification
    [Documentation]    Test to add a event of 'Alarm Activations' category, 'Activated Alarms' Outcome and 'Alarm Not Set' Type
    [Tags]   AddNewNotification
    Navigate To New Event Page
    Select Event Category  Alarm Activations
    Select Event Outcome  Activated Alarms
    Verify Alarm Outcome Types
    Select Event Type   Alarm Not Set
    Verify Save Button is shown
    Go To Who Is Reporter Question And Verify Options
    Verify Reporter Step Is Completed
    Click On Next Button
    Verify Investigate Stage Title And Count Is Shown
    Verify Detail Step Title Is Shown
    Select Locate Me Option In Map
    Go To Describe Specific Location And Answer
    Verify Location Step Is Completed
    Click On Next Button
    Verify Specific Details Group Title
    Verify Detail Step Is Completed
    Click On Next Button
    Go To Add People To Incident And Select No Option
    Verify Involved Entities Step Is Completed
    Click On Submit Button
    Verify Confirmation Popup And Select Proceed Option
    Verify Toast Message for Event Created Successfull
    Verify Event Created Successfully
    Receive A New Notification And Perform Export

NWE_02_Verify Notifications Module and the page title presence
    [Documentation]    verify the notifications module and perform notification widget export
    [Tags]    Notifications
    Verify the Notifications module and the notifications widget
    Verify The Notifications Page Title

NWE_03_Verify all the columns of notifications export page
    [Documentation]    verifying all the notifications column headers are prsenet on the export page
    [Tags]     Notifications
    Verify Date And Time Column Header In Notification Export Page
    Verify Event Reference Column Header In Notification Export Page
    Verify Subject Column Header In Notification Export Page
    Verify Reference Column Header In Notification Export Page
    Verify Type Column Header In Notification Export Page

NWE_04_Verify data source at the time of notification widget export in the export page
    [Documentation]   At the time of exporting the notifications data, verify the data source dropdown
    [Tags]     Notifications
    Verify the data source dropdown on the notification export page

NWE_05_Verify data count on the notification export page
    [Documentation]    validate that the data count present in the list widget is same in the export page
    [Tags]      Notifications
    Verify The Notification List Widget Data Count On The Export Page


NWE_06_Verify the data count after performing column filtering
    [Documentation]    date and time column filtering and export
    [Tags]     NotificationsColumnFiltering
    Perform Date And Time Column Filtering And Try Notification Widget Export

NWE_07_Verify the column headers after performing column selection
    [Documentation]    after performing column selection ,try exporting and verify that those columns are not present on the notification export page
    [Tags]     NotificationsColumnFiltering
    Perform Column Selection And Try Notifications Widget Export And Verify The Column Headers

NWE_08_Verify date and time of notification export
    [Documentation]    verify the date and time during notification export from the list widget and comparing the date and time present on the export page
    [Tags]    Notifications
    Verify date and time of notification export

NWE_09_Verify the exported notification file name
    [Documentation]    verify the exported notification file naming convention on the export page
    [Tags]     Notifications
    Verify The Exported Notification File Naming Convention
    Deleting the report and then performing notification export and verifying the export file naming convention















#Adding an event and performing incident widget export
#    [Documentation]    Test to add a event of 'Alarm Activations' category, 'Activated Alarms' Outcome and 'Alarm Not Set' Type
#    [Tags]  Add-Event
#    Navigate To New Event Page
#    Select Event Category  Alarm Activations
#    Select Event Outcome  Activated Alarms
#    Verify Alarm Outcome Types
#    Select Event Type   Alarm Not Set
#    Verify Save Button is shown
#    Go To Who Is Reporter Question And Verify Options
#    Verify Reporter Step Is Completed
#    Click On Next Button
#    Verify Investigate Stage Title And Count Is Shown
#    Verify Detail Step Title Is Shown
#    Select Locate Me Option In Map
#    Go To Describe Specific Location And Answer
#    Verify Location Step Is Completed
#    Click On Next Button
#    Verify Specific Details Group Title
#    Verify Detail Step Is Completed
#    Click On Next Button
#    Go To Add People To Incident And Select No Option
#    Verify Involved Entities Step Is Completed
#    Click On Submit Button
#    Verify Confirmation Popup And Select Proceed Option
#    Verify Toast Message for Event Created Successfull
#    Verify Event Created Successfully
#    Reload Page
#    Wait Until Element Is Visible    ${LOCATOR_APP_LOGO}    45
#    ${element_present}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${LOCATOR_ALLOW_LOCATION_BUTTON}    10
#    Run Keyword If    ${element_present}    Click Element    ${LOCATOR_ALLOW_LOCATION_BUTTON}
#    Go To Widget Export Page
#    Wait Until Element Is Visible    ${INCIDENT_WIDGET_EXPORT_FIRST_ROW}
#    ${extracted_reference_id_of_newly_added_event}    Get Text    ${INCIDENT_WIDGET_EXPORT_FIRST_ROW}
#    Log To Console    ${extracted_reference_id_of_newly_added_event}





#
#Widget export post applying query filter
#    Apply A Event Query Filter And Perform Event Widget Export