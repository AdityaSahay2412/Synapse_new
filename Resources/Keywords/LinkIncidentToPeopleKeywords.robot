#*** Settings ***
#Documentation    this is a testing file for data comparison feature
#Library    Selenium2Library
#Library    Collections
#Library    String
#Resource    General.robot
#Resource    ../Variables.robot
#Resource    ../DataComparisonVariables.robot
#Resource    ../LinkIncidentToPeopleVariables.robot
#Resource    ../Keywords/SearchKeywords.robot
##Resource    ../WidgetExportVariables.robot
#
#
#*** Keywords ***
#Navigate to People Dashboard Page and Verify the People data is loaded
#    Wait Until Element Is Visible    ${Peoples_dashboard_page}    15    People dashboard page is not visible
#    Click Element    ${Peoples_dashboard_page}
#    Wait Until Page Contains Element    ${People_dashboard_page_title}    15    People dashboard page header is not visible
#    Wait Until Element Is Visible    ${People_widget}    20    People widget is not visible
#    Wait Until Element Is Visible    ${People_data}    30    People data was not loaded
#
#
#Click On People To Open the Preview Page
#    Wait Until Element Is Visible    ${People_data}    30    People data is not visible on the people dashboard page
#    Click Element    ${People_data}
#    Wait Until Page Contains Element    ${People_preview_page}    15    People preview page is not visible
#    Wait Until Element Is Visible    ${People_name}    10    People name is not visible on the people preview page
#
#
#Verify Link/Unlink Button Is Visible on the People Preview Page when the feature flag is on and verify other UI Elements
#    Wait Until Element Is Visible    ${Link/Unlink_button}    10    Link/Unlink button is not visible on the people preview page
#    Click Element    ${Link/Unlink_button}
#    @{expected_elements}    Create List
#    ...    ${Link/Unlink People To Events header}
#    ...    ${Select events to link to people text}
#    ...    ${Incidents_dropdown}
#    ...    ${Cancel_link_button}
#    ...    ${Link_button}
#    FOR    ${element}    IN    @{expected_elements}
#        Wait Until Element Is Visible    ${element}    15    ${element} is not visible on the link/unlink incident on people preview page
#    END
#
#
#Verify Link/Unlink Button Is not Visible on the People Preview Page when the feature flag is off
#     Page Should Not Contain Element    ${Link/Unlink_button}    Link/Unlink button should not be visible when the feature flag is OFF
#
#Click On Link/Unlink Incident Button
#    Wait Until Element Is Visible    ${Link/Unlink_button}    10    Link/Unlink button is not visible on the people preview page
#    Click Element    ${Link/Unlink_button}
#    
#Link the incident to the people
#    Wait Until Element Is Visible    ${Incidents_dropdown}    10    Incidents dropdown is not visible on the link/unlink incident on people preview page
#    Click Element    ${Incidents_dropdown}
#    Input Text    ${Incident_dropdown_search_box}    ${AA_category_incident}
#    ${Selected_incident_reference_number}    Get Text    ${Alarm_activations_incident_reference_number}
#    Log To Console    Selected incident reference number is: ${Selected_incident_reference_number}
#    Set Suite Variable    ${Selected_incident_reference_number}    ${Selected_incident_reference_number}
#    Click Element    ${Alarm_activations_incident_reference_number}
#    Press Keys    ${None}    ESC
#    ${Selected_incident_reference_number_shown_after_selection}    Get Text    xpath://span[@class='mbsc-textfield-tag-text mbsc-material']
#    Should Be Equal    ${Selected_incident_reference_number}    ${Selected_incident_reference_number_shown_after_selection}    Selected incident reference number is not shown after selection
#    Wait Until Element Is Visible    ${Link_button}    10    Link button is not visible on the link/unlink incident on people preview page
#    Click Element    ${Link_button}
#    Run Keyword And Return Status    Page Should Contain    ${Event_linked_successfully_toast_message}
#
#Verify the incident is successfully linked to the people
#    Click On Link/Unlink Incident Button
#    Log To Console    Verifying that incident ${Selected_incident_reference_number} is linked to the person
#    Page Should Contain    ${Selected_incident_reference_number}
#
#Verify Dropdown Is Visible To Search Incidents Reference
#        Wait Until Element Is Visible    ${Incidents_dropdown}    10    Incidents dropdown is not visible on the link/unlink incident on people preview page
#
#Search Incident With Partial Input
#    Wait Until Element Is Visible    ${Incidents_dropdown}    10    Incidents dropdown is not visible on the link/unlink incident on people preview page
#    Click Element    ${Incidents_dropdown}
#    Input Text    ${Incident_dropdown_search_box}    ${AA_category_incident}
#    @{all_incidents_references}    Get WebElements    ${dropdown_options}
#    @{extracted_incident_reference_numbers}    Create List
#    FOR    ${element}    IN    @{all_incidents_references}[0:10]
#        ${text}=    Get Text    ${element}
#        Append To List    ${extracted_incident_reference_numbers}    ${text}
#    END
#    Log To Console    ===== First 7 Incident Reference Numbers =====
#    FOR    ${item}    IN    @{extracted_incident_reference_numbers}
#        Log To Console    ${item}
#    END
#
#
#Link Multiple Incidents To The People
#    Wait Until Element Is Visible    ${Incidents_dropdown}    10    Incidents dropdown is not visible on the link/unlink incident on people preview page
#    Click Element    ${Incidents_dropdown}
#    Input Text    ${Incident_dropdown_search_box}    ${AA_category_incident}
#    ${Selected_incident_reference_number}    Get Text    ${Alarm_activations_incident_reference_number}
#    Log To Console    Selected incident reference number is: ${Selected_incident_reference_number}
#    ${Second_selected_incident_reference_number}    Get Text    ${Alarm_activation_incident_second_reference_number}
#    Log To Console    Second Selected incident reference number is: ${Second_Selected_incident_reference_number}
#    Set Suite Variable    ${Selected_incident_reference_number}    ${Selected_incident_reference_number}
#    Set Suite Variable    ${Second_selected_incident_reference_number}    ${Second_selected_incident_reference_number}
#    Click Element    ${Alarm_activations_incident_reference_number}
#    Click Element    ${Alarm_activation_incident_second_reference_number}
#    Press Keys    ${None}    ESC
#    @{Selected_incident_reference_number_shown_after_selection}    Get WebElements    xpath://span[@class='mbsc-textfield-tag-text mbsc-material']
#    ${shown_references}    Create List
#    FOR    ${element}    IN    @{Selected_incident_reference_number_shown_after_selection}
#        ${text}    Get Text    ${element}
#        Log To Console    Found selected reference: ${text}
#        Append To List    ${shown_references}    ${text}
#    END
#    Log To Console    All shown references: ${shown_references}
#    ${expected_references}    Create List    ${Selected_incident_reference_number}    ${Second_selected_incident_reference_number}
#    Log To Console    Expected references: ${expected_references}
#    Lists Should Be Equal    ${expected_references}    ${shown_references}    The selected incident references do not match those shown in the UI
#    Wait Until Element Is Visible    ${Link_button}    10    Link button is not visible on the link/unlink incident on people preview page
#    Click Element    ${Link_button}
#    Run Keyword And Return Status    Page Should Contain    ${Event_linked_successfully_toast_message}
#
#
#Verify The Multiple Incidents Are Successfully Linked To The People
#    Click On Link/Unlink Incident Button
#    Log To Console    Verifying that incident ${Selected_incident_reference_number} is linked to the person
#    Page Should Contain    ${Selected_incident_reference_number}
#    Log To Console    Verifying that incident ${Second_selected_incident_reference_number} is linked to the person
#    Page Should Contain    ${Second_selected_incident_reference_number}
#    
#
#Extract the person name from people preview page
#    ${first_name}    Get Text    ${People_first_name} 
#    ${last_name}    Get Text    ${People_last_name}
#    Set Suite Variable    ${first_name}    ${first_name}
#    Set Suite Variable    ${last_name}    ${last_name}
#    Click On Link/Unlink Incident Button
#    Link the incident to the people
#    Click On Link/Unlink Incident Button
#    ${extracted_incident_reference}    Get Text    ${incident_reference}
#    Set Suite Variable    ${extracted_incident_reference}    ${extracted_incident_reference}
#    Click Element    ${Cancel_link_button}
#
#Navigate to Search Module and search for the Linked people incident
#    Navigate To Search Page
#    wait until element is visible  ${SEARCH_TEXTFIELD}   15  Search text field is not visible
#    input text  ${SEARCH_TEXTFIELD}    ${extracted_incident_reference}
#    Click Element    ${search_button}
#    Wait Until Page Contains    ${extracted_incident_reference}   15   Search results are not shown
#    Click Element    ${search_module_view_event_button}
#    
#Go to Involved Entities Tab and verify the linked people presence
#    Wait Until Page Contains Element    ${incident_view_header}    15    Incident view header is not visible
#    Sleep    2
#    Click Element    ${involved_entities_tab}
#    Wait Until Element Is Visible    ${People_widget}    10    People widget is not visible
#    Wait Until Element Is Visible    ${People_data}    15    People data was not loaded
#    Wait Until Page Contains    ${first_name}    20    Linked person ${first_name} is not visible under Involved Entities tab.
#    Wait Until Page Contains    ${last_name}    20    Linked person ${last_name} is not visible under Involved Entities tab.
#    Log To Console    Linked person ${first_name} ${last_name} is visible under Involved Entities tab of the linked incident






















