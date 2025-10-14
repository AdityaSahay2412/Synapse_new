*** Variables ***
${Dashboard_module}    xpath://a[@id='navbar-Dashboards']
${Add_dashboard_page_button}    xpath://button[@id='btn-add-page']
${Add_page_form}    xpath://div[@class='mat-drawer-inner-container ng-tns-c386-3']
${Dashboard_page_name_field}    xpath://input[@id='txt-page-or-tab-title']
${Save_page_button}    xpath://button[@id='btn-slide-out-confirm']
${dashboard_pages}     xpath://div[@class='mat-tooltip-trigger normal-text ng-star-inserted']
${dashboard_title}    xpath://h1[@id='dashboard-title']
${dashboard_text_header}    xpath://h3[text()=' Dashboards ']
${dashboard_edit_page_button}    xpath://button[@id='dashboard-collection-item-menu-edit']
${add_widget_button}    xpath://button[@id='add-widget-btn']
${comparison_chart_widget_button}     xpath://h4[text()='Comparison Chart Widget']
${chart_type_dropdown}     xpath://input[@id='chartType_dummy']
${bar_chart}    xpath://div[text()='Bar Chart']
${widget_title}     xpath://input[@id='widgetTitle']
${widget_title_value}     RegionName
${data_source_dropdown}    xpath://input[@id='DataSource_dummy']
${incidents_option}    xpath://div[text()='Incidents']
${Saved_filter_dropdown}      xpath://span[@class='mbsc-textfield-tags-placeholder mbsc-material']
${Search_placeholder}    xpath://input[@placeholder='Search']
${Search_value}    gt
${search_name of user 1}    aditya
${search_name of user 2}    sumit
${selected_saved_filter}    xpath://div[@class='zd-select-option' and text()='event reported gt 2020 ']
${task_selected_saved_filter}    xpath://div[@class='zd-select-option' and text()='task gt 2020 i.e- gt 1/2020 ']
${task_type_option}    xpath://div[@data-val='taskGroupId']
${task_created_by}    xpath://div[@data-val='taskAssignedById']
${task_assigned_to}    xpath://div[@data-val='taskAssignedToId']
${task_status}    xpath://div[@data-val='taskStatusId']
${user_2}    xpath://div[@class='zd-select-option' and text()='Sumith Joshi ']
${user_1}    xpath://div[@class='zd-select-option' and text()='Aditya Sahay ']
    
${x_axis_dropdown}    xpath://input[@id='chartXAxis_dummy']
${region_name_option}    xpath://div[@data-val='regionId']
${x_axis_filter_dropdown}    xpath://input[@id='chartXAxisSelectioninput']
${x_axis_filter_dropdown_for_task}    xpath://input[@id='chartXAxisSelection_dummy']

