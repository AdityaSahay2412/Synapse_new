*** Variables ***
# Credentials
${env}                    uat
#&{VALID_USERNAME}         uat=satish.kumar+694@zinc.systems     production=matt.loveday+ssanalyst@zinc.systems
&{VALID_USERNAME}         uat=satish.kumar+694@zinc.systems     production=satish.kumar+702@zinc.systems
&{VALID_PASSWORD}         uat=584TuDqvDB&P$y                    production=x4$F+FA+r3R4b7
#&{VALID_PASSWORD}         uat=584TuDqvDB&P$y                    production=v*9&h8qSvBM%0J
&{LOGGED_IN_USERNAME}     uat=Satish Kumar                      production=Satish Kumar
#&{LOGGED_IN_USERNAME}     uat=Satish Kumar                      production=Matt Loveday
&{NEW_ASSIGNE}            uat=Vaishakh                          production=Vaishakh
#${VALID_USERNAME}         satish.kumar+658@zinc.systems
#${VALID_PASSWORD}         &4Z4UjUB8M!
${INVALID_USERNAME}       satish.kumar+658@zinc.syst
${INVALID_PASSWORD}       fsfbD#zn@vP1C9Gl
${BROWSER}                chrome
${HEADLESS}               False
${USE_PYGTK}              False      # used to import ScreenCapLibrary for recording testcases based on local run or jenkins run
${DOWNLOAD_PATH}          ${EXECDIR}${/}Downloads
${GENERATE_WAIT_TIME}     300
${CHECK_INTERVAL}         5
${DOWNLOAD_WAIT_TIME}     60

# URLs
&{LOGIN_PAGE_URL}       uat=https://analystuat.staging.zinc.systems/#/auth/login            production=https://analyst.zinc.systems/#/auth/login
&{DASHBOARD_PAGE_URL}   uat=https://analystuat.staging.zinc.systems/#/analyst/dashboard     production=https://analyst.zinc.systems/#/analyst/dashboard
#${LOGIN_PAGE_URL}       https://analyst.staging.zinc.systems/#/auth/login
#${DASHBOARD_PAGE_URL}   https://analyst.staging.zinc.systems/#/analyst/dashboard

# Login Page Locators
${LOGO_IMAGE}           xpath=//img[@alt="Synapse Logo"]
${HEADER_TEXT}          xpath=//h3[@translate="AUTH.LOGIN.TITLE"]
${USERNAME_FIELD}       id=email
${PASSWORD_FIELD}       id=password
${FORGOT_PASSWORD_BUTTON}  id=btn-forgot-password
${LOGIN_BUTTON}            id=loginButton
${HOME_BUTTON}                  xpath=//img[@id='app-logo']
${ALLOW_BUTTON}                 id=btn-allow-location
${DISCARD_BUTTON}               xpath=//button[normalize-space()='Discard']

# Home Page Locators Aditya
${APP_LOGO}            xpath=//img[@id='app-logo']
${ADD_BUTTON}          xpath=//button[@id='btn-quick-add']
${SEARCH_MODULE}       id=navbar-Search
${DASHBOARDS_MODULE}   id=navbar-Dashboards
${EVENTS_MODULE}       id=navbar-Events
${TASKS_MODULE}        id=navbar-Tasks
${VERIFY_MODULE}       id=navbar-patrol-management
${NOTIFICATIONS_MODULE}   id=navbar-Notifications
${LOCATIONS_MODULE}       id=navbar-Locations
${DATA_MODULE}            id=navbar-Data
${MY_PROFILE_MODULE}      id=profile-view
${LOGOUT_OPTION}          id=btn-logout


# Dashboard Page Locators
${DASHBOARD_HEADER}      xpath=//h3[contains(text(), 'Dashboards')]
${DASHBOARD_HAMBUGER_BUTTON}      id=btn-hambuger
${DASHBOARD_ADD_PAGE_BUTTON}      xpath=//button[@id='btn-add-page']
${DASHBOARD_FILTER_LIST}      id=left-panel-search-box
${DASHBOARD_PAGES_NAME}      xpath=//i/following-sibling::div[contains(@id,'dynamic-page-title')]
${DASHBOARD_PAGE_MENU}      id=dashboard-collection-item-menu
${SELECTED_DASHBOARD_TITLE}      xpath=//h1[@id='dashboard-title']
${SELECTED_DASHBOARD_DESCRIPTION}      id=dynamic-page-description
${DASHBOARD_SELECT_TIMEFRAME_DROPDOWN}      id=filter-title
${DASHBOARD_FILTER_BUTTON}      xpath=//button[@id='btn-dynamicPages-filter']/span/i
${DASHBOARD_REFRESH_BUTTON}      xpath=//button[@id='btn-dynamicPages-refresh']/span/i
${DASHBOARD_SHARE_BUTTON}      id=btn-dynamicPages-share
${DASHBOARD_3DOTS_BUTTON}      id=btn-dynamicPages-screen
${DASHBOARD_TABS_NAME}                xpath=//*[contains(@id,"dashboard-tab-item")]//following-sibling::span
${DASHBOARD_ADD_PAGE_TITLE}      xpath=//*[@class='slide-out-form-title']/h2/span[text()='Add Page']
${DASHBOARD_NAME_FIELD}      id=txt-page-or-tab-title
${DASHBOARD_DESCRIPTION_FIELD}      id=txt-page-or-tab-description
${DASHBOARD_ICON_FIELD}      xpath=//div[@id='add-page-icon-container']/div
${DASHBOARD_ICON_SEARCH_BOX}      id=txt-add-page-icon-search-box
${DASHBOARD_ICON_RESULT_ITEM}      id=icon-collection-item-1
${DASHBOARD_CLOSE_BUTTON}      id=btn-slide-out-close
${DASHBOARD_SAVE_BUTTON}      id=btn-slide-out-confirm
${DASHBOARD_PAGE1_NAME}      xpath=//div[@class='cdk-drag left-panel-list-item ng-star-inserted left-panel-list-item-selected']/div
${DASHBOARD_TAB1_NAME}      xpath=//mat-chip[@id='dashboard-tab-item1']/span
${DASHBOARD_EDIT_PAGE_OPTION}      id=dashboard-collection-item-menu-edit
${DASHBOARD_DELETE_PAGE_OPTION}      id=dashboard-collection-item-menu-delete
${DASHBOARD_DELETE_CONFIRMATION}      xpath=//div[@class='col-md-12 text-center confirmation-title']
${DASHBOARD_DELETE_CONFIRM}      id=btn-delete-confirmation
${DASHBOARD_DELETE_CANCEL}      id=btn-cancel-confirmation

