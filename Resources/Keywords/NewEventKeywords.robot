*** Settings ***
Library    Selenium2Library
Library    Collections
Library    DateTime
Library    OperatingSystem
Library    String

Resource   ../Variables.robot
Resource   General.robot

*** Keywords ***
Navigate To New Event Page
    wait until element is visible  ${ADD_EVENT_BUTTON}  5  Add button is not shown
    click element   ${ADD_EVENT_BUTTON}
    sleep  1
    run keyword and ignore error  wait until element is visible  ${ADD_NEW_EVENT_OPTION}   3
    run keyword and ignore error  click element  ${ADD_NEW_EVENT_OPTION}
    Validate New Event Page Is Shown

Validate New Event Page Is Shown
    wait until element is visible  ${NEW_EVENT_BREADCRUMBS}  10  Failed to open add new event page

Verify New Event Page Elements
    [Documentation]    Verifies elements on the new event page.
    Wait Until Element Is Visible    ${EVENT_HEADER}  30   Event header is not shown in Add new event Page
    @{New_Event_Locators} =     Create List    ${REPORT_STAGE_TITLE}    ${REPORT_STAGE_COUNT}   ${REPORT_STEP_TITLE}   ${REPORT_STEP_COUNT}  ${LOCATION_STEP_TITLE}
                         ...      ${LOCATION_STEP_COUNT}   ${CATEGORISATION_GROUP_TITLE}   ${CATEGORY_LABEL}    ${CATEGORY_DROPDOWN}
                         ...      ${SUBCATEGORY_LABEL}  ${SUBCATEGORY_DROPDOWN}  ${TYPE_LABEL}  ${DATETIME_GROUP_TITLE}  ${REPORTED_BY_TITLE}
                         ...      ${DATETIME_OF_EVENT_LABEL}  ${DATETIME_OF_EVENT_DROPDOWN}  ${LOGGED_BY_LABEL}  ${NEXT_BUTTON}  ${UPLOAD_ICON}
#                         ...      ${DASHBOARD_REFRESH_BUTTON}  ${DASHBOARD_SHARE_BUTTON}  ${DASHBOARD_3DOTS_BUTTON}   #651 site has refresh and share options
    General.Verify_Elements_In_Page  @{New_Event_Locators}

Verify Elements In Event Overview Page
    [Documentation]    Verifies elements on the new event page.
    Wait Until Element Is Visible    ${EVENT_LOCATION_WIDGET}  50   Event header is not shown in Add new event Page
    sleep  10
    @{Event_Overview_Locators} =     Create List    ${HAMBURGER_BUTTON}    ${EVENT_NUMBER}    ${EVENT_FILTER_LIST}    ${EVENT_OVERVIEW_MODULE}
         ...      ${EVENT_LOCATIONS_MODULE}    ${EVENT_INVOLVED_ENTITIES_MODULE}    ${EVENT_FILES_MODULE}
         ...      ${EVENT_TASKS_MODULE}    ${EVENT_RESPONSES_MODULE}    ${EVENT_LINKED_REPORTS_MODULE}
         ...      ${EVENT_NOTIFICATIONS_MODULE}    ${EVENT_HOME_BREADCRUMB}    ${EVENT_EVENTS_BREADCRUMB}
         ...      ${EVENT_ID_BREADCRUMB}    ${EVENT_DATE_TIME_FIELD}    ${EVENT_LAST_UPDATED_FIELD}
         ...      ${EVENT_STATUS_FIELD}    ${EVENT_STATUS_VALUE}    ${EVENT_SEVERITY_FIELD}    ${EVENT_SEVERITY_VALUE}
         ...      ${EVENT_PRIORITY_FIELD}    ${EVENT_PRIORITY_VALUE}    ${EVENT_ASSIGNED_TO_FIELD}    ${EVENT_ASSIGNED_TO_VALUE}
         ...      ${EVENT_SUMMARY_TAB}    ${EVENT_REPORT_TAB}    ${EVENT_INVESTIGATE_TAB}    ${EVENT_ANALYSE_TAB}
         ...      ${EVENT_LINK_RESOURCES_BUTTON}    ${EVENT_REFRESH_BUTTON}    ${EVENT_EDIT_BUTTON}    ${EVENT_MEDIA_UPLOAD_BUTTON}
         ...      ${EVENT_3DOTS_BUTTON}    ${EVENT_LOCATION_WIDGET}    ${EVENT_SUMMARY_WIDGET}
         ...      ${EVENT_WRITTEN_SUMMARY_WIDGET}    ${EVENT_PINNED_LOCATION}    ${EVENT_SEARCH_LOCATION_BOX}  ${EVENT_SEARCH_LABEL}
         ...      ${SUMMARY_CATEGORY_LABEL}    ${SUMMARY_OUTCOME_LABEL}    ${SUMMARY_TYPE_LABEL}    ${SUMMARY_STATUS_LABEL}
         ...      ${SUMMARY_STATUS_VALUE}    ${SUMMARY_PRIORITY_LABEL}    ${SUMMARY_PRIORITY_VALUE}    ${SUMMARY_SEVERITY_LABEL}
         ...      ${SUMMARY_SEVERITY_VALUE}    ${SUMMARY_REPORT_DATE_TIME_LABEL}    ${SUMMARY_REPORT_DATE_TIME_VALUE}
         ...      ${SUMMARY_CREATED_DATE_TIME_LABEL}    ${SUMMARY_CREATED_DATE_TIME_VALUE}    ${SUMMARY_REPORTED_BY_LABEL}
         ...      ${SUMMARY_REPORTED_BY_VALUE}    ${SUMMARY_ASSIGNED_TO_LABEL}    ${SUMMARY_ASSIGNED_TO_VALUE}
         ...      ${SUMMARY_WRITTEN_SUMMARY_LABEL}    ${SUMMARY_WRITTEN_SUMMARY_VALUE}
    General.Verify_Elements_In_Page  @{Event_Overview_Locators}
    capture page screenshot

Select Event Category
    [Arguments]  ${category}=Alarm Activations
    Wait Until Element Is Visible    ${EVENT_HEADER}  30   Event header is not shown in Add new event Page
    Wait Until Element Is Visible    ${CATEGORY_DROPDOWN}  30   Category dropdown is not shown in Add new event Page
    click element  ${CATEGORY_DROPDOWN}
    sleep  0.5
    scroll element into view    xpath=//div[@role='option' and text()='${category}']
    wait until element is visible    xpath=//div[@role='option' and text()='${category}']        10       Risk Register Category option not shown
    click element    xpath=//div[@role='option' and text()='${category}']

