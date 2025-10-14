*** Settings ***
Resource    ../Resources/Variables.robot
Resource    ../Resources/Keywords/General.robot
Resource    ../Resources/Keywords/DataExportKeywords.robot


Suite Setup      Open Browser And Login To Analyst App
Test Setup       Go To Home Page
Test Teardown    Stop Test Case Recording
Suite Teardown   Close Browser

*** Variables ***

${TEMPLATES}   ${empty}

*** Test Cases ***

Generate and Export The Saved Template
    [Documentation]    Test for generating the downloading the saved template
    [Tags]  DataExport
    Navigate To Data Module
    Select Saved Template  Events
    Generate And View Report  Events
    Export CSV And Wait For File To Download

