*** Settings ***
Documentation    this is a testing file for add and edit checkpoints
Library    Selenium2Library
Library    Collections
#Resource    General.robot
Resource    ../Variables.robot
Resource    ../CheckpointVariables.robot
#Resource    ../WidgetExportVariables.robot


*** Keywords ***
Navigate to Locations Module
    Scroll Element Into View     ${Locations_module}
    Click Element    ${Locations_module}


Verify the web elements present under the locations module
    Wait Until Element Is Visible    ${Sites_Header}    5    Sites header is not visible
    Wait Until Element Is Visible    ${Site_name_dashboard_title}    10    site dashboard title was not visible 
    Wait Until Element Is Visible    ${Checkpoints_Tab}    10    checkpoints tab was not visible
    Wait Until Element Is Visible    ${Checkpoints_list_widget}    10    checkpoint list widget is not visible


verify the site names
    Navigate To Locations Module
    ${sites}    Get Webelements    xpath://div[contains(@id,'left-panel-dynamic-page-title')]
    FOR    ${site}    IN    @{sites}
        Log    ${site.text}
    END


Select the site
    [Arguments]    ${site_name}
    ${sites}    Get Webelements    ${list_of_sites}
    ${index}    Set Variable    1
    FOR    ${site}    IN    @{sites}
        Exit For Loop If    '${site_name}' == '${site.text}'
        ${index}    Evaluate    ${index}+1
    END
    Click Element    xpath://div[contains(@id,'dashboard-collection-item')][${index}]
    Wait Until Element Is Visible    ${Checkpoints_list_widget}    10    checkpoint list widget is not visible


Verify Add checkpoint form Elements
    Click Button   ${add_checkpoint_button}
    Wait Until Element Is Visible    ${checkpoint_name_field_label}    10    checkpoint field title was not visible
    Wait Until Element Is Visible    ${checkpoint_name_field}    10    checkpoint name field was not visible
    Wait Until Element Is Visible    ${checkpoint_verification_field_label}    5    checkpoint verification field title was not visible
    Wait Until Element Is Visible    ${checkpoint_verification_dropdown}    5    checkpoint verification dropdown was not visible
    Wait Until Element Is Visible    ${selected_checkpoint_verification_following_field_label}    5
    Wait Until Element Is Visible    ${selected_checkpoint_verification_following_field}    5
    Wait Until Element Is Visible    ${Plot_location_field_label}    5
    Wait Until Element Is Visible    ${google map}    5
    Wait Until Element Is Visible    ${Description_label_and_text_field}    5
    Wait Until Element Is Visible    ${Reference_gallery_field_label}    5
    Scroll Element Into View    ${Risk_field}    
    Wait Until Element Is Visible    ${file_drop_button}    5
    Wait Until Element Is Visible    ${Notes_field_label}    5
    Wait Until Element Is Visible    ${Notes_field}    5
    Wait Until Element Is Visible    ${Risk_field_label}    5
    Wait Until Element Is Visible    ${Risk_field}    5
    Wait Until Element Is Visible    ${add-checkpoint_form_cancel_button}    5
    Wait Until Element Is Visible    ${add_checkpoint_form_save_button}    5


Upload file while adding checkpoint
    Choose File    ${Checkpoint_file_input}    ${FILE_PATH}
    Wait Until Element Is Visible    ${Upload_file_button}    10
    Click Element    ${Upload_file_button}

Add a Checkpoint with Barcode Checkpoint Verification Method
    Click Button   ${add_checkpoint_button}
    ${current_time}    Get Time    result_format=%Y-%m-%d %H:%M:%S
    ${checkpoint_name}    Set Variable    AutomatedCheckpoint_${current_time} 
    Input Text    ${checkpoint_name_text_field}    ${checkpoint_name}
    Log    Checkpoint Name: ${checkpoint_name}
    ${verification_serial_no}    Set Variable    AutomatedVerification_${current_time}
    Input Text    ${selected_checkpoint_verification_following_field}    ${verification_serial_no}
    ${description}    Set Variable    AutomatedDescription
    Input Text    ${description_text_field}    ${description}
    Scroll Element Into View    ${Notes_field}
#    Upload File While Adding Checkpoint
#    Wait Until Element Is Visible    ${Upload_file_button}    10
#    Click Element    ${Upload_file_button}
    ${notes}    Set Variable    AutomatedNotes
    Input Text    ${Notes_field}  ${notes}
    ${risk}    Set Variable    AutomatedRisk
    Input Text    ${Risk_field}    ${risk}
    Click Element    ${add_checkpoint_form_save_button}
    Wait Until Page Contains    Checkpoint created successfully    10    Page did not contained Checkpoint created successfull

