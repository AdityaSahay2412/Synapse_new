*** Variables ***

${URL}    https://analystuat.staging.zinc.systems/#/auth/login
${BROWSER}    chrome
${EMAIL_LOGIN}    aditya.sahay+694@zinc.systems
${PASSWORD}    Atlassian@2412


&{VALID_USERNAME}         uat=satish.kumar+694@zinc.systems     production=satish.kumar+702@zinc.systems
&{VALID_PASSWORD}         uat=584TuDqvDB&P$y                    production=x4$F+FA+r3R4b7


${LOCATOR_EMAIL}    id:email
${LOCATOR_PASSWORD}    id:password
${LOCATOR_LOGIN_BUTTON}    id:loginButton
${LOCATOR_APP_LOGO}    xpath://img[@id='app-logo']
${LOCATOR_ALLOW_LOCATION_BUTTON}    id:btn-allow-location
${LOCATOR_DASHBOARDS_HEADER}    xpath://h3[contains(text(), 'Dashboards')]

${LOCATOR_EVENTS_NAVBAR}    id:navbar-Events
${LOCATOR_ALL_RECORDS}    xpath://div[text()='All Records' and contains(@id,"left-panel-dynamic-page-title")]
${LOCATOR_EXPORT_CSV_BUTTON}    id:btn-export-csv
${LOCATOR_EXPORT_NOTIFICATION}    Your data is on its way, You will be notified when it has been generated. Please do not close application
${LOCATOR_EXPORT_COMPLETE}    Your data has been generated.
${LOCATOR_VIEW_BUTTON}    xpath://span[text()='View']
${LOCATOR_SAVED_REPORT}    xpath://h3[text()='Saved report']
${LOCATOR_TOTAL_ROW_COUNT}    xpath://div[@class='ag-status-name-value ag-status-panel ag-status-panel-total-row-count']//span[@ref="eValue"]

${LOCATOR_TASKS_NAVBAR}    id:navbar-Tasks
${LOCATOR_TASKS_PAGE_TITLE}    xpath://div[text()='Tasks' and contains(@id,'left-panel-dynamic-page-title')]

${LOCATOR_NOTIFICATIONS_NAVBAR}    id:navbar-Notifications

${LOCATOR_DASHBOARDS_NAVBAR}    id:navbar-Dashboards
${LOCATOR_DASHBOARD_TITLE}    xpath://div[@id='left-panel-dynamic-page-title4']
${TESTING_SUSPECT_LIST_WIDGET}    xpath://h3[contains(text(),'testing suspect')]
${TESTING_WITNESS_LIST_WIDGET}    xpath://h3[contains(text(),'testing witness')]
${TESTING_VICTIM_LIST_WIDGET}    xpath://h3[text()=' testing victim ']
${LOCATOR_TOGGLE_LIST_WIDGET_GRID_BUTTON}    id:btn-toggle-list-widget-grid

