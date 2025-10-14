*** Settings ***
Library    Selenium2Library
Library    Collections
Library    DateTime
Resource   ../Variables.robot
Resource   General.robot

*** Keywords ***
Navigate To DashBoard Page
    wait until element is visible  ${DASHBOARDS_MODULE}  5  Dashboard mobule is not shown
    click element   ${DASHBOARDS_MODULE}

Verify Dashboard Page Elements
    [Documentation]    Verifies elements on the Dashboard page.
    Wait Until Element Is Visible    ${DASHBOARD_HEADER}  30   Dashboard header is not shown in Dashboard Page
    @{Dashboard_Locators} =     Create List    ${DASHBOARD_HAMBUGER_BUTTON}    ${DASHBOARD_ADD_PAGE_BUTTON}   ${DASHBOARD_FILTER_LIST}   ${DASHBOARD_PAGES_NAME}  ${DASHBOARD_PAGE_MENU}
                         ...      ${SELECTED_DASHBOARD_TITLE}   ${SELECTED_DASHBOARD_DESCRIPTION}   ${DASHBOARD_SELECT_TIMEFRAME_DROPDOWN}    ${DASHBOARD_FILTER_BUTTON}
                         ...      ${DASHBOARD_3DOTS_BUTTON}
#                         ...      ${DASHBOARD_REFRESH_BUTTON}  ${DASHBOARD_SHARE_BUTTON}  ${DASHBOARD_3DOTS_BUTTON}   #651 site has refresh and share options
    General.Verify_Elements_In_Page  @{Dashboard_Locators}

Add And Verify New Dashboard Page
    ${Current_Time} =    Get Current Date   increment=00:00:00  result_format=%m-%d_%H-%M-%S
    ${Name}  set variable    Automation_${Current_Time}
    ${Description}  set variable    Automation added description on ${Current_Time}
    Wait Until Element Is Visible  ${DASHBOARD_ADD_PAGE_BUTTON}  15  Add page button in dashboard is not shown
    click element  ${DASHBOARD_ADD_PAGE_BUTTON}
    Wait Until Element Is Visible  ${DASHBOARD_ADD_PAGE_TITLE}  15  Add page slideout form is not shown
    Wait Until Element Is Visible  ${DASHBOARD_NAME_FIELD}  5  Name field is not shown in slideout
    Input Text    ${DASHBOARD_NAME_FIELD}    ${Name}
    Wait Until Element Is Visible  ${DASHBOARD_DESCRIPTION_FIELD}  5  Description field is not shown in slideout
    Input Text    ${DASHBOARD_DESCRIPTION_FIELD}    ${Description}
    Wait Until Element Is Visible  ${DASHBOARD_ICON_FIELD}  15  Dashboard icon is not shown
    click element  ${DASHBOARD_ICON_FIELD}
    Wait Until Element Is Visible  ${DASHBOARD_ICON_SEARCH_BOX}  5  Name field is not shown in slideout
#    sleep  1
#    Input Text    ${DASHBOARD_ICON_SEARCH_BOX}    Auto
    Wait For Condition    return document.readyState == 'complete'    timeout=10s
    Wait Until Element Is Visible  ${DASHBOARD_ICON_RESULT_ITEM}  5  Dashboard icon not shown
    click element  ${DASHBOARD_ICON_RESULT_ITEM}
    run keyword and continue on failure  Wait Until Element Is Visible  ${DASHBOARD_CLOSE_BUTTON}  2  Close button is not shown
    click element  ${DASHBOARD_SAVE_BUTTON}
    sleep  2
    wait until page contains element   ${DASHBOARD_PAGE1_NAME}   15
    scroll element into view  ${DASHBOARD_PAGE1_NAME}
    run keyword and continue on failure  wait until element contains   ${DASHBOARD_PAGE1_NAME}   ${Name}   15
    run keyword and continue on failure  wait until element contains   ${SELECTED_DASHBOARD_TITLE}   ${Name}   3
    run keyword and continue on failure  wait until element contains   ${SELECTED_DASHBOARD_DESCRIPTION}   ${Description}   3
    set suite variable  ${Created_DashboardPage_Name}  ${Name}
    set suite variable  ${Created_DashboardPage_Description}  ${Description}
    log to console  Added Dashboard page with title "${Name}" and description "${Description}"

Edit Newly Added Dashboard page
    wait until element is visible  //*[text()='${Created_DashboardPage_Name}']/parent::div/span/button  5  Dashboard doesnot conatian page with name '${Created_DashboardPage_Name}'
    click element  //*[text()='${Created_DashboardPage_Name}']/parent::div/span/button
    wait until element is visible  ${DASHBOARD_EDIT_PAGE_OPTION}  5  Delete option is not shown
    Sleep    4
    click element   ${DASHBOARD_EDIT_PAGE_OPTION}
    wait until page contains element  ${DASHBOARD_SLIDEOUT_TITLE}  10  Dashboard edit page Slideout not shown
    element should contain  ${DASHBOARD_SLIDEOUT_TITLE}  ${Created_DashboardPage_Name}


