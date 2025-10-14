*** Settings ***
Documentation    this is a testing file for data comparison feature
Library    Selenium2Library
Library    Collections
#Resource    General.robot
Resource    ../Variables.robot
Resource    ../DataComparisonVariables.robot
#Resource    ../WidgetExportVariables.robot

*** Keywords ***
Navigate to Dashboard Module
    Click Element    ${Dashboard_module}
    Wait Until Element Is Visible    ${dashboard_text_header}

Click on the created dashboard page
#    [Arguments]    ${dashboard_page_name}
    ${dashboard_pages_list}    Get Webelements    ${dashboard_pages}
    ${dashboard_index}    Set Variable    1
    FOR    ${dashboard_page}    IN    @{dashboard_pages_list}
        Exit For Loop If    '${dashboard_page_name}' == '${dashboard_page.text}'
        ${dashboard_index}    Evaluate    ${dashboard_index}+1
    END
    ${dashboard_element}    Set Variable    xpath://div[contains(@id,'dashboard-collection-item')][${dashboard_index}]
    Click Element    ${dashboard_element}
    [Return]    ${dashboard_element}
    Wait Until Element Is Visible    ${dashboard_title}    10    dashboard title was not visible



    
    
Edit newly Added Dashboard Page for comparsion widget
    [Arguments]    ${Name}
    Sleep    4
    Wait Until Page Contains Element     xpath=//div[contains(@id,"left-panel-dynamic-page-title") and text()="${Name}"]   30
    Scroll Element Into View     xpath=//div[contains(@id,"left-panel-dynamic-page-title") and text()="${Name}"]
    ${status}=    Run Keyword And Return Status      click element    xpath=//div[contains(@id,"left-panel-dynamic-page-title") and text()="${Name}"]
    run keyword if    '${status}'=='False'        Execute JavaScript    document.evaluate("//div[text()='${Name}']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()
    Wait Until Element Is Visible    xpath=//span[contains(text(),'Add Page')]    20
    Run Keyword And Ignore Error    Scroll Element Into View     xpath=//div[contains(@id,"left-panel-dynamic-page-title") and text()="${Name}"]    
    

#    ${Current_Time} =    Get Current Date   increment=00:00:00  result_format=%m-%d_%H-%M-%S
#    ${Name}  set variable    Automation_${Current_Time}
#    ${Description}  set variable    Automation added description on ${Current_Time}
#    Wait Until Element Is Visible  ${DASHBOARD_ADD_PAGE_BUTTON}  30  Add page button in dashboard is not shown
#    click element  ${DASHBOARD_ADD_PAGE_BUTTON}
#    Wait Until Element Is Visible  ${DASHBOARD_ADD_PAGE_TITLE}  30  Add page slideout form is not shown
#    Wait Until Element Is Visible  ${DASHBOARD_NAME_FIELD}  30  Name field is not shown in slideout
#    Input Text    ${DASHBOARD_NAME_FIELD}    ${Name}
#    sleep  1
#    Wait Until Element Is Visible  ${DASHBOARD_DESCRIPTION_FIELD}  15  Description field is not shown in slideout
#    Input Text    ${DASHBOARD_DESCRIPTION_FIELD}    ${Description}
#    Wait Until Element Is Visible  ${DASHBOARD_ICON_FIELD}  30  Dashboard icon is not shown
#    click element  ${DASHBOARD_ICON_FIELD}
#    Wait Until Element Is Visible  ${DASHBOARD_ICON_SEARCH_BOX}  15  Name field is not shown in slideout
##    sleep  1
##    Input Text    ${DASHBOARD_ICON_SEARCH_BOX}    Auto
#    Wait For Condition    return document.readyState == 'complete'    timeout=10s
#    Wait Until Element Is Visible  ${DASHBOARD_ICON_RESULT_ITEM}  5  Dashboard icon not shown
#    click element  ${DASHBOARD_ICON_RESULT_ITEM}
#    run keyword and continue on failure  Wait Until Element Is Visible  ${DASHBOARD_CLOSE_BUTTON}  2  Close button is not shown
#    click element  ${DASHBOARD_SAVE_BUTTON}
#    Sleep    2
#    Scroll Element Into View    xpath=//div[@class='shared-dashboard-header ng-star-inserted']
#    Wait Until Page Contains Element    xpath=//div[contains(@id,"left-panel-dynamic-page-title") and text()='${Name}']   30
##    Wait Until Page Contains Element    xpath=//div[@class='cdk-drag left-panel-list-item left-panel-list-item-selected ng-star-inserted']/div[text()='${Name}']    30    newly created page is not selected
#    Set Suite Variable    ${DASHBOARD}    ${Name}
#    [Return]    ${Name}




Verify Data source dropdown contains both Incidents and Task under Comparison Configuration
    Click Element    ${chart_type_dropdown}
    Click Element    ${bar_chart}
    Click Element    ${data_source_dropdown}
    Sleep    3
    &{DROPDOWN_OPTIONS}    Create Dictionary
    ...    ${incident_dropdown_option}=Incidents
    ...    ${task_dropdown_option}=Task
    FOR    ${locator}    ${expected_text}    IN    &{DROPDOWN_OPTIONS}
        ${actual_text}    Get Text    ${locator}
        Log    Retrieved: ${actual_text}
        Should Be Equal    ${actual_text}    ${expected_text}
    END


Select Data Configuration for the Comparison chart
    Click Element    ${chart_type_dropdown}
    Click Element    ${bar_chart}
    Click Element    ${widget_title}
#    ${current_time}    Get Time    result_format=%Y-%m-%d %H:%M:%S
    ${unique_widget_title}    Set Variable    Region
    Input Text    ${widget_title}    ${unique_widget_title}
#    Log    Unique Widget Title: ${unique_widget_title}
    Click Element    ${data_source_dropdown}
    Click Element    ${incidents_option}
    Sleep    1
    Click Element    ${Saved_filter_dropdown}
    Input Text    ${Search_placeholder}    ${Search_value}
    Click Element    ${selected_saved_filter}
#    Set Suite Variable    ${region_widget_title}     ${unique_widget_title}








Select Data Configuration for the Site name Comparison chart
    Click Element    ${chart_type_dropdown}
    Click Element    ${bar_chart}
    Click Element    ${widget_title}
    Input Text    ${widget_title}    ${widget_title_site_name}
    Click Element    ${data_source_dropdown}
    Click Element    ${incidents_option}
    Sleep    1
    Click Element    ${Saved_filter_dropdown}
    Input Text    ${Search_placeholder}    ${Search_value}
    Click Element    ${selected_saved_filter}

Select Data Configuration for the Incident Category Comparison chart with respect to last 5 years
    Click Element    ${chart_type_dropdown}
    Click Element    ${bar_chart}
    Click Element    ${widget_title}
    Input Text    ${widget_title}   ${widget_title_last5year_Incident_Category}
    Click Element    ${data_source_dropdown}
    Click Element    ${incidents_option}
    Sleep    1
    Click Element    ${Saved_filter_dropdown}
    Input Text    ${Search_placeholder}    ${Search_value}
    Click Element    ${selected_saved_filter}

Select Data Configuration for the Incident Category Comparison chart with respect to last 4 years
    Click Element    ${chart_type_dropdown}
    Click Element    ${bar_chart}
    Click Element    ${widget_title}
    Input Text    ${widget_title}   ${widget_title_last4year_Incident_Category}
    Click Element    ${data_source_dropdown}
    Click Element    ${incidents_option}
    Sleep    1
    Click Element    ${Saved_filter_dropdown}
    Input Text    ${Search_placeholder}    ${Search_value}
    Click Element    ${selected_saved_filter}


Select Data Configuration for the Incident Category Comparison chart with respect to last 3 years
    Click Element    ${chart_type_dropdown}
    Click Element    ${bar_chart}
    Click Element    ${widget_title}
    Input Text    ${widget_title}   ${widget_title_last3year_Incident_Category}
    Click Element    ${data_source_dropdown}
    Click Element    ${incidents_option}
    Sleep    1
    Click Element    ${Saved_filter_dropdown}
    Input Text    ${Search_placeholder}    ${Search_value}
    Click Element    ${selected_saved_filter}



Select Data Configuration for the Incident Category Comparison chart with respect to last 2 years
    Click Element    ${chart_type_dropdown}
    Click Element    ${bar_chart}
    Click Element    ${widget_title}
    Input Text    ${widget_title}   ${widget_title_last2year_Incident_Category}
    Click Element    ${data_source_dropdown}
    Click Element    ${incidents_option}
    Sleep    1
    Click Element    ${Saved_filter_dropdown}
    Input Text    ${Search_placeholder}    ${Search_value}
    Click Element    ${selected_saved_filter}

Select Data Configuration for the Incident Category Comparison chart with respect to last year
    Click Element    ${chart_type_dropdown}
    Click Element    ${bar_chart}
    Click Element    ${widget_title}
    Input Text    ${widget_title}   ${widget_title_lastyear_Incident_Category}
    Click Element    ${data_source_dropdown}
    Click Element    ${incidents_option}
    Sleep    1
    Click Element    ${Saved_filter_dropdown}
    Input Text    ${Search_placeholder}    ${Search_value}
    Click Element    ${selected_saved_filter}


Select Data Configuration for the Month Comparison chart
    Click Element    ${chart_type_dropdown}
    Click Element    ${bar_chart}
    Click Element    ${widget_title}
    Input Text    ${widget_title}    ${month_widget_title}
    Click Element    ${data_source_dropdown}
    Click Element    ${incidents_option}
    Sleep    1
    Click Element    ${Saved_filter_dropdown}
    Input Text    ${Search_placeholder}    ${Search_value}
    Click Element    ${selected_saved_filter}

Select Data Configuration for the Quarter Comparison chart
    Click Element    ${chart_type_dropdown}
    Click Element    ${bar_chart}
    Click Element    ${widget_title}
    Input Text    ${widget_title}    ${quarter_widget_title}
    Click Element    ${data_source_dropdown}
    Click Element    ${incidents_option}
    Sleep    1
    Click Element    ${Saved_filter_dropdown}
    Input Text    ${Search_placeholder}    ${Search_value}
    Click Element    ${selected_saved_filter}

Select Data Configuration for the Week Comparison chart
    Click Element    ${chart_type_dropdown}
    Click Element    ${bar_chart}
    Click Element    ${widget_title}
    Input Text    ${widget_title}    ${week_widget_title}
    Click Element    ${data_source_dropdown}
    Click Element    ${incidents_option}
    Sleep    1
    Click Element    ${Saved_filter_dropdown}
    Input Text    ${Search_placeholder}    ${Search_value}
    Click Element    ${selected_saved_filter}

Select Data Configuration for the Day Comparison chart
    Click Element    ${chart_type_dropdown}
    Click Element    ${bar_chart}
    Click Element    ${widget_title}
    Input Text    ${widget_title}    ${day_widget_title}
    Click Element    ${data_source_dropdown}
    Click Element    ${incidents_option}
    Sleep    1
    Click Element    ${Saved_filter_dropdown}
    Input Text    ${Search_placeholder}    ${Search_value}
    Click Element    ${selected_saved_filter}

Select Data Configuration for the Year Comparison chart
    Click Element    ${chart_type_dropdown}
    Click Element    ${bar_chart}
    Click Element    ${widget_title}
    Input Text    ${widget_title}    ${year_widget_title}
    Click Element    ${data_source_dropdown}
    Click Element    ${incidents_option}
    Sleep    1
    Click Element    ${Saved_filter_dropdown}
    Input Text    ${Search_placeholder}    ${Search_value}
    Click Element    ${selected_saved_filter}

Verify add widget title under configurations
    Wait Until Element Is Visible    ${add_widget_text_on_configs_section}    10    add widget text was not visible

Verify preview notice message 
    Wait Until Page Contains Element    ${preview_notice_message}    10    preview notice message was not visible

Select Comparison Configuration for the Comparison chart
    Click Element    ${x_axis_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${region_name_option}
    Wait Until Element Is Visible    ${region_name_option}     10
    Click Element    ${region_name_option}
    Click Element    ${x_axis_filter_dropdown}
    Click Element    ${qa_region_option}
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Scroll Element Into View      ${compare_by_dropdown}
    Click Element    ${compare_by_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View   ${year_option}
    Wait Until Element Is Visible    ${year_option}     10
    Click Element    ${year_option}
    Scroll Element Into View    ${select_comparisons}
    Click Element     ${select_comparisons}
    Click Element   ${2024_year_option}
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Click Element    ${widget_size}
    Click Element    ${widget_size_resolution}
    Click Element    ${first_next_button}
    Verify Preview Notice Message
    Click Element    ${second_next_button}
    Verify Preview Notice Message
    Sleep    10
    Click Element    ${submit_button}
    Wait Until Page Contains Element    xpath://button[@class='btn']    10    Save Button was not visible to save the widget
    Click Element    xpath://button[@class='btn']
    Wait Until Page Contains Element    ${bar_chart_graph}    15    Bar chart was not visible
#    Run Keyword And Ignore Error    Scroll Element Into View    ${widget_title_name}
    Run Keyword And Ignore Error    Scroll Element Into View    ${bar_chart_graph}
    Wait Until Element Is Visible    ${bar_chart_graph}    10    Bar chart was not visible

Verify the chart type for Region Comparison chart
#    [Arguments]    ${dashboard_page_name}
#    ${dashboard_pages_list}    Get Webelements    ${dashboard_pages}
#    ${dashboard_index}    Set Variable    1
#    FOR    ${dashboard_page}    IN    @{dashboard_pages_list}
#        Exit For Loop If    '${dashboard_page_name}' == '${dashboard_page.text}'
#        ${dashboard_index}    Evaluate    ${dashboard_index}+1
#    END
#    ${dashboard_edit_element}    Set Variable    xpath:(//button[@id='dashboard-collection-item-menu'])[${dashboard_index}]
#    Click Element    ${dashboard_edit_element}
##   Sleep    3
#    Click Element    ${dashboard_edit_page_button}
#    Sleep    2
    Wait Until Page Contains Element    ${edit_widget_button}    10    edit widget button was not visible
    Click Element    ${edit_widget_button}
    Sleep    4
    ${expected_chart_type_value}    Get Text    ${Region_ComparisonChart_selected_chart_type_value}
    [Return]    ${expected_chart_type_value}

Verify the chart type for Site name Comparison chart
#    [Arguments]    ${dashboard_page_name}
#    ${dashboard_pages_list}    Get Webelements    ${dashboard_pages}
#    ${dashboard_index}    Set Variable    1
#    FOR    ${dashboard_page}    IN    @{dashboard_pages_list}
#        Exit For Loop If    '${dashboard_page_name}' == '${dashboard_page.text}'
#        ${dashboard_index}    Evaluate    ${dashboard_index}+1
#    END
#    ${dashboard_edit_element}    Set Variable    xpath:(//button[@id='dashboard-collection-item-menu'])[${dashboard_index}]
#    Click Element    ${dashboard_edit_element}
##   Sleep    3
#    Click Element    ${dashboard_edit_page_button}
#    Sleep    2
    Wait Until Page Contains Element    ${edit_widget_button}    10    edit widget button was not visible
    Click Element    ${edit_widget_button}
    Sleep    4
    ${expected_chart_type_value}    Get Text    ${Region_ComparisonChart_selected_chart_type_value}
    [Return]    ${expected_chart_type_value}

Verify the chart type for Last 3 year Incident category Comparison chart
    Wait Until Page Contains Element    ${edit_widget_button}    10    edit widget button was not visible
    Click Element    ${edit_widget_button}
    Sleep    4
    ${expected_chart_type_value}    Get Text    ${Region_ComparisonChart_selected_chart_type_value}
    [Return]    ${expected_chart_type_value}

Verify the chart type for Month wrt Incident category Comparison chart
    Wait Until Page Contains Element    ${edit_widget_button}    10    edit widget button was not visible
    Click Element    ${edit_widget_button}
    Sleep    4
    ${expected_chart_type_value}    Get Text    ${Region_ComparisonChart_selected_chart_type_value}
    [Return]    ${expected_chart_type_value}

Verify the chart type for Quarter wrt Incident category Comparison chart
    Wait Until Page Contains Element    ${edit_widget_button}    10    edit widget button was not visible
    Click Element    ${edit_widget_button}
    Sleep    4
    ${expected_chart_type_value}    Get Text    ${Region_ComparisonChart_selected_chart_type_value}
    [Return]    ${expected_chart_type_value}

Verify the chart type for Week wrt Incident category Comparison chart
    Wait Until Page Contains Element    ${edit_widget_button}    10    edit widget button was not visible
    Click Element    ${edit_widget_button}
    Sleep    4
    ${expected_chart_type_value}    Get Text    ${Region_ComparisonChart_selected_chart_type_value}
    [Return]    ${expected_chart_type_value}

Verify the chart type for Day wrt Incident category Comparison chart
    Wait Until Page Contains Element    ${edit_widget_button}    10    edit widget button was not visible
    Click Element    ${edit_widget_button}
    Sleep    4
    ${expected_chart_type_value}    Get Text    ${Region_ComparisonChart_selected_chart_type_value}
    [Return]    ${expected_chart_type_value}

verify the widget title value on the data configuration page for Region Comparison chart
    ${expected_widget_title_value}    Get Text    ${widget_title_name}
    Should Be Equal    ${expected_widget_title_value}    ${widget_title_value}

verify the widget title value on the data configuration page for Site Name Comparison chart
    ${expected_site_name_chart_widget_title_value}    Get Text    ${widget_title_name}
    Should Be Equal    ${expected_site_name_chart_widget_title_value}    ${widget_title_site_name}

verify the widget title value on the data configuration page for Last 3 year Incident Category Comparison chart
    ${expected_last3year_IncidentCategory_chart_widget_title_value}    Get Text    ${widget_title_name}
    Should Be Equal    ${expected_last3year_IncidentCategory_chart_widget_title_value}    ${widget_title_last3year_Incident_Category}

verify the widget title value on the data configuration page for Month wrt Incident Category Comparison chart
    ${expected_month_IncidentCategory_chart_widget_title_value}    Get Text    ${widget_title_name}
    Should Be Equal    ${expected_month_IncidentCategory_chart_widget_title_value}    ${month_widget_title}

verify the widget title value on the data configuration page for Quarter wrt Incident Category Comparison chart
    ${expected_quarter_IncidentCategory_chart_widget_title_value}    Get Text    ${widget_title_name}
    Should Be Equal    ${expected_quarter_IncidentCategory_chart_widget_title_value}    ${quarter_widget_title}

verify the widget title value on the data configuration page for Week wrt Incident Category Comparison chart
    ${expected_week_IncidentCategory_chart_widget_title_value}    Get Text    ${widget_title_name}
    Should Be Equal    ${expected_week_IncidentCategory_chart_widget_title_value}    ${week_widget_title}

verify the widget title value on the data configuration page for Day wrt Incident Category Comparison chart
    ${expected_day_IncidentCategory_chart_widget_title_value}    Get Text    ${widget_title_name}
    Should Be Equal    ${expected_day_IncidentCategory_chart_widget_title_value}    ${day_widget_title}

verify the data source on the data configuration page
    ${expected_data_source_value}    Get Text    ${selected_data_source_value}
    Log    Expected Data Source: ${expected_data_source_value}
    [Return]    ${expected_data_source_value}

verify the x axis value for Region Comparison chart on Comparison configuration section
    Run Keyword And Ignore Error    Scroll Element Into View    ${select_comparisons}
    ${expected_x_axis_value}    Get Text    ${X_axis_value}
    Log    Expected x axis filter value: ${expected_x_axis_value}
    [Return]    ${expected_x_axis_value}

verify the x axis value for Site Name Comparison chart on Comparison configuration section
    Run Keyword And Ignore Error    Scroll Element Into View    ${select_comparisons}
    ${expected_x_axis_value}    Get Text    ${X_axis_value}
    Log    Expected x axis value: ${expected_x_axis_value}
    [Return]    ${expected_x_axis_value}

verify the x axis value for Last 3 year wrt Incident category Comparison chart on Comparison configuration section
    Run Keyword And Ignore Error    Scroll Element Into View    ${select_comparisons}
    ${expected_x_axis_value}    Get Text    ${X_axis_value}
    Log    Expected x axis value: ${expected_x_axis_value}
    [Return]    ${expected_x_axis_value}

verify the x axis value for Month wrt Incident category Comparison chart on Comparison configuration section
    Run Keyword And Ignore Error    Scroll Element Into View    ${select_comparisons}
    ${expected_x_axis_value}    Get Text    ${X_axis_value}
    Log    Expected x axis value: ${expected_x_axis_value}
    [Return]    ${expected_x_axis_value}

verify the x axis value for Quarter wrt Incident category Comparison chart on Comparison configuration section
    Sleep    2
    Run Keyword And Ignore Error    Scroll Element Into View    ${select_comparisons}
    ${expected_x_axis_value}    Get Text    ${X_axis_value}
    Log    Expected x axis value: ${expected_x_axis_value}
    [Return]    ${expected_x_axis_value}

verify the x axis value for Week wrt Incident category Comparison chart on Comparison configuration section
    Sleep    2
    Run Keyword And Ignore Error    Scroll Element Into View    ${select_comparisons}
    ${expected_x_axis_value}    Get Text    ${X_axis_value}
    Log    Expected x axis value: ${expected_x_axis_value}
    [Return]    ${expected_x_axis_value}

verify the x axis value for day wrt Incident category Comparison chart on Comparison configuration section
    Sleep    2
    Run Keyword And Ignore Error    Scroll Element Into View    ${select_comparisons}
    ${expected_x_axis_value}    Get Text    ${X_axis_value}
    Log    Expected x axis value: ${expected_x_axis_value}
    [Return]    ${expected_x_axis_value}

verify the select year value for Month wrt Incident category Comparison chart on Comparison configuration section
    ${expected_select_year_value}    Get Text    ${select_year_dropdown_value}
    Log    Expected select year value: ${expected_select_year_value}
    [Return]    ${expected_select_year_value}

verify the select year value for Quarter wrt Incident category Comparison chart on Comparison configuration section
    ${expected_select_year_value}    Get Text    ${select_year_dropdown_value}
    Log    Expected select year value: ${expected_select_year_value}
    [Return]    ${expected_select_year_value}

verify the select year value for Week wrt Incident category Comparison chart on Comparison configuration section
    ${expected_select_year_value}    Get Text    ${select_year_dropdown_value}
    Log    Expected select year value: ${expected_select_year_value}
    [Return]    ${expected_select_year_value}

verify the select year value for Day wrt Incident category Comparison chart on Comparison configuration section
    ${expected_select_year_value}    Get Text    ${select_year_dropdown_value}
    Log    Expected select year value: ${expected_select_year_value}
    [Return]    ${expected_select_year_value}

verify the x axis filter value for Last3year Incident Category Comparison chart on Comparison configuration section
    ${expected_x_axis_filter_value}    Get Text    ${x_axis_filter_value}
    Log    Expected X axis filter value: ${expected_x_axis_filter_value}
    [Return]    ${expected_x_axis_filter_value}

verify the x axis filter value for Region Comparison chart on Comparison configuration section
    ${expected_x_axis_filter_value}    Get Text    ${x_axis_filter_value}
    Log    Expected X axis filter value: ${expected_x_axis_filter_value}
    [Return]    ${expected_x_axis_filter_value}

Verify x axis filter value for Site Name Comparison chart on Comparison configuration section
     Run Keyword And Ignore Error    Scroll Element Into View    ${select_comparisons}
     Click Element    ${site_name_x_axis_filter_dropdown}
     ${expected_x_axis_filter_value}    Get Text    ${site_name}
     Press Keys    ${None}    ESC
     Log    Expected x axis filter value: ${expected_x_axis_filter_value}
    [Return]    ${expected_x_axis_filter_value}

Verify Compare by value for Site Name Comparison chart on Comparison configuration section
    ${expected_compare_by_value}    Get Text    ${compare_by_filter_value}
    Log    Expected Compare By value: ${expected_compare_by_value}
    [Return]    ${expected_compare_by_value}

Verify Compare by value for Last3year Incident Category Comparison chart on Comparison configuration section
    ${expected_compare_by_value}    Get Text    ${compare_by_filter_value}
    Log    Expected Compare By value: ${expected_compare_by_value}
    [Return]    ${expected_compare_by_value}

Verify select comparisons for last3year Incident category Comparison chart on Comparison configuration section
    Click Element    ${select_comparisons}
    ${expected_dropdown_options}    Get Webelements    ${select_comparisons_value}
    ${all_option_texts}    Create List
    FOR    ${expected_dropdown_option}    IN    @{expected_dropdown_options}
    ${option_text}    Get Text    ${expected_dropdown_option}
    Log    Expected Select comparisons values: ${option_text}
    Append To List    ${all_option_texts}    ${option_text}
    END
    [Return]    ${all_option_texts}

Verify select comparisons for Month wrt Incident category Comparison chart on Comparison configuration section
    Click Element    ${select_comparisons}
    ${expected_dropdown_options}    Get Webelements    ${select_comparisons_value}
    ${all_option_texts}    Create List
    FOR    ${expected_dropdown_option}    IN    @{expected_dropdown_options}
    ${option_text}    Get Text    ${expected_dropdown_option}
    Log    Expected Select comparisons values: ${option_text}
    Append To List    ${all_option_texts}    ${option_text}
    END
    [Return]    ${all_option_texts}

Verify select comparisons for Quarter wrt Incident category Comparison chart on Comparison configuration section
    Click Element    ${select_comparisons}
    ${expected_dropdown_options}    Get Webelements    ${select_comparisons_value}
    ${all_option_texts}    Create List
    FOR    ${expected_dropdown_option}    IN    @{expected_dropdown_options}
    ${option_text}    Get Text    ${expected_dropdown_option}
    Log    Expected Select comparisons values: ${option_text}
    Append To List    ${all_option_texts}    ${option_text}
    END
    [Return]    ${all_option_texts}

Verify select comparisons for Week wrt Incident category Comparison chart on Comparison configuration section
    Click Element    ${select_comparisons}
    ${expected_dropdown_options}    Get Webelements    ${select_comparisons_value}
    ${all_option_texts}    Create List
    FOR    ${expected_dropdown_option}    IN    @{expected_dropdown_options}
    ${option_text}    Get Text    ${expected_dropdown_option}
    Log    Expected Select comparisons values: ${option_text}
    Append To List    ${all_option_texts}    ${option_text}
    END
    [Return]    ${all_option_texts}

Verify select comparisons for Day wrt Incident category Comparison chart on Comparison configuration section
    Click Element    ${select_comparisons}
    ${expected_dropdown_options}    Get Webelements    ${select_comparisons_value}
    ${all_option_texts}    Create List
    FOR    ${expected_dropdown_option}    IN    @{expected_dropdown_options}
    ${option_text}    Get Text    ${expected_dropdown_option}
    Log    Expected Select comparisons values: ${option_text}
    Append To List    ${all_option_texts}    ${option_text}
    END
    [Return]    ${all_option_texts}

Verify x axis filter values selected for Month wrt Incident category Comparison chart on Comparison configuration section
    Click Element    ${x_axis_filter_dropdown}
    ${expected_dropdown_options}    Get Webelements    ${x_axis_filter_value}
    ${all_option_texts}    Create List
    FOR    ${expected_dropdown_option}    IN    @{expected_dropdown_options}
    ${option_text}    Get Text    ${expected_dropdown_option}
    Log    Expected x axis filter values: ${option_text}
    Append To List    ${all_option_texts}    ${option_text}
    END
    [Return]    ${all_option_texts}
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC

Verify x axis filter values selected for Quarter wrt Incident category Comparison chart on Comparison configuration section
    Click Element    ${x_axis_filter_dropdown}
    ${expected_dropdown_options}    Get Webelements    ${x_axis_filter_value}
    ${all_option_texts}    Create List
    FOR    ${expected_dropdown_option}    IN    @{expected_dropdown_options}
    ${option_text}    Get Text    ${expected_dropdown_option}
    Log    Expected x axis filter values: ${option_text}
    Append To List    ${all_option_texts}    ${option_text}
    END
    [Return]    ${all_option_texts}
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC


Verify x axis filter values selected for Week wrt Incident category Comparison chart on Comparison configuration section
    Click Element    ${x_axis_filter_dropdown}
    ${expected_dropdown_options}    Get Webelements    ${x_axis_filter_value}
    ${all_option_texts}    Create List
    FOR    ${expected_dropdown_option}    IN    @{expected_dropdown_options}
    ${option_text}    Get Text    ${expected_dropdown_option}
    Log    Expected x axis filter values: ${option_text}
    Append To List    ${all_option_texts}    ${option_text}
    END
    [Return]    ${all_option_texts}
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC

Verify x axis filter values selected for Day wrt Incident category Comparison chart on Comparison configuration section
    Click Element    ${x_axis_filter_dropdown}
    ${expected_dropdown_options}    Get Webelements    ${x_axis_filter_value}
    ${all_option_texts}    Create List
    FOR    ${expected_dropdown_option}    IN    @{expected_dropdown_options}
    ${option_text}    Get Text    ${expected_dropdown_option}
    Log    Expected x axis filter values: ${option_text}
    Append To List    ${all_option_texts}    ${option_text}
    END
    [Return]    ${all_option_texts}
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC

Verify Compare by value for Month wrt Incident Category Comparison chart on Comparison configuration section
    ${expected_compare_by_value}    Get Text    ${compare_by_filter_value}
    Log    Expected Compare By value: ${expected_compare_by_value}
    [Return]    ${expected_compare_by_value}

Verify Compare by value for Quarter wrt Incident Category Comparison chart on Comparison configuration section
    ${expected_compare_by_value}    Get Text    ${compare_by_filter_value}
    Log    Expected Compare By value: ${expected_compare_by_value}
    [Return]    ${expected_compare_by_value}

Verify Compare by value for Week wrt Incident Category Comparison chart on Comparison configuration section
    ${expected_compare_by_value}    Get Text    ${compare_by_filter_value}
    Log    Expected Compare By value: ${expected_compare_by_value}
    [Return]    ${expected_compare_by_value}

Verify Compare by value for Day wrt Incident Category Comparison chart on Comparison configuration section
    ${expected_compare_by_value}    Get Text    ${compare_by_filter_value}
    Log    Expected Compare By value: ${expected_compare_by_value}
    [Return]    ${expected_compare_by_value}


Verify select comparisons for Site Name Comparison chart on Comparison configuration section
    ${expected_select_comparisons_value}    Get Text    ${select_comparisons_value}
    Log    Expected Select comparisons value: ${expected_select_comparisons_value}
    [Return]    ${expected_select_comparisons_value}


Verify Compare by value for Region Comparison chart on Comparison configuration section
    ${expected_compare_by_value}    Get Text    ${compare_by_filter_value}
    Log    Expected Compare By value: ${expected_compare_by_value}
    [Return]    ${expected_compare_by_value}

Verify select comparisons for Region Comparison chart on Comparison configuration section
    ${expected_select_comparisons_value}    Get Text    ${select_comparisons_value}
    Log    Expected Select comparisons value: ${expected_select_comparisons_value}
    [Return]    ${expected_select_comparisons_value}


Click on add widget button
#    ${dashboard_pages_list}    Get Webelements    ${dashboard_pages}
#    ${dashboard_index}    Set Variable    1
#    FOR    ${dashboard_page}    IN    @{dashboard_pages_list}
#        Exit For Loop If    '${dashboard_page_name}' == '${dashboard_page.text}'
#        ${dashboard_index}    Evaluate    ${dashboard_index}+1
#    END
#    ${dashboard_edit_element}    Set Variable    xpath:(//button[@id='dashboard-collection-item-menu'])[${dashboard_index}]
#    Click Element    ${dashboard_edit_element}
#    [Return]    ${dashboard_edit_element}
#    Sleep    3
#    Click Element    ${dashboard_edit_page_button}
    Run Keyword And Ignore Error    Wait Until Page Contains Element    ${add_widget_button}    25    add widget button was not visible
    Click Element    ${add_widget_button}
    ${widget_button_locator}    Set Variable    ${comparison_chart_widget_button}
    Run Keyword And Ignore Error    Scroll Element Into View    ${widget_button_locator}
    Wait Until Element Is Visible    ${widget_button_locator}    5    Widget button not visible even after scroll
    Click Element       ${widget_button_locator}
    Sleep    1

Click on Edit Page icon of the dashboard and navigate to Tab 2
    [Arguments]    ${dashboard_page_name}
    ${dashboard_pages_list}    Get Webelements    ${dashboard_pages}
    ${dashboard_index}    Set Variable    1
    FOR    ${dashboard_page}    IN    @{dashboard_pages_list}
        Exit For Loop If    '${dashboard_page_name}' == '${dashboard_page.text}'
        ${dashboard_index}    Evaluate    ${dashboard_index}+1
    END
    ${dashboard_edit_element}    Set Variable    xpath:(//button[@id='dashboard-collection-item-menu'])[${dashboard_index}]
    Click Element    ${dashboard_edit_element}
    Sleep    1
    Click Element    ${dashboard_edit_page_button}
    Sleep    3
    Click Element    ${tab_2}
    Wait Until Page Contains Element    ${add_widget_button}    25    add widget button was not visible
    Click Element    ${add_widget_button}
    ${widget_button_locator}    Set Variable    ${comparison_chart_widget_button}
    Run Keyword And Ignore Error    Scroll Element Into View    ${widget_button_locator}
    Wait Until Element Is Visible    ${widget_button_locator}    5    Widget button not visible even after scroll
    Click Element       ${widget_button_locator}
    Sleep    1


Go to the newly created widget
    Run Keyword And Ignore Error    Scroll Element Into View    xpath://h3[text()=' ${unique_widget_title} ']
    Wait Until Element Is Visible     ${edit_widget_button}    15
    Click Element    ${edit_widget_button}
    Sleep    3




Click on edit page and Navigate to tab 2
    [Arguments]    ${dashboard_page_name}
    ${dashboard_pages_list}    Get Webelements    ${dashboard_pages}
    ${dashboard_index}    Set Variable    1
    FOR    ${dashboard_page}    IN    @{dashboard_pages_list}
        Exit For Loop If    '${dashboard_page_name}' == '${dashboard_page.text}'
        ${dashboard_index}    Evaluate    ${dashboard_index}+1
    END
    ${dashboard_edit_element}    Set Variable    xpath:(//button[@id='dashboard-collection-item-menu'])[${dashboard_index}]
    Click Element    ${dashboard_edit_element}
    Sleep    1
    Click Element    ${dashboard_edit_page_button}
    Sleep    3
    Click Element    ${tab_2}
    Sleep    2


Click on edit page and Navigate to tab 3
    [Arguments]    ${dashboard_page_name}
    ${dashboard_pages_list}    Get Webelements    ${dashboard_pages}
    ${dashboard_index}    Set Variable    1
    FOR    ${dashboard_page}    IN    @{dashboard_pages_list}
        Exit For Loop If    '${dashboard_page_name}' == '${dashboard_page.text}'
        ${dashboard_index}    Evaluate    ${dashboard_index}+1
    END
    ${dashboard_edit_element}    Set Variable    xpath:(//button[@id='dashboard-collection-item-menu'])[${dashboard_index}]
    Click Element    ${dashboard_edit_element}
    Sleep    1
    Click Element    ${dashboard_edit_page_button}
    Sleep    4
    Click Element    ${tab_3}
    Sleep    2

Click on edit page and Navigate to tab 4
    [Arguments]    ${dashboard_page_name}
    ${dashboard_pages_list}    Get Webelements    ${dashboard_pages}
    ${dashboard_index}    Set Variable    1
    FOR    ${dashboard_page}    IN    @{dashboard_pages_list}
        Exit For Loop If    '${dashboard_page_name}' == '${dashboard_page.text}'
        ${dashboard_index}    Evaluate    ${dashboard_index}+1
    END
    ${dashboard_edit_element}    Set Variable    xpath:(//button[@id='dashboard-collection-item-menu'])[${dashboard_index}]
    Click Element    ${dashboard_edit_element}
    Sleep    1
    Click Element    ${dashboard_edit_page_button}
    Sleep    3
    Click Element    ${tab_4}
    Sleep    2


Click on edit page and Navigate to tab 5
    [Arguments]    ${dashboard_page_name}
    ${dashboard_pages_list}    Get Webelements    ${dashboard_pages}
    ${dashboard_index}    Set Variable    1
    FOR    ${dashboard_page}    IN    @{dashboard_pages_list}
        Exit For Loop If    '${dashboard_page_name}' == '${dashboard_page.text}'
        ${dashboard_index}    Evaluate    ${dashboard_index}+1
    END
    ${dashboard_edit_element}    Set Variable    xpath:(//button[@id='dashboard-collection-item-menu'])[${dashboard_index}]
    Click Element    ${dashboard_edit_element}
    Sleep    1
    Click Element    ${dashboard_edit_page_button}
    Sleep    3
    Click Element    ${tab_5}
    Sleep    2


Click on edit page and Navigate to tab 6
    [Arguments]    ${dashboard_page_name}
    ${dashboard_pages_list}    Get Webelements    ${dashboard_pages}
    ${dashboard_index}    Set Variable    1
    FOR    ${dashboard_page}    IN    @{dashboard_pages_list}
        Exit For Loop If    '${dashboard_page_name}' == '${dashboard_page.text}'
        ${dashboard_index}    Evaluate    ${dashboard_index}+1
    END
    ${dashboard_edit_element}    Set Variable    xpath:(//button[@id='dashboard-collection-item-menu'])[${dashboard_index}]
    Click Element    ${dashboard_edit_element}
    Sleep    1
    Click Element    ${dashboard_edit_page_button}
    Sleep    3
    Click Element    ${tab_6}
    Sleep    2


Click on edit page and Navigate to tab 7
    [Arguments]    ${dashboard_page_name}
    ${dashboard_pages_list}    Get Webelements    ${dashboard_pages}
    ${dashboard_index}    Set Variable    1
    FOR    ${dashboard_page}    IN    @{dashboard_pages_list}
        Exit For Loop If    '${dashboard_page_name}' == '${dashboard_page.text}'
        ${dashboard_index}    Evaluate    ${dashboard_index}+1
    END
    ${dashboard_edit_element}    Set Variable    xpath:(//button[@id='dashboard-collection-item-menu'])[${dashboard_index}]
    Click Element    ${dashboard_edit_element}
    Sleep    1
    Click Element    ${dashboard_edit_page_button}
    Sleep    3
    Click Element    ${tab_7}
    Sleep    2


Click on Edit Page icon of the dashboard and navigate to Tab 3
    [Arguments]    ${dashboard_page_name}
    ${dashboard_pages_list}    Get Webelements    ${dashboard_pages}
    ${dashboard_index}    Set Variable    1
    FOR    ${dashboard_page}    IN    @{dashboard_pages_list}
        Exit For Loop If    '${dashboard_page_name}' == '${dashboard_page.text}'
        ${dashboard_index}    Evaluate    ${dashboard_index}+1
    END
    ${dashboard_edit_element}    Set Variable    xpath:(//button[@id='dashboard-collection-item-menu'])[${dashboard_index}]
    Click Element    ${dashboard_edit_element}
    Sleep    1
    Click Element    ${dashboard_edit_page_button}
    Sleep    3
    Click Element    ${tab_3}
    Wait Until Page Contains Element    ${add_widget_button}    25    add widget button was not visible
    Click Element    ${add_widget_button}
    ${widget_button_locator}    Set Variable    ${comparison_chart_widget_button}
    Run Keyword And Ignore Error    Scroll Element Into View    ${widget_button_locator}
    Wait Until Element Is Visible    ${widget_button_locator}    5    Widget button not visible even after scroll
    Click Element       ${widget_button_locator}
    Sleep    1

Click on Edit Page icon of the dashboard and navigate to Tab 4
    [Arguments]    ${dashboard_page_name}
    ${dashboard_pages_list}    Get Webelements    ${dashboard_pages}
    ${dashboard_index}    Set Variable    1
    FOR    ${dashboard_page}    IN    @{dashboard_pages_list}
        Exit For Loop If    '${dashboard_page_name}' == '${dashboard_page.text}'
        ${dashboard_index}    Evaluate    ${dashboard_index}+1
    END
    ${dashboard_edit_element}    Set Variable    xpath:(//button[@id='dashboard-collection-item-menu'])[${dashboard_index}]
    Click Element    ${dashboard_edit_element}
    Sleep    1
    Click Element    ${dashboard_edit_page_button}
    Sleep    4
    Click Element    ${tab_4}
    Wait Until Page Contains Element    ${add_widget_button}    25    add widget button was not visible
    Click Element    ${add_widget_button}
    ${widget_button_locator}    Set Variable    ${comparison_chart_widget_button}
    Run Keyword And Ignore Error    Scroll Element Into View    ${widget_button_locator}
    Wait Until Element Is Visible    ${widget_button_locator}    5    Widget button not visible even after scroll
    Click Element       ${widget_button_locator}
    Sleep    1

Click on Edit Page icon of the dashboard and navigate to Tab 5
    [Arguments]    ${dashboard_page_name}
    ${dashboard_pages_list}    Get Webelements    ${dashboard_pages}
    ${dashboard_index}    Set Variable    1
    FOR    ${dashboard_page}    IN    @{dashboard_pages_list}
        Exit For Loop If    '${dashboard_page_name}' == '${dashboard_page.text}'
        ${dashboard_index}    Evaluate    ${dashboard_index}+1
    END
    ${dashboard_edit_element}    Set Variable    xpath:(//button[@id='dashboard-collection-item-menu'])[${dashboard_index}]
    Click Element    ${dashboard_edit_element}
    Sleep    1
    Click Element    ${dashboard_edit_page_button}
    Sleep    3
    Click Element    ${tab_5}
    Wait Until Page Contains Element    ${add_widget_button}    25    add widget button was not visible
    Click Element    ${add_widget_button}
    ${widget_button_locator}    Set Variable    ${comparison_chart_widget_button}
    Run Keyword And Ignore Error    Scroll Element Into View    ${widget_button_locator}
    Wait Until Element Is Visible    ${widget_button_locator}    5    Widget button not visible even after scroll
    Click Element       ${widget_button_locator}
    Sleep    1
    
    
Click on Edit Page icon of the dashboard and navigate to Tab 6
    [Arguments]    ${dashboard_page_name}
    ${dashboard_pages_list}    Get Webelements    ${dashboard_pages}
    ${dashboard_index}    Set Variable    1
    FOR    ${dashboard_page}    IN    @{dashboard_pages_list}
        Exit For Loop If    '${dashboard_page_name}' == '${dashboard_page.text}'
        ${dashboard_index}    Evaluate    ${dashboard_index}+1
    END
    ${dashboard_edit_element}    Set Variable    xpath:(//button[@id='dashboard-collection-item-menu'])[${dashboard_index}]
    Click Element    ${dashboard_edit_element}
    Sleep    1
    Click Element    ${dashboard_edit_page_button}
    Sleep    3
    Click Element    ${tab_6}
    Wait Until Page Contains Element    ${add_widget_button}    25    add widget button was not visible
    Click Element    ${add_widget_button}
    ${widget_button_locator}    Set Variable    ${comparison_chart_widget_button}
    Run Keyword And Ignore Error    Scroll Element Into View    ${widget_button_locator}
    Wait Until Element Is Visible    ${widget_button_locator}    5    Widget button not visible even after scroll
    Click Element       ${widget_button_locator}
    Sleep    1

Click on Edit Page icon of the dashboard and navigate to Tab 7
    [Arguments]    ${dashboard_page_name}
    ${dashboard_pages_list}    Get Webelements    ${dashboard_pages}
    ${dashboard_index}    Set Variable    1
    FOR    ${dashboard_page}    IN    @{dashboard_pages_list}
        Exit For Loop If    '${dashboard_page_name}' == '${dashboard_page.text}'
        ${dashboard_index}    Evaluate    ${dashboard_index}+1
    END
    ${dashboard_edit_element}    Set Variable    xpath:(//button[@id='dashboard-collection-item-menu'])[${dashboard_index}]
    Click Element    ${dashboard_edit_element}
    Sleep    1
    Click Element    ${dashboard_edit_page_button}
    Sleep    3
    Click Element    ${tab_7}
    Wait Until Page Contains Element    ${add_widget_button}    25    add widget button was not visible
    Click Element    ${add_widget_button}
    ${widget_button_locator}    Set Variable    ${comparison_chart_widget_button}
    Run Keyword And Ignore Error    Scroll Element Into View    ${widget_button_locator}
    Wait Until Element Is Visible    ${widget_button_locator}    5    Widget button not visible even after scroll
    Click Element       ${widget_button_locator}
    Sleep    1

Select Comparison Configuration for the Site name Comparison chart
    Click Element    ${x_axis_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${site_name_option}
    Wait Until Element Is Visible    ${site_name_option}      10
    Click Element    ${site_name_option}
    Scroll Element Into View     ${site_name_x_axis_filter_dropdown}
    Click Element    ${site_name_x_axis_filter_dropdown}
    Click Element    ${site_name3}
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Scroll Element Into View      ${compare_by_dropdown}
    Click Element    ${compare_by_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View   ${year_option}
    Wait Until Element Is Visible    ${year_option}     10
    Click Element    ${year_option}
    Scroll Element Into View    ${select_comparisons}
    Click Element     ${select_comparisons}
    Click Element   ${2024_year_option}
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Click Element    ${widget_size}
    Click Element    ${widget_size_resolution}
    Click Element    ${first_next_button}
    Verify Preview Notice Message
    Click Element    ${second_next_button}
    Verify Preview Notice Message
    Click Element    ${submit_button}
    Sleep    7
    Wait Until Page Contains Element    xpath://button[@class='btn']    10    Save Button was not visible to save the widget
    Click Element    xpath://button[@class='btn']
    Wait Until Page Contains Element    ${bar_chart_graph}    15    Bar chart was not visible
    Run Keyword And Ignore Error    Scroll Element Into View    ${bar_chart_graph}
    Wait Until Element Is Visible    ${bar_chart_graph}

Select Comparison Configuration For The Incident Category Comparison Chart with respect to last 3 year
    Click Element    ${x_axis_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${last_3_year}
    Wait Until Element Is Visible    ${last_3_year}    10
    Click Element    ${last_3_year}
    Scroll Element Into View    ${compare_by_dropdown}
    Click Element    ${compare_by_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${incident_category_option}
    Wait Until Element Is Visible      ${incident_category_option}    10
    Click Element    ${incident_category_option}
    Scroll Element Into View    ${select_comparisons}
    Click Element     ${select_comparisons}
    Click Element    xpath://div[@data-val='Daily Occurrence Book']
    Click Element    xpath://div[@data-val='Alarm Activations']
    Run Keyword And Ignore Error    Scroll Element Into View    xpath://div[@data-val='Security & Crime']
    Click Element    xpath://div[@data-val='Security & Crime']
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Scroll Element Into View    ${widget_size}
    Click Element    ${widget_size}
    Click Element    ${widget_size_resolution}
    Click Element    ${first_next_button}
    Verify Preview Notice Message
    Click Element    ${second_next_button}
    Verify Preview Notice Message
    Click Element    ${submit_button}
    Wait Until Page Contains Element    xpath://button[@class='btn']    10    Save Button was not visible to save the widget
    Click Element    xpath://button[@class='btn']
    Wait Until Page Contains Element    ${bar_chart_graph}    15    Bar chart was not visible
    Run Keyword And Ignore Error    Scroll Element Into View    ${bar_chart_graph}
    Wait Until Element Is Visible    ${bar_chart_graph}



Select Comparison Configuration For The Incident Category Comparison Chart with respect to last 2 year
    Click Element    ${x_axis_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${last_2_year}
    Wait Until Element Is Visible    ${last_2_year}    10
    Click Element    ${last_2_year}
    Scroll Element Into View    ${compare_by_dropdown}
    Click Element    ${compare_by_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${incident_category_option}
    Wait Until Element Is Visible      ${incident_category_option}    10
    Click Element    ${incident_category_option}
    Scroll Element Into View    ${select_comparisons}
    Click Element     ${select_comparisons}
    Click Element    xpath://div[@data-val='Daily Occurrence Book']
    Click Element    xpath://div[@data-val='Alarm Activations']
    Run Keyword And Ignore Error    Scroll Element Into View    xpath://div[@data-val='Security & Crime']
    Click Element    xpath://div[@data-val='Security & Crime']
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Scroll Element Into View    ${widget_size}
    Click Element    ${widget_size}
    Click Element    ${widget_size_resolution}
    Click Element    ${first_next_button}
    Verify Preview Notice Message
    Click Element    ${second_next_button}
    Verify Preview Notice Message
    Click Element    ${submit_button}
    Wait Until Page Contains Element    xpath://button[@class='btn']    10    Save Button was not visible to save the widget
    Click Element    xpath://button[@class='btn']
    Wait Until Page Contains Element    ${bar_chart_graph}    15    Bar chart was not visible
    Run Keyword And Ignore Error    Scroll Element Into View    ${bar_chart_graph}
    Wait Until Element Is Visible    ${bar_chart_graph}


Select Comparison Configuration For The Incident Category Comparison Chart with respect to last year
    Click Element    ${x_axis_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${last_year}
    Wait Until Element Is Visible    ${last_year}    10
    Click Element    ${last_year}
    Scroll Element Into View    ${compare_by_dropdown}
    Click Element    ${compare_by_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${incident_category_option}
    Wait Until Element Is Visible      ${incident_category_option}    10
    Click Element    ${incident_category_option}
    Scroll Element Into View    ${select_comparisons}
    Click Element     ${select_comparisons}
    Click Element    xpath://div[@data-val='Daily Occurrence Book']
    Click Element    xpath://div[@data-val='Alarm Activations']
    Run Keyword And Ignore Error    Scroll Element Into View    xpath://div[@data-val='Security & Crime']
    Click Element    xpath://div[@data-val='Security & Crime']
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Scroll Element Into View    ${widget_size}
    Click Element    ${widget_size}
    Click Element    ${widget_size_resolution}
    Click Element    ${first_next_button}
    Verify Preview Notice Message
    Click Element    ${second_next_button}
    Verify Preview Notice Message
    Click Element    ${submit_button}
    Wait Until Page Contains Element    xpath://button[@class='btn']    10    Save Button was not visible to save the widget
    Click Element    xpath://button[@class='btn']
    Wait Until Page Contains Element    ${bar_chart_graph}    15    Bar chart was not visible
    Run Keyword And Ignore Error    Scroll Element Into View    ${bar_chart_graph}
    Wait Until Element Is Visible    ${bar_chart_graph}


Select Comparison Configuration For The Incident Category Comparison Chart with respect to last 5 year
    Click Element    ${x_axis_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${last_5_year}
    Wait Until Element Is Visible    ${last_5_year}    10
    Click Element    ${last_5_year}
    Scroll Element Into View    ${compare_by_dropdown}
    Click Element    ${compare_by_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${incident_category_option}
    Wait Until Element Is Visible      ${incident_category_option}    10
    Click Element    ${incident_category_option}
    Scroll Element Into View    ${select_comparisons}
    Click Element     ${select_comparisons}
    Click Element    xpath://div[@data-val='Daily Occurrence Book']
    Click Element    xpath://div[@data-val='Alarm Activations']
    Run Keyword And Ignore Error    Scroll Element Into View    xpath://div[@data-val='Security & Crime']
    Click Element    xpath://div[@data-val='Security & Crime']
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Scroll Element Into View    ${widget_size}
    Click Element    ${widget_size}
    Click Element    ${widget_size_resolution}
    Click Element    ${first_next_button}
    Verify Preview Notice Message
    Click Element    ${second_next_button}
    Verify Preview Notice Message
    Click Element    ${submit_button}
    Wait Until Page Contains Element    xpath://button[@class='btn']    10    Save Button was not visible to save the widget
    Click Element    xpath://button[@class='btn']
    Wait Until Page Contains Element    ${bar_chart_graph}    15    Bar chart was not visible
    Run Keyword And Ignore Error    Scroll Element Into View    ${bar_chart_graph}
    Wait Until Element Is Visible    ${bar_chart_graph}




Select Comparison Configuration For The Incident Category Comparison Chart with respect to last 4 year
    Click Element    ${x_axis_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${last_4_year}
    Wait Until Element Is Visible    ${last_4_year}    10
    Click Element    ${last_4_year}
    Scroll Element Into View    ${compare_by_dropdown}
    Click Element    ${compare_by_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${incident_category_option}
    Wait Until Element Is Visible      ${incident_category_option}    10
    Click Element    ${incident_category_option}
    Scroll Element Into View    ${select_comparisons}
    Click Element     ${select_comparisons}
    Click Element    xpath://div[@data-val='Daily Occurrence Book']
    Click Element    xpath://div[@data-val='Alarm Activations']
    Run Keyword And Ignore Error    Scroll Element Into View    xpath://div[@data-val='Security & Crime']
    Click Element    xpath://div[@data-val='Security & Crime']
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Scroll Element Into View    ${widget_size}
    Click Element    ${widget_size}
    Click Element    ${widget_size_resolution}
    Click Element    ${first_next_button}
    Verify Preview Notice Message
    Click Element    ${second_next_button}
    Verify Preview Notice Message
    Click Element    ${submit_button}
    Wait Until Page Contains Element    xpath://button[@class='btn']    10    Save Button was not visible to save the widget
    Click Element    xpath://button[@class='btn']
    Wait Until Page Contains Element    ${bar_chart_graph}    15    Bar chart was not visible
    Run Keyword And Ignore Error    Scroll Element Into View    ${bar_chart_graph}
    Wait Until Element Is Visible    ${bar_chart_graph}


Select Comparison Configuration For The Month Comparison Chart
    Click Element    ${x_axis_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${month}
    Wait Until Element Is Visible    ${month}     10
    Click Element    ${month}
    Scroll Element Into View    ${compare_by_dropdown}
    Click Element    ${select_year_dropdown}
    Click Element    ${select_year_dropdown_2024}
    Run Keyword And Ignore Error    Scroll Element Into View     ${select_year_dropdown_2025}
    Click Element    ${select_year_dropdown_2025}
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Click Element    ${x_axis_filter_dropdown}
    FOR    ${month_name}    IN    @{Months}
        Click Element    ${month_name}
    END
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Click Element    ${compare_by_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${incident_category_option}
    Wait Until Element Is Visible      ${incident_category_option}    10
    Click Element    ${incident_category_option}
    Scroll Element Into View    ${select_comparisons}
    Click Element     ${select_comparisons}
    Click Element    xpath://div[@data-val='Daily Occurrence Book']
    Click Element    xpath://div[@data-val='Alarm Activations']
    Run Keyword And Ignore Error    Scroll Element Into View    xpath://div[@data-val='Security & Crime']
    Click Element    xpath://div[@data-val='Security & Crime']
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Scroll Element Into View    ${widget_size}
    Click Element    ${widget_size}
    Click Element    ${widget_size_resolution}
    Click Element    ${first_next_button}
    Verify Preview Notice Message
    Click Element    ${second_next_button}
    Verify Preview Notice Message
    Click Element    ${submit_button}
    Wait Until Page Contains Element    xpath://button[@class='btn']    10    Save Button was not visible to save the widget
    Click Element    xpath://button[@class='btn']
    Wait Until Page Contains Element    ${bar_chart_graph}    15    Bar chart was not visible
    Run Keyword And Ignore Error    Scroll Element Into View    ${bar_chart_graph}
    Wait Until Element Is Visible    ${bar_chart_graph}

Select Comparison Configuration For The Quarter Comparison Chart
    Click Element    ${x_axis_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${quarter}
    Wait Until Element Is Visible    ${quarter}     10
    Click Element    ${quarter}
    Scroll Element Into View    ${compare_by_dropdown}
    Click Element    ${select_year_dropdown}
    Click Element    ${select_year_dropdown_2024}
    Run Keyword And Ignore Error    Scroll Element Into View     ${select_year_dropdown_2025}
    Click Element    ${select_year_dropdown_2025}
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Click Element    ${x_axis_filter_dropdown}
    FOR    ${quarter_name}    IN    @{Quarters}
        Click Element    ${quarter_name}
    END
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Click Element    ${compare_by_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${incident_category_option}
    Wait Until Element Is Visible      ${incident_category_option}    10
    Click Element    ${incident_category_option}
    Scroll Element Into View    ${select_comparisons}
    Click Element     ${select_comparisons}
    Click Element    xpath://div[@data-val='Daily Occurrence Book']
    Click Element    xpath://div[@data-val='Alarm Activations']
    Run Keyword And Ignore Error    Scroll Element Into View    xpath://div[@data-val='Security & Crime']
    Click Element    xpath://div[@data-val='Security & Crime']
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Scroll Element Into View    ${widget_size}
    Click Element    ${widget_size}
    Click Element    ${widget_size_resolution}
    Click Element    ${first_next_button}
    Verify Preview Notice Message
    Click Element    ${second_next_button}
    Verify Preview Notice Message
    Click Element    ${submit_button}
    Wait Until Page Contains Element    xpath://button[@class='btn']    10    Save Button was not visible to save the widget
    Click Element    xpath://button[@class='btn']
    Wait Until Page Contains Element    ${bar_chart_graph}    15    Bar chart was not visible
    Run Keyword And Ignore Error    Scroll Element Into View    ${bar_chart_graph}
    Wait Until Element Is Visible    ${bar_chart_graph}

Select Comparison Configuration For The Week Comparison Chart
    Click Element    ${x_axis_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${week}
    Wait Until Element Is Visible    ${week}     10
    Click Element    ${week}
    Scroll Element Into View    ${compare_by_dropdown}
    Click Element    ${select_year_dropdown}
    Click Element    ${select_year_dropdown_2024}
    Run Keyword And Ignore Error    Scroll Element Into View     ${select_year_dropdown_2025}
    Click Element    ${select_year_dropdown_2025}
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Click Element    ${x_axis_filter_dropdown}
    Click Element    xpath://div[@data-val='Week 1']
    Run Keyword And Ignore Error    Scroll Element Into View    xpath://div[@data-val='Week 3']
    Click Element    xpath://div[@data-val='Week 3']
    Run Keyword And Ignore Error    Scroll Element Into View    xpath://div[@data-val='Week 5']
    Click Element    xpath://div[@data-val='Week 5']
    Run Keyword And Ignore Error    Scroll Element Into View    xpath://div[@data-val='Week 8']
    Click Element    xpath://div[@data-val='Week 8']
    Run Keyword And Ignore Error    Scroll Element Into View    xpath://div[@data-val='Week 9']
    Click Element    xpath://div[@data-val='Week 9']
    Run Keyword And Ignore Error    Scroll Element Into View    xpath://div[@data-val='Week 10']
    Click Element    xpath://div[@data-val='Week 10']
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Click Element    ${compare_by_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${incident_category_option}
    Wait Until Element Is Visible      ${incident_category_option}    10
    Click Element    ${incident_category_option}
    Scroll Element Into View    ${select_comparisons}
    Click Element     ${select_comparisons}
    Click Element    xpath://div[@data-val='Daily Occurrence Book']
    Click Element    xpath://div[@data-val='Alarm Activations']
    Run Keyword And Ignore Error    Scroll Element Into View    xpath://div[@data-val='Security & Crime']
    Click Element    xpath://div[@data-val='Security & Crime']
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Scroll Element Into View    ${widget_size}
    Click Element    ${widget_size}
    Click Element    ${widget_size_resolution}
    Click Element    ${first_next_button}
    Verify Preview Notice Message
    Click Element    ${second_next_button}
    Verify Preview Notice Message
    Click Element    ${submit_button}
    Wait Until Page Contains Element    xpath://button[@class='btn']    10    Save Button was not visible to save the widget
    Click Element    xpath://button[@class='btn']
    Wait Until Page Contains Element    ${bar_chart_graph}    15    Bar chart was not visible
    Run Keyword And Ignore Error    Scroll Element Into View    ${bar_chart_graph}
    Wait Until Element Is Visible    ${bar_chart_graph}


Select Comparison Configuration For The Day Comparison Chart
    Click Element    ${x_axis_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${day}
    Wait Until Element Is Visible    ${day}    10
    Click Element   ${day}
    Scroll Element Into View    ${compare_by_dropdown}
    Click Element    ${select_year_dropdown}
    Click Element    ${select_year_dropdown_2024}
    Run Keyword And Ignore Error    Scroll Element Into View     ${select_year_dropdown_2025}
    Click Element    ${select_year_dropdown_2025}
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Click Element    ${x_axis_filter_dropdown}
    FOR    ${day_name}    IN    @{Days}
        Click Element    ${day_name}
    END
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Click Element    ${compare_by_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${incident_category_option}
    Wait Until Element Is Visible      ${incident_category_option}    10
    Click Element    ${incident_category_option}
    Scroll Element Into View    ${select_comparisons}
    Click Element     ${select_comparisons}
    Click Element    xpath://div[@data-val='Daily Occurrence Book']
    Click Element    xpath://div[@data-val='Alarm Activations']
    Run Keyword And Ignore Error    Scroll Element Into View    xpath://div[@data-val='Security & Crime']
    Click Element    xpath://div[@data-val='Security & Crime']
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Scroll Element Into View    ${widget_size}
    Click Element    ${widget_size}
    Click Element    ${widget_size_resolution}
    Click Element    ${first_next_button}
    Verify Preview Notice Message
    Click Element    ${second_next_button}
    Verify Preview Notice Message
    Click Element    ${submit_button}
    Wait Until Page Contains Element    xpath://button[@class='btn']    10    Save Button was not visible to save the widget
    Click Element    xpath://button[@class='btn']
    Wait Until Page Contains Element    ${bar_chart_graph}    15    Bar chart was not visible
    Run Keyword And Ignore Error    Scroll Element Into View    ${bar_chart_graph}
    Wait Until Element Is Visible    ${bar_chart_graph}

Select Comparison Configuration For The Year Comparison Chart
    Click Element    ${x_axis_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${year}
    Wait Until Element Is Visible    ${year}    10
    Click Element   ${year}
    Scroll Element Into View    ${compare_by_dropdown}
    Click Element    ${x_axis_filter_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View     ${2024_year_option}
    Click Element    ${2024_year_option}
    Click Element    ${2025_year_option}
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Click Element    ${compare_by_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${incident_category_option}
    Wait Until Element Is Visible      ${incident_category_option}    10
    Click Element    ${incident_category_option}
    Scroll Element Into View    ${select_comparisons}
    Click Element     ${select_comparisons}
    Click Element    xpath://div[@data-val='Daily Occurrence Book']
    Click Element    xpath://div[@data-val='Alarm Activations']
    Run Keyword And Ignore Error    Scroll Element Into View    xpath://div[@data-val='Security & Crime']
    Click Element    xpath://div[@data-val='Security & Crime']
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Scroll Element Into View    ${widget_size}
    Click Element    ${widget_size}
    Click Element    ${widget_size_resolution}
    Click Element    ${first_next_button}
    Verify Preview Notice Message
    Click Element    ${second_next_button}
    Verify Preview Notice Message
    Click Element    ${submit_button}
    Wait Until Page Contains Element    xpath://button[@class='btn']    10    Save Button was not visible to save the widget
    Click Element    xpath://button[@class='btn']
    Wait Until Page Contains Element    ${bar_chart_graph}    15    Bar chart was not visible
    Run Keyword And Ignore Error    Scroll Element Into View    ${bar_chart_graph}
    Wait Until Element Is Visible    ${bar_chart_graph}

Select Date Range filter for both X axis and Compare By
    Click Element    ${x_axis_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${year}
    Wait Until Element Is Visible    ${year}    10
    Click Element    ${year}
    Scroll Element Into View    ${compare_by_dropdown}
    Click Element    ${x_axis_filter_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View     ${2024_year_option}
    Click Element    ${2024_year_option}
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Click Element     ${compare_by_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${month}
    Click Element    ${month}
    Scroll Element Into View    ${compare_by_select_year_dropdown}
    Click Element    ${compare_by_select_year_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View     ${2024_year_option}
    Click Element    ${2024_year_option}
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Scroll Element Into View    ${select_comparisons}
    Click Element     ${select_comparisons}
    FOR    ${month_name}    IN    @{Months}
        Click Element    ${month_name}
    END
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Scroll Element Into View    ${widget_size}
    Click Element    ${widget_size}
    Click Element    ${widget_size_resolution}
    Click Element    ${first_next_button}
    Wait Until Page Contains    Please select proper comparison value    10    Error message did not appear
    Element Text Should Be    ${error_message_locator}    Please select proper comparison value

Verify the error messages without selecting any configurations on add widget form
    Run Keyword And Ignore Error    Scroll Element Into View    ${first_next_button}
    Click Element    ${first_next_button}

Verify Select chart type error message
    Run Keyword And Ignore Error    Scroll Element Into View    ${chart_type_dropdown}
    ${expected_chart_type_error_message}    Get Text    ${chart_type_error}
    Log    Expected Chart Type Error Message: ${expected_chart_type_error_message}
    Page Should Contain    ${expected_chart_type_error_message}    Chart type error message is not present on the page

Verify Data source error message
    ${expected_data_source_error_message}    Get Text    ${data_source_error_message}
    Log    Expected Data Source Error Message: ${expected_data_source_error_message}
    Page Should Contain    ${expected_data_source_error_message}    Data source error message is not present on the page

Verify X axis error message
    Run Keyword And Ignore Error    Scroll Element Into View    ${x_axis_dropdown}
    ${expected_x_axis_error_message}    Get Text    ${X_axis_error_message}
    Log    Expected x axis error message: ${expected_x_axis_error_message}
    Page Should Contain    ${expected_x_axis_error_message}    x axis error message is not present on the page

verify X axis filter error message
    Run Keyword And Ignore Error    Scroll Element Into View    ${widget_size}
    ${expected_x_axis_filter_error_message}    Get Text    ${X_axis_filter_error_message}
    Log    Expected x axis filter error message: ${expected_x_axis_filter_error_message}
    Page Should Contain    ${expected_x_axis_filter_error_message}    x axis filter error message is not present on the page

Verify compare by error message
    ${expected_compare_by_error_message}    Get Text    ${Compare_by_error_message}
    Log    Expected compare by error message: ${expected_compare_by_error_message}
    Page Should Contain    ${expected_compare_by_error_message}    compare by error message is not present on the page

Verify select comparison error message
    ${expected_select_comparisons_error_message}    Get Text    ${select_comparisons_error_message}
    Log    Expected select comparisons error message: ${expected_select_comparisons_error_message}
    Page Should Contain    ${expected_select_comparisons_error_message}    select comparisons error message is not present on the page

verify widget size error message
    ${expected_widget_size_error_message}    Get Text    ${widget_size_error_message}
    Log    Expected widget size error message: ${expected_widget_size_error_message}
    Page Should Contain    ${expected_widget_size_error_message}    widget size error message is not present on the page


Select Comparison Configuration for any Comparison chart
    Click Element    ${x_axis_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${site_name_option}
    Wait Until Element Is Visible    ${site_name_option}    10
    Click Element    ${site_name_option}
    Scroll Element Into View    ${site_name_x_axis_filter_dropdown}
    Click Element    ${site_name_x_axis_filter_dropdown}
    Click Element    ${site_name3}
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Scroll Element Into View    ${compare_by_dropdown}
    Click Element    ${compare_by_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${incident_category_option}
    Wait Until Element Is Visible    ${incident_category_option}    10
    Click Element    ${incident_category_option}
    Scroll Element Into View    ${select_comparisons}
    Sleep    4
    Click Element    ${select_comparisons}
    Sleep    2
    @{dropdown_elements}    Get WebElements    xpath://div[contains(@class,'mbsc-sc-itm') and contains(@class,'mbsc-btn-e')]
    ${select_comparison_option_texts}    Create List
    FOR    ${element}    IN    @{dropdown_elements}
        Scroll Element Into View    ${element}
        Sleep    0.3
        ${is_visible}    Run Keyword And Return Status    Element Should Be Visible    ${element}
        IF    ${is_visible}
        ${text}    Get Text    ${element}
        Run Keyword If    '${text}' != ''    Append To List    ${select_comparison_option_texts}    ${text}
        END
    END
    Log    All Comparison Options: ${select_comparison_option_texts}
    [Return]    ${select_comparison_option_texts}


Select Comparison Configuration with category as x axis and compare by as dates
    Sleep    4       #incase of api failures if any
    Click Element    ${x_axis_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${incident_category_option}
    Wait Until Element Is Visible    ${incident_category_option}    10
    Click Element    ${incident_category_option}
    Scroll Element Into View    ${compare_by_dropdown}
    Click Element    ${x_axis_filter_dropdown}
    Click Element    xpath://div[@data-val='Daily Occurrence Book']
    Click Element    xpath://div[@data-val='Alarm Activations']
    Run Keyword And Ignore Error    Scroll Element Into View    xpath://div[@data-val='Security & Crime']
    Click Element    xpath://div[@data-val='Security & Crime']
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Scroll Element Into View    ${select_comparisons}
    Click Element    ${compare_by_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View     ${year_option}
    Click Element    ${year_option}
    Click Element    ${select_comparisons}
    Click Element    ${2024_year_option}
    Click Element    ${2025_year_option}
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Scroll Element Into View    ${widget_size}
    Click Element    ${widget_size}
    Click Element    ${widget_size_resolution}
    Click Element    ${first_next_button}
    Verify Preview Notice Message
    Click Element    ${second_next_button}
    Verify Preview Notice Message
    Click Element    ${submit_button}
    Wait Until Page Contains Element    xpath://button[@class='btn']    10    Save Button was not visible to save the widget
    Click Element    xpath://button[@class='btn']
    Wait Until Page Contains Element    ${bar_chart_graph}    25    Bar chart was not visible
    Run Keyword And Ignore Error    Scroll Element Into View    ${bar_chart_graph}
    Wait Until Element Is Visible    ${bar_chart_graph}



Verify the saved filter shows the filters a per data source selected
    Click Element    ${chart_type_dropdown}
    Click Element    ${bar_chart}
    Click Element    ${widget_title}
    ${unique_widget_title}    Set Variable    Region
    Input Text    ${widget_title}    ${unique_widget_title}
    Click Element    ${data_source_dropdown}
    Click Element    ${incidents_option}
    Sleep    1
    Click Element    ${Saved_filter_dropdown}
    @{incident_elements}    Get WebElements    xpath://div[@class='zd-select-option']
    ${incident_filters}    Create List
    FOR    ${element}    IN    @{incident_elements}
        Scroll Element Into View    ${element}
        ${text}    Get Text    ${element}
        Run Keyword If    '${text}' != ''    Append To List    ${incident_filters}    ${text}
    END
    Log    Found Incidents Saved Filter Options: ${incident_filters}
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Click Element    ${data_source_dropdown}
    Click Element    ${task_dropdown_option}
    Sleep    1
    Click Element    ${Saved_filter_dropdown}
    @{task_elements}    Get WebElements    xpath://div[@class='zd-select-option']
    ${task_filters}    Create List
    FOR    ${element}    IN    @{task_elements}
        Scroll Element Into View    ${element}
        ${text}    Get Text    ${element}
        Run Keyword If    '${text}' != ''    Append To List    ${task_filters}    ${text}
    END
    Log    Found Tasks Saved Filter Options: ${task_filters}
    Should Not Be Equal As Strings    ${incident_filters}    ${task_filters}    Saved filters for Incidents and Tasks should be different


Verify The Widget Title Allows All The Supported Special Characters
    Click Element    ${chart_type_dropdown}
    Click Element    ${bar_chart}
    Click Element    ${widget_title}
    ${special_characters}    Set Variable    !@#$%&()_-+:" ',.?/
    Input Text    ${widget_title}    ${special_characters}
    Click Element    ${data_source_dropdown}
    Click Element    ${incidents_option}
    Sleep    1
    Click Element    ${Saved_filter_dropdown}
    Input Text    ${Search_placeholder}    ${Search_value}
    Click Element    ${selected_saved_filter}
    Select Comparison Configuration with category as x axis and compare by as dates
    ${displayed_title}    Get Text    ${widget_title_name}
    Log    Entered Widget Title: ${special_characters}
    Log    Displayed Widget Title: ${displayed_title}
    Should Be Equal    ${displayed_title}    ${special_characters}



Select Data Configuration For The Task Comparison Chart With Respect To Last 5 Years
    Click Element    ${chart_type_dropdown}
    Click Element    ${bar_chart}
    Click Element    ${widget_title}
    ${unique_widget_title}    Set Variable    task
    Input Text    ${widget_title}    ${unique_widget_title}
    Click Element    ${data_source_dropdown}
    Click Element    ${task_dropdown_option}
    Sleep    1
    Click Element    ${Saved_filter_dropdown}
    Input Text    ${Search_placeholder}    ${Search_value}
    Wait Until Element Is Visible    ${task_selected_saved_filter}    10    
    Click Element    ${task_selected_saved_filter}

Select Data Configuration For The Task Comparison Chart With Respect To Last 4 Years
    Click Element    ${chart_type_dropdown}
    Click Element    ${bar_chart}
    Click Element    ${widget_title}
    ${unique_widget_title}    Set Variable    task
    Input Text    ${widget_title}    ${unique_widget_title}
    Click Element    ${data_source_dropdown}
    Click Element    ${task_dropdown_option}
    Sleep    1
    Click Element    ${Saved_filter_dropdown}
    Input Text    ${Search_placeholder}    ${Search_value}
    Sleep    1
    Click Element    ${task_selected_saved_filter}

Select Data Configuration For The Task Comparison Chart With Respect To Last 3 Years
    Click Element    ${chart_type_dropdown}
    Click Element    ${bar_chart}
    Click Element    ${widget_title}
    ${unique_widget_title}    Set Variable    task
    Input Text    ${widget_title}    ${unique_widget_title}
    Click Element    ${data_source_dropdown}
    Click Element    ${task_dropdown_option}
    Sleep    1
    Click Element    ${Saved_filter_dropdown}
    Input Text    ${Search_placeholder}    ${Search_value}
    Sleep    1
    Click Element    ${task_selected_saved_filter}

Select data configuration for the Task Comparison Chart with respect to last 2 years
    Click Element    ${chart_type_dropdown}
    Click Element    ${bar_chart}
    Click Element    ${widget_title}
    ${unique_widget_title}    Set Variable    task
    Input Text    ${widget_title}    ${unique_widget_title}
    Click Element    ${data_source_dropdown}
    Click Element    ${task_dropdown_option}
    Sleep    1
    Click Element    ${Saved_filter_dropdown}
    Input Text    ${Search_placeholder}    ${Search_value}
    Sleep    1
    Click Element    ${task_selected_saved_filter}

Select Data Configuration For The Task Comparison Chart With Respect To Last Year
    Wait Until Element Is Visible    ${chart_type_dropdown}    10
    Click Element    ${chart_type_dropdown}
    Wait Until Element Is Visible    ${bar_chart}    10
    Click Element    ${bar_chart}
    Wait Until Element Is Visible    ${widget_title}    10
    Click Element    ${widget_title}
    ${unique_widget_title}    Set Variable    task
    Input Text    ${widget_title}    ${unique_widget_title}
    Wait Until Element Is Visible    ${data_source_dropdown}    10
    Click Element    ${data_source_dropdown}
    Wait Until Element Is Visible    ${task_dropdown_option}    10
    Click Element    ${task_dropdown_option}
    Wait Until Element Is Visible    ${Saved_filter_dropdown}    10
    Click Element    ${Saved_filter_dropdown}
    Wait Until Element Is Visible     ${Search_placeholder}
    Input Text    ${Search_placeholder}    ${Search_value}
    Wait Until Element Is Visible    ${task_selected_saved_filter}    10
    Click Element    ${task_selected_saved_filter}


Select Comparison Configuration For The Task Comparison Chart With Respect To Last 4 Years
    Click Element    ${x_axis_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${last_4_year}
    Wait Until Element Is Visible    ${last_4_year}    10
    Click Element    ${last_4_year}
    Scroll Element Into View    ${compare_by_dropdown}
    Click Element    ${compare_by_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${task_type_option}
    Wait Until Element Is Visible   ${task_type_option}    10
    Click Element    ${task_type_option}
    Scroll Element Into View     ${select_comparisons}
    Click Element     ${select_comparisons}
    Click Element     ${Audit_review_option}
    Click Element     ${Incident_Response_option}
    Click Element     ${Operational_task_option}
    Click Element     ${Dispatch_option}
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Scroll Element Into View     ${widget_size}
    Click Element     ${widget_size}
    Click Element     ${widget_size_resolution}
    Click Element     ${first_next_button}
    Verify Preview Notice Message
    Click Element    ${second_next_button}
    Verify Preview Notice Message
    Click Element    ${submit_button}
    Wait Until Page Contains Element    xpath://button[@class='btn']    10    Save Button was not visible to save the widget
    Click Element    xpath://button[@class='btn']
    Wait Until Page Contains Element    ${bar_chart_graph}    25    Bar chart was not visible
    Run Keyword And Ignore Error    Scroll Element Into View    ${bar_chart_graph}
    Wait Until Element Is Visible    ${bar_chart_graph}



Select Comparison Configuration For The Task Comparison Chart With Respect To Last 5 Years
    Click Element    ${x_axis_dropdown}
    Wait Until Element Is Visible    ${last_5_year}    10
    Click Element    ${last_5_year}
    Scroll Element Into View    ${compare_by_dropdown}
    Click Element    ${compare_by_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${task_type_option}
    Wait Until Element Is Visible   ${task_type_option}    10
    Click Element    ${task_type_option}
    Scroll Element Into View    ${select_comparisons}
    Click Element     ${select_comparisons}
    Click Element    ${Audit_review_option} 
    Click Element    ${Incident_Response_option}
    Click Element    ${Operational_task_option}
    Click Element    ${Dispatch_option}
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Scroll Element Into View     ${widget_size}
    Click Element     ${widget_size}
    Click Element     ${widget_size_resolution}
    Click Element     ${first_next_button}
    Verify Preview Notice Message
    Click Element    ${second_next_button}
    Verify Preview Notice Message
    Click Element    ${submit_button}
    Wait Until Page Contains Element    xpath://button[@class='btn']    10    Save Button was not visible to save the widget
    Click Element    xpath://button[@class='btn']
    Wait Until Page Contains Element    ${bar_chart_graph}    25    Bar chart was not visible
    Run Keyword And Ignore Error    Scroll Element Into View    ${bar_chart_graph}
    Wait Until Element Is Visible    ${bar_chart_graph}




Select Comparison Configuration For The Task Comparison Chart With Respect To Last 3 Years
    Click Element    ${x_axis_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${last_3_year}
    Wait Until Element Is Visible    ${last_3_year}    10
    Click Element    ${last_3_year}
    Scroll Element Into View    ${compare_by_dropdown}
    Click Element    ${compare_by_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${task_type_option}
    Wait Until Element Is Visible   ${task_type_option}    10
    Click Element    ${task_type_option}
    Scroll Element Into View     ${select_comparisons}
    Click Element     ${select_comparisons}
    Click Element     ${Audit_review_option}
    Click Element     ${Incident_Response_option}
    Click Element     ${Operational_task_option}
    Click Element     ${Dispatch_option}
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Scroll Element Into View     ${widget_size}
    Click Element     ${widget_size}
    Click Element     ${widget_size_resolution}
    Click Element     ${first_next_button}
    Verify Preview Notice Message
    Click Element    ${second_next_button}
    Verify Preview Notice Message
    Click Element    ${submit_button}
    Wait Until Page Contains Element    xpath://button[@class='btn']    10    Save Button was not visible to save the widget
    Click Element    xpath://button[@class='btn']
    Wait Until Page Contains Element    ${bar_chart_graph}    25    Bar chart was not visible
    Run Keyword And Ignore Error    Scroll Element Into View    ${bar_chart_graph}
    Wait Until Element Is Visible    ${bar_chart_graph}


Select Comparison Configuration For The Task Comparison Chart With Respect To Last 2 Years
    Click Element    ${x_axis_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${last_2_year}
    Wait Until Element Is Visible    ${last_2_year}    10
    Click Element    ${last_2_year}
    Scroll Element Into View    ${compare_by_dropdown}
    Click Element    ${compare_by_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${task_type_option}
    Wait Until Element Is Visible   ${task_type_option}    10
    Click Element    ${task_type_option}
    Scroll Element Into View     ${select_comparisons}
    Click Element     ${select_comparisons}
    Click Element     ${Audit_review_option}
    Click Element     ${Incident_Response_option}
    Click Element     ${Operational_task_option}
    Click Element     ${Dispatch_option}
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Scroll Element Into View     ${widget_size}
    Click Element     ${widget_size}
    Click Element     ${widget_size_resolution}
    Click Element     ${first_next_button}
    Verify Preview Notice Message
    Click Element    ${second_next_button}
    Verify Preview Notice Message
    Click Element    ${submit_button}
    Wait Until Page Contains Element    xpath://button[@class='btn']    10    Save Button was not visible to save the widget
    Click Element    xpath://button[@class='btn']
    Wait Until Page Contains Element    ${bar_chart_graph}    25    Bar chart was not visible
    Run Keyword And Ignore Error    Scroll Element Into View    ${bar_chart_graph}
    Wait Until Element Is Visible    ${bar_chart_graph}

    
Select Comparison Configuration For The Task Comparison Chart With Respect To Last Year
    Click Element    ${x_axis_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${last_year}
    Wait Until Element Is Visible    ${last_year}    10
    Click Element    ${last_year}
    Scroll Element Into View    ${compare_by_dropdown}
    Click Element    ${compare_by_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${task_type_option}
    Wait Until Element Is Visible   ${task_type_option}    10
    Click Element    ${task_type_option}
    Scroll Element Into View     ${select_comparisons}
    Click Element     ${select_comparisons}
    Click Element     ${Audit_review_option}
    Click Element     ${Incident_Response_option}
    Click Element     ${Operational_task_option}
    Click Element     ${Dispatch_option}
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Scroll Element Into View     ${widget_size}
    Click Element     ${widget_size}
    Click Element     ${widget_size_resolution}
    Click Element     ${first_next_button}
    Verify Preview Notice Message
    Click Element    ${second_next_button}
    Verify Preview Notice Message
    Click Element    ${submit_button}
    Wait Until Page Contains Element    xpath://button[@class='btn']    10    Save Button was not visible to save the widget
    Click Element    xpath://button[@class='btn']
    Wait Until Page Contains Element    ${bar_chart_graph}    25    Bar chart was not visible
    Run Keyword And Ignore Error    Scroll Element Into View    ${bar_chart_graph}
    Wait Until Element Is Visible    ${bar_chart_graph}

Select Comparison Configuration For The Task Comparison Chart With Respect To Year
    Wait Until Element Is Visible    ${x_axis_dropdown}    10
    Click Element    ${x_axis_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${year}
    Wait Until Element Is Visible    ${year}    10
    Click Element   ${year}
    Scroll Element Into View    ${compare_by_dropdown}
    Click Element    ${x_axis_filter_dropdown_for_task}
    Run Keyword And Ignore Error    Scroll Element Into View     ${2024_year_option}
    Click Element    ${2024_year_option}
    Click Element    ${2025_year_option}
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Click Element    ${compare_by_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${task_type_option}
    Wait Until Element Is Visible   ${task_type_option}    10
    Click Element    ${task_type_option}
    Scroll Element Into View     ${select_comparisons}
    Click Element     ${select_comparisons}
    Click Element    ${Audit_review_option}
    Click Element    ${Incident_Response_option}
    Click Element    ${Operational_task_option}
    Click Element    ${Dispatch_option}
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Scroll Element Into View     ${widget_size}
    Click Element     ${widget_size}
    Click Element     ${widget_size_resolution}
    Click Element     ${first_next_button}
    Verify Preview Notice Message
    Click Element    ${second_next_button}
    Verify Preview Notice Message
    Click Element    ${submit_button}
    Wait Until Page Contains Element    xpath://button[@class='btn']    10    Save Button was not visible to save the widget
    Click Element    xpath://button[@class='btn']
    Wait Until Page Contains Element    ${bar_chart_graph}    25    Bar chart was not visible
    Run Keyword And Ignore Error    Scroll Element Into View    ${bar_chart_graph}
    Wait Until Element Is Visible    ${bar_chart_graph}

    
Select Comparison Configuration For The Task Comparison Chart With Respect To Month
    Click Element    ${x_axis_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${month}
    Wait Until Element Is Visible    ${month}    10
    Click Element   ${month}
    Scroll Element Into View    ${compare_by_dropdown}
    Click Element    ${select_year_dropdown}
    Click Element    ${select_year_dropdown_2024}
    Run Keyword And Ignore Error    Scroll Element Into View     ${select_year_dropdown_2025}
    Click Element    ${select_year_dropdown_2025}
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Click Element    ${x_axis_filter_dropdown_for_task}
    FOR    ${month_name}    IN    @{Months}
        Click Element    ${month_name}
    END
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Click Element     ${compare_by_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View     ${task_type_option}
    Wait Until Element Is Visible   ${task_type_option}    10
    Click Element    ${task_type_option}
    Scroll Element Into View     ${select_comparisons}
    Click Element     ${select_comparisons}
    Click Element    ${Audit_review_option}
    Click Element    ${Incident_Response_option}
    Click Element    ${Operational_task_option}
    Click Element    ${Dispatch_option}
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Scroll Element Into View     ${widget_size}
    Click Element     ${widget_size}
    Click Element     ${widget_size_resolution}
    Click Element     ${first_next_button}
    Verify Preview Notice Message
    Click Element    ${second_next_button}
    Verify Preview Notice Message
    Click Element    ${submit_button}
    Wait Until Page Contains Element    xpath://button[@class='btn']    10    Save Button was not visible to save the widget
    Click Element    xpath://button[@class='btn']
    Wait Until Page Contains Element    ${bar_chart_graph}    25    Bar chart was not visible
    Run Keyword And Ignore Error    Scroll Element Into View    ${bar_chart_graph}
    Wait Until Element Is Visible    ${bar_chart_graph}


Select Comparison Configuration For The Task Comparison Chart With Respect To Week
    Click Element    ${x_axis_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${week}
    Wait Until Element Is Visible    ${week}    10
    Click Element   ${week}
    Scroll Element Into View    ${compare_by_dropdown}
    Click Element    ${select_year_dropdown}
    Click Element    ${select_year_dropdown_2024}
    Run Keyword And Ignore Error    Scroll Element Into View     ${select_year_dropdown_2025}
    Click Element    ${select_year_dropdown_2025}
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Click Element     ${x_axis_filter_dropdown_for_task}
    FOR    ${week_name}    IN    @{Weeks}
        Click Element     ${week_name}
    END
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Click Element     ${compare_by_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View     ${task_type_option}
    Wait Until Element Is Visible   ${task_type_option}    10
    Click Element    ${task_type_option}
    Scroll Element Into View     ${select_comparisons}
    Click Element     ${select_comparisons}
    Click Element    ${Audit_review_option}
    Click Element    ${Incident_Response_option}
    Click Element    ${Operational_task_option}
    Click Element    ${Dispatch_option}
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Scroll Element Into View     ${widget_size}
    Wait Until Element Is Visible    ${widget_size}    10
    Click Element     ${widget_size}
    Wait Until Element Is Visible    ${widget_size_resolution}    10
    Click Element     ${widget_size_resolution}
    Wait Until Element Is Visible    ${first_next_button}    10
    Click Element     ${first_next_button}
    Wait Until Page Contains Element    ${bar_chart_graph}    25    Bar chart was not visible
    Verify Preview Notice Message
    Wait Until Element Is Visible    ${second_next_button}   10    
    Click Element    ${second_next_button}
    Wait Until Page Contains Element    ${bar_chart_graph}    20    Bar chart was not visible
    Verify Preview Notice Message
    Click Element    ${submit_button}
    Wait Until Page Contains Element    xpath://button[@class='btn']    10    Save Button was not visible to save the widget
    Click Element    xpath://button[@class='btn']
    Wait Until Page Contains Element    ${bar_chart_graph}    25    Bar chart was not visible
    Run Keyword And Ignore Error    Scroll Element Into View    ${bar_chart_graph}
    Wait Until Element Is Visible    ${bar_chart_graph}


Select Comparison Configuration For The Task Comparison Chart With Respect To Quarter
    Click Element    ${x_axis_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${quarter}
    Wait Until Element Is Visible    ${quarter}    10
    Click Element   ${quarter}
    Scroll Element Into View    ${compare_by_dropdown}
    Click Element    ${select_year_dropdown}
    Click Element    ${select_year_dropdown_2024}
    Run Keyword And Ignore Error    Scroll Element Into View     ${select_year_dropdown_2025}
    Click Element    ${select_year_dropdown_2025}
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Click Element     ${x_axis_filter_dropdown_for_task}
    FOR    ${quarter_name}    IN    @{Quarters}
        Click Element     ${quarter_name}
    END
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Click Element     ${compare_by_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View     ${task_type_option}
    Wait Until Element Is Visible   ${task_type_option}    10
    Click Element    ${task_type_option}
    Scroll Element Into View     ${select_comparisons}
    Click Element     ${select_comparisons}
    Click Element    ${Audit_review_option}
    Click Element    ${Incident_Response_option}
    Click Element    ${Operational_task_option}
    Click Element    ${Dispatch_option}
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Scroll Element Into View     ${widget_size}
    Wait Until Element Is Visible    ${widget_size}    10
    Click Element     ${widget_size}
    Wait Until Element Is Visible    ${widget_size_resolution}    10
    Click Element     ${widget_size_resolution}
    Wait Until Element Is Visible    ${first_next_button}    10
    Click Element     ${first_next_button}
    Wait Until Page Contains Element    ${bar_chart_graph}    25    Bar chart was not visible
    Verify Preview Notice Message
    Wait Until Page Contains Element    ${bar_chart_graph}    25    Bar chart was not visible
    Click Element    ${second_next_button}
    Verify Preview Notice Message
    Wait Until Page Contains Element    ${bar_chart_graph}    20    Bar chart was not visible
    Click Element    ${submit_button}
    Wait Until Page Contains Element    xpath://button[@class='btn']    10    Save Button was not visible to save the widget
    Click Element    xpath://button[@class='btn']
    Wait Until Page Contains Element    ${bar_chart_graph}    25    Bar chart was not visible
    Run Keyword And Ignore Error    Scroll Element Into View    ${bar_chart_graph}
    Wait Until Element Is Visible    ${bar_chart_graph}


Select Comparison Configuration For The Task Comparison Chart With Respect To Day
    Click Element    ${x_axis_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${day}
    Wait Until Element Is Visible    ${day}    10
    Click Element   ${day}
    Scroll Element Into View    ${compare_by_dropdown}
    Wait Until Element Is Visible    ${select_year_dropdown}    10
    Click Element    ${select_year_dropdown}
    Click Element    ${select_year_dropdown_2024}
    Run Keyword And Ignore Error    Scroll Element Into View     ${select_year_dropdown_2025}
    Wait Until Element Is Visible    ${select_year_dropdown_2025}    10
    Click Element    ${select_year_dropdown_2025}
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Click Element     ${x_axis_filter_dropdown_for_task}
    FOR    ${day_name}    IN    @{Days}
        Click Element     ${day_name}
    END
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Wait Until Element Is Visible    ${compare_by_dropdown}    10    
    Click Element     ${compare_by_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View     ${task_type_option}
    Wait Until Element Is Visible   ${task_type_option}    10
    Click Element    ${task_type_option}
    Scroll Element Into View     ${select_comparisons}
    Click Element     ${select_comparisons}
    Click Element    ${Audit_review_option}
    Click Element    ${Incident_Response_option}
    Click Element    ${Operational_task_option}
    Click Element    ${Dispatch_option}
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Scroll Element Into View     ${widget_size}
    Wait Until Element Is Visible    ${widget_size}    10
    Click Element     ${widget_size}
    Wait Until Element Is Visible    ${widget_size_resolution}    10
    Click Element     ${widget_size_resolution}
    Wait Until Element Is Visible    ${first_next_button}    10
    Click Element     ${first_next_button}
    Wait Until Page Contains Element    ${bar_chart_graph}    25    Bar chart was not visible
    Verify Preview Notice Message
    Wait Until Page Contains Element    ${bar_chart_graph}    25    Bar chart was not visible
    Click Element    ${second_next_button}
    Verify Preview Notice Message
    Wait Until Page Contains Element    ${bar_chart_graph}    20    Bar chart was not visible
    Click Element    ${submit_button}
    Wait Until Page Contains Element    xpath://button[@class='btn']    10    Save Button was not visible to save the widget
    Click Element    xpath://button[@class='btn']
    Wait Until Page Contains Element    ${bar_chart_graph}    25    Bar chart was not visible
    Run Keyword And Ignore Error    Scroll Element Into View    ${bar_chart_graph}
    Wait Until Element Is Visible    ${bar_chart_graph}

    
Select Comparison Configuration For The Task Comparison Chart With Respect To Created By
    Wait Until Element Is Visible    ${x_axis_dropdown}    10
    Click Element    ${x_axis_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${task_created_by}
    Wait Until Element Is Visible    ${task_created_by}    10
    Click Element    ${task_created_by}
    Scroll Element Into View    ${compare_by_dropdown}
    Wait Until Element Is Visible    ${x_axis_filter_dropdown}    10
    Click Element    ${x_axis_filter_dropdown}
    Click Element    ${Search_placeholder}
    Input Text    ${Search_placeholder}    ${search_name of user 1}
    Wait Until Element Is Visible    ${user_1}    20
    Click Element    ${user_1}
    Clear Element Text    ${Search_placeholder}
    Input Text    ${Search_placeholder}    ${search_name of user 2}
    Wait Until Element Is Visible    ${user_2}    20
    Click Element    ${user_2}
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Wait Until Element Is Visible    ${compare_by_dropdown}    10
    Click Element    ${compare_by_dropdown}
    Selecting Task Types
    Scroll Element Into View     ${widget_size}
    Wait Until Element Is Visible    ${widget_size}    10
    Click Element     ${widget_size}
    Wait Until Element Is Visible    ${widget_size_resolution}    10
    Click Element     ${widget_size_resolution}
    Wait Until Element Is Visible    ${first_next_button}    10
    Click Element     ${first_next_button}
    Wait Until Page Contains Element    ${bar_chart_graph}    25    Bar chart was not visible
    Verify Preview Notice Message
    Wait Until Page Contains Element    ${bar_chart_graph}    25    Bar chart was not visible
    Click Element    ${second_next_button}
    Verify Preview Notice Message
    Wait Until Page Contains Element    ${bar_chart_graph}    20    Bar chart was not visible
    Click Element    ${submit_button}
    Wait Until Page Contains Element    xpath://button[@class='btn']    10    Save Button was not visible to save the widget
    Click Element    xpath://button[@class='btn']
    Wait Until Page Contains Element    ${bar_chart_graph}    25    Bar chart was not visible
    Run Keyword And Ignore Error    Scroll Element Into View    ${bar_chart_graph}
    Wait Until Element Is Visible    ${bar_chart_graph}



Selecting Task types
    Run Keyword And Ignore Error    Scroll Element Into View     ${task_type_option}
    Wait Until Element Is Visible   ${task_type_option}    10
    Click Element    ${task_type_option}
    Scroll Element Into View     ${select_comparisons}
    Click Element     ${select_comparisons}
    Click Element    ${Audit_review_option}
    Click Element    ${Incident_Response_option}
    Click Element    ${Operational_task_option}
    Click Element    ${Dispatch_option}
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC    


Select Comparison Configuration For The Task Comparison Chart With Respect To Assigned to
    Wait Until Element Is Visible    ${x_axis_dropdown}    10
    Click Element    ${x_axis_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${task_assigned_to}
    Wait Until Element Is Visible    ${task_assigned_to}    10
    Click Element    ${task_assigned_to}
    Scroll Element Into View    ${compare_by_dropdown}
    Wait Until Element Is Visible    ${x_axis_filter_dropdown}    10
    Click Element    ${x_axis_filter_dropdown}
    Click Element    ${Search_placeholder}
    Input Text    ${Search_placeholder}    ${search_name of user 1}
    Wait Until Element Is Visible    ${user_1}    20
    Click Element    ${user_1}
    Clear Element Text    ${Search_placeholder}
    Input Text    ${Search_placeholder}    ${search_name of user 2}
    Wait Until Element Is Visible    ${user_2}    20
    Click Element    ${user_2}
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Wait Until Element Is Visible    ${compare_by_dropdown}    10
    Click Element    ${compare_by_dropdown}
    Selecting Task Types
    Scroll Element Into View     ${widget_size}
    Wait Until Element Is Visible    ${widget_size}    10
    Click Element     ${widget_size}
    Wait Until Element Is Visible    ${widget_size_resolution}    10
    Click Element     ${widget_size_resolution}
    Wait Until Element Is Visible    ${first_next_button}    10
    Click Element     ${first_next_button}
    Wait Until Page Contains Element    ${bar_chart_graph}    25    Bar chart was not visible
    Verify Preview Notice Message
    Wait Until Page Contains Element    ${bar_chart_graph}    25    Bar chart was not visible
    Click Element    ${second_next_button}
    Verify Preview Notice Message
    Wait Until Page Contains Element    ${bar_chart_graph}    20    Bar chart was not visible
    Click Element    ${submit_button}
    Wait Until Page Contains Element    xpath://button[@class='btn']    10    Save Button was not visible to save the widget
    Click Element    xpath://button[@class='btn']
    Wait Until Page Contains Element    ${bar_chart_graph}    25    Bar chart was not visible
    Run Keyword And Ignore Error    Scroll Element Into View    ${bar_chart_graph}
    Wait Until Element Is Visible    ${bar_chart_graph}


    
Select Comparison Configuration For The Task Comparison Chart With Respect To Task Status
    Wait Until Element Is Visible    ${x_axis_dropdown}    10
    Click Element    ${x_axis_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${task_status}
    Wait Until Element Is Visible    ${task_status}    10
    Click Element    ${task_status}
    Scroll Element Into View    ${compare_by_dropdown}
    Wait Until Element Is Visible    ${x_axis_filter_dropdown_for_task}    10
    Click Element    ${x_axis_filter_dropdown_for_task}
    Click Element    ${Cancelled_status}
    Click Element    ${Completed_status}
    Click Element    ${Pending_status}
    Click Element    ${Unassigned_status}
    Click Element    ${In_progress_status}
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Wait Until Element Is Visible    ${compare_by_dropdown}    10
    Click Element    ${compare_by_dropdown}
    Selecting Task Types
    Selecting Widget Size and Resolution
    Configuring And Finalizing The Widget
    Wait for the bar graph to load and verify its visibility


Selecting Widget Size and Resolution
    Scroll Element Into View     ${widget_size}
    Wait Until Element Is Visible    ${widget_size}    10
    Click Element     ${widget_size}
    Wait Until Element Is Visible    ${widget_size_resolution}    10
    Click Element     ${widget_size_resolution}

Configuring and Finalizing the widget
    Wait Until Element Is Visible    ${first_next_button}    10
    Click Element     ${first_next_button}
    Wait Until Page Contains Element    ${bar_chart_graph}    25    Bar chart was not visible
    Verify Preview Notice Message
    Wait Until Page Contains Element    ${bar_chart_graph}    25    Bar chart was not visible
    Click Element    ${second_next_button}
    Verify Preview Notice Message
    Wait Until Page Contains Element    ${bar_chart_graph}    20    Bar chart was not visible
    Click Element    ${submit_button}
    Wait Until Page Contains Element    xpath://button[@class='btn']    10    Save Button was not visible to save the widget
    Click Element    xpath://button[@class='btn']
    

Wait for the bar graph to load and verify its visibility
    Wait Until Page Contains Element    ${bar_chart_graph}    25    Bar chart was not visible
    Run Keyword And Ignore Error    Scroll Element Into View    ${bar_chart_graph}
    Wait Until Element Is Visible    ${bar_chart_graph}


Select Data Configuration For The Task Comparison Chart for Due date date filter With Respect To Last 5 Years
    Wait Until Element Is Visible    ${chart_type_dropdown}    10
    Click Element    ${chart_type_dropdown}
    Wait Until Element Is Visible    ${bar_chart}    10
    Click Element    ${bar_chart}
    Wait Until Element Is Visible    ${widget_title}    10
    Click Element    ${widget_title}
    ${unique_widget_title}    Set Variable    task
    Input Text    ${widget_title}    ${unique_widget_title}
    Wait Until Element Is Visible    ${data_source_dropdown}    10
    Click Element    ${data_source_dropdown}
    Wait Until Element Is Visible    ${task_dropdown_option}    10
    Click Element    ${task_dropdown_option}
    Wait Until Element Is Visible    ${Saved_filter_dropdown}    10
    Click Element    ${Saved_filter_dropdown}
    Wait Until Element Is Visible     ${Search_placeholder}
    Input Text    ${Search_placeholder}    ${Search_value}
    Wait Until Element Is Visible    ${task_selected_saved_filter}    10
    Click Element    ${task_selected_saved_filter}
    
    
Select Comparison Configuration For The Task Comparison chart for Due date date filter With Respect To Last 5 Years
    Wait Until Element Is Visible    ${Task_date_filter_dropdown}     10
    Click Element    ${Task_date_filter_dropdown}
    Wait Until Element Is Visible    ${Task_due_date_date_filter_option}    10
    Click Element    ${Task_due_date_date_filter_option}
    Wait Until Element Is Visible    ${x_axis_dropdown}    10
    Click Element    ${x_axis_dropdown}
    Wait Until Element Is Visible    ${last_5_year}    10
    Click Element    ${last_5_year}
    Scroll Element Into View    ${compare_by_dropdown}
    Click Element    ${compare_by_dropdown}
    Selecting Task Types
    Selecting Widget Size And Resolution
    Configuring And Finalizing The Widget
    Wait For The Bar Graph To Load And Verify Its Visibility




Select Comparison Configuration For The Task Comparison Chart for Due date date filter With Respect To Last 4 Years
    Wait Until Element Is Visible    ${Task_date_filter_dropdown}     10
    Click Element    ${Task_date_filter_dropdown}
    Wait Until Element Is Visible    ${Task_due_date_date_filter_option}    10
    Click Element    ${Task_due_date_date_filter_option}
    Wait Until Element Is Visible    ${x_axis_dropdown}    10
    Click Element    ${x_axis_dropdown}
    Wait Until Element Is Visible    ${last_4_year}    10
    Click Element    ${last_4_year}
    Scroll Element Into View    ${compare_by_dropdown}
    Click Element    ${compare_by_dropdown}
    Selecting Task Types
    Selecting Widget Size And Resolution
    Configuring And Finalizing The Widget
    Wait For The Bar Graph To Load And Verify Its Visibility


Select Comparison Configuration For The Task Comparison Chart for Due date date filter With Respect To Last 3 Years
    Wait Until Element Is Visible    ${Task_date_filter_dropdown}     10
    Click Element    ${Task_date_filter_dropdown}
    Wait Until Element Is Visible    ${Task_due_date_date_filter_option}    10
    Click Element    ${Task_due_date_date_filter_option}
    Wait Until Element Is Visible    ${x_axis_dropdown}    10
    Click Element    ${x_axis_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${last_3_year}
    Wait Until Element Is Visible    ${last_3_year}    10
    Click Element    ${last_3_year}
    Scroll Element Into View    ${compare_by_dropdown}
    Click Element    ${compare_by_dropdown}
    Selecting Task Types
    Selecting Widget Size And Resolution
    Configuring And Finalizing The Widget


Select Comparison Configuration For The Task Comparison Chart for Due date date filter With Respect To Last 2 Years
    Wait Until Element Is Visible    ${Task_date_filter_dropdown}     10
    Click Element    ${Task_date_filter_dropdown}
    Wait Until Element Is Visible    ${Task_due_date_date_filter_option}    10
    Click Element    ${Task_due_date_date_filter_option}
    Wait Until Element Is Visible    ${x_axis_dropdown}    10
    Click Element    ${x_axis_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${last_2_year}
    Wait Until Element Is Visible    ${last_2_year}    10
    Click Element    ${last_2_year}
    Scroll Element Into View    ${compare_by_dropdown}
    Click Element    ${compare_by_dropdown}
    Selecting Task Types
    Selecting Widget Size And Resolution
    Configuring And Finalizing The Widget

Select Comparison Configuration For The Task Comparison Chart for Due date date filter With Respect To Last Year
    Wait Until Element Is Visible    ${Task_date_filter_dropdown}     10
    Click Element    ${Task_date_filter_dropdown}
    Wait Until Element Is Visible    ${Task_due_date_date_filter_option}    10
    Click Element    ${Task_due_date_date_filter_option}
    Wait Until Element Is Visible    ${x_axis_dropdown}    10
    Click Element    ${x_axis_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${last_year}
    Wait Until Element Is Visible    ${last_year}    10
    Click Element    ${last_year}
    Scroll Element Into View    ${compare_by_dropdown}
    Click Element    ${compare_by_dropdown}
    Selecting Task Types
    Selecting Widget Size And Resolution
    Configuring And Finalizing The Widget
    
Select Comparison Configuration For The Task Comparison Chart for Due date date filter With Respect To Year
    Wait Until Element Is Visible    ${Task_date_filter_dropdown}     10
    Click Element    ${Task_date_filter_dropdown}
    Wait Until Element Is Visible    ${Task_due_date_date_filter_option}    10
    Click Element    ${Task_due_date_date_filter_option}
    Wait Until Element Is Visible    ${x_axis_dropdown}    10
    Click Element    ${x_axis_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${year}
    Wait Until Element Is Visible    ${year}    10
    Click Element   ${year}
    Scroll Element Into View    ${compare_by_dropdown}
    Click Element    ${x_axis_filter_dropdown_for_task}
    Run Keyword And Ignore Error    Scroll Element Into View     ${2024_year_option}
    Click Element    ${2024_year_option}
    Click Element    ${2025_year_option}
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Click Element     ${compare_by_dropdown}
    Selecting Task Types
    Selecting Widget Size And Resolution
    Configuring And Finalizing The Widget
    Wait For The Bar Graph To Load And Verify Its Visibility




Selecting Task Due date Date Filter        
    Wait Until Element Is Visible    ${Task_date_filter_dropdown}     10
    Click Element    ${Task_date_filter_dropdown}
    Wait Until Element Is Visible    ${Task_due_date_date_filter_option}    10
    Click Element    ${Task_due_date_date_filter_option}



Select Comparison Configuration For The Task Comparison Chart for Due date date filter With Respect To Month
    Wait Until Element Is Visible    ${Task_date_filter_dropdown}     10
    Click Element    ${Task_date_filter_dropdown}
    Wait Until Element Is Visible    ${Task_due_date_date_filter_option}    10
    Click Element    ${Task_due_date_date_filter_option}
    Wait Until Element Is Visible    ${x_axis_dropdown}    10
    Click Element    ${x_axis_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${month}
    Wait Until Element Is Visible    ${month}    10
    Click Element   ${month}
    Scroll Element Into View    ${compare_by_dropdown}
    Click Element    ${select_year_dropdown}
    Click Element    ${select_year_dropdown_2024}
    Run Keyword And Ignore Error    Scroll Element Into View     ${select_year_dropdown_2025}
    Click Element    ${select_year_dropdown_2025}
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Click Element    ${x_axis_filter_dropdown_for_task}
    FOR    ${month_name}    IN    @{Months}
        Click Element    ${month_name}
    END
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Click Element     ${compare_by_dropdown}
    Selecting Task Types
    Selecting Widget Size And Resolution
    Configuring And Finalizing The Widget
    Wait For The Bar Graph To Load And Verify Its Visibility


Select Comparison Configuration For The Task Comparison Chart for Due date date filter With Respect To Quarter
    Wait Until Element Is Visible    ${Task_date_filter_dropdown}     10
    Click Element    ${Task_date_filter_dropdown}
    Wait Until Element Is Visible    ${Task_due_date_date_filter_option}    10
    Click Element    ${Task_due_date_date_filter_option}
    Wait Until Element Is Visible    ${x_axis_dropdown}    10
    Click Element    ${x_axis_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${quarter}
    Wait Until Element Is Visible    ${quarter}    10
    Click Element   ${quarter}
    Scroll Element Into View    ${compare_by_dropdown}
    Click Element    ${select_year_dropdown}
    Click Element    ${select_year_dropdown_2024}
    Run Keyword And Ignore Error    Scroll Element Into View     ${select_year_dropdown_2025}
    Click Element    ${select_year_dropdown_2025}
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Click Element     ${x_axis_filter_dropdown_for_task}
    FOR    ${quarter_name}    IN    @{Quarters}
        Click Element     ${quarter_name}
    END
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Click Element     ${compare_by_dropdown}
    Selecting Task Types
    Selecting Widget Size And Resolution
    Configuring And Finalizing The Widget
    Wait For The Bar Graph To Load And Verify Its Visibility


Select Comparison Configuration For The Task Comparison Chart for Due date date filter With Respect To Week
    Wait Until Element Is Visible    ${Task_date_filter_dropdown}     10
    Click Element    ${Task_date_filter_dropdown}
    Wait Until Element Is Visible    ${Task_due_date_date_filter_option}    10
    Click Element    ${Task_due_date_date_filter_option}
    Wait Until Element Is Visible    ${x_axis_dropdown}    10
    Click Element    ${x_axis_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${week}
    Wait Until Element Is Visible    ${week}    10
    Click Element   ${week}
    Scroll Element Into View    ${compare_by_dropdown}
    Click Element    ${select_year_dropdown}
    Click Element    ${select_year_dropdown_2024}
    Run Keyword And Ignore Error    Scroll Element Into View     ${select_year_dropdown_2025}
    Click Element    ${select_year_dropdown_2025}
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Click Element     ${x_axis_filter_dropdown_for_task}
    FOR    ${week_name}    IN    @{Weeks}
        Click Element     ${week_name}
    END
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Click Element     ${compare_by_dropdown}
    Selecting Task Types
    Selecting Widget Size And Resolution
    Configuring And Finalizing The Widget
    Wait For The Bar Graph To Load And Verify Its Visibility
    
Select Comparison Configuration For The Task Comparison Chart for Due date date filter With Respect To Day 
    Wait Until Element Is Visible    ${Task_date_filter_dropdown}     10
    Click Element    ${Task_date_filter_dropdown}
    Wait Until Element Is Visible    ${Task_due_date_date_filter_option}    10
    Click Element    ${Task_due_date_date_filter_option}
    Wait Until Element Is Visible    ${x_axis_dropdown}    10
    Click Element    ${x_axis_dropdown}
    Run Keyword And Ignore Error    Scroll Element Into View    ${day}
    Wait Until Element Is Visible    ${day}    10
    Click Element   ${day}
    Scroll Element Into View    ${compare_by_dropdown}
    Wait Until Element Is Visible    ${select_year_dropdown}    10
    Click Element    ${select_year_dropdown}
    Click Element    ${select_year_dropdown_2024}
    Run Keyword And Ignore Error    Scroll Element Into View     ${select_year_dropdown_2025}
    Wait Until Element Is Visible    ${select_year_dropdown_2025}    10
    Click Element    ${select_year_dropdown_2025}
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Click Element     ${x_axis_filter_dropdown_for_task}
    FOR    ${day_name}    IN    @{Days}
        Click Element     ${day_name}
    END
    Press Keys    ${None}    ESC
    Press Keys    ${None}    ESC
    Click Element     ${compare_by_dropdown}
    Selecting Task Types
    Selecting Widget Size And Resolution
    Configuring And Finalizing The Widget
    Wait For The Bar Graph To Load And Verify Its Visibility



