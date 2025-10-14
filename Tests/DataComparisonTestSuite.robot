*** Settings ***
Documentation    This test suite is for data comparison feature
Resource    ../Resources/Keywords/General.robot
Resource    ../Resources/Keywords/WidgetExportKeywords.robot
Resource    ../Resources/Keywords/DataComparisonKeywords.robot
Resource    ../Resources/Keywords/DashboardKeywords.robot


Suite Setup      Open The Synapse Analyst Url
Test Setup       Go To Home Page
Test Teardown    Stop Test Case Recording
Suite Teardown   Close Browser

*** Test Cases ***
DC_01_Navigate to Dashboard and create a Comparison chart widget
    [Documentation]    Adding a dashboard page and configuring a comparison chart widget
    [Tags]    data-comparison
    Navigate To Dashboard Module
    Add And Verify New Dashboard Page
    Edit Newly Added Dashboard page
    Click On Add Widget Button
    Select Data Configuration For The Comparison Chart
    Select Comparison Configuration For The Comparison Chart
#    Edit Newly Added Dashboard Page








    





#    Go to the newly created widget
    
    
    
    
##    ${dashboard_element}    Click On The Created Dashboard Page
#    ${dashboard_edit_element}    Click on edit page and Navigate to tab 1
#    ${expected_chart_type_value}    Verify The Chart Type for Region Comparison Chart
#    Verify the widget title value on the data configuration page for Region Comparison chart
#    ${expected_data_source_value}    Verify The Data Source On The Data Configuration Page
#    ${expected_x_axis_filter_value}    verify the x axis value for Region Comparison chart on Comparison configuration section
#    ${expected_x_axis_filter_value}    verify the x axis filter value for Region Comparison chart on Comparison configuration section
#    ${expected_compare_by_value}    Verify Compare by value for Region Comparison chart on Comparison configuration section
#    ${expected_select_comparisons_value}    Verify select comparisons for Region Comparison chart on Comparison configuration section

DC_03_Comparing Site names with year Filter
    [Documentation]    Configuring and creating Site name comparison chart with respect to Year range filter
    [Tags]    data-comparison-SiteName
    Add And Verify New Dashboard Page
    Edit Newly Added Dashboard page
    Click On Add Widget Button
    Select Data Configuration For The Site Name Comparison Chart
    Select Comparison Configuration For The Site Name Comparison Chart
    
DC_04_Verify the selected configurations for Site name with year Filter
    [Documentation]    verifying whether the same configurations are selected or not
    [Tags]     data-comparison-verifySiteConfigs
    ${dashboard_element}    Click On The Created Dashboard Page    
    Click On Edit Page And Navigate To Tab 2    AutomatedPage
    ${expected_chart_type_value}    Verify the Chart Type for Site Name Comparison chart
    verify the widget title value on the data configuration page for Site Name Comparison chart
    ${expected_data_source_value}    Verify The Data Source On The Data Configuration Page
    ${expected_x_axis_value}   Verify the x axis value for Site Name Comparison chart on Comparison configuration section
    ${expected_x_axis_filter_value}    Verify x axis filter value for Site Name Comparison chart on Comparison configuration section
    ${expected_compare_by_value}    Verify Compare by value for Site Name Comparison chart on Comparison configuration section
    ${expected_select_comparisons_value}    Verify select comparisons for Site Name Comparison chart on Comparison configuration section


DC_05_Comparing Incident category with Last 3 years
    [Documentation]    Configuring and creating Last 3 years comparison chart with respect to Incident Category
    [Tags]    data-comparison-last3Year
    ${dashboard_element}    Click on the created dashboard page     
    Click On Edit Page Icon Of The Dashboard And Navigate To Tab 3    AutomatedPage
    Verify add widget title under configurations
    Select Data Configuration For The Incident Category Comparison Chart
    Select Comparison Configuration For The Incident Category Comparison Chart

