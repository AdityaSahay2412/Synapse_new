*** Settings ***
Documentation    test cases for Link Incidents to people
Resource    ../Resources/Keywords/General.robot
Resource    ../Resources/Keywords/WidgetExportKeywords.robot
Resource    ../Resources/Keywords/LinkIncidentToPeopleKeywords.robot
#Resource    ../Resources/Keywords/DashboardKeywords.robot
Resource    ../Resources/Keywords/DataComparisonKeywords.robot

Suite Setup      Open The Synapse Analyst Url
Test Setup       Go To Home Page
Test Teardown    Stop Test Case Recording
Suite Teardown   Close Browser

*** Test Cases ***
LPI_001_Verify user should able to see "Link Incident" button in people preview page when ff is off
    [Documentation]    Verify user should not be able to see "Link Incident" button in people preview page when ff is off
    [Tags]    LPI_WhenFFisOff
    Navigate To Dashboard Module
    Navigate to People Dashboard Page and Verify the People data is loaded
    Click On People To Open the Preview Page
    Verify Link/Unlink Button Is not Visible on the People Preview Page when the feature flag is off

LPI_002_Verify user should able to see "Add Incident" button in people preview page when ff is on
    [Documentation]    Verify user should be able to see "Add Incident" button in people preview page when ff is on
    [Tags]    LPI_WhenFFisOn
    Navigate To Dashboard Module
    Navigate to People Dashboard Page and Verify the People data is loaded
    Click On People To Open the Preview Page
    Verify Link/Unlink Button Is Visible on the People Preview Page when the feature flag is on and verify other UI Elements


LPI_003_Verify user should able to access "Select Incident" in people preview page
    [Documentation]    Verify user should able to access "Select Incident" in people preview page
    [Tags]    LPI_LinkIncident
    Navigate To Dashboard Module
    Navigate to People Dashboard Page and Verify the People data is loaded
    Click On People To Open the Preview Page
    Click On Link/Unlink Incident Button
    Link The Incident To The People
    Verify the incident is successfully linked to the people

LPI_004_Verify user should able to see dropdown to search incidents reference
    [Documentation]    Verify user should able to see dropdown to search incidents reference
    [Tags]    LPI_DropdownVisibility
    Navigate To Dashboard Module
    Navigate to People Dashboard Page and Verify the People data is loaded
    Click On People To Open the Preview Page
    Click On Link/Unlink Incident Button
    Verify Dropdown Is Visible To Search Incidents Reference

LPI_005_Verify user should able to search incident with partial input
    [Documentation]    Verify user should able to search incident with partial input
    [Tags]    LPI_SearchIncident
    Navigate To Dashboard Module
    Navigate to People Dashboard Page and Verify the People data is loaded
    Click On People To Open the Preview Page
    Click On Link/Unlink Incident Button
    Search Incident With Partial Input

LPI_006_Verify user should able to select incident from list of incident search reference
    [Documentation]    Verify user should able to select incident from list of incident search reference
    [Tags]    LPI_SelectSingleIncident
    Navigate To Dashboard Module
    Navigate to People Dashboard Page and Verify the People data is loaded
    Click On People To Open the Preview Page
    Click On Link/Unlink Incident Button
    Link The Incident To The People
    Verify The Incident Is Successfully Linked To The People


LPI_007_Verify user should able to select multiple incidents from list of incident search reference
    [Documentation]    Verify user should able to select multiple incidents from list of incident search reference
    [Tags]    LPI_SelectMultipleIncident
    Navigate To Dashboard Module
    Navigate to People Dashboard Page and Verify the People data is loaded
    Click On People To Open the Preview Page
    Click On Link/Unlink Incident Button
    Link Multiple Incidents To The People
    Verify The Multiple Incidents Are Successfully Linked To The People


LPI_013_Verify user able to view people which are linked to incident in incident preview page
    [Documentation]    Verify user able to view people which are linked to incident again in incident preview page
    [Tags]    LPI_VerifyInIncidentPreview
    Navigate To Dashboard Module
    Navigate to People Dashboard Page and Verify the People data is loaded
    Click On People To Open the Preview Page
    Extract the person name from people preview page
    Navigate to Search Module and search for the Linked people incident
    Go To Involved Entities Tab And Verify The Linked People Presence










