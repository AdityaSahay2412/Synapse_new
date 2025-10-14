*** Settings ***
Library    Selenium2Library
Library    Collections
Library    DateTime
Resource   ../Variables.robot
Resource   General.robot

*** Keywords ***
Navigate To Search Page
    wait until element is visible  ${SEARCH_MODULE}  5  Search mobule is not shown
    click element   ${SEARCH_MODULE}

Verify Search Page Elements
    [Documentation]    Verifies elements on the Search page.
    Wait Until Element Is Visible    ${SEARCH_HEADER}  30   Search header is not shown in Search Page
    @{Search_Locators} =     Create List    ${SEARCH_TEXTFIELD}    ${SEARCH_BUTTON}   ${PREVIOUS_SEARCH_LABEL}   ${CLEAR_ALL_BUTTON}
                         ...      ${SEARCHED_ITEMS}  ${SEARCHED_RESULT}   ${EDIT_SEARCHED_RESULT}  ${VIEW_SEARCHED_RESULT}
    General.Verify_Elements_In_Page  @{Search_Locators}

Search For Event
    [Arguments]  ${ID}
    wait until element is visible  ${SEARCH_TEXTFIELD}   10  Search text field is not visible
    input text  ${SEARCH_TEXTFIELD}  ${ID}
    sleep  2
    click element  ${SEARCH_BUTTON}
    Wait For Condition    return document.readyState == 'complete'    timeout=10s
    FOR    ${i}    IN RANGE    1    10
        sleep  2
        ${shown}  run keyword and return status   element should be visible   ${SEARCHED_RESULT}
        run keyword if    '${shown}'=='False'    press keys    None     ENTER
        run keyword if    '${i}'=='8'    reload page and allow location access
        run keyword if    '${i}'=='8'    click element  ${SEARCHED_ITEMS}
        run keyword if    '${shown}'=='True'    exit for loop
        run keyword if    '${i}'=='9'    fail  Failed to display the searched item even after retrying multiple times
        sleep  2
    END

View The Searched Event
    wait until element is visible  ${VIEW_SEARCHED_RESULT}   10  View button for searched event is not shown
    click element  ${VIEW_SEARCHED_RESULT}

Edit The Searched Event
    wait until element is visible  ${EDIT_SEARCHED_RESULT}   10  Edit button for searched event is not shown
    click element  ${EDIT_SEARCHED_RESULT}

