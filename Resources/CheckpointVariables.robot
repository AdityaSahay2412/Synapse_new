*** Variables ***
#env's
&{TEST_SITE}            uat= 21356                          production=78XF+QJV

# URLs
&{LOGIN_PAGE_URL}       uat=https://analystuat.staging.zinc.systems/#/auth/login            production=https://analyst.zinc.systems/#/auth/login
&{DASHBOARD_PAGE_URL}   uat=https://analystuat.staging.zinc.systems/#/analyst/dashboard     production=https://analyst.zinc.systems/#/analyst/dashboard
#${LOGIN_PAGE_URL}       https://analyst.staging.zinc.systems/#/auth/login
#${DASHBOARD_PAGE_URL}   https://analyst.staging.zinc.systems/#/analyst/dashboard

#checkpoints variables
${Sites_Header}     xpath://h3[text()=' Sites ']
${Site_name_dashboard_title}    xpath://h1[@id='dashboard-title']
${Checkpoints_Tab}    xpath://span[text()='Checkpoints']
${Checkpoints_list_widget}    xpath://h3[@class='m-portlet__head-text']
${Add_new_checkpoint-button}    xpath://button[@id='add-new-widget-btn']
${Add_checkpoint_form_title}    xpath://span[text()='Add Checkpoint']
${checkpoint_name_field_label}    xpath://span[text()='Checkpoint Name']
${checkpoint_name_text_field}    xpath://input[@id='zd-text-field-checkpoint-name']
${checkpoint_verification_field_label}    xpath://span[text()='Checkpoint Verification']
${select_checkpoint_verification_dropdown}    xpath://input[@id='zd-select-drop-down-checkpoint-type-id_dummy']
${list_of_sites}    xpath://div[contains(@id,'left-panel-dynamic-page-title')]
${list_of_checkpoints}    xpath://div[contains(text(),'AutomatedCheckpoint_2024')]
${add_checkpoint_button}     xpath://button[@id='add-new-widget-btn']
${checkpoint_name_field_label}     xpath://span[text()='Checkpoint Name']
${checkpoint_name_field}    xpath:(//div[@class='msbc-container'])[1]
${checkpoint_verification_field_label}    xpath://span[text()='Checkpoint Verification']
${checkpoint_verification_dropdown}    xpath://input[@id='zd-select-drop-down-checkpoint-type-id_dummy']
${selected_checkpoint_verification_following_field_label}    xpath://label[@class='ng-star-inserted']//span[1]
${selected_checkpoint_verification_following_field}    xpath://input[@id='zd-text-field-checkpoint-barcodeno']
${Plot_location_field_label}    xpath://label[text()=' Plot Location ']
${google map}    xpath://zd-google-map[@class='map-wrapper map hydrated']
${Description_label_and_text_field}    xpath://label[@for='zd-text-field-checkpoint-description']
${Reference_gallery_field_label}    xpath://label[text()=' Reference Gallery ']
${file_drop_button}    xpath://button[@id='browse-file']
${Notes_field_label}    xpath://label[text()=' Notes ']
${Notes_field}    xpath://textarea[@id='zd-text-field-checkpoint-notes']
${Risk_field_label}    xpath://label[text()=' Risk ']
${Risk_field}    xpath://textarea[@id='zd-text-field-checkpoint-risk']
${add-checkpoint_form_cancel_button}    xpath://button[@id='btn-slide-out-close']
${add_checkpoint_form_save_button}    xpath://button[@id='btn-slide-out-confirm']
${checkpoint_map_location_marker}    xpath://i[@class='fal fa-map-marker-alt']
${description_text_field}    xpath://textarea[@id='zd-text-field-checkpoint-description']
${edit_checkpoint_button}    xpath://button[text()='Edit']
${Barcode_text}    xpath://span[text()=' Barcode ']
${Checkpoint_file_input}    xpath:(//input[@class='input-file'])[1]
${FILE_PATH}     C:/Users/Asus/PycharmProjects/Synapse/Resources/messo.jpeg
${Upload_file_button}    xpath://button[text()='Upload']
${checkpoint_verification_dropdown}    xpath://input[@id='zd-select-drop-down-checkpoint-type-id_dummy']
${NFC_dropdown_option}    xpath://div[@role='option' and text()='NFC']
${NFC_input_field}    xpath://input[@id='zd-text-field-checkpoint-uniquerefno']
${LocationTracking_dropdown_option}    xpath://div[@role='option' and text()='Location Tracking']
${Image_META_dropdown_option}    xpath://div[@role='option' and text()='Image META']

@{LocationTracking_Locators}
...  xpath://span[text()='Latitude']
...  xpath://input[@id='zd-text-field-checkpoint-latitude']
...  xpath://span[text()='Longitude']
...  xpath://input[@id='zd-text-field-checkpoint-longitude']
...  xpath://label[.='Tolerance (+/-)*']
...  xpath://input[@id='zd-select-drop-down-checkpoint-tolerance_dummy']

${Latitude_input_field}    xpath://input[@id='zd-text-field-checkpoint-latitude']
${Latitude_value}    23.3441
${Longitude_input_field}    xpath://input[@id='zd-text-field-checkpoint-longitude']
${Longitude_value}    85.3096
${checkpoint_update_confirmation_button}    xpath://zd-button[@id='btn-update-confirmation']
${Plot_location_toggle_button}    xpath://span[@class='slider round']
${UK_latitude_value}    55.3781
${UK_longitude_value}    3.4360
${Tolerance_dropdown}    xpath://input[@id='zd-select-drop-down-checkpoint-tolerance_dummy']
${30Metre_tolerance_option}    xpath://div[text()='30 Meters']
${checkpoint_confirm_update_dialog_box}    xpath://div[@class='col-md-12 text-center confirmation-title']
${invalid_template_popup_close_button}    xpath://zd-button[@id='btn-invalid-template']
${Enable_disable_Toggle_button}     xpath://span[@class='slider round']
${Button_disabled}    xpath://span[text()='Disabled']
${Button_enabled}    xpath://span[text()='Active']