Select Event Outcome
    [Arguments]  ${outcome}=Activated Alarms
    Wait Until Element Is Visible    ${SUBCATEGORY_DROPDOWN}  30   Category dropdown is not shown in Add new event Page
    click element  ${SUBCATEGORY_DROPDOWN}
    sleep  2
    scroll element into view  //div[@class='zd-select-option' and contains(text(),'${outcome}')]
    wait until page contains element  //div[@class='zd-select-option' and contains(text(),'${outcome}')]  5
    ${clicked}=      run keyword and return status    click element    //div[@class='zd-select-option' and contains(text(),'${outcome}')]
    run keyword if    '${clicked}'=='False'     Execute JavaScript    document.evaluate("//div[@class='zd-select-option' and contains(text(),'${outcome}')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()

Select Event Type
    [Arguments]  ${type}=Alarm Not Set
    scroll element into view   ${DATETIME_GROUP_TITLE}
    wait until element is visible    //span[text()='${type}']  5
    sleep  1
    click element  //span[text()='${type}']//parent::p/input

Verify Alarm Outcome Types
    Wait Until Element Is Visible    ${SUBCATEGORY_DROPDOWN}  30   Category dropdown is not shown in Add new event Page
    capture page screenshot
    click element  ${SUBCATEGORY_DROPDOWN}
    sleep  2
    capture page screenshot
    wait until element is visible  //div[@class='zd-select-option' and contains(text(),'Alarm')]
    ${elements}    Get WebElements     //div[@class='zd-select-option' and contains(text(),'Alarm')]
    ${actual_options}=    Create List
    FOR    ${element}    IN    @{elements}
         ${option}=    Get Text    ${element}
         Append To List    ${actual_options}    ${option}
    END
    ${expected_options}=    Create List  Activated Alarms  Alarm Reports  Test Alarms
    list should contain sub list   ${actual_options}  ${expected_options}
    press keys    None     ESC
    press keys    None     ESC

Go To Who Is Reporter Question And Verify Options
    SCROLL ELEMENT INTO VIEW  ${WHO_IS_REPORTER_LABEL}
    wait until element is visible  ${WHO_IS_REPORTER_LABEL}  5  Save button not visible after selecting the event type
    wait until element is visible  ${IM_REPORTER_OPTION}  5  'I am the reporter' not visible after selecting the event type
    wait until element is visible  ${INTERNAL_OPTION}  5  'Internal' not visible after selecting the event type
    wait until element is visible  ${EXTERNAL_OPTION}  5  'External/Contractor' not visible after selecting the event type
    wait until element is visible  ${MEMBER_OPTION}  5  'Member of the Public' not visible after selecting the event type

Verify Save Button is shown
    wait until element is visible  ${SAVE_BUTTON}  5  Save button not visible after selecting the event type

Verify Reporter Step Is Completed
    scroll element into view  ${EVENT_HEADER}
    scroll element into view  ${REPORTER_STEP_TICKMARK}
    wait until element is visible  ${REPORTER_STEP_TICKMARK}

Click On Next Button
    wait until element is visible  ${NEXT_BUTTON}  15
    click element  ${NEXT_BUTTON}

Verify Investigate Stage Title And Count Is Shown
    wait until element is visible  ${INVESTIGATE_STAGE_TITLE}
    wait until element is visible  ${INVESTIGATE_STAGE_COUNT}

Verify Detail Step Title Is Shown
    wait until element is visible  ${DETAILS_STEP_TITLE}

Go To Describe Specific Location And Answer
    scroll element into view  ${DESCRIBE_SPECIFIC_LOCATION_TEXTBOX}
    ${Current_Time} =    Get Current Date   increment=00:00:00  result_format=%m-%d_%H-%M-%S
    ${Specified_Location}  set variable    Automation specified location @ ${Current_Time}
    set suite variable  ${Specified_Location}  ${Specified_Location}
    wait until element is visible  ${DESCRIBE_SPECIFIC_LOCATION_LABEL}
    input text  ${DESCRIBE_SPECIFIC_LOCATION_TEXTBOX}  ${Specified_Location}

Verify Location Step Is Completed
    scroll element into view  ${EVENT_HEADER}
    scroll element into view  ${LOCATION_STEP_TICKMARK}
    wait until element is visible  ${LOCATION_STEP_TICKMARK}

Verify Detail Step Is Completed
    scroll element into view  ${EVENT_HEADER}
    scroll element into view  ${DETAILS_STEP_TICKMARK}
    wait until element is visible  ${DETAILS_STEP_TICKMARK}

Verify Specific Details Group Title
    wait until element is visible  ${SPECIFIC_DETAILS_GROUP_TITLE}

Verify Involved Entities Step Title Is Shown
    wait until element is visible  ${INVOLVED_ENTITIES_TITLE}

Go To Involved Entities Step
    wait until element is visible  ${INVOLVED_ENTITIES_TITLE}  10
    scroll element into view    ${EVENT_HEADER}
    scroll element into view    ${INVOLVED_ENTITIES_TITLE}
    click element  ${INVOLVED_ENTITIES_TITLE}

Verify Assessment Step Title Is Shown
    wait until element is visible  ${ASSESSMENT_TITLE}

Verify Associated With Group Title
    wait until element is visible  ${ASSOCIATED_WITH_GROUP_TITLE}

Go To Add People To Incident And Select No Option
    scroll element into view   ${ADD_PEOPLE_TO_INCIDENT_LABEL}
    wait until element is visible  ${ADD_PEOPLE_TO_INCIDENT_LABEL}
    scroll element into view  ${PEOPLE_NO_OPTION}
    click element  ${PEOPLE_NO_OPTION}

Go To Add Cost Question And Select Yes Option
    scroll element into view   ${ADD_COST_TO_INCIDENT_LABEL}
    wait until element is visible  ${ADD_COST_TO_INCIDENT_LABEL}
    scroll element into view  ${COST_YES_OPTION}
    click element  ${COST_YES_OPTION}
    Validate Add Cost Slideout Is Shown

Go To Add Cost Question And Select No Option
    scroll element into view   ${ADD_COST_TO_INCIDENT_LABEL}
    wait until element is visible  ${ADD_COST_TO_INCIDENT_LABEL}
    scroll element into view  ${COST_NO_OPTION}
    click element  ${COST_NO_OPTION}

Verify Involved Entities Step Is Completed
    scroll element into view  ${EVENT_HEADER}
    scroll element into view  ${INVOLVED_ENTITIES_STEP_TICKMARK}
    wait until element is visible  ${INVOLVED_ENTITIES_STEP_TICKMARK}

Click On Submit Button
    capture page screenshot
    wait until element is visible   ${SUBMIT_BUTTON}
    click element  ${SUBMIT_BUTTON}

Verify Confirmation Popup And Select Proceed Option
    wait until element is visible  ${EVENT_SUBMIT_CONFIRMATION_POPUP}
    wait until element is visible  ${CANCEL_BUTTON}
    click element  ${PROCEED_BUTTON}

Verify Toast Message for Event Created Successfull
    run keyword and continue on failure  wait until page contains  has been submitted   30   Toast message not shown after submitting event creation

Verify Toast Message for Event Cost Linked Successfull
    run keyword and warn on failure  wait until page contains  Event cost linked successfully  40   Toast message not shown after linking event cost
    capture page screenshot

Verify Event Created Successfully
    wait until element is visible      ${EVENT_ID}   30   Failed to see incident id, hence failed to create new event
    ${ID} =   get text   ${EVENT_ID}
    log to console  Created event id '${ID}'
    set suite variable  ${Created_Event_ID}  ${ID}
    Set Test Message   Created event id '${ID}'
    capture page screenshot
    [Return]   ${ID}

Select Locate Me Option In Map
    Wait Until Element Is Visible    ${LOCATION_TITLE}  30   Location header is not shown in Location Page
    Wait Until Element Is Visible    ${GOOGLE_LOGO}  30  Google logo is not shown in Location Page
    scroll element into view  ${GOOGLE_LOGO}
    scroll element into view  ${GOOGLE_LOGO}
    ${locate_me}  run keyword and return status  wait until element is visible  ${LOCATE_ME_OPTION}  5
    Run Keyword If    ${locate_me} == True   Select Locate Me Option
    ${locate_me}  run keyword and return status  wait until element is visible   ${SEARCH_LOCATION}  5
    Run Keyword If    ${locate_me} == True   Search Location

Search Location
    click element  ${SEARCH_LOCATION}
    wait until element is visible  ${SEARCH_LOCATION}   5
    input text  ${SEARCH_LOCATION}  Automated
    wait until element is visible  ${PREVIOUSLY_REPORTED_LOCATIONS}  5  No previously reported locations with 'Automated' name
    click element  ${PREVIOUSLY_REPORTED_LOCATIONS}
    capture page screenshot


Select Locate Me Option
    CLICK ELEMENT  ${LOCATE_ME_OPTION}
    sleep  1
    ${locate_me}  run keyword and return status  CLICK ELEMENT  ${LOCATE_ME_OPTION}
    sleep  2
    Run Keyword If    ${locate_me} == True   WAIT UNTIL ELEMENT IS VISIBLE  ${MY_LOCATION_CHIP}   10  My Location chip is not shown after clicking on Locate Me option for Lacation
    Run Keyword If    ${locate_me} == False  CLICK ELEMENT  ${MY_CURRENT_LOCATION_OPTION}
    ${Current_Time} =    Get Current Date   increment=00:00:00  result_format=%d_%H-%M-%S
    ${Location_Name}  set variable    Automated Name ${Current_Time}
    sleep  2
    ${shown}  run keyword and return status  element should be visible  ${MY_CURRENT_LOCATION_NAME}
    Run Keyword If    ${shown} == False  CLICK ELEMENT  ${MY_CURRENT_LOCATION_OPTION}
    Run Keyword If    ${locate_me} == False   INPUT TEXT  ${MY_CURRENT_LOCATION_NAME}  ${Location_Name}
    sleep  1
    capture page screenshot


Select Locate Me Option And Verify Map Elements
    capture page screenshot
    Wait Until Element Is Visible    ${LOCATION_TITLE}  30   Location header is not shown in Location Page
    Wait Until Element Is Visible    ${GOOGLE_LOGO}  30  Google logo is not shown in Location Page
    scroll element into view  ${GOOGLE_LOGO}
    ${locate_me}  run keyword and return status  CLICK ELEMENT  ${LOCATE_ME_OPTION}
    Run Keyword If    ${locate_me} == True   WAIT UNTIL ELEMENT IS VISIBLE  ${MY_LOCATION_CHIP}   10  My Location chip is not shown after clicking on Locate Me option for Lacation
    Run Keyword If    ${locate_me} == False   wait until keyword succeeds  3x  200ms  CLICK ELEMENT  ${MY_CURRENT_LOCATION_OPTION}
    ${Current_Time} =    Get Current Date   increment=00:00:00  result_format=%d_%H-%M-%S
    ${Location_Name}  set variable    Automated Name ${Current_Time}
    sleep  2
    @{Locate_Me_Locators} =     Create List    ${SELECT_EVENT_LOCATION_LABEL}    ${LOCATE_HEADER}   ${LOCATE_ICON}   ${ADD_HEADER}  ${ADD_LOCATION_ICON}
                         ...      ${ZOOM_HEADER}   ${ZOOM_IN_ICON}   ${ZOOM_OUT_ICON}    ${TOOLS_HEADER}  ${MAP_BUTTON}  ${SATELLITE_BUTTON}
                         ...      ${EXPORT_ICON}  ${FULL_SCREEN_ICON}  ${CHOOSE_LOCATION_OPTION}  ${LOCATE_ME_OPTION}  ${NEW_LOCATION_OPTION}
                         ...      ${PLEASE_SELECT_LOCATION_DROPDOWN}  ${MAPS_COLLAPSE_ICON}   ${MY_LOCATION_CHIP}  ${LOCATION_CLEAR_ICON}
#                         ...      ${DASHBOARD_REFRESH_BUTTON}  ${DASHBOARD_SHARE_BUTTON}  ${DASHBOARD_3DOTS_BUTTON}   #651 site has refresh and share options
    @{My_Current_Location_Locators_UAT} =     Create List    ${ADDRESS_LINE1}    ${ADDRESS_LINE2}   ${ADDRESS_LINE3}   ${CITY}  ${POSTCODE}
                         ...      ${COUNTRY}   ${REGION}   ${LATITUDE}    ${LONGITUDE}  ${MAP_BUTTON}  ${SATELLITE_BUTTON}
                         ...      ${EXPORT_ICON}  ${FULL_SCREEN_ICON}  ${CLEAR_MY_CURRENT_LOCATION}
#    @{My_Current_Location_Locators_PROD} =     Create List    ${ADDRESS_LINE1}    ${ADDRESS_LINE2}   ${ADDRESS_LINE3}   ${CITY}  ${POSTCODE}
#                         ...      ${AREA}   ${LATITUDE}    ${LONGITUDE}  ${MAP_BUTTON}  ${SATELLITE_BUTTON}
#                         ...      ${EXPORT_ICON}  ${FULL_SCREEN_ICON}  ${CLEAR_MY_CURRENT_LOCATION}
    Run Keyword If    ${locate_me} == True   WAIT UNTIL ELEMENT IS VISIBLE  ${MY_LOCATION_CHIP}
    Run Keyword If    ${locate_me} == True   General.Verify_Elements_In_Page  @{Locate_Me_Locators}
    Run Keyword If    ${locate_me} == False   INPUT TEXT  ${MY_CURRENT_LOCATION_NAME}  ${Location_Name}
    sleep  1
    capture page screenshot
#    Run Keyword If    ${locate_me} == False and '${env}' == 'uat'  General.Verify_Elements_In_Page  @{My_Current_Location_Locators_UAT}
#    Run Keyword If    ${locate_me} == False and '${env}' == 'production'  General.Verify_Elements_In_Page  @{My_Current_Location_Locators_PROD}
    Run Keyword If    ${locate_me} == False   General.Verify_Elements_In_Page  @{My_Current_Location_Locators_UAT}

Verify Cost Slideout And Its Elements
    [Documentation]    Verifies elements on the cost slideout.
    @{Add_Cost_Locators} =     Create List    ${HOW_MANY_PRODUCTS_QUESTIONS}    ${PRODUCT_COUNT_DECREMENT}   ${PRODUCT_COUNT}
                         ...      ${PRODUCT_COUNT_INCREMENT}   ${TOTAL_AMOUNT}   ${TOTAL_RECOVERED}    ${TOTAL_DAMAGED}
                         ...      ${COST_CANCEL_BUTTON}   ${COST_CONFIRM_BUTTON}   ${COST_CATEGORY_DROPDOWN}   ${COST_BRAND_TEXT_BOX}
                         ...      ${COST_NAME_TEXT_BOX}   ${COST_CODE_TEXT_BOX}   ${COST_VALUE_TEXT_BOX}   ${COST_QUANTITY_TEXT_BOX}
                         ...      ${COST_RECOVERED_TEXT_BOX}   ${COST_DAMAGED_TEXT_BOX}   ${COST_REMOVE_BUTTON}   ${COST_COPY_BUTTON}
                         ...      ${COST_SUBTOTAL_LABEL}   ${COST_SUBTOTAL_VALUE}   ${COST_SUB_RECOVERED_VALUE}   ${COST_SUB_DAMAGED_VALUE}
    capture page screenshot
    General.Verify_Elements_In_Page  @{Add_Cost_Locators}

Click On Confirm Button In Add Cost Slideout
    capture page screenshot
    wait until element is visible   ${COST_CONFIRM_BUTTON}
    click element  ${COST_CONFIRM_BUTTON}

Click On Cancel Button In Add Cost Slideout
    capture page screenshot
    wait until element is visible   ${COST_CANCEL_BUTTON}
    click element  ${COST_CANCEL_BUTTON}

Verify Popup And Select Yes Leave Option
    wait until element is visible  ${SURE_TO_EXIT_POPUP}
    wait until element is visible  ${UNSAVED_CHANGES_MESSAGE}
    click element  ${YES_LEAVE_OPTION}

Increment The Product Number
    Wait Until Element Is Visible    ${PRODUCT_COUNT_INCREMENT}  10   Product count increment + button is not shown
    sleep  0.5
    CLICK ELEMENT  ${PRODUCT_COUNT_INCREMENT}
    sleep  0.5

Select Any Cost Category
    Wait Until Element Is Visible    ${COST_CATEGORY_DROPDOWN}  30   Cost category dropdown is not shown
    click element  ${COST_CATEGORY_DROPDOWN}
    sleep  0.5
    wait until element is visible    ${COST_CATEGORY_OPTIONS}       10     No Cost Category option is shown
    ${Cost_Category}  get text  ${COST_CATEGORY_OPTIONS}
    click element    ${COST_CATEGORY_OPTIONS}
    log to console  Selected cost category is "${Cost_Category}"
    set suite variable  ${Selected_Cost_Category}  ${Cost_Category}
    [Return]   ${Cost_Category}

Enter Brand Name
    scroll element into view  ${COST_BRAND_TEXT_BOX}
    ${Current_Time} =    Get Current Date   increment=00:00:00  result_format=%m-%d_%H-%M-%S
    ${Brand_Name}  set variable    Automated BrandName @ ${Current_Time}
    wait until element is visible  ${COST_BRAND_TEXT_BOX}
    input text  ${COST_BRAND_TEXT_BOX}  ${Brand_Name}
    log to console  Added brand name is "${Brand_Name}"
    ${VALUE}  GET VALUE  ${COST_BRAND_TEXT_BOX}
    LOG TO CONSOLE  =====brand name=${VALUE}=========
    set suite variable  ${Added_Brand_Name}  ${Brand_Name}
    [Return]   ${Brand_Name}

Enter Product Name
    scroll element into view  ${COST_NAME_TEXT_BOX}
    ${Current_Time} =    Get Current Date   increment=00:00:00  result_format=%m-%d_%H-%M-%S
    ${Product_Name}  set variable    Automated Name @ ${Current_Time}
    wait until element is visible  ${COST_NAME_TEXT_BOX}
    input text  ${COST_NAME_TEXT_BOX}  ${Product_Name}
    log to console  Added product name is "${Product_Name}"
    set suite variable  ${Added_Product_Name}  ${Product_Name}
    [Return]  ${Product_Name}

Enter Product Code
    scroll element into view  ${COST_CODE_TEXT_BOX}
    ${Product_Code}=    Generate Random String    10    [NUMBERS] [UPPERCASE] [LOWERCASE]
    wait until element is visible  ${COST_CODE_TEXT_BOX}
    input text  ${COST_CODE_TEXT_BOX}  ${Product_Code}
    log to console  Added product Code is "${Product_Code}"
    set suite variable  ${Added_Product_Code}  ${Product_Code}
    [Return]  ${Product_Code}

Enter Product Value
    scroll element into view  ${COST_VALUE_TEXT_BOX}
    ${Product_Value}=    Evaluate    round(random.uniform(0, 9), 2)
    wait until element is visible  ${COST_VALUE_TEXT_BOX}
    input text  ${COST_VALUE_TEXT_BOX}  123456789012345678
    run keyword and warn on failure  wait until page contains element  ${COST_VALUE_CHARACTER_LIMIT_ERROR}  10  Cost Value characters limit error is not shown
    capture page screenshot
    input text  ${COST_VALUE_TEXT_BOX}  ${Product_Value}
    log to console  Added product value is "${Product_Value}"
    set suite variable  ${Added_Product_Value}  ${Product_Value}
    [Return]  ${Product_Value}

Enter Product Quantity
    scroll element into view  ${COST_QUANTITY_TEXT_BOX}
    ${Product_Quantity}=    Evaluate    random.randint(1, 5)
    wait until element is visible  ${COST_QUANTITY_TEXT_BOX}
    input text  ${COST_QUANTITY_TEXT_BOX}  1234
    run keyword and warn on failure  wait until page contains element  ${COST_QUANTITY_CHARACTER_LIMIT_ERROR}  10  Cost Quantity characters limit error is not shown
    capture page screenshot
    input text  ${COST_QUANTITY_TEXT_BOX}  ${Product_Quantity}
    log to console  Added product quantity is "${Product_Quantity}"
    set suite variable  ${Added_Product_Quantity}  ${Product_Quantity}
    [Return]  ${Product_Quantity}

Verify Subtotal of Product
    sleep  1
    ${Actual_Cost_With_Currency_Code}=    Get Text   ${COST_SUBTOTAL_VALUE}
    ${Actual_Cost}   Get Cost Without Currency Code  ${Actual_Cost_With_Currency_Code}
    ${Expected_Cost}=    Evaluate    ${Added_Product_Value} * ${Added_Product_Quantity}
    log to console  Actual_Sub_Total='${Actual_Cost}',Expected_Sub_Total='${Expected_Cost}'
    should be equal as numbers    ${Actual_Cost}    ${Expected_Cost}   Displayed Total subcost is not same as expected
    [Return]   ${Actual_Cost}

Enter Product Recovered Quantity
    scroll element into view  ${COST_RECOVERED_TEXT_BOX}
    ${Recovered_Quantity}=    Evaluate    random.randint(1, ${Added_Product_Quantity})
    wait until element is visible  ${COST_RECOVERED_TEXT_BOX}
    input text  ${COST_RECOVERED_TEXT_BOX}  ${Recovered_Quantity}
    log to console  Added product recovered quantity is "${Recovered_Quantity}"
    set suite variable  ${Added_Recovered_Quantity}  ${Recovered_Quantity}
    [Return]  ${Recovered_Quantity}

Verify Recovered Subtotal of Product
    sleep  1
    ${Actual_Cost_With_Currency_Code}=    Get Text   ${COST_SUB_RECOVERED_VALUE}
    ${Actual_Cost}   Get Cost Without Currency Code  ${Actual_Cost_With_Currency_Code}
    ${Expected_Cost}=    Evaluate    ${Added_Product_Value} * ${Added_Recovered_Quantity}
    log to console  Actual_Recovered Subtotal='${Actual_Cost}',Expected_Recovered Subtotal='${Expected_Cost}'
    should be equal as numbers    ${Actual_Cost}    ${Expected_Cost}   Displayed Recovered Subtotal cost is not same as expected
    [Return]   ${Actual_Cost}

Enter Product Damaged Quantity
    scroll element into view  ${COST_DAMAGED_TEXT_BOX}
    ${Damaged_Quantity}=    Evaluate    random.randint(1, ${Added_Recovered_Quantity})
    wait until element is visible  ${COST_DAMAGED_TEXT_BOX}
    input text  ${COST_DAMAGED_TEXT_BOX}  ${Damaged_Quantity}
    log to console  Added product damaged quantity is "${Damaged_Quantity}"
    set suite variable  ${Added_Damaged_Quantity}  ${Damaged_Quantity}
    capture page screenshot
    [Return]  ${Damaged_Quantity}

Verify Damaged Subtotal of Product
    sleep  1
    ${Actual_Cost_With_Currency_Code}=    Get Text   ${COST_SUB_DAMAGED_VALUE}
    ${Actual_Cost}   Get Cost Without Currency Code  ${Actual_Cost_With_Currency_Code}
    ${Expected_Cost}=    Evaluate    ${Added_Product_Value} * ${Added_Damaged_Quantity}
    log to console  Actual_Damaged Subtotal='${Actual_Cost}',Expected_Damaged Subtotal='${Expected_Cost}'
    should be equal as numbers    ${Actual_Cost}    ${Expected_Cost}   Displayed Total Damaged Subtotal is not same as expected
    [Return]   ${Actual_Cost}

Verify Total Amount Of Products
    sleep  1
    ${Actual_Cost_With_Currency_Code}=    Get Text   ${TOTAL_AMOUNT}
    ${Actual_Cost}   Get Cost Without Currency Code  ${Actual_Cost_With_Currency_Code}
    ${Expected_Cost}=    Calculate Total Cost Of Products from Subtotals
    log to console  Actual_Total Amount='${Actual_Cost}',Expected_Total Amount='${Expected_Cost}'
    should be equal as numbers    ${Actual_Cost}    ${Expected_Cost}   Displayed Total Amount is not same as expected
    [Return]   ${Actual_Cost}

Calculate Total Cost Of Products from Subtotals
    ${subtotals}    Get WebElements     ${COST_SUBTOTAL_VALUE}
    ${Total}  set variable  0
    FOR    ${subtotal}    IN    @{subtotals}
         sleep  1
         scroll element into view  ${subtotal}
         sleep  1
         ${cost_with_currency}=    Get Text    ${subtotal}
         ${cost}   Get Cost Without Currency Code  ${cost_with_currency}
         ${Total}  evaluate  ${Total} + ${cost}
    END
    log to console  Total Cost Of Products from Subtotals=${Total}
    [Return]   ${Total}

Verify Total Amount Of Recovered Products
    sleep  1
    ${Actual_Cost_With_Currency_Code}=    Get Text   ${TOTAL_RECOVERED}
    ${Actual_Cost}   Get Cost Without Currency Code  ${Actual_Cost_With_Currency_Code}
    ${Expected_Cost}=    Calculate Total Cost Of Recovered Products from Subtotals
    log to console  Actual_Total Amount Of Recovered='${Actual_Cost}',Expected_Total Amount Of Recovered='${Expected_Cost}'
    should be equal as numbers    ${Actual_Cost}    ${Expected_Cost}   Displayed Total Amount Of Recovered is not same as expected
    [Return]   ${Actual_Cost}

Calculate Total Cost Of Recovered Products from Subtotals
    ${subtotals}    Get WebElements     ${COST_SUB_RECOVERED_VALUE}
    ${Total}  set variable  0
    FOR    ${subtotal}    IN    @{subtotals}
         sleep  1
         scroll element into view  ${subtotal}
         sleep  1
         ${cost_with_currency}=    Get Text    ${subtotal}
         ${cost}   Get Cost Without Currency Code  ${cost_with_currency}
         ${Total}  evaluate  ${Total} + ${cost}
    END
    log to console  Total Cost Of Recovered Products from Subtotals=${Total}
    [Return]   ${Total}

Verify Total Amount Of Damaged Products
    sleep  1
    ${Actual_Cost_With_Currency_Code}=    Get Text   ${TOTAL_DAMAGED}
    ${Actual_Cost}   Get Cost Without Currency Code  ${Actual_Cost_With_Currency_Code}
    ${Expected_Cost}=    Calculate Total Cost Of Damaged Products from Subtotals
    log to console  Actual_Total Amount Of Damaged='${Actual_Cost}',Expected_Total Amount Of Damaged='${Expected_Cost}'
    should be equal as numbers    ${Actual_Cost}    ${Expected_Cost}   Displayed Total Amount Of Damaged is not same as expected
    [Return]   ${Actual_Cost}

Calculate Total Cost Of Damaged Products from Subtotals
    ${subtotals}    Get WebElements     ${COST_SUB_DAMAGED_VALUE}
    ${Total}  set variable  0
    FOR    ${subtotal}    IN    @{subtotals}
         sleep  1
         scroll element into view  ${subtotal}
         sleep  1
         ${cost_with_currency}=    Get Text    ${subtotal}
         ${cost}   Get Cost Without Currency Code  ${cost_with_currency}
         ${Total}  evaluate  ${Total} + ${cost}
    END
    log to console  Total Cost Of Damaged Products from Subtotals=${Total}
    [Return]   ${Total}

Click On Copy Button of Cost
    wait until element is visible  ${COST_COPY_BUTTON}
    click element  ${COST_COPY_BUTTON}
    sleep  2

Click On Remove Button of Cost
    wait until element is visible  ${COST_REMOVE_BUTTON}
    click element  ${COST_REMOVE_BUTTON}
    sleep  2

Validate Yes Option Is Selected For Cost Question
    scroll element into view   ${COST_YES_OPTION}
    wait until page contains element  ${COST_YES_OPTION}  15
    element attribute value should be  ${COST_YES_OPTION}  value  true  Cost question is not selected with Yes option as expected

Verify Subtotal of Product In Workflow
    [Arguments]   ${Cost_In_Slideout}
    sleep  1
    scroll element into view   ${COST_SUBTOTAL_AMOUNT_IN_WORKFLOW}
    ${Actual_Cost_With_Currency_Code}=    Get Text   ${COST_SUBTOTAL_AMOUNT_IN_WORKFLOW}
    ${Actual_Cost}   Get Cost Without Currency Code  ${Actual_Cost_With_Currency_Code}
    should be equal as numbers    ${Actual_Cost}    ${Cost_In_Slideout}   Displayed subcost in Workflow is not same as Subcost added in Add Cost slideout
    log to console  Displayed subcost in Workflow is same as Subcost added in Add Cost slideout '${Actual_Cost}'='${Cost_In_Slideout}'

Verify Sub Recovered of Product In Workflow
    [Arguments]   ${Cost_In_Slideout}
    sleep  1
    scroll element into view   ${COST_SUB_RECOVERED_AMOUNT_IN_WORKFLOW}
    ${Actual_Cost_With_Currency_Code}=    Get Text   ${COST_SUB_RECOVERED_AMOUNT_IN_WORKFLOW}
    ${Actual_Cost}   Get Cost Without Currency Code  ${Actual_Cost_With_Currency_Code}
    should be equal as numbers    ${Actual_Cost}    ${Cost_In_Slideout}   Displayed sub recovered cost in Workflow is not same as Sub damaged cost added in Add Cost slideout
    log to console  Displayed sub recovered cost in Workflow is same as Sub recovered cost added in Add Cost slideout '${Actual_Cost}'='${Cost_In_Slideout}'

Verify Sub Damaged of Product In Workflow
    [Arguments]   ${Cost_In_Slideout}
    sleep  1
    scroll element into view    ${COST_SUB_DAMAGED_AMOUNT_IN_WORKFLOW}
    ${Actual_Cost_With_Currency_Code}=    Get Text   ${COST_SUB_DAMAGED_AMOUNT_IN_WORKFLOW}
    ${Actual_Cost}   Get Cost Without Currency Code  ${Actual_Cost_With_Currency_Code}
    should be equal as numbers    ${Actual_Cost}    ${Cost_In_Slideout}   Displayed sub damaged cost in Workflow is not same as Sub damaged cost added in Add Cost slideout
    log to console  Displayed sub damaged cost in Workflow is same as Sub damaged cost added in Add Cost slideout '${Actual_Cost}'='${Cost_In_Slideout}'

Verify Total of Product In Workflow
    [Arguments]   ${Cost_In_Slideout}
    sleep  1
    scroll element into view   ${TOTAL_COST_AMOUNT_IN_WORKFLOW}
    ${Actual_Cost_With_Currency_Code}=    Get Text   ${TOTAL_COST_AMOUNT_IN_WORKFLOW}
    ${Actual_Cost}   Get Cost Without Currency Code  ${Actual_Cost_With_Currency_Code}
    should be equal as numbers    ${Actual_Cost}    ${Cost_In_Slideout}   Displayed total cost in Workflow is not same as total cost added in Add Cost slideout
    log to console  Displayed Total in Workflow is same as Total in Add Cost slideout '${Actual_Cost}'='${Cost_In_Slideout}'

Verify Total Recovered of Product In Workflow
    [Arguments]   ${Cost_In_Slideout}
    sleep  1
    scroll element into view   ${TOTAL_RECOVERED_COST_AMOUNT_IN_WORKFLOW}
    ${Actual_Cost_With_Currency_Code}=    Get Text   ${TOTAL_RECOVERED_COST_AMOUNT_IN_WORKFLOW}
    ${Actual_Cost}   Get Cost Without Currency Code  ${Actual_Cost_With_Currency_Code}
    should be equal as numbers    ${Actual_Cost}    ${Cost_In_Slideout}   Displayed total recovered cost in Workflow is not same as total recovered cost added in Add Cost slideout
    log to console  Displayed Total Recovered in Workflow is same as Total recovered in Add Cost slideout '${Actual_Cost}'='${Cost_In_Slideout}'

Verify Total Damaged of Product In Workflow
    [Arguments]   ${Cost_In_Slideout}
    sleep  1
    scroll element into view   ${TOTAL_DAMAGED_COST_AMOUNT_IN_WORKFLOW}
    ${Actual_Cost_With_Currency_Code}=    Get Text   ${TOTAL_DAMAGED_COST_AMOUNT_IN_WORKFLOW}
    ${Actual_Cost}   Get Cost Without Currency Code  ${Actual_Cost_With_Currency_Code}
    should be equal as numbers    ${Actual_Cost}    ${Cost_In_Slideout}   Displayed total recovered cost in Workflow is not same as total recovered cost added in Add Cost slideout
    log to console  Displayed Total Damaged in Workflow is same as Total damaged in Add Cost slideout '${Actual_Cost}'='${Cost_In_Slideout}'

Verify Fields Under Add Cost Question In Workflow
    @{Add_Cost_Fields} =     Create List    ${COST_DETAIL_CONTAINER}    ${TOTAL_COST_AMOUNT_IN_WORKFLOW}   ${TOTAL_RECOVERED_COST_AMOUNT_IN_WORKFLOW}
                         ...      ${TOTAL_DAMAGED_COST_AMOUNT_IN_WORKFLOW }   ${COST_EDIT_BUTTON_IN_WORKFLOW}   ${COST_CATEGORY_IN_WORKFLOW}    ${COST_BRAND_IN_WORKFLOW}
                         ...      ${COST_NAME_IN_WORKFLOW}   ${COST_CODE_IN_WORKFLOW}   ${COST_VALUE_IN_WORKFLOW}   ${COST_QUANTITY_IN_WORKFLOW}   ${COST_RECOVERED_IN_WORKFLOW}
                         ...      ${COST_DAMAGED_IN_WORKFLOW}   ${COST_SUBTOTAL_AMOUNT_IN_WORKFLOW}   ${COST_SUB_RECOVERED_AMOUNT_IN_WORKFLOW}   ${COST_SUB_DAMAGED_AMOUNT_IN_WORKFLOW}

    capture page screenshot
    General.Verify_Elements_In_Page  @{Add_Cost_Fields}
    
Verify Cost Category In Workflow
    [Arguments]   ${Category_In_Slideout}
    ${Category_In_Workflow}  GET VALUE  ${COST_CATEGORY_IN_WORKFLOW}
    should be equal as strings  ${Category_In_Workflow}  ${Category_In_Slideout}  Category_In_Workflow='${Category_In_Workflow}' is not equal to Category_In_Slideout='${Category_In_Slideout}'
    log to console  Category_In_Workflow='${Category_In_Workflow}' & Category_In_Slideout='${Category_In_Slideout}'

Verify Brand Name In Workflow
    [Arguments]   ${Brand_In_Slideout}
    ${Brand_In_Workflow}  GET VALUE  ${COST_BRAND_IN_WORKFLOW}
    should be equal as strings  ${Brand_In_Workflow}  ${Brand_In_Slideout}  Brand_In_Workflow='${Brand_In_Workflow}' is not equal to Brand_In_Slideout='${Brand_In_Slideout}'
    log to console  Brand_In_Workflow='${Brand_In_Workflow}' & Brand_In_Slideout='${Brand_In_Slideout}'

Verify Product Name In Workflow
    [Arguments]   ${ProductName_In_Slideout}
    ${ProductName_In_Workflow}  GET VALUE  ${COST_NAME_IN_WORKFLOW}
    should be equal as strings  ${ProductName_In_Workflow}  ${ProductName_In_Slideout}  ProductName_In_Workflow='${ProductName_In_Workflow}' is not equal to ProductName_In_Slideout='${ProductName_In_Slideout}'
    log to console  ProductName_In_Workflow='${ProductName_In_Workflow}' & ProductName_In_Slideout='${ProductName_In_Slideout}'

Verify Product Code In Workflow
    [Arguments]   ${ProductCode_In_Slideout}
    ${ProductCode_In_Workflow}  GET VALUE  ${COST_CODE_IN_WORKFLOW}
    should be equal as strings  ${ProductCode_In_Workflow}  ${ProductCode_In_Slideout}  ProductCode_In_Workflow='${ProductCode_In_Workflow}' is not equal to ProductCode_In_Slideout='${ProductCode_In_Slideout}'
    log to console  ProductCode_In_Workflow='${ProductCode_In_Workflow}' & ProductCode_In_Slideout='${ProductCode_In_Slideout}'

Verify Product Value In Workflow
    [Arguments]   ${ProductValue_In_Slideout}
    ${ProductValue_In_Workflow}  GET VALUE  ${COST_VALUE_IN_WORKFLOW}
    ${ProductValue_In_Slideout}=    Convert To String    ${ProductValue_In_Slideout}
    ${COST_VALUE_IN_WORKFLOW}=    Convert To String    ${COST_VALUE_IN_WORKFLOW}
    Should Be Equal As Numbers  ${ProductValue_In_Workflow}  ${ProductValue_In_Slideout}  ProductValue_In_Workflow='${ProductValue_In_Workflow}' is not equal to ProductValue_In_Slideout='${ProductValue_In_Slideout}'
    log to console  ProductValue_In_Workflow='${ProductValue_In_Workflow}' & ProductValue_In_Slideout='${ProductValue_In_Slideout}'

Verify Product Quantity In Workflow
    [Arguments]   ${ProductQuantity_In_Slideout}
    ${ProductQuantity_In_Workflow}  GET VALUE  ${COST_QUANTITY_IN_WORKFLOW}
    should be equal as strings  ${ProductQuantity_In_Workflow}  ${ProductQuantity_In_Slideout}  ProductQuantity_In_Workflow='${ProductQuantity_In_Workflow}' is not equal to ProductQuantity_In_Slideout='${ProductQuantity_In_Slideout}'
    log to console  ProductQuantity_In_Workflow='${ProductQuantity_In_Workflow}' & ProductQuantity_In_Slideout='${ProductQuantity_In_Slideout}'

Verify Product Recovered In Workflow
    [Arguments]   ${ProductRecovered_In_Slideout}
    ${ProductRecovered_In_Workflow}  GET VALUE  ${COST_RECOVERED_IN_WORKFLOW}
    should be equal as strings  ${ProductRecovered_In_Workflow}  ${ProductRecovered_In_Slideout}  ProductRecovered_In_Workflow='${ProductRecovered_In_Workflow}' is not equal to ProductRecovered_In_Slideout='${ProductRecovered_In_Slideout}'
    log to console  ProductRecovered_In_Workflow='${ProductRecovered_In_Workflow}' & ProductRecovered_In_Slideout='${ProductRecovered_In_Slideout}'

Verify Product Damaged In Workflow
    [Arguments]   ${ProductDamaged_In_Slideout}
    ${ProductDamaged_In_Workflow}  GET VALUE  ${COST_DAMAGED_IN_WORKFLOW}
    should be equal as strings  ${ProductDamaged_In_Workflow}  ${ProductDamaged_In_Slideout}  ProductDamaged_In_Workflow='${ProductDamaged_In_Workflow}' is not equal to ProductDamaged_In_Slideout='${ProductDamaged_In_Slideout}'
    log to console  ProductDamaged_In_Workflow='${ProductDamaged_In_Workflow}' & ProductDamaged_In_Slideout='${ProductDamaged_In_Slideout}'

Click On Link Resource Button
    wait until element is visible  ${EVENT_LINK_RESOURCES_BUTTON}  10  Link Resource Button is not shown in Event overview page
    click element  ${EVENT_LINK_RESOURCES_BUTTON}

Validate Add To Event Popup Is Shown
    wait until element is visible  ${ADD_TO_EVENT_POPUP}   15  Add To Event Popup is not shown

Select Costs Option
    wait until element is visible  ${COSTS_OPTION}  10  Cost(s) option is not shown in Add To Event Popup
    click element  ${COSTS_OPTION}

Validate Add Cost Slideout Is Shown
    wait until element is visible  ${ADD_COST_SLIDEOUT_TITLE}   15  Add Cost slideout is not shown

Validate Edit Cost Slideout Is Shown
    wait until element is visible  ${EDIT_COST_SLIDEOUT_TITLE}   15  Add Cost slideout is not shown

Go To Add Cost Slideout From Event Overview Page
    Wait Until Element Is Visible    ${EVENT_LOCATION_WIDGET}  50   LOcation widget is not shown in Add new event Page
#    Click On App Logo Button
#    sleep  5
#    go back
#    reload page and allow location access
    Click On Link Resource Button
    FOR    ${i}    IN RANGE    1    10
        sleep  2
        Validate Add To Event Popup Is Shown
        ${shown}  run keyword and return status  element should be visible  ${COSTS_OPTION}
        run keyword if    '${shown}'=='True'    exit for loop
        press keys    None     ESC
        Click On Refresh Button In Event Overview Page
        sleep  10
        Click On Link Resource Button
    END
    Select Costs Option
    Validate Add Cost Slideout Is Shown

Click On Edit Button In Event Overview Page
    Wait Until Element Is Visible    ${EVENT_EDIT_BUTTON}  30   Event header is not shown in Add new event Page
    click element  ${EVENT_EDIT_BUTTON}

Go To Add Cost Slideout While Editing Event
    FOR    ${i}    IN RANGE    1    8
        wait until page contains element  ${SUBMIT_BUTTON}  25
        ${costquestion}       Run Keyword And Return Status    page should contain element  ${ADD_COST_TO_INCIDENT_LABEL}
        Run Keyword If    ${costquestion} == True   exit for loop
        Run Keyword If    ${costquestion} == False   click on next button
        Run Keyword If    ${i} == 7 and ${costquestion} == False   Reload Page And Allow Location Access
        Run Keyword If    ${i} == 7 and ${costquestion} == False   Fail  Failed to view cost question for event
    END

Get The Count of Products In Add Cost Slideout
    wait until element is visible  ${PRODUCT_COUNT}
    ${count}  GET VALUE  ${PRODUCT_COUNT}
    [Return]   ${count}

Verify Cost Category In Add Cost Slideout
    [Arguments]   ${Category_Added}
    ${Category_Present}  GET VALUE  ${COST_CATEGORY_DROPDOWN}
    should be equal as strings  ${Category_Present}  ${Category_Added}  Category_Present='${Category_Present}' is not equal to Category_Added='${Category_Added}'
    log to console  Category_Present='${Category_Present}' & Category_Added='${Category_Added}'

Verify Brand Name In Add Cost Slideout
    [Arguments]   ${Brand_Added}
    ${Brand_Present}  GET VALUE  ${COST_BRAND_TEXT_BOX}
    should be equal as strings  ${Brand_Present}  ${Brand_Added}  Brand_Present='${Brand_Present}' is not equal to Brand_Added='${Brand_Added}'
    log to console  Brand_Present='${Brand_Present}' & Brand_Added='${Brand_Added}'

Verify Product Name In Add Cost Slideout
    [Arguments]   ${Product_Added}
    ${Product_Present}  GET VALUE  ${COST_NAME_TEXT_BOX}
    should be equal as strings  ${Product_Present}  ${Product_Added}  Product_Present='${Product_Present}' is not equal to Product_Added='${Product_Added}'
    log to console  Product_Present='${Product_Present}' & Product_Added='${Product_Added}'

Verify Product Code In Add Cost Slideout
    [Arguments]   ${Code_Added}
    ${Code_Present}  GET VALUE  ${COST_CODE_TEXT_BOX}
    should be equal as strings  ${Code_Present}  ${Code_Added}  Code_Present='${Code_Present}' is not equal to Code_Added='${Code_Added}'
    log to console  Code_Present='${Code_Present}' & Code_Added='${Code_Added}'

Verify Product Value In Add Cost Slideout
    [Arguments]   ${Value_Added}
    ${Value_Present}  GET VALUE  ${COST_VALUE_TEXT_BOX}
    ${Value_Present}=    Convert To String    ${Value_Present}
    ${Value_Added}=    Convert To String    ${Value_Added}
    Should Be Equal As Numbers    ${Value_Present}  ${Value_Added}  Value_Present='${Value_Present}' is not equal to Value_Added='${Value_Added}'
    log to console  Value_Present='${Value_Present}' & Value_Added='${Value_Added}'

Verify Product Quantity In Add Cost Slideout
    [Arguments]   ${Quantity_Added}
    ${Quantity_Present}  GET VALUE  ${COST_QUANTITY_TEXT_BOX}
    should be equal as strings  ${Quantity_Present}  ${Quantity_Added}  Quantity_Present='${Quantity_Present}' is not equal to Quantity_Added='${Quantity_Added}'
    log to console  Quantity_Present='${Quantity_Present}' & Quantity_Added='${Quantity_Added}'

Verify Product Recovered In Add Cost Slideout
    [Arguments]   ${Recovered_Added}
    ${Recovered_Present}  GET VALUE  ${COST_RECOVERED_TEXT_BOX}
    should be equal as strings  ${Recovered_Present}  ${Recovered_Added}  Recovered_Present='${Recovered_Present}' is not equal to Recovered_Added='${Recovered_Added}'
    log to console  Recovered_Present='${Recovered_Present}' & Recovered_Added='${Recovered_Added}'

Verify Product Damaged In Add Cost Slideout
    [Arguments]   ${Damaged_Added}
    ${Damaged_Present}  GET VALUE  ${COST_DAMAGED_TEXT_BOX}
    should be equal as strings  ${Damaged_Present}  ${Damaged_Added}  Damaged_Present='${Damaged_Present}' is not equal to Damaged_Added='${Damaged_Added}'
    log to console  Damaged_Present='${Damaged_Present}' & Damaged_Added='${Damaged_Added}'

Verify Subtotal of Product In Add Cost Slideout
    [Arguments]   ${Cost_In_Slideout}
    sleep  1
    scroll element into view   ${COST_SUBTOTAL_VALUE}
    ${Actual_Cost_With_Currency_Code}=    Get Text   ${COST_SUBTOTAL_VALUE}
    ${Actual_Cost}   Get Cost Without Currency Code  ${Actual_Cost_With_Currency_Code}
    should be equal as numbers    ${Actual_Cost}    ${Cost_In_Slideout}   Displayed subcost in Add Cost slideout is not same as Subcost added in Add Cost slideout
    log to console  Displayed subcost in Add Cost slideout is same as Subcost added in Add Cost slideout '${Actual_Cost}'='${Cost_In_Slideout}'

Verify Sub Recovered of Product In Add Cost Slideout
    [Arguments]   ${Cost_In_Slideout}
    sleep  1
    scroll element into view   ${COST_SUB_RECOVERED_VALUE}
    ${Actual_Cost_With_Currency_Code}=    Get Text   ${COST_SUB_RECOVERED_VALUE}
    ${Actual_Cost}   Get Cost Without Currency Code  ${Actual_Cost_With_Currency_Code}
    should be equal as numbers    ${Actual_Cost}    ${Cost_In_Slideout}   Displayed sub recovered cost in Add Cost slideout is not same as Sub damaged cost added in Add Cost slideout
    log to console  Displayed sub recovered cost in Add Cost slideout is same as Sub recovered cost added in Add Cost slideout '${Actual_Cost}'='${Cost_In_Slideout}'

Verify Sub Damaged of Product In Add Cost Slideout
    [Arguments]   ${Cost_In_Slideout}
    sleep  1
    scroll element into view    ${COST_SUB_DAMAGED_VALUE}
    ${Actual_Cost_With_Currency_Code}=    Get Text   ${COST_SUB_DAMAGED_VALUE}
    ${Actual_Cost}   Get Cost Without Currency Code  ${Actual_Cost_With_Currency_Code}
    should be equal as numbers    ${Actual_Cost}    ${Cost_In_Slideout}   Displayed sub damaged cost in Add Cost slideout is not same as Sub damaged cost added in Add Cost slideout
    log to console  Displayed sub damaged cost in Add Cost slideout is same as Sub damaged cost added in Add Cost slideout '${Actual_Cost}'='${Cost_In_Slideout}'

Verify Total of Product In Add Cost Slideout
    [Arguments]   ${Cost_In_Slideout}
    sleep  1
    scroll element into view   ${TOTAL_AMOUNT}
    ${Actual_Cost_With_Currency_Code}=    Get Text   ${TOTAL_AMOUNT}
    ${Actual_Cost}   Get Cost Without Currency Code  ${Actual_Cost_With_Currency_Code}
    should be equal as numbers    ${Actual_Cost}    ${Cost_In_Slideout}   Displayed total cost in Add Cost slideout is not same as total cost added in Add Cost slideout
    log to console  Displayed Total in Add Cost slideout is same as Total in Add Cost slideout '${Actual_Cost}'='${Cost_In_Slideout}'

Verify Total Recovered of Product In Add Cost Slideout
    [Arguments]   ${Cost_In_Slideout}
    sleep  1
    scroll element into view   ${TOTAL_RECOVERED}
    ${Actual_Cost_With_Currency_Code}=    Get Text   ${TOTAL_RECOVERED}
    ${Actual_Cost}   Get Cost Without Currency Code  ${Actual_Cost_With_Currency_Code}
    should be equal as numbers    ${Actual_Cost}    ${Cost_In_Slideout}   Displayed total recovered cost in Add Cost slideout is not same as total recovered cost added in Add Cost slideout
    log to console  Displayed Total Recovered in Add Cost slideout is same as Total recovered in Add Cost slideout '${Actual_Cost}'='${Cost_In_Slideout}'

Verify Total Damaged of Product In Add Cost Slideout
    [Arguments]   ${Cost_In_Slideout}
    sleep  1
    scroll element into view   ${TOTAL_DAMAGED}
    ${Actual_Cost_With_Currency_Code}=    Get Text   ${TOTAL_DAMAGED}
    ${Actual_Cost}   Get Cost Without Currency Code  ${Actual_Cost_With_Currency_Code}
    should be equal as numbers    ${Actual_Cost}    ${Cost_In_Slideout}   Displayed total recovered cost in Add Cost slideout is not same as total recovered cost added in Add Cost slideout
    log to console  Displayed Total Damaged in Add Cost slideout is same as Total damaged in Add Cost slideout '${Actual_Cost}'='${Cost_In_Slideout}'

Verify Event Edited Successfully
    run keyword and continue on failure  wait until page contains  successfully been edited   30   Toast message not shown after submitting event creation
    capture page screenshot
    wait until element is visible      ${EVENT_ID}   30   Failed to see incident id, hence failed to create new event
    ${ID} =   get text   ${EVENT_ID}
    log to console  Edited event id '${ID}'

Click On Refresh Button In Event Overview Page
    wait until element is visible  ${EVENT_REFRESH_BUTTON}  10  Refresh button in event overview page is not shown
    click element  ${EVENT_REFRESH_BUTTON}

Click On App Logo Button
    wait until element is visible  ${APP_LOGO}  25  App Logo is not shown
    click element   ${APP_LOGO}

Add Date And Time Of Event
    [Arguments]   ${Date of Entry}=01/01/2020 12:34
    scroll element into view   ${DATETIME_OF_EVENT_DROPDOWN}
    sleep  1
    wait until element is visible   ${DATETIME_OF_EVENT_LABEL}   5
    click element   ${DATETIME_OF_EVENT_LABEL}
    Set_Date_And_Time  ${Date of Entry}
    [Return]   ${Date of Entry}

Get Selected Date And Time Of Event
    scroll element into view    ${DATETIME_OF_EVENT_LABEL}
    wait until element is visible  ${DATETIME_OF_EVENT_DROPDOWN}
    ${Date_Time}  GET VALUE  ${DATETIME_OF_EVENT_LABEL}
    LOG TO CONSOLE  Selected Date and Time Of Event =${Date_Time}
    [Return]   ${Date_Time}

Get Date And Time Of Event Shown In Event Detail Page
    wait until element is visible  ${EVENT_DATE_TIME_FIELD}
    ${Date_Time}  GET TEXT  ${EVENT_DATE_TIME_FIELD}
    ${dates}    Split String    ${Date_Time}    ${SPACE}at${SPACE}
    ${date}    Split String    ${dates}[0]    :${SPACE}
    ${formatted_date_time}    Set Variable    ${date}[1] ${dates}[1][0:5]
    LOG TO CONSOLE  Date and Time Of Event in Detail page=${formatted_date_time}
    [Return]   ${formatted_date_time}

Get Date And Time Oda
    ${date_and_time}    Set Variable    Date and time of the event: 04/02/2024 at 12:56:00
    ${dates}    Split String    ${date_and_time}    ${SPACE}at${SPACE}
    ${date}    Split String    ${dates}[0]    :${SPACE}
    ${formatted_date_time}    Set Variable    ${date}[1] ${dates}[1][0:5]
    Log To Console    ${formatted_date_time}

Verify Event Details Page Header And All Pages And Tabs
    Wait Until Element Is Visible    ${EVENT_LOCATION_WIDGET}  50   Event header is not shown in Add new event Page
    @{Event_Detail_Pages} =     Create List  ${EVENT_OVERVIEW_MODULE}   ${EVENT_LOCATIONS_MODULE}
         ...      ${EVENT_INVOLVED_ENTITIES_MODULE}    ${EVENT_FILES_MODULE}  ${EVENT_TASKS_MODULE}
         ...      ${EVENT_RESPONSES_MODULE}    ${EVENT_LINKED_REPORTS_MODULE}   ${EVENT_NOTIFICATIONS_MODULE}
    General.Verify_Elements_In_Page  @{Event_Detail_Pages}
    click element  ${EVENT_SUMMARY_TAB}
    General.Verify_Elements_In_Page  ${EVENT_LOCATION_WIDGET}    ${EVENT_SUMMARY_WIDGET}  ${EVENT_WRITTEN_SUMMARY_WIDGET}
    click element  ${EVENT_REPORT_TAB}
    General.Verify_Elements_In_Page  ${REPORTER_TAB_WHEN_AND_WHO_WIDGET}    ${REPORTER_TAB_WHERE_WIDGET}  ${REPORTER_TAB_OVERVIEW_WIDGET}  ${REPORTER_TAB_SPECIFIC_DETAILS_WIDGET}
    click element  ${EVENT_INVESTIGATE_TAB}
    General.Verify_Elements_In_Page  ${INVESTIGATE_TAB_ASSESSMENT_WIDGET}    ${INVESTIGATE_TAB_METHODOLOGY_WIDGET}
    click element  ${EVENT_ANALYSE_TAB}
    General.Verify_Elements_In_Page  ${ANALYSE_TAB_EVALUATION_WIDGET}    ${ANALYSE_TAB_ANALYSIS_WIDGET}
    click element  ${EVENT_LOCATIONS_MODULE}
    General.Verify_Elements_In_Page  ${LOCATIONS_PAGE_LOCATION_TAB}    ${LOCATIONS_PAGE_LOCATION_WIDGET}    ${LOCATIONS_PAGE_LOCATION_DETAILS_WIDGET}
    click element  ${EVENT_INVOLVED_ENTITIES_MODULE}
    General.Verify_Elements_In_Page  ${INVOLVED_ENTITIES_PAGE_SUSPECTS_TAB}    ${INVOLVED_ENTITIES_PAGE_SUSPECTS_WIDGET}
    click element  ${INVOLVED_ENTITIES_PAGE_IMPACTED_PERSONS_TAB}
    General.Verify_Elements_In_Page  ${INVOLVED_ENTITIES_PAGE_VICTIMS_WIDGET}
    click element  ${INVOLVED_ENTITIES_PAGE_WITNESSES_TAB}
    General.Verify_Elements_In_Page  ${INVOLVED_ENTITIES_PAGE_WITNESS_WIDGET}
    click element  ${INVOLVED_ENTITIES_PAGE_VEHICLES_TAB}
    General.Verify_Elements_In_Page  ${INVOLVED_ENTITIES_PAGE_VEHICLES_WIDGET}
    click element  ${EVENT_FILES_MODULE}
    General.Verify_Elements_In_Page  ${FILES_PAGE_UPLOADED_ITEMS_TAB}   ${FILES_PAGE_LINKED_ATTACHEMENTS_WIDGET}
    click element  ${EVENT_TASKS_MODULE}
    General.Verify_Elements_In_Page  ${TASKS_PAGE_ALL_TASKS_TAB}   ${TASKS_PAGE_ASSOCIATED_TASKS_WIDGET}
    click element  ${TASKS_PAGE_EOPS_SOPS_TAB}
    General.Verify_Elements_In_Page  ${TASKS_PAGE_EOPS_SOPS_WIDGET}
    click element  ${EVENT_RESPONSES_MODULE}
    General.Verify_Elements_In_Page  ${RESPONSES_PAGE_COMMENTS_TAB}    ${RESPONSES_PAGE_ALL_COMMENTS_WIDGET}
    click element  ${RESPONSES_PAGE_VEHICLES_TAB}
    General.Verify_Elements_In_Page  ${RESPONSES_PAGE_VEHICLES_WIDGET}
    click element  ${RESPONSES_PAGE_PRODUCTS_TAB}
    General.Verify_Elements_In_Page  ${RESPONSES_PAGE_PRODUCTS_WIDGET}
    click element  ${RESPONSES_PAGE_STATEMENTS_TAB}
    General.Verify_Elements_In_Page  ${RESPONSES_PAGE_WITNESS_STATEMENTS_WIDGET}
    click element  ${RESPONSES_PAGE_INJURIES_TAB}
    General.Verify_Elements_In_Page  ${RESPONSES_PAGE_RECORDED_INJURIES_WIDGET}
    click element  ${EVENT_LINKED_REPORTS_MODULE}
    General.Verify_Elements_In_Page  ${LINKED_REPORTS_PAGE_SEARCH_AND_LINK_TAB}  ${LINKED_REPORTS_PAGE_LINKED_REPORTS_WIDGET}  ${LINKED_REPORTS_PAGE_SEARCH_AND_LINK_WIDGET}
    click element  ${EVENT_NOTIFICATIONS_MODULE}
    General.Verify_Elements_In_Page  ${NOTIFICATION_PAGE_SENT_NOTIFICATIONS_TAB}    ${NOTIFICATION_PAGE_SENT_NOTIFICATIONS_WIDGET}

Assign User To The Event
    wait until element is visible  ${EVENT_ASSIGNED_TO_VALUE}
    ${assigned}  GET TEXT  ${EVENT_ASSIGNED_TO_VALUE}
    click element  ${EVENT_ASSIGNED_TO_FIELD}
    wait until element is visible  ${CHANGE_OWNER_SLIDEOUT_HEADER}  10  Change owner slideout not shown
    General.Verify_Elements_In_Page  ${CHANGE_OWNER_SLIDEOUT_TITLE}    ${SELECT_NEW_ASSIGNED_MEMBER_QUESTION}  ${CHANGE_OWNER_SLIDEOUT_CLOSE_BUTTON}    ${CHANGE_OWNER_SLIDEOUT_SAVE_BUTTON}
    click element  ${CHANGE_OWNER_SLIDEOUT_SAVE_BUTTON}
    wait until page contains  ${CHANGE_OWNER_ERROR_TOAST_MESSAGE}  5  Failed to show "Please select another staff member"
    click element  ${CHANGE_OWNER_PLEASE_SELECT_DROPDOWN}
    wait until element is visible  ${CHANGE_OWNER_SEARCH_BOX}  5
    Run Keyword If    '${assigned}' == '${LOGGED_IN_USERNAME.${env}}'    input text  ${CHANGE_OWNER_SEARCH_BOX}  ${NEW_ASSIGNE.${env}}
    ...    ELSE    input text  ${CHANGE_OWNER_SEARCH_BOX}  ${LOGGED_IN_USERNAME.${env}}
    sleep  3
    wait until element is visible  ${CHANGE_OWNER_SEARCHED_RESULT}  5
    click element  ${CHANGE_OWNER_SEARCHED_RESULT}
    wait until element is visible  ${CHANGE_OWNER_SLIDEOUT_SAVE_BUTTON}  5  Save button not shown
    ${selected_owner}  GET VALUE  ${CHANGE_OWNER_PLEASE_SELECT_DROPDOWN}
    click element  ${CHANGE_OWNER_SLIDEOUT_SAVE_BUTTON}
    wait until page contains  ${CHANGE_OWNER_SUCCESS_TOAST_MESSAGE}   15  Failed to show "Assigned Incident Successfully"
    sleep  2
    [Return]  ${selected_owner}

Get Assigned To User In Event Detail Page
    wait until element is visible  ${EVENT_ASSIGNED_TO_VALUE}  10
    ${assigned}  GET TEXT  ${EVENT_ASSIGNED_TO_VALUE}
    [Return]  ${assigned}

Go To Responses Page
    wait until element is visible  ${EVENT_RESPONSES_MODULE}  10  Responses page is not shown
    click element  ${EVENT_RESPONSES_MODULE}

Add Vehicle Response Form
    ${Current_Time} =    Get Current Date   increment=00:00:00  result_format=%m-%d_%H-%M-%S
    wait until element is visible  ${RESPONSES_PAGE_VEHICLES_TAB}  20  Vehicle tab is not shown
    click element  ${RESPONSES_PAGE_VEHICLES_TAB}
    wait until element is visible  ${RESPONSES_PAGE_VEHICLES_WIDGET}   10  Vehicle widget is not shown
    wait until element is visible  ${ADD_NEW_VEHICLE_FORM}   10   Add new Vehicle form button is not shown
    click element  ${ADD_NEW_VEHICLE_FORM}
    wait until element is visible  ${ADD_NEW_SLIDEOUT}  10   Add new slideout is not shown
    wait until element is visible  ${VEHICLE_FORM_TITLE}  10   Vehicle form title is not shown
    wait until element is visible  ${VEHICLE_REG_NO_HINT_TEXT}  10   Vehicle Reg. No. hint text not shown
    wait until element is visible  ${VEHICLE_REG_NO_PLACEHOLDER}  10   Vehicle Reg. No. placeholder not shown
    input text   ${VEHICLE_REG_NO_PLACEHOLDER}   Auto1234
    input text   ${VEHICLE_MAKE}   Automation Volkswagen ${Current_Time}
    scroll element into view  ${VEHICLE_COLOUR}
    sleep  1
    input text   ${VEHICLE_MODEL}   Automation Golf ${Current_Time}
    input text   ${VEHICLE_COLOUR}   Automation Red ${Current_Time}
    scroll element into view  ${VEHICLE_DESCRIPTION}
    sleep  1
    click element  ${VEHICLE_TYPE}
    input text   ${VEHICLE_OWNER}   Automation Owner ${Current_Time}
    input text   ${VEHICLE_DESCRIPTION}   Automation Description ${Current_Time}
    sleep  2
    ${fileuploaded}     run keyword and return status  Browse File And Upload
#    Run Keyword If    ${fileuploaded} == False   click element  ${VEHICLE_CLOSE_BUTTON}
#    Run Keyword If    ${fileuploaded} == False   FAIL   File upload failed in vehicle response form hence failing this testcase
    wait until page contains element  ${VEHICLE_CLOSE_BUTTON}  10   Close button not in Response form
    click element  ${VEHICLE_SUBMIT_BUTTON}
    wait until page contains  ${RESPONSE_FORM_ADDED_TOAST_MESSAGE}   15  Failed to show "Response Form Vehicle Form added successfully"
    capture page screenshot
    wait until element is visible  ${VEHICLE_REG_NO_COLUMN}   30  Vehicle widget is not shown
    click element  ${LIST_WIDGET_COLUMNS_OPTION}
    sleep  1
    click element  ${COLUMNS_REFERENCE_ID_CHECKBOX}
    sleep  1
    click element  ${COLUMNS_FORM_TYPES_CHECKBOX}
    sleep  1
    click element  ${COLUMNS_SUBMITTED_DATE_TIME_CHECKBOX}
    sleep  1
    run keyword and continue on failure     element attribute value should be  ${VEHICLE_REG_NO_COLUMN}  title   Auto1234
    click element  ${COLUMNS_VEHICLE_REG_NO_CHECKBOX}
    sleep  1
    run keyword and continue on failure     element attribute value should be  ${VEHICLE_FULL_PARTIAL_REG_COLUMN}  title   full
    click element  ${COLUMNS_FULL_PARTIAL_CHECKBOX}
    sleep  1
    run keyword and continue on failure     element attribute value should be  ${VEHICLE_MAKE_COLUMN}  title   Automation Volkswagen ${Current_Time}
    click element  ${COLUMNS_MAKE_CHECKBOX}
    sleep  1
    run keyword and continue on failure     element attribute value should be  ${VEHICLE_MODEL_COLUMN}  title   Automation Golf ${Current_Time}
    click element  ${COLUMNS_MODEL_CHECKBOX}
    sleep  1
    run keyword and continue on failure     element attribute value should be  ${VEHICLE_COLOUR_COLUMN}  title   Automation Red ${Current_Time}
    click element  ${COLUMNS_COLOUR_CHECKBOX}
    sleep  1
    run keyword and continue on failure     element attribute value should be  ${VEHICLE_TYPE_COLUMN}  title   other
    click element  ${COLUMNS_VEHICLE_TYPE_CHECKBOX}
    sleep  1
    run keyword and continue on failure     element attribute value should be  ${VEHICLE_OWNER_COLUMN}  title   Automation Owner ${Current_Time}
    click element  ${COLUMNS_VEHICLE_OWNER_CHECKBOX}
    sleep  1
    run keyword and continue on failure     element attribute value should be  ${VEHICLE_DESCRIPTION_COLUMN}  title   Automation Description ${Current_Time}
    Run Keyword If    '${fileuploaded}' == 'False'    Fail    File upload failed or timed out but vehicle response added successfully

Go To Tasks Page In Event Detail Page
    wait until element is visible  ${EVENT_TASKS_MODULE}  10  Tasks page is not shown
    click element  ${EVENT_TASKS_MODULE}
    wait until element is visible  ${TASKS_PAGE_ALL_TASKS_TAB}  20  All tasks tab is not shown
    click element  ${TASKS_PAGE_ALL_TASKS_TAB}
    wait until element is visible  ${TASKS_PAGE_ASSOCIATED_TASKS_WIDGET}   10  Associated tasks widget is not shown


Add New Task
    [Arguments]  ${add_attachment}=no
    ${Current_Time} =    Get Current Date   increment=00:00:00  result_format=%m-%d_%H-%M-%S        
    wait until element is visible  ${ADD_NEW_TASK}   10   Add new task button (+) is not shown
    sleep  1
    click element  ${ADD_NEW_TASK}
    wait until element is visible  ${ASSIGN_TASK_SLIDEOUT}   10  Assign task slideout is not shown
    wait until element is visible  ${TASK_TITLE_HEADER}   10  Task title header is not shown
    wait until element is visible  ${TASK_TITLE_TEXTBOX}   10  Task title text field is not shown
    input text   ${TASK_TITLE_TEXTBOX}  Automated_Task_At_${Current_Time}
    wait until element is visible   ${TASK_TYPE_HEADER}  10  Task type header is not shown
    wait until element is visible   ${TASK_TYPE_DROPDOWN}  10  Task type drop down is not shown
    click element  ${TASK_TYPE_DROPDOWN}
    ${dropdown_options}  CREATE LIST  Audit / Review   Incident Response  Operational Task  Dispatch
    ${tasktype_selected}=  Evaluate  random.choice($dropdown_options)
    log to console  ${tasktype_selected}
    wait until element is visible  //div[@role='option' and contains(text(),'${tasktype_selected}')]   10  Task type '${tasktype_selected}' is not shown
    click element   //div[@role='option' and contains(text(),'${tasktype_selected}')]
    wait until page contains element  ${TASK_ASSIGNED_TO_LABEL}  5  Assigned To label is not shown
    wait until page contains element  ${TASK_ASSIGNED_TO_FIELD}  5  Assigned To label is not shown
    click element  ${TASK_ASSIGNED_TO_FIELD}
    wait until element is visible  ${TASK_ASSIGNED_TO_SEARCH_BOX}  5  Search box is not shown
    input text  ${TASK_ASSIGNED_TO_SEARCH_BOX}  ${LOGGED_IN_USERNAME.${env}}
    wait until element is visible  ${TASK_ASSIGNED_TO_SEARCHED_RESULT}  5
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
    input text  ${TASK_INSTRUCTIONS_TEXTBOX}  This is automated instructions added at ${Current_Time}
    run keyword and ignore error  Link Event To Task
    sleep  1
    press keys    None     ESC
    press keys    None     ESC
    capture page screenshot
#    run keyword if   '${add_attachment}'=='yes'  browse file and upload
    ${fileuploaded}     run keyword if   '${add_attachment}'=='yes'  browse file and upload
#    Run Keyword If    ${fileuploaded} == False   click element  ${VEHICLE_CLOSE_BUTTON}
#    Run Keyword If    ${fileuploaded} == False   FAIL   File upload failed in vehicle response form hence failing this testcase
    wait until page contains element  ${TASK_SLIDEOUT_CLOSE_BUTTON}  5  Close button not shown in Add task slideout
    wait until page contains element  ${TASK_SLIDEOUT_SAVE_BUTTON}  5  Save button not shown in Add task slideout
    click element  ${TASK_SLIDEOUT_SAVE_BUTTON}
    wait until page contains  has been added successfully  15   Toast message is not shown
    ${Created_date} =    Get Current Date    result_format=%d/%m/%Y %H:%M
    CAPTURE PAGE SCREENSHOT
    sleep  10
    wait until element is visible  ${TASK_TITLE_COLUMN}   30  Task title column is not shown
    click element  ${LIST_WIDGET_COLUMNS_OPTION}
    sleep  2
    run keyword and continue on failure     element attribute value should be  ${TASK_TITLE_COLUMN}  title   Automated_Task_At_${Current_Time}
    click element  ${COLUMNS_TASK_TITLE_CHECKBOX}
    sleep  1
    run keyword and continue on failure     element text should be  ${TASK_TYPE_COLUMN}    ${tasktype_selected}
    click element  ${COLUMNS_TASK_TYPE_CHECKBOX}
    sleep  1
    run keyword and continue on failure     element attribute value should be  ${TASK_ASSIGNED_TO_COLUMN}  title   ${LOGGED_IN_USERNAME.${env}}
    click element  ${COLUMNS_ASSIGNED_TO_CHECKBOX}
    sleep  1
    run keyword and continue on failure     element attribute value should be  ${TASK_CREATED_BY_COLUMN}  title   ${LOGGED_IN_USERNAME.${env}}
    click element  ${COLUMNS_CREATED_BY_CHECKBOX}
    sleep  1
    run keyword and continue on failure     element text should be  ${TASK_CREATED_DATE_COLUMN}    ${Created_date}
    click element  ${COLUMNS_CREATED_DATE_TIME_CHECKBOX}
    sleep  1
    run keyword and continue on failure     element text should be  ${TASK_DUE_DATE_COLUMN}    ${Due_Date_Selected}
    click element  ${COLUMNS_DUE_DATE_TIME_CHECKBOX}
    sleep  1
    run keyword and continue on failure     element attribute value should be  ${TASK_STATUS_COLUMN}  title   Pending
    click element  ${COLUMNS_DUE_DATE_TIME_CHECKBOX}
    click element  ${COLUMNS_CREATED_DATE_TIME_CHECKBOX}
    click element  ${COLUMNS_CREATED_BY_CHECKBOX}
    click element  ${COLUMNS_ASSIGNED_TO_CHECKBOX}
    click element  ${COLUMNS_TASK_TYPE_CHECKBOX}
    click element  ${COLUMNS_TASK_TITLE_CHECKBOX}
    sleep  1
    click element  ${COLUMNS_TASK_REFERENCE}
    run keyword and continue on failure  wait until page contains element  ${TASK_PREVIEW_PAGE_TITLE}  15  Failed to open the task preview slide
    run keyword and continue on failure  wait until page contains element  ${TASK_PREVIEW_PAGE_CLOSE_BUTTON}  15  Close button not shown in task preview slide
    run keyword and continue on failure  wait until page contains element  ${TASK_PREVIEW_PAGE_TASK_TAB}  15  Task tab not shown in task preview slide
    run keyword and continue on failure  element text should be  ${TASK_PREVIEW_PAGE_TASK_TYPE}    ${tasktype_selected}
    run keyword and continue on failure  element text should be  ${TASK_PREVIEW_PAGE_CREATED_BY}    ${LOGGED_IN_USERNAME.${env}}
    run keyword and continue on failure  element text should be  ${TASK_PREVIEW_PAGE_ASSIGNED_TO}    ${LOGGED_IN_USERNAME.${env}}
    run keyword and continue on failure  element text should be  ${TASK_PREVIEW_PAGE_TASK_STATUS}    Pending
    ${Formatted_Created_Date_Selected}=   Convert Date	   ${Created_date}    result_format=%d/%m/%Y - %H:%M  date_format=%d/%m/%Y %H:%M
    run keyword and continue on failure  element text should be  ${TASK_PREVIEW_PAGE_CREATED_DATETIME}    ${Formatted_Created_Date_Selected}
    run keyword if   '${add_attachment}'=='yes' and '${fileuploaded}'=='True'  wait until page contains element  ${TASK_PREVIEW_PAGE_DOWNLOAD_ICON}  10  Attachment download icon not present in page
    run keyword if   '${add_attachment}'=='yes' and '${fileuploaded}'=='True'  scroll element into view  ${TASK_PREVIEW_PAGE_DOWNLOAD_ICON}
    run keyword and ignore error  scroll element into view  ${TASK_PREVIEW_PAGE_INSTRUCTION}
    run keyword and ignore error  scroll element into view  ${TASK_PREVIEW_PAGE_LINKED_EVENTS}
    run keyword and ignore error  scroll element into view  ${TASK_PREVIEW_PAGE_DOWNLOAD_ICON}
    sleep  1
    ${Formatted_Due_Date_Selected}=   Convert Date	   ${Due_Date_Selected}    result_format=%d/%m/%Y - %H:%M  date_format=%d/%m/%Y %H:%M
    run keyword and continue on failure  element text should be  ${TASK_PREVIEW_PAGE_DUE_DATETIME}    ${Formatted_Due_Date_Selected}
    ${actual_text}=    Get Text   ${TASK_PREVIEW_PAGE_INSTRUCTION}
    run keyword and continue on failure  Should Be Equal As Strings    ${actual_text.strip()}    This is automated instructions added at ${Current_Time}
    run keyword and continue on failure  wait until page contains element  ${TASK_PREVIEW_PAGE_LINKED_EVENTS}  5  Linked event not shown in task preview slide
    run keyword if   '${add_attachment}'=='yes' and '${fileuploaded}'=='True'   run keyword and continue on failure  wait until page contains element  ${TASK_PREVIEW_PAGE_IMAGE_THUMBNAIL}  5  Attachment thumbnail not shown in task preview slide
    run keyword and continue on failure  wait until page contains element  ${TASK_PREVIEW_PAGE_UPDATE_TASK_BUTTON}  5  Update button not shown in task preview slide
    run keyword if   '${add_attachment}'=='yes' and '${fileuploaded}'=='True'   run keyword and continue on failure  wait until page contains element  ${TASK_PREVIEW_PAGE_ATTACHMENT_NAME}  5  Attachment name not shown in task preview slide
    run keyword if   '${add_attachment}'=='yes' and '${fileuploaded}'=='True'   run keyword and continue on failure  wait until page contains element  ${TASK_PREVIEW_PAGE_DOWNLOAD_ICON}  5  Download icon not shown in task preview slide
    run keyword and continue on failure  click element  ${TASK_PREVIEW_PAGE_CLOSE_BUTTON}
    capture page screenshot
    [Return]  ${fileuploaded}

Link Event To Task
    scroll element into view  ${TASK_LINK_EVENTS}
    click element  ${TASK_LINK_EVENTS}
    wait until element is visible   ${TASK_SEARCH_LINK_EVENTS}  5
    input text  ${TASK_SEARCH_LINK_EVENTS}  SEC
    sleep  2
    click element  ${TASK_SEARCHED_LINK_EVENT}


Update Task And Verify Data
    wait until element is visible   ${COLUMNS_TASK_REFERENCE}  5  Task reference is not shown
    click element  ${COLUMNS_TASK_REFERENCE}
    wait until element is visible   ${TASK_PREVIEW_PAGE_UPDATE_TASK_BUTTON}  15  Update Task button is not shown
    click element  ${TASK_PREVIEW_PAGE_UPDATE_TASK_BUTTON}
    wait until element is visible   id=task-type-status_dummy  5  Update Task button is not shown
    click element  id=task-type-status_dummy
    sleep  2
    wait until element is visible   xpath=//div[@role="option" and text()='Complete']   5   Update Task button is not shown
    click element  xpath=//div[@role="option" and text()='Complete']
    sleep  1
    wait until page contains element  ${TASK_SLIDEOUT_SAVE_BUTTON}  5  Save button not shown in Add task slideout
    capture page screenshot
    click element  ${TASK_SLIDEOUT_SAVE_BUTTON}
    sleep  1
    wait until element is visible   ${TASK_PREVIEW_PAGE_CLOSE_BUTTON}  5
    click element  ${TASK_PREVIEW_PAGE_CLOSE_BUTTON}
    sleep  5
    click element  ${COLUMNS_TASK_TITLE_CHECKBOX}
    sleep  0.5
    click element  ${COLUMNS_TASK_TYPE_CHECKBOX}
    sleep  0.5
    click element  ${COLUMNS_ASSIGNED_TO_CHECKBOX}
    sleep  0.5
    click element  ${COLUMNS_CREATED_BY_CHECKBOX}
    sleep  0.5
    click element  ${COLUMNS_CREATED_DATE_TIME_CHECKBOX}
    sleep  0.5
    click element  ${COLUMNS_DUE_DATE_TIME_CHECKBOX}
    sleep  0.5
    click element  ${COLUMNS_TASK_REFERENCE_CHECKBOX}
    sleep  0.5
    run keyword and continue on failure     element attribute value should be  ${TASK_STATUS_COLUMN}  title   Complete
    wait until element is visible  ${COLUMNS_TASK_REFERENCE_CHECKBOX}  5
    click element  ${COLUMNS_TASK_REFERENCE_CHECKBOX}
    wait until element is visible   ${COLUMNS_TASK_REFERENCE}  5  Task reference is not shown
    click element  ${COLUMNS_TASK_REFERENCE}
    run keyword and continue on failure  wait until page contains element  ${TASK_PREVIEW_PAGE_TITLE}  15  Failed to open the task preview slide
    run keyword and continue on failure  element text should be  ${TASK_PREVIEW_PAGE_TASK_STATUS}    Complete

Get Current Event Status In Event Detail Page
    wait until element is visible  ${EVENT_STATUS_VALUE}  10
    ${status}  GET TEXT  ${EVENT_STATUS_VALUE}
    capture page screenshot
    [Return]  ${status}

Get Current Event Severity In Event Detail Page
    wait until element is visible  ${EVENT_SEVERITY_VALUE}  10
    ${severity}  GET TEXT  ${EVENT_SEVERITY_VALUE}
    capture page screenshot
    [Return]  ${severity}

Get Current Event Priority In Event Detail Page
    wait until element is visible  ${EVENT_PRIORITY_VALUE}  10
    ${priority}  GET TEXT  ${EVENT_PRIORITY_VALUE}
    capture page screenshot
    [Return]  ${priority}

Change The Event Status
    wait until element is visible  ${EVENT_STATUS_VALUE}
    ${current}  GET TEXT  ${EVENT_STATUS_VALUE}
    click element  ${EVENT_STATUS_FIELD}
    wait until element is visible  ${CHANGE_STATUS_SLIDEOUT_HEADER}  10  Change owner slideout not shown
    General.Verify_Elements_In_Page  ${CHANGE_STATUS_SLIDEOUT_TITLE}    ${SELECT_THE_STATUS_BELOW_QUESTION}  ${CHANGE_STATUS_SLIDEOUT_CLOSE_BUTTON}    ${CHANGE_STATUS_SLIDEOUT_SAVE_BUTTON}
    click element  ${CHANGE_STATUS_SLIDEOUT_SAVE_BUTTON}
    wait until page contains  ${CHANGE_STATUS_ERROR_TOAST_MESSAGE}  5  Failed to show "Please select another staff member"
    click element  ${CHANGE_STATUS_DROPDOWN}
    ${status}   Select_Any_Status_Except_Current
    wait until element is visible   ${CHANGE_STATUS_SEARCH_BOX}   5
    input text  ${CHANGE_STATUS_SEARCH_BOX}  ${status}
    sleep  3
    wait until element is visible  ${UNSELECTED_STATUS_IN_DROPDOWN}  5
    click element  ${UNSELECTED_STATUS_IN_DROPDOWN}
    wait until element is visible  ${CHANGE_STATUS_SLIDEOUT_SAVE_BUTTON}  5  Save button not shown
    ${selected_status}  GET VALUE  ${CHANGE_STATUS_DROPDOWN}
    click element  ${CHANGE_STATUS_SLIDEOUT_SAVE_BUTTON}
    wait until page contains  ${CHANGE_STATUS_SUCCESS_TOAST_MESSAGE}   15  Failed to show "Assigned Incident Successfully"
    sleep  2
    [Return]  ${selected_status}

Select_Any_Status_Except_Current
     Wait Until Page Contains Element    ${UNSELECTED_STATUS_IN_DROPDOWN}  10  Stasus dropdown is not shown
     @{results}    Get Webelements    ${UNSELECTED_STATUS_IN_DROPDOWN}
     ${value}=  Evaluate  random.choice($results)  random
     ${status}  get text   ${value}
     [Return]  ${status}

Change The Event Severity
    wait until element is visible  ${EVENT_SEVERITY_VALUE}
    ${current}  GET TEXT  ${EVENT_SEVERITY_VALUE}
    click element  ${EVENT_SEVERITY_FIELD}
    wait until element is visible  ${CHANGE_SEVERITY_SLIDEOUT_HEADER}  10  Change severity slideout not shown
    General.Verify_Elements_In_Page  ${CHANGE_SEVERITY_SLIDEOUT_TITLE}    ${SELECT_THE_SEVERITY_BELOW_QUESTION}  ${CHANGE_SEVERITY_SLIDEOUT_CLOSE_BUTTON}    ${CHANGE_SEVERITY_SLIDEOUT_SAVE_BUTTON}
    click element  ${CHANGE_SEVERITY_SLIDEOUT_SAVE_BUTTON}
    wait until page contains  ${CHANGE_SEVERITY_ERROR_TOAST_MESSAGE}  5  Failed to show "Please select another staff member"
    click element  ${CHANGE_SEVERITY_DROPDOWN}
    ${severity}   Select_Any_Severity_Except_Current
    wait until element is visible  ${CHANGE_SEVERITY_SEARCH_BOX}  5
    input text  ${CHANGE_SEVERITY_SEARCH_BOX}  ${severity}
    sleep  3
    wait until element is visible  ${UNSELECTED_SEVERITY_IN_DROPDOWN}  5
    click element  ${UNSELECTED_SEVERITY_IN_DROPDOWN}
    wait until element is visible  ${CHANGE_SEVERITY_SLIDEOUT_SAVE_BUTTON}  5  Save button not shown
    ${selected_severity}  GET VALUE  ${CHANGE_SEVERITY_DROPDOWN}
    click element  ${CHANGE_SEVERITY_SLIDEOUT_SAVE_BUTTON}
    wait until page contains  ${CHANGE_SEVERITY_SUCCESS_TOAST_MESSAGE}   15  Failed to show "Assigned Incident Successfully"
    sleep  2
    [Return]  ${selected_severity}

Select_Any_Severity_Except_Current
     Wait Until Page Contains Element    ${UNSELECTED_SEVERITY_IN_DROPDOWN}  10  Stasus dropdown is not shown
     @{results}    Get Webelements    ${UNSELECTED_SEVERITY_IN_DROPDOWN}
     ${value}=  Evaluate  random.choice($results)  random
     ${severity}  get text   ${value}
     [Return]  ${severity}

Change The Event Priority
    wait until element is visible  ${EVENT_PRIORITY_VALUE}
    ${current}  GET TEXT  ${EVENT_PRIORITY_VALUE}
    click element  ${EVENT_PRIORITY_FIELD}
    wait until element is visible  ${CHANGE_PRIORITY_SLIDEOUT_HEADER}  10  Change priority slideout not shown
    General.Verify_Elements_In_Page  ${CHANGE_PRIORITY_SLIDEOUT_TITLE}    ${SELECT_THE_PRIORITY_BELOW_QUESTION}  ${CHANGE_PRIORITY_SLIDEOUT_CLOSE_BUTTON}    ${CHANGE_PRIORITY_SLIDEOUT_SAVE_BUTTON}
    click element  ${CHANGE_PRIORITY_SLIDEOUT_SAVE_BUTTON}
    wait until page contains  ${CHANGE_PRIORITY_ERROR_TOAST_MESSAGE}  5  Failed to show "Please select another staff member"
    click element  ${CHANGE_PRIORITY_DROPDOWN}
    ${priority}   Select_Any_Priority_Except_Current
    wait until element is visible  ${CHANGE_PRIORITY_SEARCH_BOX}   5
    input text  ${CHANGE_PRIORITY_SEARCH_BOX}  ${priority}
    sleep  3
    wait until element is visible  ${UNSELECTED_PRIORITY_IN_DROPDOWN}  5
    click element  ${UNSELECTED_PRIORITY_IN_DROPDOWN}
    wait until element is visible  ${CHANGE_PRIORITY_SLIDEOUT_SAVE_BUTTON}  5  Save button not shown
    ${selected_priority}  GET VALUE  ${CHANGE_PRIORITY_DROPDOWN}
    click element  ${CHANGE_PRIORITY_SLIDEOUT_SAVE_BUTTON}
    wait until page contains  ${CHANGE_PRIORITY_SUCCESS_TOAST_MESSAGE}   15  Failed to show "Assigned Incident Successfully"
    sleep  2
    [Return]  ${selected_priority}

Select_Any_Priority_Except_Current
     Wait Until Page Contains Element    ${UNSELECTED_PRIORITY_IN_DROPDOWN}  10  Stasus dropdown is not shown
     @{results}    Get Webelements    ${UNSELECTED_PRIORITY_IN_DROPDOWN}
     ${value}=  Evaluate  random.choice($results)  random
     ${severity}  get text   ${value}
     [Return]  ${severity}

Validate Time with Tolerance   # +-1 min tolerance is present
    [Arguments]  ${time_to_validate}
    ${current_time} =  Get Current Date    time_zone=local   exclude_millis=yes    result_format=%H:%M
    ${time_to_validate_converted} =  Convert Time  ${time_to_validate}
    ${current_time_converted} =  Convert Time  ${current_time}
    ${duration} =  Subtract Time From Time  ${current_time_converted}  ${time_to_validate_converted}
    ${result}    Evaluate    ${duration} == 0 or ${duration} == 1 or ${duration} == -1
    run keyword if  '${result}'=='False'  fail  Time shown is '${time_to_validate}' but time should be '${current_time}'

Validate Event TimeLine For Status Change
    [Arguments]  ${status}
    wait until element is visible  ${EVENT_TIMELINE_ICON}  5  Event Timeline Icon is not shown
    click element   ${EVENT_TIMELINE_ICON}
    wait until element is visible  ${EVENT_TIMELINE_HEADER}  15  Event Timeline Header is not shown
    General.Verify_Elements_In_Page  ${EVENT_TIMELINE_CLOSE_BUTTON}    ${EVENT_TIMELINE_DATE_COLOUMN}  ${EVENT_TIMELINE_EVENTS_COLOUMN}
    sleep  2
    ${Events}  GET TEXT  ${EVENT_TIMELINE_EVENTS}
    run keyword and continue on failure  should contain  ${Events}  Status was changed to '${status}' By - ${LOGGED_IN_USERNAME.${env}}
    ${time}  GET TEXT  ${EVENT_TIMELINE_TIME}
    Validate Time with Tolerance  ${time}
    ${date}  GET TEXT  ${EVENT_TIMELINE_DATE}
    ${current_utc_date}    Get Current Date   time_zone=UTC   result_format=%d
    log to console   Comparing date: ${date} with current UTC date: ${current_utc_date}
    run keyword and continue on failure  Run Keyword If    '${date}' != '${current_utc_date}'    FAIL   date: ${date} with current UTC date: ${current_utc_date} is not matching
    ${monthyear}  GET TEXT  ${EVENT_TIMELINE_MONTH_YEAR}
    ${current_utc_monthyear}    Get Current Date   time_zone=UTC   result_format=%b %y
    log to console    Comparing date: ${monthyear} with current UTC date: ${current_utc_monthyear}
    run keyword and continue on failure  should be equal as strings  ${monthyear}  ${current_utc_monthyear}  ignore_case=True  msg=Month and year is shown are not correct
    capture page screenshot

Validate Event TimeLine For Severity Change
    [Arguments]  ${severity}
    wait until element is visible  ${EVENT_TIMELINE_ICON}  5  Event Timeline Icon is not shown
    click element   ${EVENT_TIMELINE_ICON}
    wait until element is visible  ${EVENT_TIMELINE_HEADER}  15  Event Timeline Header is not shown
    General.Verify_Elements_In_Page  ${EVENT_TIMELINE_CLOSE_BUTTON}    ${EVENT_TIMELINE_DATE_COLOUMN}  ${EVENT_TIMELINE_EVENTS_COLOUMN}
    sleep  2
    ${Events}  GET TEXT  ${EVENT_TIMELINE_EVENTS}
    run keyword and continue on failure  should contain  ${Events}  Severity was changed to '${severity}' By - ${LOGGED_IN_USERNAME.${env}}
    ${time}  GET TEXT  ${EVENT_TIMELINE_TIME}
    Validate Time with Tolerance  ${time}
    ${date}  GET TEXT  ${EVENT_TIMELINE_DATE}
    ${current_utc_date}    Get Current Date   time_zone=UTC   result_format=%d
    log to console   Comparing date: ${date} with current UTC date: ${current_utc_date}
    run keyword and continue on failure  Run Keyword If    '${date}' != '${current_utc_date}'    FAIL   date: ${date} with current UTC date: ${current_utc_date} is not matching
    ${monthyear}  GET TEXT  ${EVENT_TIMELINE_MONTH_YEAR}
    ${current_utc_monthyear}    Get Current Date   time_zone=UTC   result_format=%b %y
    log to console    Comparing date: ${monthyear} with current UTC date: ${current_utc_monthyear}
    run keyword and continue on failure  should be equal as strings  ${monthyear}  ${current_utc_monthyear}  ignore_case=True  msg=Month and year is shown are not correct
    capture page screenshot

Validate Event TimeLine For Priority Change
    [Arguments]  ${priority}
    wait until element is visible  ${EVENT_TIMELINE_ICON}  5  Event Timeline Icon is not shown
    click element   ${EVENT_TIMELINE_ICON}
    wait until element is visible  ${EVENT_TIMELINE_HEADER}  15  Event Timeline Header is not shown
    General.Verify_Elements_In_Page  ${EVENT_TIMELINE_CLOSE_BUTTON}    ${EVENT_TIMELINE_DATE_COLOUMN}  ${EVENT_TIMELINE_EVENTS_COLOUMN}
    sleep  2
    ${Events}  GET TEXT  ${EVENT_TIMELINE_EVENTS}
    run keyword and continue on failure  should contain  ${Events}  Priority was changed to '${priority}' By - ${LOGGED_IN_USERNAME.${env}}
    ${time}  GET TEXT  ${EVENT_TIMELINE_TIME}
    Validate Time with Tolerance  ${time}
    ${date}  GET TEXT  ${EVENT_TIMELINE_DATE}
    ${current_utc_date}    Get Current Date   time_zone=UTC   result_format=%d
    log to console   Comparing date: ${date} with current UTC date: ${current_utc_date}
    run keyword and continue on failure  Run Keyword If    '${date}' != '${current_utc_date}'    FAIL   date: ${date} with current UTC date: ${current_utc_date} is not matching
    ${monthyear}  GET TEXT  ${EVENT_TIMELINE_MONTH_YEAR}
    ${current_utc_monthyear}    Get Current Date   time_zone=UTC   result_format=%b %y
    log to console    Comparing date: ${monthyear} with current UTC date: ${current_utc_monthyear}
    run keyword and continue on failure  should be equal as strings  ${monthyear}  ${current_utc_monthyear}  ignore_case=True  msg=Month and year is shown are not correct
    capture page screenshot

Navigate To Event Page
    wait until element is visible  ${EVENTS_MODULE}  5  Search mobule is not shown
    click element   ${EVENTS_MODULE}

Select All Records Page
    wait until element is visible  ${EVENT_ALL_RECORDS_PAGE}  5  All Records page is not shown
    click element   ${EVENT_ALL_RECORDS_PAGE}

Get Random Event ID From The List Widget
     Wait Until Page Contains Element    ${EVENT_REFERENCE_NUMBERS}  30  Event reference numbers is not shown
     @{results}    Get Webelements    ${EVENT_REFERENCE_NUMBERS}
     ${value}=  Evaluate  random.choice($results)  random
     ${reference}  get text   ${value}
     [Return]  ${reference}

Search And Open Any Event Reference From List
    [Arguments]  ${reference}
     wait until element is visible   ${EVENT_REFERENCE_FILTER_INPUT}  10  Reference filter search field is not found
     input text   ${EVENT_REFERENCE_FILTER_INPUT}  ${reference}
     sleep  2
     Click On Event Reference in List Widget To Open The Event

Click On Event Reference in List Widget To Open The Event
     wait until element is visible  ${EVENT_REFERENCE_NUMBERS}   10  Failed to show the searched event reference number in list filter
     click element  ${EVENT_REFERENCE_NUMBERS}

Validate Event Detail Page is opened
    [Arguments]  ${reference}
    wait until element is visible      ${EVENT_ID}   30   Failed to see incident id, hence failed to create new event
    ${left_panel_header} =   get text   ${EVENT_ID}
    should contain  ${left_panel_header}  ${reference}
    wait until element is visible      ${EVENT_NUMBER}   30   Failed to see incident id, hence failed to create new event
    ${incident_outer_title} =   get text   ${EVENT_NUMBER}
    should contain  ${incident_outer_title}  ${reference}
    wait until element is visible      ${EVENT_BREADCRUMBS}   30   Failed to see incident id, hence failed to create new event
    ${breadcrumb} =   get text   ${EVENT_BREADCRUMBS}
    should contain  ${breadcrumb}  ${reference}
    
Answer to describe the specific location question in workflow
    Scroll Element Into View    ${describe_the_specific_location_question}
    ${entered_text}    Set Variable    Testing the location
    Input Text    ${describe_the_specific_location_question}    ${entered_text}
    Log    Entered Text: ${entered_text}
    Set Suite Variable    ${describe_the_specific_location_answer}    ${entered_text}
    [Return]    ${entered_text}

Answer to Select the option(s) that best describes the verbal abuse question
    Run Keyword And Ignore Error    Scroll Element Into View    ${Select the option(s) that best describes the verbal abuse_question} 
    Click Element    ${Select the option(s) that best describes the verbal abuse_question}
    ${selected_options}    Create List    Abuse disguised as a joke    Abusive Anger    Accusing or Blaming
    FOR    ${option}    IN    @{selected_options}
        Click Element    xpath://div[@data-val='${option}']
    END
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Log    Selected Options: ${selected_options}
    [Return]    ${selected_options}


Answer to Written Summary
    Scroll Element Into View    ${Written_summary_question}
    Input Text     ${Written_summary_question}    ${Written_summary_value}
    Set Suite Variable     ${Written_summary_text_value}    ${Written_summary_value}
    [Return]    ${Written_summary_value}
    

Answer to Is CCTV available at the location question
    Click Element    ${Is_CCTV_available_at_the_location_Option_Yes}
    ${Is_CCTV available_at_the_location_question_answer}    Get Text     ${Is_CCTV_available_at_the_location_Option_Yes}
    Set Suite Variable    ${Is_CCTV available_at_the_location_question_selected_answer}     ${Is_CCTV available_at_the_location_question_answer} 
    [Return]        ${Is_CCTV available_at_the_location_question_answer}  
    
Verify Answer to Written Summary on add event workflow
    [Arguments]    ${Written_summary_text_value}    
    ${Written_summary_extracted_text_value}    Get Value    ${Written_summary_question}  
    Run Keyword And Continue On Failure    Should Be Equal      ${Written_summary_extracted_text_value}    ${Written_summary_text_value}
    Log To Console    Expected: '${Written_summary_text_value}' | Actual: '${Written_summary_extracted_text_value}'


Answer to Has a copy of the CCTV been saved question
    Click Element    ${Has a copy of the CCTV been saved_option_Yes}
    ${Has a copy of the CCTV been saved_question_answer}    Get Text    ${Has a copy of the CCTV been saved_option_Yes}
    Set Suite Variable      ${Has a copy of the CCTV been saved_question_selected_answer}    ${Has a copy of the CCTV been saved_question_answer} 
    [Return]    ${Has a copy of the CCTV been saved_question_answer}
             
    
Verify Answer to Has a copy of the CCTV been saved question on add event workflow 
    [Arguments]     ${Has a copy of the CCTV been saved_question_selected_answer}
    Run Keyword And Ignore Error    Scroll Element Into View    ${Has a copy of the CCTV been saved_option_Yes}
    ${Has a copy of the CCTV been saved_option_value}    Get Value    ${Has a copy of the CCTV been saved_option_Yes}
    Run Keyword And Continue On Failure    Should Be Equal       ${Has a copy of the CCTV been saved_option_value}     ${Has a copy of the CCTV been saved_question_selected_answer}
    Log    Expected: '${Has a copy of the CCTV been saved_question_selected_answer}' | Actual: '${Has a copy of the CCTV been saved_option_value}'


Answer to Has a copy been uploaded to Analyst question
    Click Element    ${Has a copy been uploaded to Analyst_option_Yes}
    ${Has a copy been uploaded to Analyst_question_answer}    Get Text      ${Has a copy been uploaded to Analyst_option_Yes}
    Set Suite Variable    ${Has a copy been uploaded to Analyst_question_selected_answer}    ${Has a copy been uploaded to Analyst_question_answer}   
    [Return]     ${Has a copy been uploaded to Analyst_question_answer}


Verify Answer to Has a copy been uploaded to Analyst question on add event workflow
    [Arguments]      ${Has a copy been uploaded to Analyst_question_selected_answer}
    Run Keyword And Ignore Error    Scroll Element Into View     ${Has a copy been uploaded to Analyst_option_Yes}
    ${Has a copy been uploaded to Analyst_option_value}    Get Value    ${Has a copy been uploaded to Analyst_option_Yes}
    Run Keyword And Continue On Failure    Should Be Equal       ${Has a copy been uploaded to Analyst_option_value}      ${Has a copy been uploaded to Analyst_question_selected_answer}
    Log    Expected: '${Has a copy been uploaded to Analyst_question_selected_answer}' | Actual: '${Has a copy been uploaded to Analyst_option_value}'


Answer to Was a weapon present question
    Scroll Element Into View    ${Was a weapon present_option_Yes} 
    Click Element    ${Was a weapon present_option_Yes} 
    ${Was a weapon present question_answer}    Get Text     ${Was a weapon present_option_Yes} 
    Set Suite Variable     ${Was a weapon present question_selected_answer}    ${Was a weapon present question_answer}
    [Return]    ${Was a weapon present question_answer}  
    
    
Verify Answer to Was a weapon present question on add event workflow
    [Arguments]     ${Was a weapon present question_selected_answer}
    Run Keyword And Ignore Error    Scroll Element Into View    ${Was a weapon present_option_Yes} 
    ${Was a weapon present_option_value}    Get Value    ${Was a weapon present_option_Yes}
    Run Keyword And Continue On Failure    Should Be Equal    ${Was a weapon present_option_value}     ${Was a weapon present question_selected_answer}
    Log    Expected: '${Was a weapon present question_selected_answer}' | Actual: '${Was a weapon present_option_value}'

Answer to What was the type of weapon(s) present question
    Click Element    ${What was the type of weapon(s) present_dropdown}
    Click Element    xpath://div[@data-val='Airgun']
    Click Element    xpath://div[@data-val='Axe']
    Click Element    xpath://div[@data-val='Baseball Bat']
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    ${What was the type of weapon(s) present expected options}    Get Webelements    ${What was the type of weapon(s) present selected options} 
    ${all_option_texts}    Create List
    FOR    ${expected_dropdown_option}    IN    @{What was the type of weapon(s) present expected options}
        ${option_text}    Get Text    ${expected_dropdown_option}
        Log    Selected values: ${option_text}
        Append To List    ${all_option_texts}    ${option_text}
    END
    Set Suite Variable     ${What was the type of weapon(s) present_selected_options}     ${all_option_texts}
    [Return]    ${all_option_texts}
    


Verify Answer to What was the type of weapon(s) present question on add event workflow
    ${all_option_values}    Get Value    ${What was the type of weapon(s) present_dropdown}
    ${selected_options_string}    Evaluate    ', '.join(${What was the type of weapon(s) present_selected_options})
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${all_option_values}    ${selected_options_string}    Selected weapon values mismatch
    Log    Expected: '${selected_options_string}' | Actual: '${all_option_values}'



Who is the reporter question answer as External/Contractor
    Run Keyword And Ignore Error    Scroll Element Into View    ${external/contractor_option}
    Click Element    ${external/contractor_option}
    ${who_is_the_reporter_answer}    Get Text    ${external/contractor_option}
    Scroll Element Into View    ${email_address_label}
#    ${first_names}    Create List    John    Michael    David    Chris    Robert
#    ${last_names}    Create List    Smith    Johnson    Brown    Williams    Miller
#    ${random_first}    Evaluate    random.choice(${first_names})    modules=random
#    ${random_last}    Evaluate    random.choice(${last_names})    modules=random
#    ${full_name}    Set Variable    ${random_first} ${random_last}
#    Log    Generated Full Name: ${full_name}
    Input Text    ${full_name_text_field}   ${full_name}
#    ${contact_number}    Evaluate    str(random.randint(6000000000, 9999999999))    modules=random
#    Log    Generated Contact Number: ${contact_number}
    Input Text    ${contact_number_field}    ${contact_number}
#    ${random_number}    Evaluate    random.randint(1000, 9999)    modules=random
#    ${email}    Set Variable    user${random_number}@test.com
#    Log    Generated Email Address: ${email}
    Input Text    ${email_address_field}    ${email}
    Set Suite Variable     ${who_is_the_reporter_option_answer}     ${who_is_the_reporter_answer}
    Set Suite Variable    ${Name}    ${full_name}
    Set Suite Variable    ${contact}    ${contact_number}
    Set Suite Variable    ${email_id}    ${email}
    [Return]     ${who_is_the_reporter_answer}     ${full_name}    ${contact_number}      ${email}
#
Navigate to the widget which contains all the dynamic questions
    Run Keyword And Ignore Error    Scroll Element Into View    ${all_dynamic_question_widget}  

Verify All Dynamic Questions in Detail Page configured widget
    ${expected_values}    Create Dictionary
    ...    Who is the reporter?=External / Contractor
    ...    Full Name=Danny johns
    ...    Contact Number=8908046411
    ...    Email Address=aditya.sahay+694@zinc.systems
    ...    Describe the specific location=Testing the location
    ...    Select the option(s) that best describes the verbal abuse=Abuse disguised as a joke,Abusive Anger,Accusing or Blaming
    ...    Is CCTV available at the location?=Yes
    ...    Written summary=Testing summary
    ...    Who is the new reporter?=I am the reporter
    ...    Has a copy of the CCTV been saved?=Yes
    ...    Has a copy been uploaded to Analyst?=Yes
    ...    Was a weapon present?=Yes
    ...    What was the type of weapon(s) present?=Airgun,Axe,Baseball Bat

    FOR    ${question}    IN    @{expected_values.keys()}
        ${expected_text}    Set Variable    ${expected_values}[${question}]
        ${actual_text}    Get Text    xpath://td[.='${question}']/following-sibling::td
        Log    Verifying: ${question} - Expected: ${expected_text} | Actual: ${actual_text}
        Should Be Equal    ${actual_text}    ${expected_text}
    END

Verifying answer for Who is the Reporter dynamic question in the add event workflow
    [Arguments]    ${who_is_the_reporter_option_answer}
    Run Keyword And Ignore Error    Scroll Element Into View    ${edit_event_button}
    Click Element    ${edit_event_button}
    Wait Until Element Is Visible    ${add_event_category_dropdown}    15    category dropdown was not visible
    Sleep    4
    Run Keyword And Ignore Error    Scroll Element Into View    ${external/contractor_option}
    ${who_is_the_reporter_value}    Get Value    ${external_contractor_option}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${who_is_the_reporter_value}    ${who_is_the_reporter_option_answer}    who_is_the_reporter_value='${who_is_the_reporter_value}' is not equal to who_is_the_reporter_answer='${who_is_the_reporter_option_answer}'
    Log    Expected: '${who_is_the_reporter_option_answer}' | Actual: '${who_is_the_reporter_value}'


Verify Name,Email,and Contact Number for External Contractor on add event workflow
    [Arguments]    ${Name}     ${contact}     ${email_id}
    Run Keyword And Ignore Error    Scroll Element Into View    ${email_address_field}
    ${full_name_value}    Get Value    ${full_name_text_field}
    ${contact_value}    Get Value    ${contact_number_field}
    ${email_value}    Get Value    ${email_address_field}
    Run Keyword And Continue On Failure    Should Be Equal    ${full_name_value}    ${Name}    full_name_value='${full_name_value}' is not equal to Name='${Name}'
    Log To Console    Expected Name: '${Name}' | Actual Name: '${full_name_value}'
    Run Keyword And Continue On Failure    Should Be Equal    ${contact_value}    ${contact}    contact_value='${contact_value}' is not equal to contact='${contact}'
    Log To Console    Expected Contact: '${contact}' | Actual Contact: '${contact_value}'
    Run Keyword And Continue On Failure    Should Be Equal    ${email_value}    ${email_id}    email_value='${email_value}' is not equal to email_id='${email_id}'
    Log To Console    Expected Email: '${email_id}' | Actual Email: '${email_value}'

Verify the answer of Describe the specific location question on add event workflow
    [Arguments]    ${describe_the_specific_location_answer}
    Click On Next Button
    Run Keyword And Ignore Error    Scroll Element Into View    ${describe_the_specific_location_question} 
    ${describe_the_specific_location_value}    Get Value    ${describe_the_specific_location_question} 
    Run Keyword And Continue On Failure    Should Be Equal       ${describe_the_specific_location_value}     ${describe_the_specific_location_answer}
    Log To Console    Expected Specific Location: '${describe_the_specific_location_answer}' | Actual Specific Location: '${describe_the_specific_location_value}'

Verify the dropdown option for Select the option(s) that best describes the verbal abuse on add event workflow
    Click On Next Button
    Run Keyword And Ignore Error    Scroll Element Into View    ${Select the option(s) that best describes the verbal abuse_question}
    Click Element    ${Select the option(s) that best describes the verbal abuse_question}
    ${expected_dropdown_options}    Get Webelements    ${Select the option(s) that best describes the verbal abuse_question_selected_options}
    ${all_option_texts}    Create List
    FOR    ${expected_dropdown_option}    IN    @{expected_dropdown_options}
    ${option_text}    Get Text    ${expected_dropdown_option}
    Log    Expected selected dropdown values: ${option_text}
    Append To List    ${all_option_texts}    ${option_text}
    END
    [Return]    ${all_option_texts}
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC

Verify Is CCTV Available At The Location Question answer on add event workflow
    [Arguments]       ${Is_CCTV available_at_the_location_question_selected_answer}
    Run Keyword And Ignore Error    Scroll Element Into View    ${Is_CCTV_available_at_the_location_Option_Yes}
    ${Is_CCTV_available_at_the_location_Option_value}    Get Value    ${Is_CCTV_available_at_the_location_Option_Yes}
    Run Keyword And Continue On Failure    Should Be Equal       ${Is_CCTV_available_at_the_location_Option_value}    ${Is_CCTV available_at_the_location_question_selected_answer}
    Log To Console    Expected: '${Is_CCTV available_at_the_location_question_selected_answer}' | Actual: '${Is_CCTV_available_at_the_location_Option_value}'












    


    


    