${DASHBOARD_ADD_WIDGET_BUTTON}      xpath=//button[@id='add-widget-btn']/span/span
${DASHBOARD_LIST_WIDGET_OPTION}      id=widget-ag-grid
${DASHBOARD_TEXT_WIDGET_OPTION}      id=widget-text
${DASHBOARD_COUNT_WIDGET_OPTION}     id=widget-count
${DASHBOARD_MAP_WIDGET_OPTION}       id=widget-map
${DASHBOARD_CHART_WIDGET_OPTION}     id=widget-chart
${DASHBOARD_ADD_WIDGET_SLIDEOUT}     xpath=//*[text()=' Add Widget']
${DASHBOARD_WIDGET_TYPE_SELECTED}    xpath=//select[@id="select-widget-type"]/option
${DASHBOARD_WIDGET_TITLE_FIELD}      id=widgetTitle
${DASHBOARD_DATA_SOURCE}             id=DataSource_dummy
${DASHBOARD_WIDGET_SIZE}             id=widgetSize_dummy
${DASHBOARD_INCIDENTS_OPTION}        xpath=//div[@role='option' and text()='Incidents']
${DASHBOARD_100_WIDGET_SIZE}         xpath=//div[@role='option' and text()='Extra Large (100%)']
${DASHBOARD_FIRST_NEXT_BUTTON}       id=btnStepFirst
${DASHBOARD_SECOND_NEXT_BUTTON}      id=btnStepTwo
${DASHBOARD_BACK_BUTTON}             id=btn-incident-final-configuration
${DASHBOARD_SUBMIT_BUTTON}           id=btnSubmit
${DASHBOARD_SAVE_BUTTON}             id=btn-slide-out-confirm
${DASHBOARD_QUERY_BUILDER_TOGGLE}    xpath=//label[@id='queryBuilder']/span
${DASHBOARD_EDIT_WIDGET_SLIDEOUT}    xpath=//*[text()=' EDIT Widget']ta
${DASHBOARD_SLIDEOUT_TITLE}    xpath=//h3[@class="right-panel-title"]/span
${DASHBOARD_ADD_FILTER_BUTTON}    id=add-query

# Events Page Locators
${ADD_EVENT_BUTTON}         xpath=//button[@id='btn-quick-add']
${ADD_NEW_EVENT_OPTION}     id=btn-incident-add--new
${NEW_EVENT_BREADCRUMBS}         xpath=//p[contains(text(),'New Event')]
${EVENT_HEADER}             xpath=//h2[text()='Event']
${REPORT_STAGE_TITLE}       xpath=//span[@class="workflow-stage-title" and text()='Report']
${REPORT_STAGE_COUNT}       xpath=//span[@class="zd-workflow-stages-count" and text()='1 of 5']
${REPORT_STEP_TITLE}        xpath=//button[@class="workflow-step-title" and text()='Reporter']
${REPORT_STEP_COUNT}        xpath=//span[@class="workflow-stage-mandatory" and text()='1 of 4']
${LOCATION_STEP_TITLE}        xpath=//button[@class="workflow-step-title" and text()='Location']
${LOCATION_STEP_COUNT}        xpath=//span[@class="workflow-stage-mandatory" and text()='0 of 1']
${CATEGORISATION_GROUP_TITLE}  xpath=//h2[@class="question-group-title" and text()='Categorisation']
${CATEGORY_LABEL}     xpath=//label[text()='Category']
${CATEGORY_DROPDOWN}  xpath=//input[contains(@id,'qincident-category')]
${SUBCATEGORY_LABEL}     xpath=//label[text()='Sub-Category']
${SUBCATEGORY_DROPDOWN}  xpath=//input[contains(@id,'qincident-outcome')]
${TYPE_LABEL}     xpath=//label[text()='Type']
${DATETIME_GROUP_TITLE}  xpath=//h2[@class="question-group-title" and text()='Date / Time']
${DATETIME_OF_EVENT_LABEL}     xpath=//*[@label="Date and time of the event"]//input
${DATETIME_OF_EVENT_DROPDOWN}     xpath=//input[contains(@id,'qtime-incident')]
${REPORTED_BY_TITLE}  xpath=//h2[@class="question-group-title" and text()='Reported By']
${LOGGED_BY_LABEL}     xpath=//label[text()='Logged by']
${WHO_IS_REPORTER_LABEL}     xpath=//label[text()='Who is the reporter?']
${IM_REPORTER_OPTION}     xpath=//span[@title="I am the reporter"]
${INTERNAL_OPTION}     xpath=//span[@title="Internal"]
${EXTERNAL_OPTION}     xpath=//span[@title="External / Contractor"]
${MEMBER_OPTION}     xpath=//span[@title="Member of the Public"]
${NEXT_BUTTON}     xpath=//button[text()='Next']
${ALARM_ACTIVATIONS_OPTION}     xpath=//div[@role='option' and text()='Alarm Activations']
${SAVE_BUTTON}     id=incident-workflow-save-as-draft
${INVESTIGATE_STAGE_TITLE}       xpath=//span[@class="workflow-stage-title" and text()='Investigate']
${INVESTIGATE_STAGE_COUNT}       xpath=//span[@class="zd-workflow-stages-count" and text()='0 of 1']
${DETAILS_STEP_TITLE}        xpath=//button[@class="workflow-step-title" and text()='Details']
${LOCATION_TITLE}     xpath=//h2[@class="question-group-title" and text()='Location']
${SELECT_EVENT_LOCATION_LABEL}     xpath=//label[text()='Select event location']
${LOCATE_HEADER}     xpath=//div[text()=' Locate']
${LOCATE_ICON}       xpath=//zd-toolbar-button[@title='Locate']
${ADD_HEADER}        xpath=//div[text()=' Add']
${ADD_LOCATION_ICON}  xpath=//zd-toolbar-button[@title='Add Location']
${ZOOM_HEADER}     xpath=//div[text()=' Zoom']
${ZOOM_IN_ICON}      xpath=//zd-toolbar-button[@title='Zoom In']
${ZOOM_OUT_ICON}     xpath=//zd-toolbar-button[@title='Zoom Out']
${TOOLS_HEADER}      xpath=//div[text()=' Tools']
${MAP_BUTTON}      xpath=//button[text()='Map']
${SATELLITE_BUTTON}      xpath=//button[text()='Satellite']
${EXPORT_ICON}       xpath=//zd-toolbar-button[@title='MAP.EXPORT']
${FULL_SCREEN_ICON}  xpath=//zd-toolbar-button[@title='Full Screen']
${CHOOSE_LOCATION_OPTION}  xpath=//li[text()='Choose location']
${LOCATE_ME_OPTION}  xpath=//li[text()='Locate Me']
${MY_CURRENT_LOCATION_OPTION}  xpath=//*[text()='My Current Location']
${SEARCH_LOCATION}  id=txt-location-search
${PREVIOUSLY_REPORTED_LOCATIONS}  xpath=//ul[@id="existing-places-results"]/li
${MY_CURRENT_LOCATION_NAME}  id=txt-new-location-name
${CLEAR_MY_CURRENT_LOCATION}  id=location-search-clear
${ADDRESS_LINE1}  id=txt-new-location-address-line-1
${ADDRESS_LINE2}  id=txt-new-location-address-line-2
${ADDRESS_LINE3}  id=txt-new-location-address-line-3
${CITY}  id=txt-new-location-city