Verify the checkpoint details added for Barcode
    [Arguments]    ${checkpoint_name}        
    ${checkpoints}    Get Webelements    ${list_of_checkpoints}
    ${checkpoint_index}    Set Variable    1
    FOR    ${checkpoint}    IN    @{checkpoints}
        Exit For Loop If    '${checkpoint_name}' == '${checkpoint.text}'
        ${checkpoint_index}    Evaluate    ${checkpoint_index}+1
    END
    Click Element    xpath:(//button[@id='btn-list-action-view'])[${checkpoint_index}]
    Wait Until Element Is Visible    ${edit_checkpoint_button}    10    edit checkpoint button was not visible
    Sleep    3
    ${locators}    Create List
    ...    xpath://span[text()=' Barcode ']
    ...    xpath://div[@class='row preview-detail ng-star-inserted']//span[2]
    ...    xpath://span[@class='content-font col-12 span-checkpoint-description']
    ...    xpath://span[@class='content-font col-12 span-checkpoint-notes']
    ...    xpath://span[@class='content-font col-12 span-checkpoint-risk']

    ${expected_texts}    Create List
    FOR    ${locator}    IN    @{locators}
        ${text}    Get Text    ${locator}
        Append To List    ${expected_texts}    ${text}
    END

    # Verify the text of each element
    FOR    ${index}    IN RANGE    0    ${expected_texts.__len__()}
        ${expected_text}    Set Variable    ${expected_texts[${index}]}
        ${actual_locator}    Set Variable    ${locators[${index}]}
        Element Text Should Be    ${actual_locator}    ${expected_text}
    END







Verify the checkpoint details after editing the checkpoint added for Barcode
    [Arguments]    ${checkpoint_name}
    ${checkpoints}    Get Webelements    ${list_of_checkpoints}
    ${checkpoint_index}    Set Variable    1
    FOR    ${checkpoint}    IN    @{checkpoints}
        Exit For Loop If    '${checkpoint_name}' == '${checkpoint.text}'
        ${checkpoint_index}    Evaluate    ${checkpoint_index}+1
    END
    Click Element    xpath:(//button[@id='btn-list-action-view'])[${checkpoint_index}]
    Wait Until Element Is Visible    ${edit_checkpoint_button}    10    edit checkpoint button was not visible
    Sleep    3

    ${locators}    Create List
    ...    xpath://span[text()=' Barcode ']
    ...    xpath://div[@class='row preview-detail ng-star-inserted']//span[2]
    ...    xpath://span[@class='content-font col-12 span-checkpoint-description']
    ...    xpath://span[@class='content-font col-12 span-checkpoint-notes']
    ...    xpath://span[@class='content-font col-12 span-checkpoint-risk']
    ${expected_texts}    Create List
    FOR    ${locator}    IN    @{locators}
        ${text}    Get Text    ${locator}
        Append To List    ${expected_texts}    ${text}
    END
    # Verify the text of each element
    FOR    ${index}    IN RANGE    0    ${expected_texts.__len__()}
        ${expected_text}    Set Variable    ${expected_texts[${index}]}
        ${actual_locator}    Set Variable    ${locators[${index}]}
        Element Text Should Be    ${actual_locator}    ${expected_text}
    END


Edit the checkpoint details added for Barcode
    [Arguments]    ${checkpoint_name}
    ${checkpoints}    Get Webelements    ${list_of_checkpoints}
    ${checkpoint_index}    Set Variable    1
    FOR    ${checkpoint}    IN    @{checkpoints}
        Exit For Loop If    '${checkpoint_name}' == '${checkpoint.text}'
        ${checkpoint_index}    Evaluate    ${checkpoint_index}+1
    END
    Click Element    xpath:(//button[@id='btn-list-action-view'])[${checkpoint_index}]
    Wait Until Element Is Visible    ${edit_checkpoint_button}    10    edit checkpoint button was not visible
    Click Element    ${edit_checkpoint_button}
    Clear Element Text    ${checkpoint_name_text_field}
    ${current_time}    Get Time    result_format=%Y-%m-%d %H:%M:%S
    ${checkpoint_name}    Set Variable    AutomatedCheckpoint_${current_time}
    Input Text    ${checkpoint_name_text_field}    ${checkpoint_name}
    Log    Checkpoint Name: ${checkpoint_name}
    Clear Element Text    ${selected_checkpoint_verification_following_field}
    ${verification_serial_no}    Set Variable    EditedVerification_${current_time}
    Input Text    ${selected_checkpoint_verification_following_field}    ${verification_serial_no}
    Clear Element Text    ${description_text_field}
    ${description}    Set Variable    EditedDescription
    Input Text    ${description_text_field}    ${description}
    Scroll Element Into View    ${Notes_field}
    Clear Element Text    ${Notes_field}
    ${notes}    Set Variable    EditedNotes
    Input Text    ${Notes_field}  ${notes}
    Clear Element Text    ${Risk_field}
    ${risk}    Set Variable    EditedRisk
    Input Text    ${Risk_field}    ${risk}
    Click Element    ${add_checkpoint_form_save_button}
    Wait Until Page Contains Element    xpath://div[@class='col-md-12 text-center confirmation-title']    10    Page did not contained "Updating this checkpoint will affect all upcoming patrol events. Are you sure you want to proceed?" dialog box
    Click Element    ${checkpoint_update_confirmation_button}
    Wait Until Page Contains    Checkpoint successfully updated! All future patrols using this checkpoint will be updated with the changes.    10    The toast message "Checkpoint successfully updated! All future patrols using this checkpoint will be updated with the changes." did not appear after 10 seconds


Verify the checkpoint details added for NFC
    [Arguments]    ${checkpoint_name}
    ${checkpoints}    Get Webelements    ${list_of_checkpoints}    #20 checkpoint rows stored hai
    ${checkpoint_index}    Set Variable    1
    FOR    ${checkpoint}    IN    @{checkpoints}
        Exit For Loop If    '${checkpoint_name}' == '${checkpoint.text}'
        ${checkpoint_index}    Evaluate    ${checkpoint_index}+1
    END
    Click Element    xpath:(//button[@id='btn-list-action-view'])[${checkpoint_index}]
    Wait Until Element Is Visible    ${edit_checkpoint_button}    10    edit checkpoint button was not visible
    Sleep    3
    ${locators}    Create List
    ...    xpath://span[text()=' NFC ']
    ...    xpath://div[@class='row preview-detail ng-star-inserted']//span[2]
    ...    xpath://span[@class='content-font col-12 span-checkpoint-description']
    ...    xpath://span[@class='content-font col-12 span-checkpoint-notes']
    ...    xpath://span[@class='content-font col-12 span-checkpoint-risk']

    ${expected_texts}    Create List
    FOR    ${locator}    IN    @{locators}
        ${text}    Get Text    ${locator}
        Append To List    ${expected_texts}    ${text}
    END

    # Verify the text of each element
    FOR    ${index}    IN RANGE    0    ${expected_texts.__len__()}
        ${expected_text}    Set Variable    ${expected_texts[${index}]}
        ${actual_locator}    Set Variable    ${locators[${index}]}
        Element Text Should Be    ${actual_locator}    ${expected_text}
    END



Verify the checkpoint details after editing the checkpoint added for NFC
    [Arguments]    ${checkpoint_name}
    ${checkpoints}    Get Webelements    ${list_of_checkpoints}
    ${checkpoint_index}    Set Variable    1
    FOR    ${checkpoint}    IN    @{checkpoints}
        Exit For Loop If    '${checkpoint_name}' == '${checkpoint.text}'
        ${checkpoint_index}    Evaluate    ${checkpoint_index}+1
    END
    Click Element    xpath:(//button[@id='btn-list-action-view'])[${checkpoint_index}]
    Wait Until Element Is Visible    ${edit_checkpoint_button}    10    edit checkpoint button was not visible
    Sleep    3
    ${locators}    Create List
    ...    xpath://span[text()=' NFC ']
    ...    xpath://div[@class='row preview-detail ng-star-inserted']//span[2]
    ...    xpath://span[@class='content-font col-12 span-checkpoint-description']
    ...    xpath://span[@class='content-font col-12 span-checkpoint-notes']
    ...    xpath://span[@class='content-font col-12 span-checkpoint-risk']

    ${expected_texts}    Create List
    FOR    ${locator}    IN    @{locators}
        ${text}    Get Text    ${locator}
        Append To List    ${expected_texts}    ${text}
    END

    # Verify the text of each element
    FOR    ${index}    IN RANGE    0    ${expected_texts.__len__()}
        ${expected_text}    Set Variable    ${expected_texts[${index}]}
        ${actual_locator}    Set Variable    ${locators[${index}]}
        Element Text Should Be    ${actual_locator}    ${expected_text}
    END



Verify the checkpoint details added for Location Tracking
    [Arguments]    ${checkpoint_name}
    ${checkpoints}    Get Webelements    ${list_of_checkpoints}    #20 checkpoint rows stored hai
    ${checkpoint_index}    Set Variable    1
    FOR    ${checkpoint}    IN    @{checkpoints}
        Exit For Loop If    '${checkpoint_name}' == '${checkpoint.text}'
        ${checkpoint_index}    Evaluate    ${checkpoint_index}+1
    END
    Click Element    xpath:(//button[@id='btn-list-action-view'])[${checkpoint_index}]
    Wait Until Element Is Visible    ${edit_checkpoint_button}    10    edit checkpoint button was not visible
    Sleep    3
    ${expected_texts}    Create List    Location Tracking    55.3781    3.436    EditedDescription    30 Meters    EditedNotes    EditedRisk
    ${locators}    Create List
    ...    xpath://span[text()=' Location Tracking ']
    ...    xpath:(//span[@class='content-font col-12'])[3]
    ...    xpath:(//span[@class='content-font col-12'])[4]
    ...    xpath://span[@class='content-font col-12 span-checkpoint-description']
    ...    xpath:(//span[@class='content-font col-12'])[5]
    ...    xpath://span[@class='content-font col-12 span-checkpoint-notes']
    ...    xpath://span[@class='content-font col-12 span-checkpoint-risk']
    FOR    ${index}    IN RANGE    0    ${expected_texts.__len__()}
        ${expected_text}    Set Variable    ${expected_texts[${index}]}
        ${actual_locator}    Set Variable    ${locators[${index}]}
        Scroll Element Into View    ${actual_locator}
        Element Text Should Be    ${actual_locator}    ${expected_text}
    END

verify the checkpoint details added for Barcode Verification Method
    Navigate To Locations Module
    Sleep    5
    Select The Site  21356
    Sleep    4
    Verify The Checkpoint Details Added For Barcode    AutomatedCheckpoint_2024-11-17 22:20:16

verify the checkpoint details added for NFC Verification Method
    Navigate To Locations Module
    Sleep    5
    Select The Site  21356
    Sleep    4
    Verify The Checkpoint Details Added For NFC    AutomatedCheckpoint_2024-11-21 14:24:38
    
verify the checkpoint details added for Location Tracking Verification Method
    Navigate To Locations Module
    Sleep    5
    Select The Site  21356
    Sleep    4
    Verify The Checkpoint Details Added For Location Tracking    AutomatedCheckpoint_2024-11-21 15:19:07


Add a Checkpoint with NFC Verification Method
    Click Button   ${add_checkpoint_button}
    ${current_time}    Get Time    result_format=%Y-%m-%d %H:%M:%S
    ${checkpoint_name}    Set Variable    AutomatedCheckpoint_${current_time}
    Input Text    ${checkpoint_name_text_field}    ${checkpoint_name}
    Log    Checkpoint Name: ${checkpoint_name}
    Click Element    ${checkpoint_verification_dropdown}
    Click Element    ${NFC_dropdown_option}
    ${verification_serial_no}    Set Variable    AutomatedVerification_${current_time}
    Input Text    ${NFC_input_field}    ${verification_serial_no}
    ${description}    Set Variable    AutomatedDescription
    Input Text    ${description_text_field}    ${description}
    Scroll Element Into View    ${Notes_field}
#    Upload File While Adding Checkpoint
#    Wait Until Element Is Visible    ${Upload_file_button}    10
#    Click Element    ${Upload_file_button}
    ${notes}    Set Variable    AutomatedNotes
    Input Text    ${Notes_field}  ${notes}
    ${risk}    Set Variable    AutomatedRisk
    Input Text    ${Risk_field}    ${risk}
    Click Element    ${add_checkpoint_form_save_button}
    Wait Until Page Contains    Checkpoint created successfully    10    Page did not contained Checkpoint created successfully

Edit the checkpoint details added for NFC
    [Arguments]    ${checkpoint_name}
    ${checkpoints}    Get Webelements    ${list_of_checkpoints}
    ${checkpoint_index}    Set Variable    1
    FOR    ${checkpoint}    IN    @{checkpoints}
        Exit For Loop If    '${checkpoint_name}' == '${checkpoint.text}'
        ${checkpoint_index}    Evaluate    ${checkpoint_index}+1
    END
    Click Element    xpath:(//button[@id='btn-list-action-view'])[${checkpoint_index}]
    Wait Until Element Is Visible    ${edit_checkpoint_button}    10    edit checkpoint button was not visible
    Click Element    ${edit_checkpoint_button}
    Clear Element Text    ${checkpoint_name_text_field}
    ${current_time}    Get Time    result_format=%Y-%m-%d %H:%M:%S
    ${checkpoint_name}    Set Variable    AutomatedCheckpoint_${current_time}
    Input Text    ${checkpoint_name_text_field}    ${checkpoint_name}
    Log    Checkpoint Name: ${checkpoint_name}
    Clear Element Text     ${NFC_input_field}
    ${verification_serial_no}    Set Variable    EditedVerification_${current_time}
    Input Text     ${NFC_input_field}    ${verification_serial_no}
    Clear Element Text    ${description_text_field}
    ${description}    Set Variable    EditedDescription
    Input Text    ${description_text_field}    ${description}
    Scroll Element Into View    ${Notes_field}
    Clear Element Text    ${Notes_field}
    ${notes}    Set Variable    EditedNotes
    Input Text    ${Notes_field}  ${notes}
    Clear Element Text    ${Risk_field}
    ${risk}    Set Variable    EditedRisk
    Input Text    ${Risk_field}    ${risk}
    Click Element    ${add_checkpoint_form_save_button}
    Wait Until Page Contains Element    ${checkpoint_confirm_update_dialog_box}    10    Page did not contained "Updating this checkpoint will affect all upcoming patrol events. Are you sure you want to proceed?" dialog box
    Click Element    ${checkpoint_update_confirmation_button}
    Wait Until Page Contains    Checkpoint successfully updated! All future patrols using this checkpoint will be updated with the changes.    10    The toast message "Checkpoint successfully updated! All future patrols using this checkpoint will be updated with the changes." did not appear after 10 seconds


Add a Checkpoint with Image META Verification Method
    Click Button   ${add_checkpoint_button}
    Click Element    ${checkpoint_verification_dropdown}
    Click Element    ${Image_META_dropdown_option}
    ${current_time}    Get Time    result_format=%Y-%m-%d %H:%M:%S
    ${checkpoint_name}    Set Variable    AutomatedCheckpoint_${current_time}
    Input Text    ${checkpoint_name_text_field}    ${checkpoint_name}
    Log    Checkpoint Name: ${checkpoint_name}
    Upload File While Adding Checkpoint
    Wait Until Page Contains Element    xpath://div[@class='col-md-12 text-center confirmation-title']    60    Page did not contained Not able to fetch location info from uploaded image, please enter latitude and longitude
    Click Element    ${invalid_template_popup_close_button}
    Wait Until Page Contains Element    xpath://img[@class='container-image']    20    Page did not contained the container image
    Input Text    ${Latitude_input_field}    ${Latitude_value}
    Input Text    ${Longitude_input_field}   ${Longitude_value}
    ${description}    Set Variable    AutomatedDescription
    Input Text    ${description_text_field}    ${description}
    Scroll Element Into View    ${Notes_field}
    ${notes}    Set Variable    AutomatedNotes
    Input Text    ${Notes_field}  ${notes}
    ${risk}    Set Variable    AutomatedRisk
    Input Text    ${Risk_field}    ${risk}
    Click Element    ${add_checkpoint_form_save_button}
    Click Element    ${add_checkpoint_form_save_button}
    Wait Until Page Contains    Checkpoint created successfully    10    Page did not contained Checkpoint created successfully



Verify The Checkpoint Details Added For Image META
    [Arguments]    ${checkpoint_name}
    ${checkpoints}    Get Webelements    ${list_of_checkpoints}    #20 checkpoint rows stored hai
    ${checkpoint_index}    Set Variable    1
    FOR    ${checkpoint}    IN    @{checkpoints}
        Exit For Loop If    '${checkpoint_name}' == '${checkpoint.text}'
        ${checkpoint_index}    Evaluate    ${checkpoint_index}+1
    END
    Click Element    xpath:(//button[@id='btn-list-action-view'])[${checkpoint_index}]
    Wait Until Element Is Visible    ${edit_checkpoint_button}    10    edit checkpoint button was not visible
    Sleep    3
    Page Should Contain Element    xpath://img[@class='ng-star-inserted']
    ${expected_texts}    Create List     Image META    AutomatedDescription    5 Meters    AutomatedNotes    AutomatedRisk
    ${locators}    Create List
    ...    xpath://span[text()=' Image META ']
    ...    xpath://span[@class='content-font col-12 span-checkpoint-description']
    ...    xpath:(//span[@class='content-font col-12'])[4]
    ...    xpath://span[@class='content-font col-12 span-checkpoint-notes']
    ...    xpath://span[@class='content-font col-12 span-checkpoint-risk']
    FOR    ${index}    IN RANGE    0    ${expected_texts.__len__()}
        ${expected_text}    Set Variable    ${expected_texts[${index}]}
        ${actual_locator}    Set Variable    ${locators[${index}]}
        Scroll Element Into View      ${actual_locator}
        Sleep    1
        Element Text Should Be    ${actual_locator}    ${expected_text}
    END

#------ANOTHER APPROACH i used------ but last 2 locators are failing that is notes and risk (not added)
#    ${locators}    Create List
#    ...    xpath://span[text()=' Image META ']
#    ...    xpath://span[@class='content-font col-12 span-checkpoint-description']
#    ...    xpath:(//span[@class='content-font col-12'])[4]
#    ...    xpath://span[@class='content-font col-12 span-checkpoint-notes']
#    ...    xpath://span[@class='content-font col-12 span-checkpoint-risk']
#    ${expected_texts}    Create List
#    FOR    ${locator}    IN    @{locators}
#        ${text}    Get Text    ${locator}
#        Append To List    ${expected_texts}    ${text}
#    END
#
#    # Verify the text of each element
#    FOR    ${index}    IN RANGE    0    ${expected_texts.__len__()}
#        ${expected_text}    Set Variable    ${expected_texts[${index}]}
#        ${actual_locator}    Set Variable    ${locators[${index}]}
#        Sleep    2
#        Scroll Element Into View      ${actual_locator}
#        Element Text Should Be    ${actual_locator}    ${expected_text}
#    END



Verify The Checkpoint Details Added For Image META Verification Method
    Navigate To Locations Module
    Sleep    5
    Select The Site  21356
    Sleep    4
    Verify The Checkpoint Details Added For Image META    AutomatedCheckpoint_2024-11-21 12:09:00


Verify Page contains input web elements when Location Tracking is selected as Verification Method
     FOR    ${locator}    IN    @{LocationTracking_Locators}
        Page Should Contain Element    ${locator}    timeout=10
     END
     Log    All location tracking input web elements are visible on the page.

Add a Checkpoint with Location Tracking Verification Method
    Click Button   ${add_checkpoint_button}
    Click Element    ${checkpoint_verification_dropdown}
    Click Element    ${LocationTracking_dropdown_option}
    Verify Page Contains Input Web Elements When Location Tracking Is Selected As Verification Method    #bring this on test suite
    ${current_time}    Get Time    result_format=%Y-%m-%d %H:%M:%S
    ${checkpoint_name}    Set Variable    AutomatedCheckpoint_${current_time}
    Input Text    ${checkpoint_name_text_field}    ${checkpoint_name}
    Log    Checkpoint Name: ${checkpoint_name}
    Input Text    ${Latitude_input_field}    ${Latitude_value}
    Input Text    ${Longitude_input_field}   ${Longitude_value}
    ${description}    Set Variable    AutomatedDescription
    Input Text    ${description_text_field}    ${description}
    Scroll Element Into View    ${Notes_field}
    ${notes}    Set Variable    AutomatedNotes
    Input Text    ${Notes_field}  ${notes}
    ${risk}    Set Variable    AutomatedRisk
    Input Text    ${Risk_field}    ${risk}
    Click Element    ${add_checkpoint_form_save_button}
    Wait Until Page Contains    Checkpoint created successfully    10    Page did not contained Checkpoint created successfully

Edit the checkpoint details added for Location Tracking
    [Arguments]    ${checkpoint_name}
    ${checkpoints}    Get Webelements    ${list_of_checkpoints}
    ${checkpoint_index}    Set Variable    1
    FOR    ${checkpoint}    IN    @{checkpoints}
        Exit For Loop If    '${checkpoint_name}' == '${checkpoint.text}'
        ${checkpoint_index}    Evaluate    ${checkpoint_index}+1
    END
    Click Element    xpath:(//button[@id='btn-list-action-view'])[${checkpoint_index}]
    Wait Until Element Is Visible    ${edit_checkpoint_button}    10    edit checkpoint button was not visible
    Click Element    ${edit_checkpoint_button}
    Clear Element Text    ${checkpoint_name_text_field}
    ${current_time}    Get Time    result_format=%Y-%m-%d %H:%M:%S
    ${checkpoint_name}    Set Variable    AutomatedCheckpoint_${current_time}
    Input Text    ${checkpoint_name_text_field}    ${checkpoint_name}
    Log    Checkpoint Name: ${checkpoint_name}
    Click Element    ${Plot_location_toggle_button}
    Clear Element Text    ${Latitude_input_field}
    Input Text    ${Latitude_input_field}    ${UK_latitude_value}
    Clear Element Text     ${Longitude_input_field}
    Input Text    ${Longitude_input_field}    ${UK_longitude_value}
    Click Element    ${Tolerance_dropdown}
    Click Element    ${30Metre_tolerance_option}
    Clear Element Text    ${description_text_field}
    ${description}    Set Variable    EditedDescription
    Input Text    ${description_text_field}    ${description}
    Scroll Element Into View    ${Notes_field}
    Clear Element Text    ${Notes_field}
    ${notes}    Set Variable    EditedNotes
    Input Text    ${Notes_field}  ${notes}
    Clear Element Text    ${Risk_field}
    ${risk}    Set Variable    EditedRisk
    Input Text    ${Risk_field}    ${risk}
    Click Element    ${add_checkpoint_form_save_button}
    Wait Until Page Contains Element    ${checkpoint_confirm_update_dialog_box}    10    Page did not contained "Updating this checkpoint will affect all upcoming patrol events. Are you sure you want to proceed?" dialog box
    Click Element    ${checkpoint_update_confirmation_button}
    Wait Until Page Contains    Checkpoint successfully updated! All future patrols using this checkpoint will be updated with the changes.    10    The toast message "Checkpoint successfully updated! All future patrols using this checkpoint will be updated with the changes." did not appear after 10 seconds



Verify the checkpoint details after editing the checkpoint added for Location Tracking
    [Arguments]    ${checkpoint_name}
    ${checkpoints}    Get Webelements    ${list_of_checkpoints}
    ${checkpoint_index}    Set Variable    1
    FOR    ${checkpoint}    IN    @{checkpoints}
        Exit For Loop If    '${checkpoint_name}' == '${checkpoint.text}'
        ${checkpoint_index}    Evaluate    ${checkpoint_index}+1
    END
    Click Element    xpath:(//button[@id='btn-list-action-view'])[${checkpoint_index}]
    Wait Until Element Is Visible    ${edit_checkpoint_button}    10    edit checkpoint button was not visible
    Sleep    3
    ${locators}    Create List
    ...    xpath://span[text()=' Location Tracking ']
    ...    xpath:(//span[@class='content-font col-12'])[3]
    ...    xpath:(//span[@class='content-font col-12'])[4]
    ...    xpath://span[@class='content-font col-12 span-checkpoint-description']
    ...    xpath:(//span[@class='content-font col-12'])[5]

    ${expected_texts}    Create List
    FOR    ${locator}    IN    @{locators}
        ${text}    Get Text    ${locator}
        Append To List    ${expected_texts}    ${text}
    END
    FOR    ${index}    IN RANGE    0    ${locators.__len__()}
        ${expected_text}    Set Variable    ${expected_texts[${index}]}
        ${actual_locator}    Set Variable    ${locators[${index}]}
        Scroll Element Into View     ${actual_locator}
        Sleep    1
        Element Text Should Be    ${actual_locator}    ${expected_text}
    END



Editing the checkpoint details added for Image META Verification Method
    [Arguments]    ${checkpoint_name}
    ${checkpoints}    Get Webelements    ${list_of_checkpoints}
    ${checkpoint_index}    Set Variable    1
    FOR    ${checkpoint}    IN    @{checkpoints}
        Exit For Loop If    '${checkpoint_name}' == '${checkpoint.text}'
        ${checkpoint_index}    Evaluate    ${checkpoint_index}+1
    END
    Click Element    xpath:(//button[@id='btn-list-action-view'])[${checkpoint_index}]
    Wait Until Element Is Visible    ${edit_checkpoint_button}    10    edit checkpoint button was not visible
    Click Element    ${edit_checkpoint_button}
    Clear Element Text    ${checkpoint_name_text_field}
    ${current_time}    Get Time    result_format=%Y-%m-%d %H:%M:%S
    ${checkpoint_name}    Set Variable    AutomatedCheckpoint_${current_time}
    Input Text    ${checkpoint_name_text_field}    ${checkpoint_name}
    Log    Checkpoint Name: ${checkpoint_name}
    Scroll Element Into View    ${Plot_location_toggle_button}
    Click Element    ${Plot_location_toggle_button}
    Clear Element Text    ${Latitude_input_field}
    Input Text    ${Latitude_input_field}    ${UK_latitude_value}
    Clear Element Text     ${Longitude_input_field}
    Input Text    ${Longitude_input_field}    ${UK_longitude_value}
    Click Element    ${Tolerance_dropdown}
    Click Element    ${30Metre_tolerance_option}
    Clear Element Text    ${description_text_field}
    ${description}    Set Variable    EditedDescription
    Input Text    ${description_text_field}    ${description}
    Scroll Element Into View    ${Notes_field}
    Clear Element Text    ${Notes_field}
    ${notes}    Set Variable    EditedNotes
    Input Text    ${Notes_field}  ${notes}
    Clear Element Text    ${Risk_field}
    ${risk}    Set Variable    EditedRisk
    Input Text    ${Risk_field}    ${risk}
    Click Element    ${add_checkpoint_form_save_button}
    Wait Until Page Contains Element    ${checkpoint_confirm_update_dialog_box}    10    Page did not contained "Updating this checkpoint will affect all upcoming patrol events. Are you sure you want to proceed?" dialog box
    Click Element    ${checkpoint_update_confirmation_button}
    Wait Until Page Contains    Checkpoint successfully updated! All future patrols using this checkpoint will be updated with the changes.    10    The toast message "Checkpoint successfully updated! All future patrols using this checkpoint will be updated with the changes." did not appear after 10 seconds


Verify the checkpoint details after editing the checkpoint added for Image META
    [Arguments]    ${checkpoint_name}
    ${checkpoints}    Get Webelements    ${list_of_checkpoints}
    ${checkpoint_index}    Set Variable    1
    FOR    ${checkpoint}    IN    @{checkpoints}
        Exit For Loop If    '${checkpoint_name}' == '${checkpoint.text}'
        ${checkpoint_index}    Evaluate    ${checkpoint_index}+1
    END
    Click Element    xpath:(//button[@id='btn-list-action-view'])[${checkpoint_index}]
    Wait Until Element Is Visible    ${edit_checkpoint_button}    10    edit checkpoint button was not visible
    Sleep    3
    ${locators}    Create List
    ...    xpath://span[text()=' Image META ']
    ...    xpath:(//span[@class='content-font col-12'])[3]
    ...    xpath://span[@class='content-font col-12 span-checkpoint-description']
    ...    xpath:(//span[@class='content-font col-12'])[4]
    ${expected_texts}    Create List
    FOR    ${locator}    IN    @{locators}
        ${text}    Get Text    ${locator}
        Append To List    ${expected_texts}    ${text}
    END
    FOR    ${index}    IN RANGE    0    ${locators.__len__()}
        ${expected_text}    Set Variable    ${expected_texts[${index}]}
        ${actual_locator}    Set Variable    ${locators[${index}]}
        Sleep    1
        Scroll Element Into View     ${actual_locator}
        Element Text Should Be    ${actual_locator}    ${expected_text}
    END


Click on the disabled checkpoint
    [Arguments]    ${checkpoint_name}
    ${checkpoints}    Get Webelements    ${list_of_checkpoints}
    ${checkpoint_index}    Set Variable    1
    FOR    ${checkpoint}    IN    @{checkpoints}
        Exit For Loop If    '${checkpoint_name}' == '${checkpoint.text}'
        ${checkpoint_index}    Evaluate    ${checkpoint_index}+1
    END
    Click Element    xpath:(//button[@id='btn-list-action-view'])[${checkpoint_index}]
    Wait Until Element Is Visible    ${edit_checkpoint_button}    10    edit checkpoint button was not visible
    
    
Click on the enabled checkpoint
    [Arguments]    ${checkpoint_name}
    ${checkpoints}    Get Webelements    ${list_of_checkpoints}
    ${checkpoint_index}    Set Variable    1
    FOR    ${checkpoint}    IN    @{checkpoints}
        Exit For Loop If    '${checkpoint_name}' == '${checkpoint.text}'
        ${checkpoint_index}    Evaluate    ${checkpoint_index}+1
    END
    Click Element    xpath:(//button[@id='btn-list-action-view'])[${checkpoint_index}]
    Wait Until Element Is Visible    ${edit_checkpoint_button}    10    edit checkpoint button was not visible
    
        

Verifying the Disabling of checkpoint
    [Arguments]    ${checkpoint_name}
    ${checkpoints}    Get Webelements    ${list_of_checkpoints}
    ${checkpoint_index}    Set Variable    1
    FOR    ${checkpoint}    IN    @{checkpoints}
        Exit For Loop If    '${checkpoint_name}' == '${checkpoint.text}'
        ${checkpoint_index}    Evaluate    ${checkpoint_index}+1
    END
    Click Element    xpath:(//button[@id='btn-list-action-view'])[${checkpoint_index}]
    Wait Until Element Is Visible    ${edit_checkpoint_button}    10    edit checkpoint button was not visible
    Click Element    ${Enable_disable_Toggle_button}
    Wait Until Page Contains    Checkpoint disabled successfully    10    checkpoint did not contained Checkpoint disabled successfully toast message
    Select The Site    21356
    Click On The Disabled Checkpoint     AutomatedCheckpoint_2024-12-02 16:22:25
    Wait Until Page Contains Element    ${Button_disabled}    10    Did not contained Disabled as a text which it should

Verifying the Enabling of checkpoint
    [Arguments]    ${checkpoint_name}
    ${checkpoints}    Get Webelements    ${list_of_checkpoints}
    ${checkpoint_index}    Set Variable    1
    FOR    ${checkpoint}    IN    @{checkpoints}
        Exit For Loop If    '${checkpoint_name}' == '${checkpoint.text}'
        ${checkpoint_index}    Evaluate    ${checkpoint_index}+1
    END
    Click Element    xpath:(//button[@id='btn-list-action-view'])[${checkpoint_index}]
    Wait Until Element Is Visible    ${edit_checkpoint_button}    10    edit checkpoint button was not visible
    Click Element    ${Enable_disable_Toggle_button}
    Wait Until Page Contains    Checkpoint activated successfully   10    checkpoint did not contained Checkpoint activated successfully toast message
    Select The Site    21356
    Click On The Enabled Checkpoint    AutomatedCheckpoint_2024-12-02 16:22:25
    Wait Until Page Contains Element    ${Button_enabled}   10     Did not contained Active as a text which it should











    



    























    