${qa_region_option}    xpath://div[@data-val='1']
${compare_by_dropdown}    xpath://input[@id='chartCompareBy_dummy']
${year_option}    xpath://div[@data-val='year']
${widget_size}    xpath://input[@id='widgetSize_dummy']
${select_comparisons}    xpath://input[@id='chartCompareBySelection_dummy']
${2024_year_option}    xpath://div[@data-val='2024']
${2025_year_option}    xpath://div[@data-val='2025']
${widget_size_resolution}    xpath://div[text()='Extra Large (100%)']
${first_next_button}    xpath://button[@id='btnStepFirst']
${second_next_button}    xpath://button[@id='btnStepTwo']
${submit_button}    xpath://button[@id='btnSubmit']
${bar_chart_graph}    xpath://canvas[@charttype='bar']
${tab_2}    xpath://mat-chip[@id='dashboard-tab-item2']
${tab_1}    xpath://mat-chip[@id='dashboard-tab-item1']
${widget_title_site_name}    SiteName
${Task_date_filter_dropdown}    xpath://input[@id='taskDateAggrField_dummy']
${Task_due_date_date_filter_option}    xpath://div[@data-val='taskDueDate']
${site_name_option}    xpath://div[@data-val='incidentSiteId']
${site_name}    xpath://div[@class='zd-select-option']
${site_name2}    xpath:(//div[@class='zd-select-option'])[2]
${site_name3}    xpath:(//div[@class='zd-select-option'])[3]
${site_name_x_axis_filter_dropdown}    xpath://input[@id='site-filterinput']
${tab_3}    xpath://mat-chip[@id='dashboard-tab-item3']
${tab_4}    xpath://mat-chip[@id='dashboard-tab-item4']
${tab_5}    xpath://mat-chip[@id='dashboard-tab-item5']
${tab_6}    xpath://mat-chip[@id='dashboard-tab-item6']
${tab_7}    xpath://mat-chip[@id='dashboard-tab-item7']
${widget_title_last3year_Incident_Category}    last3yearIncidentCategory
${widget_title_last5year_Incident_Category}    last5yearIncidentCategory
${widget_title_last4year_Incident_Category}    last4yearIncidentCategory
${widget_title_last2year_Incident_Category}    last2yearIncidentCategory
${widget_title_lastyear_Incident_Category}    lastyearIncidentCategory
${select_year_dropdown_2024}    css:div[class='mbsc-fr mbsc-material mbsc-fr-bubble options mbsc-sc mbsc-sel mbsc-sel-multi mbsc-fr-liq mbsc-fr-no-overlay mbsc-fr-pointer mbsc-no-touch mbsc-fr-nobtn'] div:nth-child(41)
${select_year_dropdown_2025}    css:div[class='mbsc-fr mbsc-material mbsc-fr-bubble options mbsc-sc mbsc-sel mbsc-sel-multi mbsc-fr-liq mbsc-fr-no-overlay mbsc-fr-pointer mbsc-no-touch mbsc-fr-nobtn'] div:nth-child(42)



${month_widget_title}    monthwidget
${quarter_widget_title}    quarterwidget
${week_widget_title}    weekwidget
${day_widget_title}    daywidget
${year_widget_title}    yearwidget


${last_3_year}    xpath://div[@data-val='3year']
${last_4_year}    xpath://div[@data-val='4year']
${last_5_year}    xpath://div[@data-val='5year']
${last_2_year}    xpath://div[@data-val='2year']
${last_year}      xpath://div[@data-val='1year']

${year}    xpath://div[@data-val='year']
${incident_category_option}    xpath://div[@data-val='incidentCategoryId']
${incident_dropdown_option}    xpath://div[text()='Incidents']
${task_dropdown_option}    xpath://div[text()='Task']
${month}    xpath://div[@data-val='month']
${quarter}    xpath://div[@data-val='quarter']
${week}    xpath://div[@data-val='week']
${day}    xpath://div[@data-val='day']
${year}    xpath://div[@data-val='year']
${select_year_dropdown}    xpath://input[@id='chartXAxisYear_dummy']
${Audit_review_option}    xpath://div[contains(@class,'mbsc-sc-itm') and contains(@class,'mbsc-btn-e')][1]
${Incident_Response_option}    xpath://div[contains(@class,'mbsc-sc-itm') and contains(@class,'mbsc-btn-e')][2]
${Operational_task_option}    xpath://div[contains(@class,'mbsc-sc-itm') and contains(@class,'mbsc-btn-e')][3]
${Dispatch_option}    xpath://div[contains(@class,'mbsc-sc-itm') and contains(@class,'mbsc-btn-e')][4]
${Cancelled_status}    xpath://div[contains(@class,'mbsc-sc-itm') and contains(@class,'mbsc-btn-e')][1]
${Completed_status}    xpath://div[contains(@class,'mbsc-sc-itm') and contains(@class,'mbsc-btn-e')][2]
${Pending_status}    xpath://div[contains(@class,'mbsc-sc-itm') and contains(@class,'mbsc-btn-e')][3]
${Unassigned_status}    xpath://div[contains(@class,'mbsc-sc-itm') and contains(@class,'mbsc-btn-e')][4]
${In_progress_status}    xpath://div[contains(@class,'mbsc-sc-itm') and contains(@class,'mbsc-btn-e')][5]


${compare_by_select_year_dropdown}    xpath://input[@id='chartCompareByYear_dummy']
${error_message_locator}    xpath://span[@class='mbsc-err-msg show']
${chart_type_error}     xpath://span[@id='lbl-chart-type-error']
${data_source_error_message}    xpath://span[@slot='error' and text()='Please select a data source']
${X_axis_error_message}    xpath://span[@slot='error' and text()='Please select x-axis ']
${X_axis_filter_error_message}    xpath://span[@slot='error' and text()='Please select x-axis filter value ']
${Compare_by_error_message}    xpath://span[@slot='error' and text()='Please select compare by ']
${select_comparisons_error_message}    xpath://span[@slot='error' and text()='Please select comparison ']
${widget_size_error_message}    xpath://span[@slot='error' and text()='Please select a widget size ']
${edit_widget_button}    xpath://button[@id='btn-edit']
${Region_ComparisonChart_selected_chart_type_value}    xpath://select[@id='chartType']/child::option
${selected_data_source_value}    xpath://select[@id='DataSource']/child::option
${widget_title_name}    xpath://h3[@class='m-portlet__head-text']
${selected_saved_filter}    xpath://span[@class='mbsc-textfield-tag mbsc-material mbsc-ltr']
${X_axis_value}    xpath://select[@id='chartXAxis']/child::option
${x_axis_filter_value}    xpath://select[@id='chartXAxisSelection']/child::option
${compare_by_filter_value}    xpath://select[@id='chartCompareBy']/child::option
${select_comparisons_value}    xpath://select[@id='chartCompareBySelection']/child::option
${select_year_dropdown_value}    xpath://select[@id='chartXAxisYear']/child::option
${more_tabs}    xpath://mat-chip[@id='chpUserDashboardMore']
${preview_notice_message}    xpath://p[@class='ng-star-inserted']
${add_widget_text_on_configs_section}    xpath://span[@class='mat-tooltip-trigger ng-star-inserted']
@{Months}
...    xpath://div[@data-val='January']
...    xpath://div[@data-val='February']
...    xpath://div[@data-val='March']
...    xpath://div[@data-val='April']
...    xpath://div[@data-val='May']

@{Quarters}
...    xpath://div[@data-val='Quarter 1']
...    xpath://div[@data-val='Quarter 2']

@{Days}
...    xpath://div[@data-val='Monday']
...    xpath://div[@data-val='Tuesday']
...    xpath://div[@data-val='Wednesday']
...    xpath://div[@data-val='Thursday']
...    xpath://div[@data-val='Friday']

@{Years}    
...    xpath://div[@data-val='2021']
...    xpath://div[@data-val='2022']
...    xpath://div[@data-val='2023']
...    xpath://div[@data-val='2024']
...    xpath://div[@data-val='2025']

@{Weeks}
...    xpath://div[@data-val='Week 1']
...    xpath://div[@data-val='Week 2']
...    xpath://div[@data-val='Week 3']
...    xpath://div[@data-val='Week 4']