DC_06_Verify the selected configurations for Last 3 year comparison wrt Incident Category
    [Documentation]    verifying whether the same configurations are selected or not
    [Tags]    data-comparison-verifyLast3yearIncidentCategory
    ${dashboard_element}    Click On The Created Dashboard Page    
    Click On Edit Page And Navigate To Tab 3    AutomatedPage
    ${expected_chart_type_value}  Verify the chart type for Last 3 year Incident category Comparison chart
    verify the widget title value on the data configuration page for Last 3 year Incident Category Comparison chart
    ${expected_data_source_value}    verify the data source on the data configuration page
    ${expected_x_axis_value}    verify the x axis value for Last 3 year wrt Incident category Comparison chart on Comparison configuration section
    ${expected_x_axis_filter_value}    verify the x axis filter value for Last3year Incident Category Comparison chart on Comparison configuration section
    ${expected_compare_by_value}    Verify Compare by value for Last3year Incident Category Comparison chart on Comparison configuration section
    ${all_option_texts}    Verify Select Comparisons For Last3year Incident Category Comparison Chart On Comparison Configuration Section


DC_07_Verify the data source dropdown contains both Incidents and Task
    [Documentation]    Ensure that the data source dropdown contains both Incidents and Task
    [Tags]    datasource
    ${dashboard_element}    Click on the created dashboard page
    Verify Data Source Dropdown Contains Both Incidents And Task Under Comparison Configuration

DC_08_Comparing Incident Category with Month filter
    [Documentation]    Configuring and creating Months comparison chart with respect to Incident Category
    [Tags]     data-comparison-Month
    ${dashboard_element}    Click on the created dashboard page      
    Click On Edit Page Icon Of The Dashboard And Navigate To Tab 4    AutomatedPage
    Verify add widget title under configurations
    Select Data Configuration For The Month Comparison Chart
    Select Comparison Configuration For The Month Comparison Chart

DC_09_Verify the selected configurations for Month comparison wrt Incident Category
    [Documentation]    verifying whether the same configurations are selected or not
    [Tags]    data-comparison-verifyMonthIncidentCategory
    ${dashboard_element}    Click On The Created Dashboard Page    
    Click On Edit Page And Navigate To Tab 4    AutomatedPage
    ${expected_chart_type_value}    Verify The Chart Type For Month Wrt Incident Category Comparison Chart
    verify the widget title value on the data configuration page for Month wrt Incident Category Comparison chart
    ${expected_data_source_value}    Verify The Data Source On The Data Configuration Page
    ${expected_x_axis_value}    verify the x axis value for Month wrt Incident category Comparison chart on Comparison configuration section
    ${expected_select_year_value}    Verify The Select Year Value For Month Wrt Incident Category Comparison Chart On Comparison Configuration Section
    ${all_option_texts}    Verify x axis filter values selected for Month wrt Incident category Comparison chart on Comparison configuration section
    ${expected_compare_by_value}    Verify Compare by value for Month wrt Incident Category Comparison chart on Comparison configuration section
    ${all_option_texts}    Verify select comparisons for Month wrt Incident category Comparison chart on Comparison configuration section

DC_10_Comparing Incident Category with Quarter filter
    [Documentation]     Configuring and creating Quarter comparison chart with respect to Incident Category
    [Tags]    data-comparison-Quarter
    ${dashboard_element}    Click on the created dashboard page     
    Click On Edit Page Icon Of The Dashboard And Navigate To Tab 5    AutomatedPage
    Verify add widget title under configurations
    Select Data Configuration For The Quarter Comparison Chart
    Select Comparison Configuration For The Quarter Comparison Chart
    
DC_11_Verify the selected configurations for Quarter comparison wrt Incident Category
    [Documentation]    verifying whether the same configurations are selected or not
    [Tags]    data-comparison-verifyQuarterIncidentCategory
    ${dashboard_element}    Click On The Created Dashboard Page    
    Click on edit page and Navigate to tab 5    AutomatedPage
    ${expected_chart_type_value}    Verify The Chart Type For Quarter Wrt Incident Category Comparison Chart
    verify the widget title value on the data configuration page for Quarter wrt Incident Category Comparison chart
    ${expected_data_source_value}    Verify The Data Source On The Data Configuration Page
    ${expected_x_axis_value}    Verify the x axis value for Quarter wrt Incident category Comparison chart on Comparison configuration section
    ${expected_select_year_value}    Verify the select year value for Quarter wrt Incident category Comparison chart on Comparison configuration section
    ${all_option_texts}    Verify x axis filter values selected for Quarter wrt Incident category Comparison chart on Comparison configuration section
    ${expected_compare_by_value}    Verify Compare by value for Quarter wrt Incident Category Comparison chart on Comparison configuration section
    ${all_option_texts}    Verify select comparisons for Quarter wrt Incident category Comparison chart on Comparison configuration section