Delete Dashboard Page
    ${status}  run keyword and return status  wait until element is visible  ${DASHBOARD_CLOSE_BUTTON}  1
    run keyword if    '${status}'=='True'       click element  ${DASHBOARD_CLOSE_BUTTON}
    wait until element is visible  //*[text()='${Created_DashboardPage_Name}']/parent::div/span/button  5  Dashboard doesnot conatian page with name '${Created_DashboardPage_Name}'
    click element  //*[text()='${Created_DashboardPage_Name}']/parent::div/span/button
    wait until element is visible  ${DASHBOARD_DELETE_PAGE_OPTION}  5  Delete option is not shown
    click element   ${DASHBOARD_DELETE_PAGE_OPTION}
    run keyword and continue on failure  wait until element contains   ${DASHBOARD_DELETE_CONFIRMATION}   ${Created_DashboardPage_Name}   5
    run keyword and continue on failure  Wait Until Element Is Visible  ${DASHBOARD_DELETE_CANCEL}  2  Cancel button is not shown
    click element  ${DASHBOARD_DELETE_CONFIRM}
    wait until page contains  Deleted  10  'Deleted' toast message is not shown
    sleep  2
    run keyword and continue on failure  wait until page does not contain  ${Created_DashboardPage_Name}   15
    run keyword and continue on failure  wait until element does not contain   ${SELECTED_DASHBOARD_TITLE}   ${Created_DashboardPage_Name}   3
    log to console  Deleted Dashboard page with title "${Created_DashboardPage_Name}"

Add Incidents List Widget In DashBoard Page
    ${Current_Time} =    Get Current Date   increment=00:00:00  result_format=%m-%d_%H-%M-%S
    ${Name}  set variable    AutomationWidget${Current_Time}
    wait until element is visible  ${DASHBOARD_ADD_WIDGET_BUTTON}  5  Add widget button is not shown
    click element   ${DASHBOARD_ADD_WIDGET_BUTTON}
    wait until element is visible  ${DASHBOARD_LIST_WIDGET_OPTION}  5  List widget option is not shown
    click element   ${DASHBOARD_LIST_WIDGET_OPTION}
    wait until element is visible  ${DASHBOARD_ADD_WIDGET_SLIDEOUT}  5  Add widget slideout is not shown
    wait until element is visible  ${DASHBOARD_WIDGET_TYPE_SELECTED}  5   widget Type is not shown
    element should contain  ${DASHBOARD_WIDGET_TYPE_SELECTED}   List Widget
    Input Text    ${DASHBOARD_WIDGET_TITLE_FIELD}    ${Name}
    wait until element is visible  ${DASHBOARD_DATA_SOURCE}
    click element  ${DASHBOARD_DATA_SOURCE}
    wait until element is visible  ${DASHBOARD_INCIDENTS_OPTION}
    click element  ${DASHBOARD_INCIDENTS_OPTION}
    sleep  1
    wait until element is visible     ${DASHBOARD_WIDGET_SIZE}
    click element     ${DASHBOARD_WIDGET_SIZE}
    sleep  1
    wait until element is visible   ${DASHBOARD_100_WIDGET_SIZE}
    click element    ${DASHBOARD_100_WIDGET_SIZE}
    scroll element into view  ${DASHBOARD_FIRST_NEXT_BUTTON}
    wait until element is visible    ${DASHBOARD_FIRST_NEXT_BUTTON}
    click element    ${DASHBOARD_FIRST_NEXT_BUTTON}
    wait until element is visible   ${DASHBOARD_QUERY_BUILDER_TOGGLE}
    click element    ${DASHBOARD_QUERY_BUILDER_TOGGLE}
    scroll element into view  ${DASHBOARD_SECOND_NEXT_BUTTON}
    wait until element is visible    ${DASHBOARD_SECOND_NEXT_BUTTON}
    click element    ${DASHBOARD_SECOND_NEXT_BUTTON}
    wait until element is visible    ${DASHBOARD_SUBMIT_BUTTON}
    click element    ${DASHBOARD_SUBMIT_BUTTON}
    wait until element is visible    ${DASHBOARD_SAVE_BUTTON}
    click element    ${DASHBOARD_SAVE_BUTTON}
    sleep  5
    ${status}  run keyword and return status  wait until element is visible  xpath=//h3[@class="m-portlet__head-text" and contains(text(),'${Name}')]   15
    run keyword if    '${status}'=='False'       Reload Page And Allow Location Access
    wait until page contains element  xpath=//h3[@class="m-portlet__head-text" and contains(text(),'${Name}')]   20
    scroll element into view   xpath=//h3[@class="m-portlet__head-text" and contains(text(),'${Name}')]
    wait until element is visible  xpath=//h3[@class="m-portlet__head-text" and contains(text(),'${Name}')]   5
    capture page screenshot
    set suite variable  ${Created_ListWidget_Name}  ${Name}
    log to console  Added List widget with name "${Name}"