*** Settings ***
Documentation    this is a testing file for data comparison feature
Library    Selenium2Library
Library    Collections
Library    String
Resource    General.robot
Resource    ../Variables.robot
Resource    ../DataComparisonVariables.robot
Resource    ../LinkIncidentToPeopleVariables.robot
Resource    ../Keywords/SearchKeywords.robot
#Resource    ../WidgetExportVariables.robot


*** Keywords ***
Navigate to People Dashboard Page and Verify the People data is loaded
    Wait Until Element Is Visible    ${Peoples_dashboard_page}    15    People dashboard page is not visible
#    Click Element    ${Peoples_dashboard_page}
    Wait Until Page Contains Element    ${People_dashboard_page_title}    15    People dashboard page header is not visible
    Wait Until Element Is Visible    ${People_widget}    20    People widget is not visible
    Wait Until Page Contains Element    ${People_data}    30    people data was not loaded



Click On People To Open the Preview Page
#    Wait Until Element Is Visible    xpath:(//div[@class='grid-view-card'])[1]    30    People card is not visible on the people dashboard page
    Wait Until Element Is Visible    ${People_data}    30    People data is not visible on the people dashboard page
    Click Element    ${People_data}
    Wait Until Page Contains Element    ${People_preview_page}    15    People preview page is not visible
    Wait Until Element Is Visible    ${People_name}    10    People name is not visible on the people preview page