DC_12_Comparing Incident Category with Week filter
    [Documentation]    Configuring and creating Week comparison chart with respect to Incident Category
    [Tags]    data-comparison-week
    ${dashboard_element}    Click on the created dashboard page    
    Click On Edit Page Icon Of The Dashboard And Navigate To Tab 6    AutomatedPage
    Verify add widget title under configurations
    Select Data Configuration For The Week Comparison Chart
    Select Comparison Configuration For The Week Comparison Chart
    
DC_13_Verify the selected configurations for Week comparison wrt Incident Category
    [Documentation]    verifying whether the same configurations are selected or not
    [Tags]    data-comparison-verifyWeekIncidentCategory
    ${dashboard_element}    Click On The Created Dashboard Page
    Click on edit page and Navigate to tab 6    AutomatedPage
    ${expected_chart_type_value}    Verify the chart type for Week wrt Incident category Comparison chart
    verify the widget title value on the data configuration page for Week wrt Incident Category Comparison chart
    ${expected_data_source_value}    Verify The Data Source On The Data Configuration Page
    ${expected_x_axis_value}    verify the x axis value for Week wrt Incident category Comparison chart on Comparison configuration section
    ${expected_select_year_value}    verify the select year value for Week wrt Incident category Comparison chart on Comparison configuration section
    ${all_option_texts}    Verify x axis filter values selected for Week wrt Incident category Comparison chart on Comparison configuration section
    ${expected_compare_by_value}    Verify Compare by value for Week wrt Incident Category Comparison chart on Comparison configuration section
    ${all_option_texts}    Verify select comparisons for Week wrt Incident category Comparison chart on Comparison configuration section

DC_14_Comparing Incident Category with Day filter
    [Documentation]    Configuring and creating Day comparison chart with respect to Incident Category
    [Tags]    data-comparison-day
    ${dashboard_element}    Click on the created dashboard page   
    Click On Edit Page Icon Of The Dashboard And Navigate To Tab 7    AutomatedPage
    Verify add widget title under configurations
    Select Data Configuration For The Day Comparison Chart
    Select Comparison Configuration For The Day Comparison Chart
    
DC_15_Verify the selected configurations for Day comparison wrt Incident Category
    [Documentation]    verifying whether the same configurations are selected or not
    [Tags]      data-comparison-verifyDayIncidentCategory
    ${dashboard_element}    Click On The Created Dashboard Page
    Click on edit page and Navigate to tab 7    AutomatedPage
    ${expected_chart_type_value}    Verify the chart type for Day wrt Incident category Comparison chart
    verify the widget title value on the data configuration page for Day wrt Incident Category Comparison chart
    ${expected_data_source_value}    Verify The Data Source On The Data Configuration Page
    ${expected_x_axis_value}    verify the x axis value for day wrt Incident category Comparison chart on Comparison configuration section
    ${expected_select_year_value}    verify the select year value for Day wrt Incident category Comparison chart on Comparison configuration section
    ${all_option_texts}    Verify x axis filter values selected for Day wrt Incident category Comparison chart on Comparison configuration section
    ${expected_compare_by_value}    Verify Compare by value for Day wrt Incident Category Comparison chart on Comparison configuration section
    ${all_option_texts}    Verify select comparisons for Day wrt Incident category Comparison chart on Comparison configuration section


DC_16_Verify both X axis and Compare by cannot be Date Range Filters
    [Documentation]    verify both x axis filter and compare by cannot be compared via any Date range Filters
    [Tags]    data-comparison-validation
    ${dashboard_element}    Click on the created dashboard page    
    Click On Edit Page Icon Of The Dashboard And Navigate To Tab 5    AutomatedPage
    Select Data Configuration For The Comparison Chart
    Select Date Range Filter For Both X Axis And Compare By

DC_017_Verify the error messages without selecting any configurations and clicking on Next
    [Documentation]    Without selecting any configuration on the add widget form and clicking on next triggers error messages
    ...                for each and every fields
    [Tags]    data-comparison-error-messages
    ${dashboard_element}    Click on the created dashboard page
    Click On Edit Page Icon Of The Dashboard And Navigate To Tab 5    AutomatedPage
    Verify The Error Messages Without Selecting Any Configurations On Add Widget Form
    Verify Select chart type error message
    Verify Data source error message
    Verify X Axis Error Message
    Verify X Axis Filter Error Message
    Verify Compare By Error Message
    Verify Select Comparison Error Message
    Verify Widget Size Error Message











    
    






    