#   Events Page Locators Aditya
${POSTCODE}  id=txt-new-location-postcode
${COUNTRY}  xpath=//span[text()='Country']
${REGION}  xpath=//span[text()='Region']
${AREA}  xpath=//span[text()='Area']           #cannot find
${LATITUDE}  id=txt-new-location-latitude
${LONGITUDE}  id=txt-new-location-longitude
${NEW_LOCATION_OPTION}  xpath=//li[text()='New location']       #this can also be written as //li[@id='lst-maps-new-location'] or just id
${PLEASE_SELECT_LOCATION_DROPDOWN}  id=select-location-dropdown == //span[text()='Please Select Location']
${MAPS_COLLAPSE_ICON}  id=icon-maps-collapse   #cannot find
${MY_LOCATION_CHIP}     xpath=//SPAN[text()='My Location']  #cannot find,there is my current location
${LOCATION_CLEAR_ICON}     xpath=//SPAN[@class="mbsc-textfield-tag-clear mbsc-icon mbsc-material"] == //span[@id="location-search-clear"]
${PREVIOUS_BUTTON}     id=incident-workflow-previous
${GOOGLE_LOGO}     xpath=//img[@alt="Google"]
${SPECIFIC_DETAILS_GROUP_TITLE}  xpath=//h2[@class="question-group-title" and text()='Specific Details']
${DESCRIBE_SPECIFIC_LOCATION_LABEL}     xpath=//label[text()='Describe the specific location']
${DESCRIBE_SPECIFIC_LOCATION_TEXTBOX}  xpath=//input[@id='qa422397d-bad9-4450-89e0-04419b6b2946_0_a422397d-bad9-4450-89e0-04419b6b2946']
${REPORTER_STEP_TICKMARK}  xpath=//button[text()='Reporter']//following-sibling::i
${LOCATION_STEP_TICKMARK}  xpath=//button[text()='Location']//following-sibling::i
${DETAILS_STEP_TICKMARK}  xpath=//button[text()='Details']//following-sibling::i
${INVOLVED_ENTITIES_TITLE}        xpath=//button[@class="workflow-step-title" and text()='Involved Entities']
${ASSESSMENT_TITLE}        xpath=//button[@class="workflow-step-title" and text()='Assessment']
${ASSOCIATED_WITH_GROUP_TITLE}  xpath=//h2[@class="question-group-title" and text()='Associated With']
${ADD_PEOPLE_TO_INCIDENT_LABEL}     xpath=//label[text()='Do you want to add people to this incident?']
${PEOPLE_YES_OPTION}     xpath=//*[@label="Do you want to add people to this incident?"]//span[text()='Yes']//parent::p/input
${PEOPLE_NO_OPTION}     xpath=//*[@label="Do you want to add people to this incident?"]//span[text()='No']//parent::p/input
${INVOLVED_ENTITIES_STEP_TICKMARK}  xpath=//button[text()='Involved Entities']//following-sibling::i
${SUBMIT_BUTTON}     xpath=//button[text()='Submit']
${UPLOAD_ICON}     id=action-upload
${EVENT_SUBMIT_CONFIRMATION_POPUP}  xpath=//div/div[text()=' You are about to submit this event. Are you sure you wish to proceed? ']
${CANCEL_BUTTON}               id=btn-confirmation-cancel
${PROCEED_BUTTON}               id=btn-confirmation-yes
${EVENT_ID}               id=incidentID
${ADD_COST_TO_INCIDENT_LABEL}     xpath=//label[text()='Would you like to add any costs?']
${COST_YES_OPTION}     xpath=//*[@label="Would you like to add any costs?"]//span[text()='Yes']//parent::p/input
${COST_NO_OPTION}      xpath=//*[@label="Would you like to add any costs?"]//span[text()='No']//parent::p/input

#Event detail page Aditya
${HAMBURGER_BUTTON}   id=btn-hambuger
${EVENT_NUMBER}       xpath=//h3[@class="ng-star-inserted"]
${EVENT_FILTER_LIST}      id=left-panel-search-box
${EVENT_OVERVIEW_MODULE}      xpath=//div[text()='Overview']/preceding-sibling::i
${EVENT_LOCATIONS_MODULE}      xpath=//div[text()='Locations']/preceding-sibling::i
${EVENT_INVOLVED_ENTITIES_MODULE}      xpath=//div[text()='Involved Entities']/preceding-sibling::i
${EVENT_FILES_MODULE}      xpath=//div[text()='Files']/preceding-sibling::i
${EVENT_TASKS_MODULE}      xpath=//div[text()='Tasks']/preceding-sibling::i
${EVENT_RESPONSES_MODULE}      xpath=//div[text()='Responses']/preceding-sibling::i
${EVENT_LINKED_REPORTS_MODULE}      xpath=//div[text()='Linked Reports']/preceding-sibling::i
${EVENT_NOTIFICATIONS_MODULE}      xpath=//div[text()='Notifications']/preceding-sibling::i
${EVENT_HOME_BREADCRUMB}      xpath=//p[text()='Home']
${EVENT_EVENTS_BREADCRUMB}      xpath=//p[text()='Events']
${EVENT_ID_BREADCRUMB}      xpath=//div[@class="col-md-12 breadcrumbs"]/p[3]
${EVENT_DATE_TIME_FIELD}      xpath=//div[@id="event-date-time" and contains(text(),'Date and time of the event:')]
${EVENT_LAST_UPDATED_FIELD}   xpath=//div[@class="last-updated-time ng-star-inserted" and contains(text(),'Last updated:')]
${EVENT_STATUS_FIELD}      xpath=//span[text()='Status:']
${EVENT_STATUS_VALUE}      xpath=//span[text()='Status:']/following-sibling::span
${EVENT_SEVERITY_FIELD}    xpath=//span[text()='Severity:']
${EVENT_SEVERITY_VALUE}    xpath=//span[text()='Severity:']/following-sibling::span
${EVENT_PRIORITY_FIELD}    xpath=//span[text()='Priority:']
${EVENT_PRIORITY_VALUE}    xpath=//span[text()='Priority:']/following-sibling::span
${EVENT_ASSIGNED_TO_FIELD}    xpath=//span[text()='Assigned to:']
${EVENT_ASSIGNED_TO_VALUE}    xpath=//span[text()='Assigned to:']/following-sibling::span
${EVENT_SUMMARY_TAB}    xpath=//span[text()='Summary']
${EVENT_REPORT_TAB}    xpath=//span[text()='Report']
${EVENT_INVESTIGATE_TAB}    xpath=//span[text()='Investigate']
${EVENT_ANALYSE_TAB}    xpath=//span[text()='Analyse']
${EVENT_LINK_RESOURCES_BUTTON}    id=action-link
${EVENT_REFRESH_BUTTON}    id=action-refresh
${EVENT_EDIT_BUTTON}    id=action-edit
${EVENT_MEDIA_UPLOAD_BUTTON}     id=action-upload
${EVENT_3DOTS_BUTTON}      id=btn-dynamicPages-screen
${EVENT_LOCATION_WIDGET}      xpath=//h3[text()=' Location ']
${EVENT_SUMMARY_WIDGET}      xpath=//h3[text()=' Summary ']
${EVENT_WRITTEN_SUMMARY_WIDGET}      xpath=//h3[text()=' Written Summary ']
${EVENT_PINNED_LOCATION}      xpath=//img[@src='https://maps.gstatic.com/mapfiles/transparent.png']
${EVENT_SEARCH_LOCATION_BOX}      xpath=//*[@id='searchbox-container']
${EVENT_SEARCH_LABEL}      xpath=//*[text()=' Search']
${SUMMARY_CATEGORY_LABEL}      xpath=//strong[contains(text(),'Category:')]
${SUMMARY_OUTCOME_LABEL}      xpath=//strong[contains(text(),'Outcome:')]
${SUMMARY_TYPE_LABEL}          xpath=//strong[contains(text(),'Type:')]
${SUMMARY_STATUS_LABEL}     xpath=//strong[contains(text(),'Status')]
${SUMMARY_STATUS_VALUE}     xpath=//strong[contains(text(),'Status')]/parent::p
${SUMMARY_PRIORITY_LABEL}   xpath=//strong[contains(text(),'Priority')]
${SUMMARY_PRIORITY_VALUE}   xpath=//strong[contains(text(),'Priority')]/parent::p
${SUMMARY_SEVERITY_LABEL}   xpath=//strong[contains(text(),'Severity')]
${SUMMARY_SEVERITY_VALUE}   xpath=//strong[contains(text(),'Severity')]/parent::p
${SUMMARY_REPORT_DATE_TIME_LABEL}   xpath=//strong[contains(text(),'Report date & time:')]
${SUMMARY_REPORT_DATE_TIME_VALUE}   xpath=//strong[contains(text(),'Report date & time:')]/parent::p
${SUMMARY_CREATED_DATE_TIME_LABEL}   xpath=//strong[contains(text(),'Created date & time :')]
${SUMMARY_CREATED_DATE_TIME_VALUE}   xpath=//strong[contains(text(),'Created date & time :')]/parent::p
${SUMMARY_REPORTED_BY_LABEL}   xpath=//strong[contains(text(),'Reported by:')]
${SUMMARY_REPORTED_BY_VALUE}   xpath=//strong[contains(text(),'Reported by:')]/parent::p
${SUMMARY_ASSIGNED_TO_LABEL}   xpath=//strong[contains(text(),'Currently assigned to:')]
${SUMMARY_ASSIGNED_TO_VALUE}   xpath=//strong[contains(text(),'Currently assigned to:')]/parent::p
${SUMMARY_WRITTEN_SUMMARY_LABEL}   xpath=//b[text()='Written summary']
${SUMMARY_WRITTEN_SUMMARY_VALUE}   xpath=//b[text()='Written summary']//parent::td/following-sibling::td    #done