Verify Link/Unlink Button Is Visible on the People Preview Page when the feature flag is on and verify other UI Elements
    Wait Until Element Is Visible    ${Link/Unlink_button}    10    Link/Unlink button is not visible on the people preview page
    Click Element    ${Link/Unlink_button}
    @{expected_elements}    Create List
    ...    ${Link/Unlink People To Events header}
    ...    ${Select events to link to people text}
    ...    ${Incidents_dropdown}
    ...    ${Cancel_link_button}
    ...    ${Link_button}
    FOR    ${element}    IN    @{expected_elements}
        Wait Until Element Is Visible    ${element}    15    ${element} is not visible on the link/unlink incident on people preview page
    END


Verify Link/Unlink Button Is not Visible on the People Preview Page when the feature flag is off
     Page Should Not Contain Element    ${Link/Unlink_button}    Link/Unlink button should not be visible when the feature flag is OFF

Click On Link/Unlink Incident Button
    Sleep    2
    Wait Until Element Is Visible    ${Link/Unlink_button}    10    Link/Unlink button is not visible on the people preview page
    Click Element    ${Link/Unlink_button}
    
Link the incident to the people
    Wait Until Element Is Visible    ${Incidents_dropdown}    10    Incidents dropdown is not visible on the link/unlink incident on people preview page
    Click Element    ${Incidents_dropdown}
    Input Text    ${Incident_dropdown_search_box}    ${AA_category_incident}
    ${Selected_incident_reference_number}    Get Text    ${Alarm_activations_incident_reference_number}
    Log To Console    Selected incident reference number is: ${Selected_incident_reference_number}
    Set Suite Variable    ${Selected_incident_reference_number}    ${Selected_incident_reference_number}
    Click Element    ${Alarm_activations_incident_reference_number}
    Press Keys    ${None}    ESC
    ${Selected_incident_reference_number_shown_after_selection}    Get Text    xpath://span[@class='mbsc-textfield-tag-text mbsc-material']
    Should Be Equal    ${Selected_incident_reference_number}    ${Selected_incident_reference_number_shown_after_selection}    Selected incident reference number is not shown after selection
    Wait Until Element Is Visible    ${Link_button}    10    Link button is not visible on the link/unlink incident on people preview page
    Click Element    ${Link_button}
    Run Keyword And Return Status    Page Should Contain    ${Event_linked_successfully_toast_message}

