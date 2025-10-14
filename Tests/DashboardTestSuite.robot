*** Settings ***
Resource    ../Resources/Variables.robot
Resource    ../Resources/Keywords/General.robot
Resource    ../Resources/Keywords/DashboardKeywords.robot


Suite Setup      Open Browser And Login To Analyst App
Test Setup       Go To Home Page
Test Teardown    Stop Test Case Recording
Suite Teardown   Close Browser

*** Test Cases ***
Valid Dashboard Page
    [Documentation]    Test the Dashboard page elements
    [Tags]  Dashboard
    Navigate To DashBoard Page
    Verify Dashboard Page Elements

Validate Adding New Dashboard Page
    [Documentation]    Test the adding of new dashboard and verify
    [Tags]  Dashboard
    Navigate To DashBoard Page
    Add And Verify New Dashboard Page
    [Teardown]  run keywords    Stop Test Case Recording  AND  Delete Dashboard Page

Validate Editing A Dashboard Page
    [Documentation]    Test the adding of new dashboard and verify
    [Tags]  Dashboard
    Navigate To DashBoard Page
    Add And Verify New Dashboard Page
    Edit Added Dashboard Page
    Update Dashboard Page Name And Title
    [Teardown]  run keywords  Stop Test Case Recording  AND  Delete Dashboard Page


Validate Adding Incidents List Widget Without Filters
    [Documentation]    Test the adding of new list widget with Incidents as Data source and no Saved Filter selected
    [Tags]  Dashboard
    Navigate To DashBoard Page
    Add And Verify New Dashboard Page
    Edit Added Dashboard Page
    Add Incidents List Widget In DashBoard Page
    [Teardown]  run keywords  Stop Test Case Recording  AND  Delete Dashboard Page

##
#Validate Adding Multiple Incidents List Widgets
#    [Documentation]    Test the adding of multiple incidents list widgets
#    [Tags]  Dashboard
#    Navigate To DashBoard Page
##    Add And Verify New Dashboard Page
#    FOR    ${i}    IN RANGE    6
#        Edit Added Dashboard Page
#        Add Incidents List Widget In DashBoard Page
#    END
##    [Teardown]  Delete Dashboard Page
##

Validate Adding Global Incident Filter In Dashboard Page
    [Documentation]    Test the adding of new dashboard and verify
    [Tags]  Dashboard
    Navigate To DashBoard Page
    Add And Verify New Dashboard Page
    Edit Added Dashboard Page
    Add Incidents List Widget In DashBoard Page
    Add A Global Incident Filter In Dashboard Page
#    Edit Added Dashboard Page
    Verify Added Filter In Query Builder  ${Created_Global_Incident_Filter_Name}  ${Selected_Global_Incident_Filter_Value}
    [Teardown]  run keywords  Stop Test Case Recording  AND  Delete Dashboard Page


Validate Deleting Dashboard Page
    [Documentation]    Test the adding of new dashboard and verify
    [Tags]  Dashboard
    Navigate To DashBoard Page
    Add And Verify New Dashboard Page
    Delete Dashboard Page