#Add cost Slideout form
${ADD_COST_SLIDEOUT_TITLE}   xpath=//h2/span[text()='Add Cost']
${EDIT_COST_SLIDEOUT_TITLE}   xpath=//h2/span[text()='Edit Cost']
${HOW_MANY_PRODUCTS_QUESTIONS}   xpath=//div/label[text()='How many products are you adding?']
${PRODUCT_COUNT_DECREMENT}   id=decrement-nbr-count-product-theft
${PRODUCT_COUNT}   id=nbr-count-product-theft
${PRODUCT_COUNT_INCREMENT}   id=increment-nbr-count-product-theft
${TOTAL_AMOUNT}   id=span-product-total-amount
${TOTAL_RECOVERED}   xpath=//div/span[contains(text(),'Recovered ')]
${TOTAL_DAMAGED}   xpath=//div/span[@class="mat-tooltip-trigger product-summary-amount" and contains(text(),'Damaged')]
${COST_CANCEL_BUTTON}      id=btn-slide-out-close
${COST_CONFIRM_BUTTON}      id=btn-slide-out-confirm
${COST_CATEGORY_DROPDOWN}  xpath=//input[@id='slct-product-category-0input' and @placeholder='Category']
${COST_BRAND_TEXT_BOX}  xpath=//*[contains(@id,'txt-product-brand')]
${COST_NAME_TEXT_BOX}   xpath=//*[contains(@id,'txt-product-name')]
${COST_CODE_TEXT_BOX}   xpath=//*[contains(@id,'txt-product-code')]
${COST_VALUE_TEXT_BOX}  xpath=//*[contains(@id,'txt-product-value')]
${COST_QUANTITY_TEXT_BOX}  xpath=//*[contains(@id,'txt-product-quantity')]
${COST_RECOVERED_TEXT_BOX}  xpath=//*[contains(@id,'txt-product-recovered')]
${COST_DAMAGED_TEXT_BOX}  xpath=//*[contains(@id,'txt-product-damaged')]
${COST_REMOVE_BUTTON}  xpath=//*[contains(@id,'spn-product-remove')]
${COST_COPY_BUTTON}  xpath=//*[contains(@id,'spn-product-copy')]
${COST_SUBTOTAL_LABEL}  xpath=//span[contains(text(),'Sub total ')]
${COST_SUBTOTAL_VALUE}  xpath=//span[contains(text(),'Sub total ')]/following-sibling::span
${COST_SUB_RECOVERED_VALUE}  xpath=//span[contains(text(),'Recovered')]/following-sibling::span[contains(@id,'span-product-individual-recovered-cost')]
${COST_SUB_DAMAGED_VALUE}  xpath=//span[contains(text(),'Damaged')]/following-sibling::span[contains(@id,'span-product-individual-damaged-cost')]
${SURE_TO_EXIT_POPUP}  xpath=//div[text()=' Are you sure you wish to exit? ']
${UNSAVED_CHANGES_MESSAGE}  xpath=//div[text()=' If you choose to leave now all unsaved changes will be lost ']
${YES_LEAVE_OPTION}  xpath=//button[text()='Yes, Leave']
${NO_STAY_OPTION}  xpath=//button[text()='No, Stay']
${COST_CATEGORY_OPTIONS}  xpath=//*[@class='zd-select-option']
${COST_DETAIL_CONTAINER}  xpath=//div[@class="mbsc-col-sm-12 mbsc-col-md-8 cost-detail-container p-0"]
${TOTAL_COST_AMOUNT_IN_WORKFLOW}  xpath=//h1[@class="total-cost"]
${TOTAL_RECOVERED_COST_AMOUNT_IN_WORKFLOW}  xpath=//div[@class="total-sum product-details p-0"]/span[contains(text(),'Recovered')]
${TOTAL_DAMAGED_COST_AMOUNT_IN_WORKFLOW}  xpath=//div[@class="total-sum product-details p-0"]/span[contains(text(),'Damaged')]
${COST_EDIT_BUTTON_IN_WORKFLOW}  xpath=//div[contains(@class,"edit-product-btn")]/i
${COST_CATEGORY_IN_WORKFLOW}  xpath=//input[@placeholder='Category']
${COST_BRAND_IN_WORKFLOW}  xpath=//*[contains(@id,'product-brand')]
${COST_NAME_IN_WORKFLOW}  xpath=//*[contains(@id,'product-name')]
${COST_CODE_IN_WORKFLOW}  xpath=//*[contains(@id,'product-code')]
${COST_VALUE_IN_WORKFLOW}  xpath=//*[contains(@id,'product-value')]
${COST_QUANTITY_IN_WORKFLOW}  xpath=//*[contains(@id,'product-quantity')]
${COST_RECOVERED_IN_WORKFLOW}  xpath=//*[contains(@id,'product-recovered')]
${COST_DAMAGED_IN_WORKFLOW}  xpath=//*[contains(@id,'product-damaged')]
${COST_SUBTOTAL_AMOUNT_IN_WORKFLOW}  xpath=//*[contains(text(),'Sub total')]
${COST_SUB_RECOVERED_AMOUNT_IN_WORKFLOW}  xpath=//*[contains(text(),'Sub total')]/following-sibling::span[contains(text(),'Recovered')]
${COST_SUB_DAMAGED_AMOUNT_IN_WORKFLOW}  xpath=//*[contains(text(),'Sub total')]/following-sibling::span[contains(text(),'Damaged')]
${COST_VALUE_CHARACTER_LIMIT_ERROR}  xpath=//*[contains(text(),'The value character limit has been reached')]
${COST_QUANTITY_CHARACTER_LIMIT_ERROR}  xpath=//*[contains(text(),'The quantity character limit has been reached')]