Verify the incident is successfully linked to the people
    Click On Link/Unlink Incident Button
    Log To Console    Verifying that incident ${Selected_incident_reference_number} is linked to the person
    Page Should Contain    ${Selected_incident_reference_number}

Verify Dropdown Is Visible To Search Incidents Reference
        Wait Until Element Is Visible    ${Incidents_dropdown}    10    Incidents dropdown is not visible on the link/unlink incident on people preview page

Search Incident With Partial Input
    Wait Until Element Is Visible    ${Incidents_dropdown}    10    Incidents dropdown is not visible on the link/unlink incident on people preview page
    Click Element    ${Incidents_dropdown}
    Input Text    ${Incident_dropdown_search_box}    ${AA_category_incident}
    @{all_incidents_references}    Get WebElements    ${dropdown_options}
    @{extracted_incident_reference_numbers}    Create List
    FOR    ${element}    IN    @{all_incidents_references}[0:10]
        ${text}=    Get Text    ${element}
        Append To List    ${extracted_incident_reference_numbers}    ${text}
    END
    Log To Console    ===== First 7 Incident Reference Numbers =====
    FOR    ${item}    IN    @{extracted_incident_reference_numbers}
        Log To Console    ${item}
    END


Link Multiple Incidents To The People
    Wait Until Element Is Visible    ${Incidents_dropdown}    10    Incidents dropdown is not visible on the link/unlink incident on people preview page
    Click Element    ${Incidents_dropdown}
    Input Text    ${Incident_dropdown_search_box}    ${AA_category_incident}
    ${Selected_incident_reference_number}    Get Text    ${Alarm_activations_incident_reference_number}
    Log To Console    Selected incident reference number is: ${Selected_incident_reference_number}
    ${Second_selected_incident_reference_number}    Get Text    ${Alarm_activation_incident_second_reference_number}
    Log To Console    Second Selected incident reference number is: ${Second_Selected_incident_reference_number}
    Set Suite Variable    ${Selected_incident_reference_number}    ${Selected_incident_reference_number}
    Set Suite Variable    ${Second_selected_incident_reference_number}    ${Second_selected_incident_reference_number}
    Click Element    ${Alarm_activations_incident_reference_number}
    Click Element    ${Alarm_activation_incident_second_reference_number}
    Press Keys    ${None}    ESC
    @{Selected_incident_reference_number_shown_after_selection}    Get WebElements    xpath://span[@class='mbsc-textfield-tag-text mbsc-material']
    ${shown_references}    Create List
    FOR    ${element}    IN    @{Selected_incident_reference_number_shown_after_selection}
        ${text}    Get Text    ${element}
        Log To Console    Found selected reference: ${text}
        Append To List    ${shown_references}    ${text}
    END
    Log To Console    All shown references: ${shown_references}
    ${expected_references}    Create List    ${Selected_incident_reference_number}    ${Second_selected_incident_reference_number}
    Log To Console    Expected references: ${expected_references}
    Lists Should Be Equal    ${expected_references}    ${shown_references}    The selected incident references do not match those shown in the UI
    Wait Until Element Is Visible    ${Link_button}    10    Link button is not visible on the link/unlink incident on people preview page
    Click Element    ${Link_button}
    Run Keyword And Return Status    Page Should Contain    ${Event_linked_successfully_toast_message}


