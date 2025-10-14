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
TC_115_Verify the data comparison functionality is working as expected for events
    [Documentation]    Adding a dashboard page and configuring a comparison chart widget and verifying the chart creation
    [Tags]    data-comparison
    Navigate To Dashboard Module
    Add And Verify New Dashboard Page
    Edit Newly Added Dashboard Page
    Click On Add Widget Button
    Select Data Configuration For The Comparison Chart
    Select Comparison Configuration For The Comparison Chart


TC_03_Comparing Site names with year Filter
    [Documentation]    Configuring and creating Site name comparison chart with respect to Year range filter
    [Tags]    data-comparison1
    Navigate To Dashboard Module
    Add And Verify New Dashboard Page
    Edit Newly Added Dashboard Page
    Click On Add Widget Button
    Select Data Configuration For The Site Name Comparison Chart
    Select Comparison Configuration For The Site Name Comparison Chart


TC_147_Comparing Incident category with Last 5 year
    [Documentation]    Configuring and creating Last 5 years comparison chart with respect to Incident Category
    [Tags]    data-comparison-Last5Year
    Navigate To Dashboard Module
    Add And Verify New Dashboard Page
    Edit Newly Added Dashboard Page
    Click On Add Widget Button
    Select Data Configuration For The Incident Category Comparison Chart With Respect To Last 5 Years
    Select Comparison Configuration For The Incident Category Comparison Chart with respect to last 5 year


TC_148_Comparing Incident category with Last 4 year
    [Documentation]    Configuring and creating Last 4 years comparison chart with respect to Incident Category
    [Tags]    data-comparison-Last4Year
    Navigate To Dashboard Module
    Add And Verify New Dashboard Page
    Edit Newly Added Dashboard Page
    Click On Add Widget Button
    Select Data Configuration for the Incident Category Comparison chart with respect to last 4 years
    Select Comparison Configuration For The Incident Category Comparison Chart with respect to last 4 year



TC_149_Comparing Incident category with Last 3 years
    [Documentation]    Configuring and creating Last 3 years comparison chart with respect to Incident Category
    [Tags]    data-comparison-Last3Year
    Navigate To Dashboard Module
    Add And Verify New Dashboard Page
    Edit Newly Added Dashboard Page
    Click On Add Widget Button
    Select Data Configuration for the Incident Category Comparison chart with respect to last 3 years
    Select Comparison Configuration For The Incident Category Comparison Chart With Respect To Last 3 Year


TC_150_Comparing Incident category with Last 2 years
    [Documentation]    Configuring and creating Last 2 years comparison chart with respect to Incident Category
    [Tags]    data-comparison-Last2Year
    Navigate To Dashboard Module
    Add And Verify New Dashboard Page
    Edit Newly Added Dashboard Page
    Click On Add Widget Button
    Select Data Configuration for the Incident Category Comparison chart with respect to last 2 years
    Select Comparison Configuration For The Incident Category Comparison Chart with respect to last 2 year

TC_151_Comparing Incident category with Last year
    [Documentation]    Configuring and creating Last year comparison chart with respect to Incident Category
    [Tags]    data-comparison-LastYear
    Navigate To Dashboard Module
    Add And Verify New Dashboard Page
    Edit Newly Added Dashboard Page
    Click On Add Widget Button
    Select Data Configuration for the Incident Category Comparison chart with respect to last year
    Select Comparison Configuration For The Incident Category Comparison Chart with respect to last year


TC_124_Verify the data source dropdown contains both Incidents and Task
    [Documentation]    Ensure that the data source dropdown contains both Incidents and Task
    [Tags]    data-comparison-datasource
    Navigate To Dashboard Module
    Add And Verify New Dashboard Page
    Edit Newly Added Dashboard Page
    Click On Add Widget Button
    Verify Data Source Dropdown Contains Both Incidents And Task Under Comparison Configuration


TC_130_Verify Comparing Incident category with Year filter
    [Documentation]    Verify Year when selected as X Axis it should display only past  5 years as options under X Axis filter 
...    should be able to select any combination of years within the options available and verify graph data accordingly
    [Tags]    data-comparison-Year
    Navigate To Dashboard Module
    Add And Verify New Dashboard Page
    Edit Newly Added Dashboard Page
    Click On Add Widget Button
    Select Data Configuration For The Year Comparison Chart
    Select Comparison Configuration For The Year Comparison Chart