${ADD_TO_EVENT_POPUP}  xpath=//*[@class="bottom-panel-title"]/*[text()=' Add to Event']
${CLOSE_ADD_TO_EVENT_POPUP}  id=bottom-sheet-close
${COSTS_OPTION}  id=widget-add-product-to-incident


# Search Page Locators
${SEARCH_HEADER}      xpath=//h1[text()='Search']
${SEARCH_TEXTFIELD}      xpath=//input[@id='txt-global-search']
${SEARCH_BUTTON}      xpath=//button[@id='btn-global-search']
${PREVIOUS_SEARCH_LABEL}      xpath=//h4[text()='Previous Searches']
${CLEAR_ALL_BUTTON}     xpath=//span[text()=' Clear All ']
${SEARCHED_ITEMS}       xpath=//div[contains(@id,'recent-search-item')]
${SEARCHED_RESULT}      xpath=//h3[@class="incident-outer-title"]
${EDIT_SEARCHED_RESULT}      id=action-edit
${VIEW_SEARCHED_RESULT}      id=action-view   #done



${REPORTER_TAB_WHEN_AND_WHO_WIDGET}      xpath=//h3[text()=' When & Who? ']
${REPORTER_TAB_WHERE_WIDGET}      xpath=//h3[text()=' Where? ']
${REPORTER_TAB_OVERVIEW_WIDGET}      xpath=//h3[text()=' Overview ']
${REPORTER_TAB_SPECIFIC_DETAILS_WIDGET}      xpath=//h3[text()=' Specific Details ']
${INVESTIGATE_TAB_ASSESSMENT_WIDGET}      xpath=//h3[text()=' Assessment ']
${INVESTIGATE_TAB_METHODOLOGY_WIDGET}      xpath=//h3[text()=' Methodology ']
${ANALYSE_TAB_EVALUATION_WIDGET}      xpath=//h3[text()=' Evaluation / Conclusion ']
${ANALYSE_TAB_ANALYSIS_WIDGET}      xpath=//h3[text()=' Analysis ']
${LOCATIONS_PAGE_LOCATION_TAB}      xpath=//span[text()='Location']
${LOCATIONS_PAGE_LOCATION_WIDGET}      xpath=//h3[text()=' Incident Location ']
${LOCATIONS_PAGE_LOCATION_DETAILS_WIDGET}      xpath=//h3[text()=' Location Details ']
${INVOLVED_ENTITIES_PAGE_SUSPECTS_TAB}      xpath=//span[text()='Suspects']
${INVOLVED_ENTITIES_PAGE_SUSPECTS_WIDGET}      xpath=//h3[contains(text(),'Suspect')]
${INVOLVED_ENTITIES_PAGE_IMPACTED_PERSONS_TAB}      xpath=//span[text()='Impacted Persons']
${INVOLVED_ENTITIES_PAGE_VICTIMS_WIDGET}      xpath=//h3[contains(text(),'Victims')]
${INVOLVED_ENTITIES_PAGE_WITNESSES_TAB}      xpath=//span[text()='Witnesses']
${INVOLVED_ENTITIES_PAGE_WITNESS_WIDGET}      xpath=//h3[contains(text(),'Witness')]
${INVOLVED_ENTITIES_PAGE_VEHICLES_TAB}      xpath=//span[text()='Vehicles']
${INVOLVED_ENTITIES_PAGE_VEHICLES_WIDGET}      xpath=//h3[text()=' Vehicles ']
${FILES_PAGE_UPLOADED_ITEMS_TAB}      xpath=//span[text()='Uploaded Items']
${FILES_PAGE_LINKED_ATTACHEMENTS_WIDGET}      xpath=//h3[text()=' Linked Attachments ']
${TASKS_PAGE_ALL_TASKS_TAB}      xpath=//span[text()='All Tasks']
${TASKS_PAGE_ASSOCIATED_TASKS_WIDGET}      xpath=//h3[text()=' Associated Tasks ']
${TASKS_PAGE_EOPS_SOPS_TAB}      xpath=//span[text()='EOPs / SOPs']
${TASKS_PAGE_EOPS_SOPS_WIDGET}      xpath=//h3[text()=' EOPs / SOPs ']
${RESPONSES_PAGE_COMMENTS_TAB}      xpath=//span[text()='Comments']
${RESPONSES_PAGE_ALL_COMMENTS_WIDGET}      xpath=//h3[text()=' All Comments ']
${RESPONSES_PAGE_VEHICLES_TAB}      xpath=//span[text()='Vehicles']
${RESPONSES_PAGE_VEHICLES_WIDGET}      xpath=//h3[text()=' Vehicles ']
${RESPONSES_PAGE_PRODUCTS_TAB}      xpath=//span[text()='Products']
${RESPONSES_PAGE_PRODUCTS_WIDGET}      xpath=//h3[text()=' Products ']
${RESPONSES_PAGE_STATEMENTS_TAB}      xpath=//span[text()='Statements']
${RESPONSES_PAGE_WITNESS_STATEMENTS_WIDGET}      xpath=//h3[text()=' Witness Statements ']
${RESPONSES_PAGE_INJURIES_TAB}      xpath=//span[text()='Injuries']
${RESPONSES_PAGE_RECORDED_INJURIES_WIDGET}      xpath=//h3[text()=' Recorded Injuries ']
${LINKED_REPORTS_PAGE_SEARCH_AND_LINK_TAB}      xpath=//span[text()='Search & Link']
${LINKED_REPORTS_PAGE_LINKED_REPORTS_WIDGET}      xpath=//h3[text()=' Linked Reports ']
${LINKED_REPORTS_PAGE_SEARCH_AND_LINK_WIDGET}      xpath=//h3[text()=' Search & Link ']
${NOTIFICATION_PAGE_SENT_NOTIFICATIONS_TAB}      xpath=//span[text()='Sent Notifications']
${NOTIFICATION_PAGE_SENT_NOTIFICATIONS_WIDGET}      xpath=//h3[text()=' Sent Notifications ']

${CHANGE_OWNER_SLIDEOUT_HEADER}           xpath=//h2/span[text()='Change Owner']  #start
${CHANGE_OWNER_SLIDEOUT_TITLE}            xpath=//h3[text()=' Change Owner ']
${SELECT_NEW_ASSIGNED_MEMBER_QUESTION}    xpath=//label[text()='Select the new assigned member of staff below']
${CHANGE_OWNER_PLEASE_SELECT_DROPDOWN}    id=incident-details-assigned-toinput
${CHANGE_OWNER_SEARCH_BOX}                xpath=//input[@placeholder="Search"]
${CHANGE_OWNER_SEARCHED_RESULT}           xpath=//*[@class='zd-select-option']
${CHANGE_OWNER_SLIDEOUT_CLOSE_BUTTON}     id=btn-slide-out-close
${CHANGE_OWNER_SLIDEOUT_SAVE_BUTTON}      id=btn-slide-out-confirm
${CHANGE_OWNER_SUCCESS_TOAST_MESSAGE}     Assigned Incident Successfully
${CHANGE_OWNER_ERROR_TOAST_MESSAGE}       Please select another staff member