Update Dashboard Page Name And Title
    ${Current_Time}    Get Current Date   increment=00:00:00  result_format=%m-%d_%H-%M-%S
    ${Name}  set variable    Automation_${Current_Time}
    ${Description}  set variable    Automation updated description on ${Current_Time}
    Wait Until Element Is Visible  ${DASHBOARD_NAME_FIELD}  5  Name field is not shown in slideout
    Input Text    ${DASHBOARD_NAME_FIELD}    ${Name}
    Wait Until Element Is Visible  ${DASHBOARD_DESCRIPTION_FIELD}  5  Description field is not shown in slideout
    Input Text    ${DASHBOARD_DESCRIPTION_FIELD}    ${Description}
    click element  ${DASHBOARD_SAVE_BUTTON}
    sleep  2
    scroll element into view    ${DASHBOARD_PAGE1_NAME}
    run keyword and continue on failure  wait until element contains   ${DASHBOARD_PAGE1_NAME}   ${Name}   15
    run keyword and continue on failure  wait until element contains   ${SELECTED_DASHBOARD_TITLE}   ${Name}   3
    run keyword and continue on failure  wait until element contains   ${SELECTED_DASHBOARD_DESCRIPTION}   ${Description}   3
    set suite variable  ${Created_DashboardPage_Name}  ${Name}
    set suite variable  ${Created_DashboardPage_Description}  ${Description}
    log to console  Updated Dashboard page with title "${Name}" and description "${Description}"


Edit
    click element  xpath=//h3[@class="m-portlet__head-text" and contains(text(),'${Created_ListWidget_Name}')]/ancestor::div[@class="m-portlet__head"]//button
    wait until element is visible  ${DASHBOARD_ADD_WIDGET_SLIDEOUT}  5  Add widget slideout is not shown

Add A Global Incident Filter In Dashboard Page
    ${Current_Time}    Get Current Date   increment=00:00:00  result_format=%m-%d_%H-%M-%S
    ${Name}  set variable    Automated_Filter${Current_Time}
    ${status}  run keyword and return status  element should be visible  id=add-query
    run keyword if    '${status}'=='False'       Reload Page And Allow Location Access
    wait until element is visible  id=add-query  20  Query Builder option not shown after waiting for 20 secs
    click element     id=add-query
    wait until element is visible  id=query-name  15  Failed to load query builder form in 15 secs
    element should contain   xpath=//*[@class="slide-out-form-title"]/h2/span    Query Builder
    wait until element is visible  id=query-name  15
    Input Text    id=query-name    ${Name}
    wait until element is visible   xpath=//input[@placeholder="Please select"]
    click element     xpath=//input[@placeholder="Please select"]
    click element     xpath=//*[@class="zd-select-option" and contains(text(),'Or')]
    click element     xpath=//*[text()=' + Group ']
    click element     xpath=//li/query-builder//button[text()=' + Filter ']
    scroll element into view  xpath=//*[@name="queryBuilderValueField"]//input[@placeholder="Please select"]
    click element     xpath=//*[@name="queryBuilderValueField"]//input[@placeholder="Please select"]
    click element     xpath=//input[@placeholder="Search"]
    ${value}  get text   xpath=//*[@class="zd-select-option"]
    input text  xpath=//input[@placeholder="Search"]  ${value}
    wait until element is visible     xpath=//*[@class="zd-select-option"]  5
    click element     xpath=//*[@class="zd-select-option"]
    scroll element into view  xpath=//*[@name="queryBuilderValueDropdown"]//input[@placeholder="Please select"]
    click element     xpath=//*[@name="queryBuilderValueDropdown"]//input[@placeholder="Please select"]
    click element     xpath=//input[@placeholder="Search"]
    ${value}  get text   xpath=//*[@class="zd-select-option"]
    input text  xpath=//input[@placeholder="Search"]  ${value}
    wait until element is visible     xpath=//*[@class="zd-select-option"]  5
    click element     xpath=//*[@class="zd-select-option"]
    Wait Until Element Is Visible    id=btn-slide-out-close
    Wait Until Element Is Visible    id=btn-slide-out-run-confirm
    Wait Until Element Is Visible    xpath=//label[@id='id']/span
    capture page screenshot
    click element  id=btn-slide-out-run-save-confirm
    set suite variable  ${Created_Global_Incident_Filter_Name}  ${Name}
    set suite variable  ${Selected_Global_Incident_Filter_Value}  ${value}
    wait until page does not contain element  //div[@class='ag-loading']  30
    wait until element is visible  //*[@id="portletBody"]//mat-chip/span[@class="ng-star-inserted"]  15
    element should contain  //*[@id="portletBody"]//mat-chip/span[@class="ng-star-inserted"]  ${value}