TC_131_Verify Comparing Incident category with Month filter
    [Documentation]    Verify Month when selected as  X Axis it should display the fields,i.e-year,month
...    (e,g-Jan 2021,Feb 2021,Dec 2021,Jan 2022,Feb 2022,Dec 2022)and should display graph data accordingly
    [Tags]    data-comparison-Month
    Navigate To Dashboard Module
    Add And Verify New Dashboard Page
    Edit Newly Added Dashboard Page
    Click On Add Widget Button
    Select Data Configuration For The Month Comparison Chart
    Select Comparison Configuration For The Month Comparison Chart

TC_132_Verify Comparing Incident category with Week filter
    [Documentation]    Verify Week when selected as X Axis it should display weekwise graph data for certain selected years
    [Tags]    data-comparison-Week
    Navigate To Dashboard Module
    Add And Verify New Dashboard Page
    Edit Newly Added Dashboard Page
    Click On Add Widget Button
    Select Data Configuration For The Week Comparison Chart
    Select Comparison Configuration For The Week Comparison Chart

TC_129_Verify Comparing Incident category with Quarter filter
    [Documentation]    Verify Quarter when selected as X Axis it should display the fields(year,which quarter(e.g-Quarter1 ,Quarter 2.etc)
...    and should display graph data accordingly
    [Tags]    data-comparison-Quarter
    Navigate To Dashboard Module
    Add And Verify New Dashboard Page
    Edit Newly Added Dashboard Page
    Click On Add Widget Button
    Select Data Configuration For The Quarter Comparison Chart
    Select Comparison Configuration For The Quarter Comparison Chart


TC_133_Verify Comparing Incident category with Day filter
    [Documentation]    Verify Day when selected as X  Axis,it should display valid options of days(Like mon,tue..etc) 
...    under X Axis filter and display the graph data accordingly
    [Tags]    data-comparison-Day
    Navigate To Dashboard Module
    Add And Verify New Dashboard Page
    Edit Newly Added Dashboard Page
    Click On Add Widget Button
    Select Data Configuration For The Day Comparison Chart
    Select Comparison Configuration For The Day Comparison Chart
    
TC_140_Verify the error messages without selecting any configurations and clicking on Next
    [Documentation]    Without selecting any configuration on the add widget form and clicking on next triggers error messages
    ...                for each and every fields
    [Tags]    data-comparison-error-messages
    Navigate To Dashboard Module
    Add And Verify New Dashboard Page
    Edit Newly Added Dashboard Page
    Click On Add Widget Button
    Verify The Error Messages Without Selecting Any Configurations On Add Widget Form
    Verify Select chart type error message
    Verify Data source error message
    Verify X Axis Error Message
    Verify X Axis Filter Error Message
    Verify Compare By Error Message
    Verify Select Comparison Error Message
    Verify Widget Size Error Message


TC_122_Verify Select comparisons shows only the reliable options according to the selection done in Compare by
    [Documentation]    Verify Select comparisons shows only the reliable options according to the selection done in Compare by
    [Tags]    data-comparison-optionsValidation
    Navigate To Dashboard Module
    Add And Verify New Dashboard Page
    Edit Newly Added Dashboard Page
    Click On Add Widget Button
    Select Data Configuration for the Comparison chart
    Select Comparison Configuration for any Comparison chart


TC_136_Validate that category can be X axis and Compare By to dates
    [Documentation]    Validate  that category can be X axis and Compare By to dates
    [Tags]    data-comparison-CategoryXaxis-CompareBy-Dates
    Navigate To Dashboard Module
    Add And Verify New Dashboard Page
    Edit Newly Added Dashboard Page
    Click On Add Widget Button
    Select Data Configuration for the Comparison chart
    Select Comparison Configuration with category as x axis and compare by as dates


TC_125_Verify saved filter contains all the filters with respect to data source
    [Documentation]    Verify saved filter contains all the filters with respect to data source
    [Tags]    data-comparison-savedFilter
    Navigate To Dashboard Module
    Add And Verify New Dashboard Page
    Edit Newly Added Dashboard Page
    Click On Add Widget Button
    Verify the saved filter shows the filters a per data source selected


TC_134_Verify the Widget title allows all the supported special characters
    [Documentation]    Verify the Widget title allows all the supported special characters
    [Tags]    data-comparison-widgetTitle
    Navigate To Dashboard Module
    Add And Verify New Dashboard Page
    Edit Newly Added Dashboard Page
    Click On Add Widget Button
    Verify The Widget Title Allows All The Supported Special Characters


TC_154_Verify task data comparison feature functionality with Created date Date filter For last 5 years
    [Documentation]    Verify task data comparison feature functionality with Created date Date filter For last 5 years
    [Tags]    data-comparison-task-Last5Year
    Navigate To Dashboard Module
    Add And Verify New Dashboard Page
    Edit Newly Added Dashboard Page
    Click On Add Widget Button
    Select Data Configuration For The Task Comparison Chart With Respect To Last 5 Years
    Select Comparison Configuration For The Task Comparison Chart With Respect To Last 5 Years


TC_154_Verify task data comparison feature functionality with Created date Date filter For last 4 years
    [Documentation]    Verify task data comparison feature functionality with Created date Date filter For last 4 years
    [Tags]    data-comparison-task-Last4Year
    Navigate To Dashboard Module
    Add And Verify New Dashboard Page
    Edit Newly Added Dashboard Page
    Click On Add Widget Button
    Select Data Configuration For The Task Comparison Chart With Respect To Last 4 Years
    Select Comparison Configuration For The Task Comparison Chart With Respect To Last 4 Years

TC_154_Verify task data comparison feature functionality with Created date Date filter For last 3 years
    [Documentation]    Verify task data comparison feature functionality with Created date Date filter For last 3 years
    [Tags]    data-comparison-task-Last3Year
    Navigate To Dashboard Module
    Add And Verify New Dashboard Page
    Edit Newly Added Dashboard Page
    Click On Add Widget Button
    Select Data Configuration For The Task Comparison Chart With Respect To Last 3 Years
    Select Comparison Configuration For The Task Comparison Chart With Respect To Last 3 Years

TC_154_Verify task data comparison feature functionality with Created date Date filter For last 2 years
    [Documentation]    Verify task data comparison feature functionality with Created date Date filter For last 2 years
    [Tags]    data-comparison-task-Last2Year
    Navigate To Dashboard Module
    Add And Verify New Dashboard Page
    Edit Newly Added Dashboard Page
    Click On Add Widget Button
    Select Data Configuration For The Task Comparison Chart With Respect To Last 2 Years
    Select Comparison Configuration For The Task Comparison Chart With Respect To Last 2 Years

    
    
TC_154_Verify task data comparison feature functionality with Created date Date filter For last year
    [Documentation]    Verify task data comparison feature functionality with Created date Date filter For last year
    [Tags]    data-comparison-task-LastYear
    Navigate To Dashboard Module
    Add And Verify New Dashboard Page
    Edit Newly Added Dashboard Page
    Click On Add Widget Button
    Select Data Configuration For The Task Comparison Chart With Respect To Last Year
    Select Comparison Configuration For The Task Comparison Chart With Respect To Last Year

TC_155_Verify task data comparison feature functionality with Created date Date filter For Years with respect to Task type
    [Documentation]    Verify task data comparison feature functionality with Created date Date filter For years 
    [Tags]    data-comparison-task-Year
    Navigate To Dashboard Module
    Add And Verify New Dashboard Page
    Edit Newly Added Dashboard Page
    Click On Add Widget Button
    Select Data Configuration For The Task Comparison Chart With Respect To Last Year
    Select Comparison Configuration For The Task Comparison Chart With Respect To Year


TC_156_Verify task data comparison feature functionality with Created date Date filter For Month with respect to Task type
    [Documentation]    Verify task data comparison feature functionality with Created date Date filter For Month
    [Tags]    data-comparison-task-Month
    Navigate To Dashboard Module
    Add And Verify New Dashboard Page
    Edit Newly Added Dashboard Page
    Click On Add Widget Button
    Select Data Configuration For The Task Comparison Chart With Respect To Last Year
    Select Comparison Configuration For The Task Comparison Chart With Respect To Month

TC_157_Verify task data comparison feature functionality with Created date Date filter For Week with respect to Task type
    [Documentation]    Verify task data comparison feature functionality with Created date Date filter For Week
    [Tags]    data-comparison-task-Week
    Navigate To Dashboard Module
    Add And Verify New Dashboard Page
    Edit Newly Added Dashboard Page
    Click On Add Widget Button
    Select Data Configuration For The Task Comparison Chart With Respect To Last Year
    Select Comparison Configuration For The Task Comparison Chart With Respect To Week

TC_158_Verify task data comparison feature functionality with Created date Date filter For Quarter with respect to Task type
    [Documentation]    Verify task data comparison feature functionality with Created date Date filter For Quarter
    [Tags]    data-comparison-task-Quarter
    Navigate To Dashboard Module
    Add And Verify New Dashboard Page
    Edit Newly Added Dashboard Page
    Click On Add Widget Button
    Select Data Configuration For The Task Comparison Chart With Respect To Last Year
    Select Comparison Configuration For The Task Comparison Chart With Respect To Quarter

TC_159_Verify task data comparison feature functionality with Created date Date filter For Day with respect to Task type
    [Documentation]    Verify task data comparison feature functionality with Created date Date filter For Day
    [Tags]    data-comparison-task-Day
    Navigate To Dashboard Module
    Add And Verify New Dashboard Page
    Edit Newly Added Dashboard Page
    Click On Add Widget Button
    Select Data Configuration For The Task Comparison Chart With Respect To Last Year
    Select Comparison Configuration For The Task Comparison Chart With Respect To Day
    
TC_159_Verify task data comparison feature functionality with Created date Date filter For Created By with respect to Task type
    [Documentation]    Verify task data comparison feature functionality with Created date Date filter For Created By with respect to Task type
    [Tags]    data-comparison-task-CreatedBy
    Navigate To Dashboard Module
    Add And Verify New Dashboard Page
    Edit Newly Added Dashboard Page
    Click On Add Widget Button
    Select Data Configuration For The Task Comparison Chart With Respect To Last Year
    Select Comparison Configuration For The Task Comparison Chart With Respect To Created By


TC_159_Verify task data comparison feature functionality with Created date Date filter For Assigned to with respect to Task type
    [Documentation]    Verify task data comparison feature functionality with Created date Date filter For Task Type
    [Tags]    data-comparison-task-AssignedTo
    Navigate To Dashboard Module
    Add And Verify New Dashboard Page
    Edit Newly Added Dashboard Page
    Click On Add Widget Button
    Select Data Configuration For The Task Comparison Chart With Respect To Last Year
    Select Comparison Configuration For The Task Comparison Chart With Respect To Assigned to
    
TC_159_Verify task data comparison feature functionality with Created date Date filter For Task Status with respect to Task type
    [Documentation]    Verify task data comparison feature functionality with Created date Date filter For Task Type
    [Tags]    data-comparison-task-TaskStatus
    Navigate To Dashboard Module
    Add And Verify New Dashboard Page
    Edit Newly Added Dashboard Page
    Click On Add Widget Button
    Select Data Configuration For The Task Comparison Chart With Respect To Last Year
    Select Comparison Configuration For The Task Comparison Chart With Respect To Task Status


TC_162_Verify the data comparison feature functionality with Due date Dtae filter for Last 5 years
    [Documentation]    Verify the data comparison feature functionality with Due date Dtae filter for Last 5 years
    [Tags]    data-comparison-dueDate-Last5Year
    Navigate To Dashboard Module
    Add And Verify New Dashboard Page
    Edit Newly Added Dashboard Page
    Click On Add Widget Button
    Select Data Configuration For The Task Comparison Chart for Due date date filter With Respect To Last 5 Years
    Select Comparison Configuration For The Task Comparison Chart for Due date date filter With Respect To Last 5 Years



TC_163_Verify the data comparison feature functionality with Due date Dtae filter for Last 4 years
    [Documentation]    Verify the data comparison feature functionality with Due date Dtae filter for Last 4 years
    [Tags]    data-comparison-dueDate-Last4Year
    Navigate To Dashboard Module
    Add And Verify New Dashboard Page
    Edit Newly Added Dashboard Page
    Click On Add Widget Button
    Select Data Configuration For The Task Comparison Chart for Due date date filter With Respect To Last 5 Years
    Select Comparison Configuration For The Task Comparison Chart for Due date date filter With Respect To Last 4 Years



TC_164_Verify the data comparison feature functionality with Due date Dtae filter for Last 3 years
    [Documentation]    Verify the data comparison feature functionality with Due date Dtae filter for Last 3 years
    [Tags]    data-comparison-dueDate-Last3Year
    Navigate To Dashboard Module
    Add And Verify New Dashboard Page
    Edit Newly Added Dashboard Page
    Click On Add Widget Button
    Select Data Configuration For The Task Comparison Chart for Due date date filter With Respect To Last 5 Years
    Select Comparison Configuration For The Task Comparison Chart for Due date date filter With Respect To Last 3 Years



TC_165_Verify the data comparison feature functionality with Due date Dtae filter for Last 2 years
    [Documentation]    Verify the data comparison feature functionality with Due date Dtae filter for Last 2 years
    [Tags]    data-comparison-dueDate-Last2Year
    Navigate To Dashboard Module
    Add And Verify New Dashboard Page
    Edit Newly Added Dashboard Page
    Click On Add Widget Button
    Select Data Configuration For The Task Comparison Chart for Due date date filter With Respect To Last 5 Years
    Select Comparison Configuration For The Task Comparison Chart for Due date date filter With Respect To Last 2 Years


TC_166_Verify the data comparison feature functionality with Due date Dtae filter for Last year
    [Documentation]    Verify the data comparison feature functionality with Due date Dtae filter for Last year
    [Tags]    data-comparison-dueDate-LastYear
    Navigate To Dashboard Module
    Add And Verify New Dashboard Page
    Edit Newly Added Dashboard Page
    Click On Add Widget Button
    Select Data Configuration For The Task Comparison Chart for Due date date filter With Respect To Last 5 Years
    Select Comparison Configuration For The Task Comparison Chart for Due date date filter With Respect To Last Year

TC_167_Verify the data comparison feature functionality with Due date Dtae filter for Year
    [Documentation]    Verify the data comparison feature functionality with Due date Dtae filter for Year
    [Tags]    data-comparison-dueDate-Year
    Navigate To Dashboard Module
    Add And Verify New Dashboard Page
    Edit Newly Added Dashboard Page
    Click On Add Widget Button
    Select Data Configuration For The Task Comparison Chart for Due date date filter With Respect To Last 5 Years
    Select Comparison Configuration For The Task Comparison Chart for Due date date filter With Respect To Year
    

TC_168_Verify the data comparison feature functionality with Due date Dtae filter for Month
    [Documentation]    Verify the data comparison feature functionality with Due date Dtae filter for Month
    [Tags]    data-comparison-dueDate-Month
    Navigate To Dashboard Module
    Add And Verify New Dashboard Page
    Edit Newly Added Dashboard Page
    Click On Add Widget Button
    Select Data Configuration For The Task Comparison Chart for Due date date filter With Respect To Last 5 Years
    Select Comparison Configuration For The Task Comparison Chart for Due date date filter With Respect To Month


TC_169_Verify the data comparison feature functionality with Due date Dtae filter for Quarter
    [Documentation]    Verify the data comparison feature functionality with Due date Dtae filter for Quarter
    [Tags]    data-comparison-dueDate-Quarter
    Navigate To Dashboard Module
    Add And Verify New Dashboard Page
    Edit Newly Added Dashboard Page
    Click On Add Widget Button
    Select Data Configuration For The Task Comparison Chart for Due date date filter With Respect To Last 5 Years
    Select Comparison Configuration For The Task Comparison Chart for Due date date filter With Respect To Quarter


TC_170_Verify the data comparison feature functionality with Due date Dtae filter for Week
    [Documentation]    Verify the data comparison feature functionality with Due date Dtae filter for Week
    [Tags]    data-comparison-dueDate-Week
    Navigate To Dashboard Module
    Add And Verify New Dashboard Page
    Edit Newly Added Dashboard Page
    Click On Add Widget Button
    Select Data Configuration For The Task Comparison Chart for Due date date filter With Respect To Last 5 Years
    Select Comparison Configuration For The Task Comparison Chart for Due date date filter With Respect To Week

TC_171_Verify the data comparison feature functionality with Due date Dtae filter for Day
    [Documentation]    Verify the data comparison feature functionality with Due date Dtae filter for Day
    [Tags]    data-comparison-dueDate-Day
    Navigate To Dashboard Module
    Add And Verify New Dashboard Page
    Edit Newly Added Dashboard Page
    Click On Add Widget Button
    Select Data Configuration For The Task Comparison Chart for Due date date filter With Respect To Last 5 Years
    Select Comparison Configuration For The Task Comparison Chart for Due date date filter With Respect To Day