${ADD_NEW_VEHICLE_FORM}          id=add-new-widget-btn
${ADD_NEW_SLIDEOUT}              xpath=//h2/span[text()='Add New']
${VEHICLE_FORM_TITLE}            xpath=//h3[text()=' Vehicle Form ']
${VEHICLE_REG_NO_HINT_TEXT}      xpath=//span[text()=' Vehicle Reg. No.']
${VEHICLE_REG_NO_PLACEHOLDER}    xpath=//input[@placeholder="Enter the vehicle registration number here"]
${VEHICLE_MAKE}                  xpath=//input[@placeholder="Enter the vehicle manufacturer (e.g. Volkswagen)"]
${VEHICLE_MODEL}                 xpath=//input[@placeholder="Enter the vehicle model name (e.g. Golf)"]
${VEHICLE_COLOUR}                xpath=//input[@placeholder="Enter the colour of the vehicle"]
${VEHICLE_TYPE}                  xpath=//input[@value="other"]/ancestor::label
${VEHICLE_OWNER}                 xpath=//input[@placeholder="Enter the name of the vehicle owner"]
${VEHICLE_DESCRIPTION}           xpath=//textarea[contains(@placeholder,"Enter a description")]
${VEHICLE_BROWSE_FILES}          xpath=//input[@type='file']
${VEHICLE_UPLOAD_BUTTON}         xpath=//button[text()='Upload']
${VEHICLE_FILE_NAME}             xpath=//input[@placeholder="File Name"]
${VEHICLE_FILE_CLOSE}            xpath=//i[@class="mat-tooltip-trigger fal fa-times"]
${VEHICLE_FILE_UPLOAD_PROGRESS_BAR}   xpath=//*[@role="progressbar"]
${VEHICLE_FILE_UPLOAD_CANCEL}   id=file-upload-canel-btn
${VEHICLE_FILE_UPLOAD_SUCCESS}   xpath=//h3[contains(text(),' File successfully added ')]
${VEHICLE_FILE_UPLOAD_CLOSE}   xpath=//button/span/i[@class="fal fa-times ng-star-inserted"]
${VEHICLE_SUBMIT_BUTTON}         xpath=//button/span[text()=' Submit ']
${VEHICLE_CLOSE_BUTTON}          id=btn-slide-out-close
${RESPONSE_FORM_ADDED_TOAST_MESSAGE}       Response Form Vehicle Form added successfully
${VEHICLE_REG_NO_COLUMN}       xpath=//div[@col-id="vehicleRegNo"]/zs-ag-grid-response/span
${VEHICLE_FULL_PARTIAL_REG_COLUMN}      xpath=//div[@col-id="isThisAFullOrPartialRegNo"]/zs-ag-grid-response/span
${VEHICLE_MAKE_COLUMN}        xpath=//div[@col-id="test"]/zs-ag-grid-response/span
${VEHICLE_MODEL_COLUMN}        xpath=//div[@col-id="model"]/zs-ag-grid-response/span
${VEHICLE_COLOUR_COLUMN}       xpath=//div[@col-id="colour"]/zs-ag-grid-response/span
${VEHICLE_TYPE_COLUMN}         xpath=//div[@col-id="vehicleType"]/zs-ag-grid-response/span
${VEHICLE_OWNER_COLUMN}        xpath=//div[@col-id="vehicleOwnerIfKnow"]/zs-ag-grid-response/span
${VEHICLE_DESCRIPTION_COLUMN}  xpath=//div[@col-id="description"]/zs-ag-grid-response/span
${LIST_WIDGET_COLUMNS_OPTION}      xpath=//span[text()='Columns']
${COLUMNS_REFERENCE_ID_CHECKBOX}   xpath=//span[text()='Reference ID']/preceding-sibling::div[@ref="cbSelect"]
${COLUMNS_FORM_TYPES_CHECKBOX}   xpath=//span[text()='Form Types']/preceding-sibling::div[@ref="cbSelect"]
${COLUMNS_SUBMITTED_DATE_TIME_CHECKBOX}   xpath=//span[text()='Submitted Date & Time']/preceding-sibling::div[@ref="cbSelect"]
${COLUMNS_VEHICLE_REG_NO_CHECKBOX}   xpath=//span[text()='Vehicle Reg. No.']/preceding-sibling::div[@ref="cbSelect"]
${COLUMNS_FULL_PARTIAL_CHECKBOX}   xpath=//span[text()='Is this a full or partial reg. no.?']/preceding-sibling::div[@ref="cbSelect"]
${COLUMNS_MAKE_CHECKBOX}   xpath=//span[text()='Make']/preceding-sibling::div[@ref="cbSelect"]
${COLUMNS_MODEL_CHECKBOX}   xpath=//span[text()='Model']/preceding-sibling::div[@ref="cbSelect"]
${COLUMNS_COLOUR_CHECKBOX}   xpath=//span[text()='Colour']/preceding-sibling::div[@ref="cbSelect"]
${COLUMNS_VEHICLE_TYPE_CHECKBOX}   xpath=//span[text()='Vehicle Type']/preceding-sibling::div[@ref="cbSelect"]
${COLUMNS_VEHICLE_OWNER_CHECKBOX}   xpath=//span[text()='Vehicle Owner (if known)']/preceding-sibling::div[@ref="cbSelect"]

${ADD_NEW_TASK}               id=add-new-widget-btn
${ASSIGN_TASK_SLIDEOUT}       xpath=//h2/span[text()='Assign Task']
${TASK_TITLE_HEADER}          xpath=//label[text()='Task Title']
${TASK_TITLE_TEXTBOX}         xpath=//input[@id='task-title']
${TASK_TYPE_HEADER}           xpath=//label[text()='Task Type']
${TASK_TYPE_DROPDOWN}         id=task-type-id_dummy
${TASK_TYPE_AUDIT_REVIEW_OPTION}  xpath=//div[@role='option' and text()='Audit / Review ']
${TASK_TYPE_INCIDENT_RESPONSE_OPTION}  xpath=//div[@role='option' and text()='Incident Response ']
${TASK_TYPE_OPERATIONAL_TASK_OPTION}   xpath=//div[@role='option' and text()='Operational Task']
${TASK_TYPE_DISPATCH_OPTION}  xpath=//div[@role='option' and text()='Dispatch']
${TASK_ASSIGNED_TO_LABEL}     xpath=//label[text()='Assigned To']
${TASK_ASSIGNED_TO_FIELD}     id=share-with-idinput
${TASK_ASSIGNED_TO_SEARCH_BOX}                xpath=//input[@placeholder="Search"]
${TASK_ASSIGNED_TO_SEARCHED_RESULT}           xpath=//*[@class='zd-select-option']
${TASK_DUE_DATE_TIME_LABEL}           xpath=//label[text()='Due Date & Time']
${TASK_DUE_DATE_TIME}           id=task-due-date
${TASK_INSTRUCTIONS_LABEL}           xpath=//label[text()='Instructions']
${TASK_INSTRUCTIONS_TEXTBOX}           id=task-description
${TASK_SLIDEOUT_CLOSE_BUTTON}     id=btn-slide-out-close
${TASK_SLIDEOUT_SAVE_BUTTON}      id=btn-slide-out-confirm