Verify The Multiple Incidents Are Successfully Linked To The People
    Click On Link/Unlink Incident Button
    Log To Console    Verifying that incident ${Selected_incident_reference_number} is linked to the person
    Page Should Contain    ${Selected_incident_reference_number}
    Log To Console    Verifying that incident ${Second_selected_incident_reference_number} is linked to the person
    Page Should Contain    ${Second_selected_incident_reference_number}
    

Extract the person name from people preview page
    ${first_name}    Get Text    ${People_first_name} 
    ${last_name}    Get Text    ${People_last_name}
    Set Suite Variable    ${first_name}    ${first_name}
    Set Suite Variable    ${last_name}    ${last_name}
    Click On Link/Unlink Incident Button
    Link the incident to the people
    Click On Link/Unlink Incident Button
    ${extracted_incident_reference}    Get Text    ${incident_reference}
    Set Suite Variable    ${extracted_incident_reference}    ${extracted_incident_reference}
    Click Element    ${Cancel_link_button}

Navigate to Search Module and search for the Linked people incident
    Navigate To Search Page
    wait until element is visible  ${SEARCH_TEXTFIELD}   15  Search text field is not visible
    input text  ${SEARCH_TEXTFIELD}    ${extracted_incident_reference}
    Click Element    ${search_button}
    Wait Until Page Contains    ${extracted_incident_reference}   15   Search results are not shown
    Click Element    ${search_module_view_event_button}
    
Go to Involved Entities Tab and verify the linked people presence
    Wait Until Page Contains Element    ${incident_view_header}    15    Incident view header is not visible
    Sleep    2
    Click Element    ${involved_entities_tab}
    Wait Until Element Is Visible    ${People_widget}    10    People widget is not visible
    Wait Until Element Is Visible    ${People_data}    15    People data was not loaded
    Wait Until Page Contains    ${first_name}    20    Linked person ${first_name} is not visible under Involved Entities tab.
    Wait Until Page Contains    ${last_name}    20    Linked person ${last_name} is not visible under Involved Entities tab.
    Log To Console    Linked person ${first_name} ${last_name} is visible under Involved Entities tab of the linked incident


Go to Involved Entities Tab and verify the linked witness presence
    Wait Until Page Contains Element    ${incident_view_header}    15    Incident view header is not visible
    Sleep    2
    Click Element    ${involved_entities_tab}
    Sleep    3
    Wait Until Element Is Visible    ${witness_tab_ubder_involved_entities}    10    Witness tab is not visible under Involved Entities tab
    Click Element    ${witness_tab_ubder_involved_entities}
    Wait Until Element Is Visible    ${People_widget}    10    People widget is not visible
    Wait Until Element Is Visible    ${People_data}    15    People data was not loaded
    Wait Until Page Contains    ${first_name}    20    Linked person ${first_name} is not visible under Involved Entities tab.
    Wait Until Page Contains    ${last_name}    20    Linked person ${last_name} is not visible under Involved Entities tab.
    Log To Console    Linked person ${first_name} ${last_name} is visible under Involved Entities tab of the linked incident



Go to Involved Entities Tab and verify the linked victim presence
    Wait Until Page Contains Element    ${incident_view_header}    15    Incident view header is not visible
    Sleep    2
    Click Element    ${involved_entities_tab}
    Sleep    3
    Wait Until Element Is Visible    ${victim_tab_ubder_involved_entities}    10    Witness tab is not visible under Involved Entities tab
    Click Element    ${victim_tab_ubder_involved_entities}
    Wait Until Element Is Visible    ${People_widget}    10    People widget is not visible
    Wait Until Element Is Visible    ${People_data}    15    People data was not loaded
    Wait Until Page Contains    ${first_name}    20    Linked person ${first_name} is not visible under Involved Entities tab.
    Wait Until Page Contains    ${last_name}    20    Linked person ${last_name} is not visible under Involved Entities tab.
    Log To Console    Linked person ${first_name} ${last_name} is visible under Involved Entities tab of the linked incident