${LOCATOR_EXPORT_CSV_WIDGET_BUTTON_VICTIM}    xpath://*[contains(text(),'testing victim')]/../../..//li//button[@id='btn-export-csv']
${LOCATOR_EXPORT_CSV_WIDGET_BUTTON_WITNESS}    xpath://*[contains(text(),'testing witness')]/../../..//li//button[@id='btn-export-csv']
${LOCATOR_EXPORT_CSV_WIDGET_BUTTON_SUSPECT}    xpath://*[contains(text(),'testing suspect')]/../../..//li//button[@id='btn-export-csv']
${SELECT_TIMEFRAME_FILTER_BUTTON}   xpath://div[@id='filter-title']
${LAST_MONTH_TIMEFRAME_FILTER}    xpath://button[contains(.,'Last month')]
${TIMEFRAME_FILTER_APPLY_BUTTON}    xpath://button[@id='div-dynamicPages-time-filter-apply-btn']
${SELECT_DATE_RANGE_FILTER}    xpath://input[@id='select-date-range']
${FILTERED_LIST_WIDGET_NAME}    xpath://h3[text()=' filtered list widget ']
${OPEN_IN_PROGRESS_WIDGET}    xpath://h3[text()=' Open / In progress ']
${incident_widget_export_naming_convention}    xpath://span[@class='normal-text']
${task_widget_export_naming_convention}    xpath://span[@class='normal-text']
${task_export_date_and_time}    xpath://div[@class='ng-star-inserted']//span[@class='normal-text']/following-sibling::div
${DATA_SOURCE_INCIDENT_EXPORT_PAGE}    xpath://mat-form-field[@id='field-report-datasource']
${DATA_SOURCE_TASK_EXPORT_PAGE}     xpath://mat-form-field[@id='field-report-datasource']
${EXPORT_PAGE_BREADCRUMB}    xpath://div[@class='col-md-12 breadcrumbs']
${INCIDENT_EXPORT_DATE_COLUMN_HEADER}    xpath://span[@ref='eText'][normalize-space()='Date']
${INCIDENT_EXPORT_REFERENCE_COLUMN_HEADER}    xpath://span[@ref='eText'][normalize-space()='Reference']
${INCIDENT_EXPORT_CATEGORY_COLUMN_HEADER}    xpath://span[@ref='eText'][normalize-space()='Category']
${INCIDENT_EXPORT_OUTCOME_COLUMN_HEADER}    xpath://span[@ref='eText'][normalize-space()='Outcome']
${INCIDENT_EXPORT_TYPE_COLUMN_HEADER}    xpath://span[@ref='eText'][normalize-space()='Type']
${INCIDENT_EXPORT_PRIORITY_COLUMN_HEADER}     xpath://span[@ref='eText'][normalize-space()='Priority']
${INCIDENT_EXPORT_STATUS_COLUMN_HEADER}    xpath://span[@ref='eText'][normalize-space()='Status']
${INCIDENT_EXPORT_SCORE_COLUMN_HEADER}    xpath://span[@ref='eText'][normalize-space()='Score']
${INCIDENT_EXPORT_VENUE_COLUMN_HEADER}    xpath://span[@ref='eText'][normalize-space()='Venue']
${INCIDENT_EXPORT_REPORTED_BY_COLUMN_HEADER}    xpath://span[@ref='eText'][normalize-space()='Reported By']
${INCIDENT_EXPORT_ASSIGNED_TO_COLUMN_HEADER}    xpath://span[@ref='eText'][normalize-space()='Assigned To']
${INCIDENT_EXPORT_SEVERITY_COLUMN_HEADER}    xpath://span[@ref='eText'][normalize-space()='Severity']



${COLUMN_SELECTION_BUTTON}    xpath://span[text()='Columns']
${DATE_COLUMN_SELECTION_BUTTON}    xpath://span[@class='ag-column-select-column-label' and text()='Date']
${REFERENCE_COLUMN_SELECTION_BUTTON}    xpath://span[@class='ag-column-select-column-label' and text()='Reference']
${CATEGORY_COLUMN_SELECTION_BUTTON}    xpath://span[@class='ag-column-select-column-label' and text()='Category']
${OUTCOME_COLUMN_SELECTION_BUTTON}    xpath://span[@class='ag-column-select-column-label' and text()='Outcome']
${TYPE_COLUMN_SELECTION_BUTTON}    xpath://span[@class='ag-column-select-column-label' and text()='Type']
${PRIORITY_COLUMN_SELECTION_BUTTON}    xpath://span[@class='ag-column-select-column-label' and text()='Priority']
${INCIDENT_WIDGET_EXPORT_FIRST_ROW}    xpath://div[@row-id='0']
${TASK_WIDGET_EXPORT_FIRST_ROW}    xpath://div[@row-id='0']
#${expected_query_filter_row_count_value}    xpath://span[@ref='lbRecordCount']
${INCIDENT_OUTCOME_DATA}     xpath://*[@id="myGrid"]/div/div[2]/div[2]/div[4]/div[1]/div[2]/div/div[1]/div[2]/zs-aggrid-cell-render-data/div