${TASK_TITLE_COLUMN}       xpath=//div[@col-id="task_title"]/zs-ag-grid-cell-render-value/div
${TASK_TYPE_COLUMN}        xpath=//div[@col-id="task_type"]/zs-ag-grid-cell-render-value/div
${TASK_ASSIGNED_TO_COLUMN}  xpath=//div[@col-id="assigned_to"]/zs-ag-grid-cell-render-value/div
${TASK_CREATED_BY_COLUMN}   xpath=//div[@col-id="assigned_by"]/zs-ag-grid-cell-render-value/div
${TASK_CREATED_DATE_COLUMN}   xpath=//div[@col-id="created_date"]/zs-ag-grid-cell-render-date/span
${TASK_DUE_DATE_COLUMN}       xpath=//div[@col-id="dueDate"]/zs-ag-grid-cell-render-date/span
${TASK_STATUS_COLUMN}         xpath=//div[@col-id="status"]/zs-ag-grid-cell-task-status/div
${COLUMNS_TASK_TITLE_CHECKBOX}   xpath=//span[text()='Task Title']/preceding-sibling::div[@ref="cbSelect"]
${COLUMNS_TASK_TYPE_CHECKBOX}    xpath=//span[text()='Task Type']/preceding-sibling::div[@ref="cbSelect"]
${COLUMNS_ASSIGNED_TO_CHECKBOX}  xpath=//span[text()='Assigned To']/preceding-sibling::div[@ref="cbSelect"]
${COLUMNS_CREATED_BY_CHECKBOX}   xpath=//span[text()='Created By']/preceding-sibling::div[@ref="cbSelect"]
${COLUMNS_CREATED_DATE_TIME_CHECKBOX}   xpath=//span[text()='Created Date & Time']/preceding-sibling::div[@ref="cbSelect"]
${COLUMNS_DUE_DATE_TIME_CHECKBOX}    xpath=//span[text()='Due Date & Time']/preceding-sibling::div[@ref="cbSelect"]
${COLUMNS_TASK_STATUS_CHECKBOX}      xpath=//span[text()='Task Status']/preceding-sibling::div[@ref="cbSelect"]
${COLUMNS_TASK_REFERENCE}   xpath=//div[@col-id="task_refernce"]/zs-ag-grid-cell-render-value/div
${COLUMNS_TASK_REFERENCE_CHECKBOX}   xpath=//span[text()='Task Reference']/preceding-sibling::div[@ref="cbSelect"]

${TASK_PREVIEW_PAGE_TITLE}           xpath=//h3[@class="right-panel-title"]/span
${TASK_PREVIEW_PAGE_CLOSE_BUTTON}    xpath=//i[@class="fal fa-times"]
${TASK_PREVIEW_PAGE_TASK_TAB}        xpath=//*[@id='task-tab' and text()=' Task ']
${TASK_PREVIEW_PAGE_TASK_TYPE}       xpath=//span[text()=' Task Type ']/following-sibling::span
${TASK_PREVIEW_PAGE_CREATED_BY}      xpath=//span[text()=' Created By ']/following-sibling::span
${TASK_PREVIEW_PAGE_ASSIGNED_TO}       xpath=//span[text()=' Assigned To ']/following-sibling::span
${TASK_PREVIEW_PAGE_TASK_STATUS}       xpath=//span[text()=' Task Status ']/following-sibling::span
${TASK_PREVIEW_PAGE_CREATED_DATETIME}  xpath=//span[text()=' Created Date & Time ']/following-sibling::span
${TASK_PREVIEW_PAGE_DUE_DATETIME}   xpath=//span[text()=' Due Date & Time ']/following-sibling::span
${TASK_PREVIEW_PAGE_INSTRUCTION}    xpath=//span[text()=' Instruction ']/following-sibling::span
${TASK_PREVIEW_PAGE_LINKED_EVENTS}    xpath=//span[text()=' Linked Events ']/parent::div/div/div[contains(text(),'SEC')]
${TASK_PREVIEW_PAGE_IMAGE_THUMBNAIL}      xpath=//div[@class="thumbnail thumbnail-preview"]/img
${TASK_PREVIEW_PAGE_UPDATE_TASK_BUTTON}   xpath=//button[text()='Update Task']
${TASK_PREVIEW_PAGE_ATTACHMENT_NAME}   xpath=//div[@class="mat-tooltip-trigger attachment-name"]
${TASK_PREVIEW_PAGE_DOWNLOAD_ICON}   id=task-attachment-icon-0


${TASK_LINK_EVENTS}  id=link-incident_dummy
${TASK_SEARCH_LINK_EVENTS}  xpath=//*[@placeholder="Type to filter"]
${TASK_SEARCHED_LINK_EVENT}  xpath=//div[@role="option" and contains(text(),'SEC')]
${TASK_HEADER}  xpath=//h3[text()=' Tasks ']
${TASK_ADD_PAGE_BUTTON}  xpath=//button[@id='btn-add-page']
${TASK_FILTER_LIST}  id=left-panel-search-box
${TASKS_PAGE}        xpath=//div[text()='Tasks' and contains(@id,'left-panel-dynamic-page-title')]
${TASKS_PAGE_TITLE}        xpath=//div/h1[text()=' Tasks ']

${TASKS_UPDATE_TASKS_SLIDEOUT_HEADER}        xpath=//h2/span[text()='Update Task']

${CHANGE_STATUS_SLIDEOUT_HEADER}          xpath=//h2/span[text()='Status']
${CHANGE_STATUS_SLIDEOUT_TITLE}           xpath=//h3[text()=' Status ']/span[text()='Change']
${SELECT_THE_STATUS_BELOW_QUESTION}       xpath=//label[text()='Select the Status below']
${CHANGE_STATUS_DROPDOWN}                 id=incident-details-updation_dummy
${CHANGE_STATUS_SEARCH_BOX}               xpath=//input[@placeholder="Type to filter"]
${CHANGE_STATUS_SLIDEOUT_CLOSE_BUTTON}     id=btn-slide-out-close
${CHANGE_STATUS_SLIDEOUT_SAVE_BUTTON}      id=btn-slide-out-confirm
${CHANGE_STATUS_SUCCESS_TOAST_MESSAGE}     has been successfully updated to
${CHANGE_STATUS_ERROR_TOAST_MESSAGE}       Please select another status
${UNSELECTED_STATUS_IN_DROPDOWN}           xpath=//div[@role="option" and contains(@class,'mbsc-btn-e') and @aria-selected="false"]