Naviagte to People dahsboard page and verify the witness data is loaded
#    Wait Until Element Is Visible    ${Peoples_dashboard_page}    15    People dashboard page is not visible
#    Click Element    ${Peoples_dashboard_page}
    Sleep    5
    Wait Until Element Is Visible    ${witness_tab}    10    Witness tab is not visible on the people dashboard page
    Click Element    ${witness_tab}
    Sleep    5
    Wait Until Element Is Visible    ${People_widget}    20    People widget is not visible
    Wait Until Element Is Visible    ${People_data}    30    People data was not loaded



Navigate to People dahsboard page and verify the victim data is loaded
    Sleep    5
    Wait Until Element Is Visible    ${victim_tab}    10    Witness tab is not visible on the people dashboard page
    Click Element    ${victim_tab}
    Sleep    5
    Wait Until Element Is Visible    ${People_widget}    20    People widget is not visible
    Wait Until Element Is Visible    ${People_data}    30    People data was not loaded

Unlink the incident from people(suspect) preview page
    Wait Until Element Is Visible    ${first_incident_to_unlink}    10    Incident to unlink is not visible on the link/unlink incident on people preview page
    ${incident_to_unlink}    Get Text    ${first_incident_to_unlink}
    Log To Console    the incident selected to unlink is: ${incident_to_unlink}
    Set Suite Variable    ${incident_to_unlink}    ${incident_to_unlink}
    Click Element    ${first_incident_delink_button}
    Wait Until Element Is Visible    ${delink_confirmation_dialog_box}    10    Confirmation dialog is not visible after clicking delink button
    Click Element    ${delink_yes_option}
    Element Should Not Be Visible    xpath=//*[contains(text(), '${incident_to_unlink}')]
    Wait Until Page Contains    ${Event_unlinked_successfully_toast_message}
    Wait Until Element Is Visible    ${Cancel_link_button}  10  Cancel button is not visible on the link/unlink incident on people preview page
    Click Element    ${Cancel_link_button}


Navigate to Search Module and search for the unlinked people incident
    Navigate To Search Page
    wait until element is visible  ${SEARCH_TEXTFIELD}   15  Search text field is not visible
    input text  ${SEARCH_TEXTFIELD}    ${incident_to_unlink}
    Click Element    ${search_button}
    Wait Until Page Contains    ${incident_to_unlink}  15   Search results are not shown
    Click Element    ${search_module_view_event_button}


Extract the person name which has to be unliked from people preview page
    ${unlink_people_first_name}    Get Text    ${People_first_name}
    ${unlink_people_last_name}    Get Text    ${People_last_name}
    Set Suite Variable  ${unlink_people_first_name}   ${unlink_people_first_name}
    Set Suite Variable  ${unlink_people_last_name}    ${unlink_people_last_name}


Go to Involved Entities Tab and verify the linked suspect absence
    Wait Until Page Contains Element    ${incident_view_header}    15    Incident view header is not visible
    Sleep    2
    Click Element    ${involved_entities_tab}
    Wait Until Element Is Visible    ${People_widget}    10    People widget is not visible
    Element Should Not Be Visible     xpath=//*[contains(text(), '${unlink_people_first_name}')]
    Element Should Not Be Visible     xpath=//*[contains(text(), '${unlink_people_last_name}')]
    Log To Console    Unlinked person ${unlink_people_first_name} ${unlink_people_last_name} is not visible under Involved Entities tab of the unlinked incident as expected