Verify Added Filter In Query Builder
    [Arguments]   ${Name}  ${value}
    ${status}  run keyword and return status  element should be visible  id=add-query
    run keyword if    '${status}'=='False'       Reload Page And Allow Location Access
    wait until element is visible  id=add-query  20  Query Builder option not shown after waiting for 20 secs
    click element     id=add-query
    wait until element is visible  id=query-name  15  Failed to load query builder form in 15 secs
    element should contain   xpath=//*[@class="slide-out-form-title"]/h2/span    Query Builder
    wait until element is visible  id=query-name  5
    click element  //input[@placeholder="Select saved filter"]
    input text  xpath=//input[@placeholder="Search"]  ${Name}
    sleep  3
    capture page screenshot
    wait until element is visible     xpath=//*[@class="zd-select-option"]  5
    element should contain     xpath=//*[@class="zd-select-option"]  ${Name}
    click element  xpath=//*[@class="zd-select-option"]
    scroll element into view  id=div-query-builder-dropdown-value
    get value  id=div-query-builder-dropdown-value
    click element  id=div-query-builder-dropdown-value
    sleep  2
    wait until page contains element    xpath=//*[@class="mbsc-scroller-wheel-item mbsc-material mbsc-ltr mbsc-wheel-item-checkmark mbsc-selected"]/div/div   10
    element should contain     xpath=//*[@class="mbsc-scroller-wheel-item mbsc-material mbsc-ltr mbsc-wheel-item-checkmark mbsc-selected"]/div/div   ${value}
    capture page screenshot
    press keys    None     ESC
    click element  ${DASHBOARD_CLOSE_BUTTON}

Select Events Page
    wait until element is visible  ${DASHBOARD_EVENTS_PAGE}  5  All Records page is not shown
    click element   ${DASHBOARD_EVENTS_PAGE}

Add A Query Builder To Filter Event Reference
    [Arguments]  ${reference}
    ${Current_Time}    Get Current Date   increment=00:00:00  result_format=%m-%d_%H-%M-%S
    ${Name}  set variable    Run_Filter${Current_Time}
    ${status}  run keyword and return status  element should be visible  id=add-query
    run keyword if    '${status}'=='False'       Reload Page And Allow Location Access
    wait until element is visible  id=add-query  20  Query Builder option not shown after waiting for 20 secs
    click element     id=add-query
    wait until element is visible  id=query-name  15  Failed to load query builder form in 15 secs
    element should contain   xpath=//*[@class="slide-out-form-title"]/h2/span    Query Builder
    wait until element is visible  id=query-name  5
    Input Text    id=query-name    ${Name}
    wait until element is visible   xpath=//input[@placeholder="Please select"]
    click element     xpath=//input[@placeholder="Please select"]
    click element     xpath=//*[@class="zd-select-option" and contains(text(),'Or')]
    click element     xpath=//*[text()=' + Group ']
    click element     xpath=//li/query-builder//button[text()=' + Filter ']
    scroll element into view  xpath=//*[@name="queryBuilderValueField"]//input[@placeholder="Please select"]
    click element     xpath=//*[@name="queryBuilderValueField"]//input[@placeholder="Please select"]
    click element     xpath=//input[@placeholder="Search"]
    input text  xpath=//input[@placeholder="Search"]  Incident Reference
    sleep  2
    wait until element is visible     xpath=//*[@class="zd-select-option"]  5
    click element     xpath=//*[@class="zd-select-option"]
    scroll element into view  xpath=//*[@name="queryBuilderValueTextbox"]//input[@placeholder="Please Enter"]
    click element     xpath=//*[@name="queryBuilderValueTextbox"]//input[@placeholder="Please Enter"]
    input text  xpath=//*[@name="queryBuilderValueTextbox"]//input[@placeholder="Please Enter"]  ${reference}
    capture page screenshot
    Wait Until Element Is Visible    id=btn-slide-out-close
    Wait Until Element Is Visible    id=btn-slide-out-run-confirm
    Wait Until Element Is Visible    xpath=//label[@id='id']/span
    capture page screenshot
    click element  id=btn-slide-out-run-confirm
    wait until page does not contain element  //div[@class='ag-loading']  30
    wait until element is visible  //*[@id="portletBody"]//mat-chip/span[@class="ng-star-inserted"]  15
    element should contain  //*[@id="portletBody"]//mat-chip/span[@class="ng-star-inserted"]  ${reference}
    capture page screenshot