${CHANGE_SEVERITY_SLIDEOUT_HEADER}          xpath=//h2/span[text()='Severity']
${CHANGE_SEVERITY_SLIDEOUT_TITLE}           xpath=//h3[text()=' Severity ']/span[text()='Change']
${SELECT_THE_SEVERITY_BELOW_QUESTION}       xpath=//label[text()='Select the Severity below']
${CHANGE_SEVERITY_DROPDOWN}                 id=incident-details-updation_dummy
${CHANGE_SEVERITY_SEARCH_BOX}               xpath=//input[@placeholder="Type to filter"]
${CHANGE_SEVERITY_SLIDEOUT_CLOSE_BUTTON}     id=btn-slide-out-close
${CHANGE_SEVERITY_SLIDEOUT_SAVE_BUTTON}      id=btn-slide-out-confirm
${CHANGE_SEVERITY_SUCCESS_TOAST_MESSAGE}     Severity Updated
${CHANGE_SEVERITY_ERROR_TOAST_MESSAGE}       Please select another severity
${UNSELECTED_SEVERITY_IN_DROPDOWN}           xpath=//div[@role="option" and contains(@class,'mbsc-btn-e') and @aria-selected="false"]

${CHANGE_PRIORITY_SLIDEOUT_HEADER}          xpath=//h2/span[text()='Priority']
${CHANGE_PRIORITY_SLIDEOUT_TITLE}           xpath=//h3[text()=' Priority ']/span[text()='Change']
${SELECT_THE_PRIORITY_BELOW_QUESTION}       xpath=//label[text()='Select the Priority below']
${CHANGE_PRIORITY_DROPDOWN}                 id=incident-details-updation_dummy
${CHANGE_PRIORITY_SEARCH_BOX}               xpath=//input[@placeholder="Type to filter"]
${CHANGE_PRIORITY_SLIDEOUT_CLOSE_BUTTON}     id=btn-slide-out-close
${CHANGE_PRIORITY_SLIDEOUT_SAVE_BUTTON}      id=btn-slide-out-confirm
${CHANGE_PRIORITY_SUCCESS_TOAST_MESSAGE}     Priority Updated
${CHANGE_PRIORITY_ERROR_TOAST_MESSAGE}       Please select another priority
${UNSELECTED_PRIORITY_IN_DROPDOWN}           xpath=//div[@role="option" and contains(@class,'mbsc-btn-e') and @aria-selected="false"]

${EVENT_TIMELINE_ICON}              id=btn-rightbar-timeline
${EVENT_TIMELINE_HEADER}            xpath=//h3/span[text()=' Event Timeline']
${EVENT_TIMELINE_CLOSE_BUTTON}      id=btn-right-panel-close
${EVENT_TIMELINE_DATE_COLOUMN}      xpath=//div[text()=' Date ']
${EVENT_TIMELINE_EVENTS_COLOUMN}    xpath=//div[text()=' Events ']
${EVENT_TIMELINE_EVENTS}            xpath=//*[contains(@id,"div-audit-trail-list")]
${EVENT_TIMELINE_TIME}              xpath=//div[@class="audit-trail-list audit-entry ng-star-inserted"]/span
${EVENT_TIMELINE_DATE}              xpath=//div/span[@class="audit-date"]
${EVENT_TIMELINE_MONTH_YEAR}        xpath=//div/span[@class="audit-date2"]


${EVENT_ALL_RECORDS_PAGE}           xpath=//div[text()='All Records' and contains(@id,"left-panel-dynamic-page-title")]
${EVENT_REFERENCE_FILTER_INPUT}     xpath=//input[@aria-label="Reference Filter Input"]
${EVENT_REFERENCE_NUMBERS}          xpath=//div[@col-id="reference"]//a/b
${EVENT_BREADCRUMBS}          xpath=//p[@class='page-breadcrumbs disabled-page-breadcrumbs ng-star-inserted']
${DASHBOARD_EVENTS_PAGE}     xpath=//div[text()='Events' and contains(@id,"left-panel-dynamic-page-title")]
${INCIDENT_REFERENCE_OPTION}     xpath=//*[@class="zd-select-option" and text()='Incident Reference ']

#Data Export Module
${DATA_MODULE}            id=navbar-Data
${GENERATE_REPORT_BUTTON}        id=btn-report-generate
${DATA_ON_ITS_WAY_MESSAGE}       Your data is on its way, You will be notified when it has been generated. Please do not close application.
${DATA_GENERATED_MESSAGE}        Your data has been generated.
${VIEW_BUTTON_IN_MESSAGE}        xpath=//span[@class="mat-button-wrapper" and text()="View"]
${EXPORT_CSV_BUTTON}             id=btn-export-csv


#dynamic questions
${describe_the_specific_location_question}    xpath://input[contains(@id,'qa422397d-bad9-4450-89e0-04419b6b2946_0_a422397d-bad9-4450-89e0-04419b6b2946')]
${Select the option(s) that best describes the verbal abuse_question}    xpath://input[contains(@id,'q0fbe29ef-9a6e-4785-a632-bb31e33c2979_0_0fbe29ef-9a6e-4785-a632-bb31e33c2979_dummy')]
${Written_summary_question}      xpath://textarea[@class='mbsc-control mbsc-textarea-scroll']
${Is_CCTV_available_at_the_location_Option_Yes}    xpath://zd-radio-group[@label='Is CCTV available at the location?']//div//zd-radio[@label='Yes']
${Has a copy of the CCTV been saved_option_Yes}    xpath://zd-radio-group[@label='Has a copy of the CCTV been saved?']//div//zd-radio[@label='Yes']
${Has a copy been uploaded to Analyst_option_Yes}    xpath://zd-radio-group[@label='Has a copy been uploaded to Analyst?']//div//zd-radio[@label='Yes']
${Was a weapon present_option_Yes}    xpath://zd-radio-group[@label='Was a weapon present?']//div//zd-radio[@label='Yes']
${What was the type of weapon(s) present_dropdown}    xpath://input[@class='mbsc-select-input mbsc-control ']
${full_name_text_field}    xpath://input[contains(@id,'qa650d358-5610-4d26-a1c1-2f3ec0f43b1c_0_a650d358-5610-4d26-a1c1-2f3ec0f43b1c')]
${external/contractor_option}    xpath://zd-radio-group[@label='Who is the reporter?']//div//zd-radio[@label='External / Contractor']
${email_address_label}     xpath://label[text()='Email Address']
${contact_number_field}      xpath://input[contains(@id,'q7b4b786b-5cbd-48a5-93df-80b9d85dc31a_0_7b4b786b-5cbd-48a5-93df-80b9d85dc31a')]
${email_address_field}      xpath://input[contains(@id,'qf33cbbb6-5ebe-4549-a076-240374af299c_0_f33cbbb6-5ebe-4549-a076-240374af299c')]
${full_name}    Danny johns
${contact_number}    8908046411
${email}    test@gmail.com
${all_dynamic_question_widget}    xpath://h3[@class='m-portlet__head-text' and text()=' testigng ']
${edit_event_button}    xpath://button[@id='action-edit']
${add_event_category_dropdown}     xpath://input[@class='mbsc-select-input mbsc-control ']
${external_contractor_option}    xpath://input[contains(@id,'wf-radio-group-q5f89a8ec-bf9e-4b41-9cd7-44a8d4fe344a_0_5f89a8ec-bf9e-4b41-9cd7-44a8d4fe344a2')]
${Select the option(s) that best describes the verbal abuse_question_selected_options}    xpath://div[@class='mbsc-sc-itm mbsc-btn-e mbsc-sc-itm-sel mbsc-ic mbsc-ic-material-check']
${Written_summary_value}    Testing summary
${What was the type of weapon(s) present selected options}   xpath://div[@aria-selected='true']