Unlink the incident from people(witness) preview page
    Wait Until Element Is Visible    ${first_incident_to_unlink}    10    Incident to unlink is not visible on the link/unlink incident on people preview page
    ${incident_to_unlink}    Get Text    ${first_incident_to_unlink}
    Log To Console    the incident selected to unlink is: ${incident_to_unlink}
    Set Suite Variable    ${incident_to_unlink}    ${incident_to_unlink}
    Click Element    ${first_incident_delink_button}
    Wait Until Element Is Visible    ${delink_confirmation_dialog_box}    10    Confirmation dialog is not visible after clicking delink button
    Click Element    ${delink_yes_option}
    Element Should Not Be Visible    xpath=//*[contains(text(), '${incident_to_unlink}')]
    Wait Until Page Contains    ${Event_unlinked_successfully_toast_message}
    Wait Until Element Is Visible    ${Cancel_link_button}  10  Cancel button is not visible on the link/unlink incident on people preview page
    Click Element    ${Cancel_link_button}



Go to Involved Entities Tab and verify the linked witness absence
    Wait Until Page Contains Element    ${incident_view_header}    15    Incident view header is not visible
    Sleep    2
    Click Element    ${involved_entities_tab}
    Wait Until Element Is Visible    ${People_widget}    10    People widget is not visible
    Wait Until Element Is Visible    ${witness_tab_ubder_involved_entities_post_unlink}    10    Witness tab is not visible under Involved Entities tab
    Click Element    ${victim_tab_under_involved_entities}
    Sleep    1
    Click Element    ${witness_tab_ubder_involved_entities_post_unlink}
#    Page Should Not Contain    ${unlink_people_first_name}
    Element Should Not Be Visible     xpath=//*[contains(text(), '${unlink_people_first_name}')]  
    Element Should Not Be Visible     xpath=//*[contains(text(), '${unlink_people_last_name}')]
#    Page Should Not Contain    ${unlink_people_last_name}
    Log To Console    Unlinked person ${unlink_people_first_name} ${unlink_people_last_name} is not visible under Involved Entities tab of the unlinked incident as expected



Unlink the incident from people(victim) preview page
    Wait Until Element Is Visible    ${first_incident_to_unlink}    10    Incident to unlink is not visible on the link/unlink incident on people preview page
    ${incident_to_unlink}    Get Text    ${first_incident_to_unlink}
    Log To Console    the incident selected to unlink is: ${incident_to_unlink}
    Set Suite Variable    ${incident_to_unlink}    ${incident_to_unlink}
    Click Element    ${first_incident_delink_button}
    Wait Until Element Is Visible    ${delink_confirmation_dialog_box}    10    Confirmation dialog is not visible after clicking delink button
    Click Element    ${delink_yes_option}
    Element Should Not Be Visible    xpath=//*[contains(text(), '${incident_to_unlink}')]
    Wait Until Page Contains    ${Event_unlinked_successfully_toast_message}
    Wait Until Element Is Visible    ${Cancel_link_button}  10  Cancel button is not visible on the link/unlink incident on people preview page
    Click Element    ${Cancel_link_button}


Go to Involved Entities Tab and verify the linked victim absence
    Wait Until Page Contains Element    ${incident_view_header}    15    Incident view header is not visible
    Sleep    2
    Click Element    ${involved_entities_tab}
    Wait Until Element Is Visible    ${People_widget}    10    People widget is not visible
    Wait Until Element Is Visible    ${witness_tab_ubder_involved_entities_post_unlink}    10    Witness tab is not visible under Involved Entities tab
    Click Element    ${witness_tab_ubder_involved_entities_post_unlink}
    Wait Until Element Is Visible    ${victim_tab_under_involved_entities}    10    Victim tab is not visible under Involved Entities tab
    Sleep    1
    Click Element    ${victim_tab_under_involved_entities}
    Sleep    1
#    Page Should Not Contain    ${unlink_people_first_name}
    Element Should Not Be Visible     xpath=//*[contains(text(), '${unlink_people_first_name}')]
    Element Should Not Be Visible     xpath=//*[contains(text(), '${unlink_people_last_name}')]
#    Page Should Not Contain    ${unlink_people_last_name}
    Log To Console    Unlinked person ${unlink_people_first_name} ${unlink_people_last_name} is not visible under Involved Entities tab of the unlinked incident as expected