#Tasks locators
${TASKS_PAGE_Task_WIDGET}    xpath://h3[contains(.,'tasks')] 
${Add query}      xpath://mat-chip[@id='add-query']
${SELECT_SAVED_FILTER}    xpath://input[@placeholder='Select saved filter'] 
${SEARCH_SELECT_SAVED_FILTER}    xpath://input[@placeholder='Search']
${SAVED_FILTER_SELECTED_OPTION}    xpath://*[@class='zd-select-option']
${SAVE_AND_RUN_BUTTON}    xpath://button[@id='btn-slide-out-run-save-confirm']
${OVERWRITE_BUTTON}    xpath://button[text()='Overwrite']    
${APPLIED_QUERY_CHIP}     xpath://mat-chip[@id='rule-0']
${EXPORTED_TASK_ROW_COUNT}    xpath://div[@class='ag-status-name-value ag-status-panel ag-status-panel-total-row-count']//span[@ref="eValue"]
${OVERDUE_QUERY_CHIP}    xpath://mat-chip[@id='query-0']
${TASK_REFERENCE_WIDGET_HEADER}     xpath://span[contains(@ref,'eText')][normalize-space()='Task Reference'] 
${TASK_WIDGET_ROW_COUNT}    xpath://span[@ref='lbRecordCount']
${OVERDUE_TASK_WIDGET_ROW_COUNT}    xpath://span[@ref='lbRecordCount']      #will delete this later
${TASK_REFERENCE_EXPORT_PAGE_COLUMN_HEADER}    xpath://span[@ref='eText'][text()='Task Reference']
${TASK_TITLE_EXPORT_PAGE_COLUMN_HEADER}    xpath://span[@ref='eText'][text()='Task Title']
${TASK_TYPE_EXPORT_PAGE_COLUMN_HEADER}    xpath://span[@ref='eText'][text()='Task Type']
${ASSIGNED_TO_EXPORT_PAGE_COLUMN_HEADER}    xpath://span[@ref='eText'][text()='Assigned To']
${CREATED_BY_EXPORT_PAGE_COLUMN_HEADER}    xpath://span[@ref='eText'][text()='Created By']
${CREATED_DATE_AND_TIME_EXPORT_PAGE_COLUMN_HEADER}    xpath://span[@ref='eText'][text()='Created Date & Time']
${DUE_DATE_AND_TIME_EXPORT_PAGE_COLUMN_HEADER}    xpath://span[@ref='eText'][text()='Due Date & Time']
${TASK_REFERENCE_CHECKBOX}    xpath://span[@class='ag-column-select-column-label' and text()='Task Reference']
${TASK_TITLE_CHECKBOX}    xpath://span[@class='ag-column-select-column-label' and text()='Task Title']
${TASK_TYPE_CHECKBOX}      xpath://span[@class='ag-column-select-column-label' and text()='Task Type']
${ASSIGNED_TO_CHECKBOX}    xpath://span[@class='ag-column-select-column-label' and text()='Assigned To']
${EVENT_REFERENCE_EXPORT_PAGE_COLUMN_HEADER}    xpath://span[@ref='eText'][text()='Event Reference']
${CREATED_BY_CHECKBOX}    xpath://span[@class='ag-column-select-column-label' and text()='Created By']   
${TEAMS_EXPORT_PAGE_COLUMN_HEADER}    xpath://span[@ref='eText'][text()='Teams']
${TASK_STATUS_EXPORT_PAGE_COLUMN_HEADER}     xpath://span[@ref='eText'][text()='Task Status']
${EDIT_BUTTON_LIST_WIDGET}    xpath://button[@id='btn-list-action-edit']
${COLUMN_TOOLBOX}    xpath://span[.='Columns']
${THREE_DOTS_ON_EXPORT_PAGE}    xpath://button[@id='report-item-menu']
${DELETE_REPORT_BUTTON}    xpath://button[@id='btn-report-item-menu-delete']
${DELETE_DIALOG_BOX}    xpath://mat-dialog-container[@role='dialog']
${DIALOG_BOX_DELETE_BUTTON}    xpath://zd-button[@id='btn-delete-confirmation']

       
#notifications variables
${NOTIFICATIONS_MODULE}    xpath://a[@id='navbar-Notifications']
${NOTIFICATIONS_LIST_WIDGET}    xpath://h3[@class='m-portlet__head-text']
${INCIDENT_REFERENCE_NUMBER_ON_INCIDENT_DETAIL_PAGE}    xpath://h3[@class='ng-star-inserted']
${NEWLY_ADDED_INCIDENT_REFERENCE_ON_NOTIFICATIONS_WIDGET}     xpath:(//div[@class='mat-tooltip-trigger ng-star-inserted'])[1]
${NOTIFICATION_EXPORT_DATE_AND_TIME_COLUMN_HEADER}    xpath://span[@ref='eText' and text()='Date & Time'] 
${NOTIFICATION_EXPORT_EVENT_REFERENCE_COLUMN_HEADER}    xpath://span[@ref='eText' and text()='Event Reference']
${NOTIFICATION_EXPORT_SUBJECT_COLUMN_HEADER}    xpath://span[@ref='eText' and text()='Subject']
${NOTIFICATION_EXPORT_DATE_AND_TIME_COLUMN_CHECKBOX}    xpath://span[@class='ag-column-select-column-label' and text()='Date & Time']
${NOTIFICATION_EXPORT_REFERENCE_COLUMN_HEADER}    xpath://span[@ref='eText' and text()='Reference']
${NOTIFICATION_EXPORT_EVENT_REFERENCE_COLUMN_CHECKBOX}    xpath://span[@class='ag-column-select-column-label' and text()='Event Reference']
${NOTIFICATION_EXPORT_TYPE_COLUMN_HEADER}    xpath://span[@ref='eText' and text()='Type']
${DATA_SOURCE_NOTIFICATION_EXPORT_PAGE}    xpath://mat-form-field[@id='field-report-datasource']
${ROW_COUNT}    xpath://span[@ref='lbRecordCount']
${NOTIFICATION_EXPORT_DATA_COUNT}    xpath://div[@class='ag-status-name-value ag-status-panel ag-status-panel-total-row-count']//span[@ref="eValue"]
${NOTIFICATION_LIST_WIDGET_DATE_AND_TIME_CHECKBOX}    xpath://span[@class='ag-column-select-column-label' and text()='Date & Time']
${NOTIFICATION_LIST_WIDGET_EVENT_REFERENCE_CHECKBOX}    xpath://span[@class='ag-column-select-column-label' and text()='Event Reference']
${NOTIFICATION_LIST_WIDGET_SUBJECT_CHECKBOX}    xpath://span[@class='ag-column-select-column-label' and text()='Subject']
${notification_export_date_and_time}    xpath://div[@class='ng-star-inserted']//span[@class='normal-text']/following-sibling::div
${notification_widget_export_naming_convention}    xpath://span[@class='normal-text']
${DATE_AND_TIME_COLUMN_FILTERING_BUTTON}    xpath://div[@class='ag-header-cell ag-floating-filter ag-focus-managed ag-column-first']//span[@role='presentation']
${DATE_AND_TIME_SELECTION_FIRST_BOX}    xpath:(//input[@placeholder='yyyy-mm-dd'])[1]
${FIRST_DATE}    09122024
${SECOND_DATE}    09192024
${DATE_AND_TIME_SELECTION_SECOND_BOX}    xpath:(//input[@placeholder='yyyy-mm-dd'])[2]
${APPLY_BUTTON}    xpath://button[@ref='applyFilterButton']
${date_and_time_column_filtered_row_count}    xpath://span[@ref='lbRecordCount']
${EXPORTED_NOTIFICATION_ROW_COUNT}    xpath://div[@class='ag-status-name-value ag-status-panel ag-status-panel-total-row-count']//span[@ref="eValue"]
${MAX_VISIBLE_ROWS}    40