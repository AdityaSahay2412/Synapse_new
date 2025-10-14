*** Settings ***
Resource    ../Resources/WidgetExportVariables.robot
Resource    ../Resources/Keywords/General.robot
Resource    ../Resources/Keywords/NewEventKeywords.robot
Resource    ../Resources/Keywords/SearchKeywords.robot
Resource    ../Resources/Keywords/TasksKeywords.robot
Resource    ../Resources/Keywords/DashboardKeywords.robot
Resource    ../Resources/Keywords/WidgetExportKeywords.robot

Suite Setup      Open the synapse analyst url
Test Setup       Go To Home Page
Test Teardown    Stop Test Case Recording
Suite Teardown   Close Browser

*** Test Cases ***
Verify Elements In Add New Event Page
    [Documentation]    Test the New Event page elements
    [Tags]  Add-Event
    Navigate To New Event Page
    Verify New Event Page Elements

Verify Elements In Map While Adding A New Event
    [Documentation]    Test the Map elements
    [Tags]  Add-Event
     Navigate To New Event Page
    Select Event Category  Alarm Activations
    Select Event Outcome  Activated Alarms
    Select Event Type   Alarm Not Set
    sleep  2
    Click On Next Button
    Select Locate Me Option And Verify Map Elements

Add Event WorkFlow
    [Documentation]    Test to add a event of 'Alarm Activations' category, 'Activated Alarms' Outcome and 'Alarm Not Set' Type
    [Tags]  Add-Event
    Navigate To New Event Page
    Select Event Category  Alarm Activations
    Select Event Outcome  Activated Alarms
    Verify Alarm Outcome Types
    Select Event Type   Alarm Not Set
    Verify Save Button is shown
    Go To Who Is Reporter Question And Verify Options
    Verify Reporter Step Is Completed
    Click On Next Button
    Verify Investigate Stage Title And Count Is Shown
    Verify Detail Step Title Is Shown
    Select Locate Me Option In Map
    Go To Describe Specific Location And Answer
    Verify Location Step Is Completed
    Click On Next Button
    Verify Specific Details Group Title
    Verify Detail Step Is Completed
    Click On Next Button
    Go To Add People To Incident And Select No Option
    Verify Involved Entities Step Is Completed
    Click On Submit Button
    Verify Confirmation Popup And Select Proceed Option
    Verify Toast Message for Event Created Successfull
    Verify Event Created Successfully

Verify Elements In Event Overview Page after Adding A New Event
    [Documentation]    Test to Verify Event overview page elements after adding a new event
    [Tags]  Add-Event
    Navigate To New Event Page
    Select Event Category  Alarm Activations
    Select Event Outcome  Activated Alarms
    Select Event Type   Alarm Not Set
    Verify Reporter Step Is Completed
    Click On Next Button
    Select Locate Me Option In Map
    Verify Location Step Is Completed
    Click On Next Button
    Verify Detail Step Is Completed
    Click On Next Button
    Verify Involved Entities Step Title Is Shown
    Verify Associated With Group Title
    Go To Add People To Incident And Select No Option
    Verify Involved Entities Step Is Completed
    Click On Submit Button
    Verify Confirmation Popup And Select Proceed Option
    Verify Toast Message for Event Created Successfull
    Verify Event Created Successfully
    Verify Elements In Event Overview Page

Add Event WorkFlow Without Event Cost
    [Documentation]    Test to Verify adding a new event without adding event cost and verify the elements in Add cost slideout form
    [Tags]  Add-Event
    Navigate To New Event Page
    Select Event Category  Security & Crime
    Select Event Outcome  Violence
    Select Event Type   Verbal Abuse
    Verify Reporter Step Is Completed
    Click On Next Button
    Select Locate Me Option In Map
    Verify Location Step Is Completed
    Click On Next Button
    Verify Detail Step Is Completed
    Click On Next Button
    Verify Assessment Step Title Is Shown
    Go To Invoved Entities Step
    Go To Add People To Incident And Select No Option
    Go To Add Cost Question And Select Yes Option
    Increment The Product Number
    Verify Cost Slideout And Its Elements
    Click On Cancel Button In Add Cost Slideout
    Verify Popup And Select Yes Leave Option
    Go To Add Cost Question And Select No Option
    Click On Submit Button
    Verify Confirmation Popup And Select Proceed Option
    Verify Toast Message for Event Created Successfull
    Verify Event Created Successfully


Add Event WorkFlow With Event Cost
    [Documentation]    Test to Verify adding a new event with adding event cost
    [Tags]  Add-Event
    Navigate To New Event Page
    Select Event Category  Security & Crime
    Select Event Outcome  Violence
    Select Event Type   Verbal Abuse
    Verify Reporter Step Is Completed
    Click On Next Button
    Select Locate Me Option In Map
    Verify Location Step Is Completed
    Click On Next Button
    Verify Detail Step Is Completed
    Click On Next Button
    Verify Assessment Step Title Is Shown
    Go To Invoved Entities Step
    Go To Add People To Incident And Select No Option
    Go To Add Cost Question And Select Yes Option
    Increment The Product Number
    Select Any Cost Category
    Enter Brand Name
    Enter Product Name
    Enter Product Code
    Enter Product Value
    Enter Product Quantity
    Enter Product Recovered Quantity
    Enter Product Damaged Quantity
    Click On Confirm Button In Add Cost Slideout
    Click On Submit Button
    Verify Confirmation Popup And Select Proceed Option
    Verify Toast Message for Event Created Successfull
    Verify Toast Message for Event Cost Linked Successfull
    Verify Event Created Successfully

Add Event WorkFlow With Event Cost Copying
    [Documentation]    Test to Verify copying a event cost while adding a new event
    [Tags]  Add-Event3
    Navigate To New Event Page
    Select Event Category  Security & Crime
    Select Event Outcome  Violence
    Select Event Type   Verbal Abuse
    Verify Reporter Step Is Completed
    Click On Next Button
    Select Locate Me Option In Map
    Verify Location Step Is Completed
    Click On Next Button
    Verify Detail Step Is Completed
    Click On Next Button
    Verify Assessment Step Title Is Shown
    Go To Invoved Entities Step
    Go To Add People To Incident And Select No Option
    Go To Add Cost Question And Select Yes Option
    Increment The Product Number
    Select Any Cost Category
    Enter Brand Name
    Enter Product Name
    Enter Product Code
    Enter Product Value
    Enter Product Quantity
    Enter Product Recovered Quantity
    Enter Product Damaged Quantity
    Verify Subtotal of Product
    Verify Recovered Subtotal of Product
    Verify Damaged Subtotal of Product
    Verify Total Amount Of Products
    Verify Total Amount Of Recovered Products
    Verify Total Amount Of Damaged Products
    Click On Copy Button of Cost
    Verify Total Amount Of Products
    Verify Total Amount Of Recovered Products
    Verify Total Amount Of Damaged Products
    Click On Confirm Button In Add Cost Slideout
    Click On Submit Button
    Verify Confirmation Popup And Select Proceed Option
    Verify Toast Message for Event Created Successfull
    Verify Toast Message for Event Cost Linked Successfull
    Verify Event Created Successfully

Verify Event Cost Added In Add Cost Slideout Is Shown Under Add Cost Question In Workflow
    [Documentation]    Test to Verify added event cost is shown in workflow is same as added in slideout
    [Tags]  Add-Event2
    Navigate To New Event Page
    Select Event Category  Security & Crime
    Select Event Outcome  Violence
    Select Event Type   Verbal Abuse
    Verify Reporter Step Is Completed
    Click On Next Button
    Select Locate Me Option In Map
    Verify Location Step Is Completed
    Click On Next Button
    Verify Detail Step Is Completed
    Click On Next Button
    Verify Assessment Step Title Is Shown
    Go To Invoved Entities Step
    Go To Add People To Incident And Select No Option
    Go To Add Cost Question And Select Yes Option
    Increment The Product Number
    ${Cost_Category_In_Slideout}  Select Any Cost Category
    ${Brand_Name_In_Slideout}  Enter Brand Name
    ${Product_Name_In_Slideout}  Enter Product Name
    ${Product_Code_In_Slideout}  Enter Product Code
    ${Product_Value_In_Slideout}  Enter Product Value
    ${Product_Quantity_In_Slideout}  Enter Product Quantity
    ${Product_Recovered_In_Slideout}  Enter Product Recovered Quantity
    ${Product_Damaged_In_Slideout}  Enter Product Damaged Quantity
    ${Sub_Total_In_Add_Cost_Slideout}  Verify Subtotal of Product
    ${Sub_Recovered_In_Add_Cost_Slideout}  Verify Recovered Subtotal of Product
    ${Sub_Damaged_In_Add_Cost_Slideout}  Verify Damaged Subtotal of Product
    ${Total_In_Add_Cost_Slideout}   Verify Total Amount Of Products
    ${Total_Recovered_In_Add_Cost_Slideout}   Verify Total Amount Of Recovered Products
    ${Total_Damaged_In_Add_Cost_Slideout}   Verify Total Amount Of Damaged Products
    Click On Confirm Button In Add Cost Slideout
    Validate Yes Option Is Selected For Cost Question
    Verify Fields Under Add Cost Question In Workflow
    Verify Subtotal of Product In Workflow         ${Sub_Total_In_Add_Cost_Slideout}
    Verify Sub Recovered of Product In Workflow    ${Sub_Recovered_In_Add_Cost_Slideout}
    Verify Sub Damaged of Product In Workflow      ${Sub_Damaged_In_Add_Cost_Slideout}
    Verify Total of Product In Workflow            ${Total_In_Add_Cost_Slideout}
    Verify Total Recovered of Product In Workflow  ${Total_Recovered_In_Add_Cost_Slideout}
    Verify Total Damaged of Product In Workflow    ${Total_Damaged_In_Add_Cost_Slideout}
    Verify Cost Category In Workflow               ${Cost_Category_In_Slideout}
    Verify Brand Name In Workflow                  ${Brand_Name_In_Slideout}
    Verify Product Name In Workflow                ${Product_Name_In_Slideout}
    Verify Product Code In Workflow                ${Product_Code_In_Slideout}
    Verify Product Value In Workflow               ${Product_Value_In_Slideout}
    Verify Product Quantity In Workflow            ${Product_Quantity_In_Slideout}
    Verify Product Recovered In Workflow           ${Product_Recovered_In_Slideout}
    Verify Product Damaged In Workflow             ${Product_Damaged_In_Slideout}
    Click On Submit Button
    Verify Confirmation Popup And Select Proceed Option
    Verify Toast Message for Event Created Successfull
    Verify Toast Message for Event Cost Linked Successfull
    Verify Event Created Successfully

Verify Event Cost Added While Adding Event Remains Same During Editing the Event
    [Documentation]    Test to Verify Event Cost Added While Adding A New Event Is Same While Editing the Event
    [Tags]  Add-Event4
    Navigate To New Event Page
    Select Event Category  Security & Crime
    Select Event Outcome  Violence
    Select Event Type   Verbal Abuse
    Verify Reporter Step Is Completed
    Click On Next Button
    Select Locate Me Option In Map
    Verify Location Step Is Completed
    Click On Next Button
    Verify Detail Step Is Completed
    Click On Next Button
    Verify Assessment Step Title Is Shown
    Go To Invoved Entities Step
    Go To Add People To Incident And Select No Option
    Go To Add Cost Question And Select Yes Option
    Increment The Product Number
    ${Cost_Category_In_Slideout}  Select Any Cost Category
    ${Brand_Name_In_Slideout}  Enter Brand Name
    ${Product_Name_In_Slideout}  Enter Product Name
    ${Product_Code_In_Slideout}  Enter Product Code
    ${Product_Value_In_Slideout}  Enter Product Value
    ${Product_Quantity_In_Slideout}  Enter Product Quantity
    ${Product_Recovered_In_Slideout}  Enter Product Recovered Quantity
    ${Product_Damaged_In_Slideout}  Enter Product Damaged Quantity
    ${Sub_Total_In_Add_Cost_Slideout}  Verify Subtotal of Product
    ${Sub_Recovered_In_Add_Cost_Slideout}  Verify Recovered Subtotal of Product
    ${Sub_Damaged_In_Add_Cost_Slideout}  Verify Damaged Subtotal of Product
    ${Total_In_Add_Cost_Slideout}   Verify Total Amount Of Products
    ${Total_Recovered_In_Add_Cost_Slideout}   Verify Total Amount Of Recovered Products
    ${Total_Damaged_In_Add_Cost_Slideout}   Verify Total Amount Of Damaged Products
    ${count1}   Get The Count of Products In Add Cost Slideout
    Click On Confirm Button In Add Cost Slideout
    Validate Yes Option Is Selected For Cost Question
    Verify Fields Under Add Cost Question In Workflow
    Click On Submit Button
    Verify Confirmation Popup And Select Proceed Option
    Verify Toast Message for Event Created Successfull
    Verify Toast Message for Event Cost Linked Successfull
    Verify Event Created Successfully
    Click On Edit Button In Event Overview Page
    Go To Add Cost Slideout While Editing Event
    wait until element is visible  ${COST_EDIT_BUTTON_IN_WORKFLOW}
    click element  ${COST_EDIT_BUTTON_IN_WORKFLOW}
    Validate Edit Cost Slideout Is Shown
    Verify Cost Category In Add Cost Slideout      ${Cost_Category_In_Slideout}
    Verify Brand Name In Add Cost Slideout         ${Brand_Name_In_Slideout}
    Verify Product Name In Add Cost Slideout       ${Product_Name_In_Slideout}
    Verify Product Code In Add Cost Slideout       ${Product_Code_In_Slideout}
    Verify Product Value In Add Cost Slideout      ${Product_Value_In_Slideout}
    Verify Product Quantity In Add Cost Slideout   ${Product_Quantity_In_Slideout}
    Verify Product Recovered In Add Cost Slideout  ${Product_Recovered_In_Slideout}
    Verify Product Damaged In Add Cost Slideout    ${Product_Damaged_In_Slideout}
    Verify Subtotal of Product In Add Cost Slideout        ${Sub_Total_In_Add_Cost_Slideout}
    Verify Sub Recovered of Product In Add Cost Slideout    ${Sub_Recovered_In_Add_Cost_Slideout}
    Verify Sub Damaged of Product In Add Cost Slideout      ${Sub_Damaged_In_Add_Cost_Slideout}
    Verify Total of Product In Add Cost Slideout            ${Total_In_Add_Cost_Slideout}
    Verify Total Recovered of Product In Add Cost Slideout  ${Total_Recovered_In_Add_Cost_Slideout}
    Verify Total Damaged of Product In Add Cost Slideout    ${Total_Damaged_In_Add_Cost_Slideout}
    ${count2}   Get The Count of Products In Add Cost Slideout
    should be equal as numbers  ${count1}  ${count2}  Number of Costs added is not same
    Click On Confirm Button In Add Cost Slideout
    Click On Submit Button
    Verify Confirmation Popup And Select Proceed Option
    Verify Event Edited Successfully

Verify Event Cost Added While Adding Event Remains Same In Event Overview Page
    [Documentation]    Test to Verify Event Cost Added While Adding A New Event Is Same While Editing the Event
    [Tags]  Add-Event
    Navigate To New Event Page
    Select Event Category  Security & Crime
    Select Event Outcome  Violence
    Select Event Type   Verbal Abuse
    Verify Reporter Step Is Completed
    Click On Next Button
    Select Locate Me Option In Map
    Verify Location Step Is Completed
    Click On Next Button
    Verify Detail Step Is Completed
    Click On Next Button
    Verify Assessment Step Title Is Shown
    Go To Invoved Entities Step
    Go To Add People To Incident And Select No Option
    Go To Add Cost Question And Select Yes Option
    Increment The Product Number
    ${Cost_Category_In_Slideout}  Select Any Cost Category
    ${Brand_Name_In_Slideout}  Enter Brand Name
    ${Product_Name_In_Slideout}  Enter Product Name
    ${Product_Code_In_Slideout}  Enter Product Code
    ${Product_Value_In_Slideout}  Enter Product Value
    ${Product_Quantity_In_Slideout}  Enter Product Quantity
    ${Product_Recovered_In_Slideout}  Enter Product Recovered Quantity
    ${Product_Damaged_In_Slideout}  Enter Product Damaged Quantity
    ${Sub_Total_In_Add_Cost_Slideout}  Verify Subtotal of Product
    ${Sub_Recovered_In_Add_Cost_Slideout}  Verify Recovered Subtotal of Product
    ${Sub_Damaged_In_Add_Cost_Slideout}  Verify Damaged Subtotal of Product
    ${Total_In_Add_Cost_Slideout}   Verify Total Amount Of Products
    ${Total_Recovered_In_Add_Cost_Slideout}   Verify Total Amount Of Recovered Products
    ${Total_Damaged_In_Add_Cost_Slideout}   Verify Total Amount Of Damaged Products
    ${count1}   Get The Count of Products In Add Cost Slideout
    Click On Confirm Button In Add Cost Slideout
    Validate Yes Option Is Selected For Cost Question
    Verify Fields Under Add Cost Question In Workflow
    Click On Submit Button
    Verify Confirmation Popup And Select Proceed Option
    Verify Toast Message for Event Created Successfull
    Verify Toast Message for Event Cost Linked Successfull
    Verify Event Created Successfully
    Go To Add Cost Slideout From Event Overview Page
    Verify Cost Category In Add Cost Slideout      ${Cost_Category_In_Slideout}
    Verify Brand Name In Add Cost Slideout         ${Brand_Name_In_Slideout}
    Verify Product Name In Add Cost Slideout       ${Product_Name_In_Slideout}
    Verify Product Code In Add Cost Slideout       ${Product_Code_In_Slideout}
    Verify Product Value In Add Cost Slideout      ${Product_Value_In_Slideout}
    Verify Product Quantity In Add Cost Slideout   ${Product_Quantity_In_Slideout}
    Verify Product Recovered In Add Cost Slideout  ${Product_Recovered_In_Slideout}
    Verify Product Damaged In Add Cost Slideout    ${Product_Damaged_In_Slideout}
    Verify Subtotal of Product In Add Cost Slideout        ${Sub_Total_In_Add_Cost_Slideout}
    Verify Sub Recovered of Product In Add Cost Slideout    ${Sub_Recovered_In_Add_Cost_Slideout}
    Verify Sub Damaged of Product In Add Cost Slideout      ${Sub_Damaged_In_Add_Cost_Slideout}
    Verify Total of Product In Add Cost Slideout            ${Total_In_Add_Cost_Slideout}
    Verify Total Recovered of Product In Add Cost Slideout  ${Total_Recovered_In_Add_Cost_Slideout}
    Verify Total Damaged of Product In Add Cost Slideout    ${Total_Damaged_In_Add_Cost_Slideout}
    ${count2}   Get The Count of Products In Add Cost Slideout
    should be equal as numbers  ${count1}  ${count2}  Number of Costs added is not same
    Click On Confirm Button In Add Cost Slideout

Verify Event Cost In Search Event View Workflow
    [Documentation]    Test to Verify Event Cost Added While Adding A New Event Is Same While Editing the Event
    [Tags]  Add-Event2
    Navigate To New Event Page
    Select Event Category  Security & Crime
    Select Event Outcome  Violence
    Select Event Type   Verbal Abuse
    Verify Reporter Step Is Completed
    Click On Next Button
    Select Locate Me Option In Map
    Verify Location Step Is Completed
    Click On Next Button
    Verify Detail Step Is Completed
    Click On Next Button
    Verify Assessment Step Title Is Shown
    Go To Invoved Entities Step
    Go To Add People To Incident And Select No Option
    Go To Add Cost Question And Select Yes Option
    Increment The Product Number
    ${Cost_Category_In_Slideout}  Select Any Cost Category
    ${Brand_Name_In_Slideout}  Enter Brand Name
    ${Product_Name_In_Slideout}  Enter Product Name
    ${Product_Code_In_Slideout}  Enter Product Code
    ${Product_Value_In_Slideout}  Enter Product Value
    ${Product_Quantity_In_Slideout}  Enter Product Quantity
    ${Product_Recovered_In_Slideout}  Enter Product Recovered Quantity
    ${Product_Damaged_In_Slideout}  Enter Product Damaged Quantity
    ${Sub_Total_In_Add_Cost_Slideout}  Verify Subtotal of Product
    ${Sub_Recovered_In_Add_Cost_Slideout}  Verify Recovered Subtotal of Product
    ${Sub_Damaged_In_Add_Cost_Slideout}  Verify Damaged Subtotal of Product
    ${Total_In_Add_Cost_Slideout}   Verify Total Amount Of Products
    ${Total_Recovered_In_Add_Cost_Slideout}   Verify Total Amount Of Recovered Products
    ${Total_Damaged_In_Add_Cost_Slideout}   Verify Total Amount Of Damaged Products
    ${count1}   Get The Count of Products In Add Cost Slideout
    Click On Confirm Button In Add Cost Slideout
    Validate Yes Option Is Selected For Cost Question
    Verify Fields Under Add Cost Question In Workflow
    Click On Submit Button
    Verify Confirmation Popup And Select Proceed Option
    Verify Toast Message for Event Created Successfull
    Verify Toast Message for Event Cost Linked Successfull
    ${ID}   Verify Event Created Successfully
#    Click On App Logo Button
#    reload page and allow location access
    Navigate To Search Page
    Search For Event  ${ID}
    Verify Search Page Elements
    View The Searched Event
    Go To Add Cost Slideout From Event Overview Page
    Verify Cost Category In Add Cost Slideout      ${Cost_Category_In_Slideout}
    Verify Brand Name In Add Cost Slideout         ${Brand_Name_In_Slideout}
    Verify Product Name In Add Cost Slideout       ${Product_Name_In_Slideout}
    Verify Product Code In Add Cost Slideout       ${Product_Code_In_Slideout}
    Verify Product Value In Add Cost Slideout      ${Product_Value_In_Slideout}
    Verify Product Quantity In Add Cost Slideout   ${Product_Quantity_In_Slideout}
    Verify Product Recovered In Add Cost Slideout  ${Product_Recovered_In_Slideout}
    Verify Product Damaged In Add Cost Slideout    ${Product_Damaged_In_Slideout}
    Verify Subtotal of Product In Add Cost Slideout        ${Sub_Total_In_Add_Cost_Slideout}
    Verify Sub Recovered of Product In Add Cost Slideout    ${Sub_Recovered_In_Add_Cost_Slideout}
    Verify Sub Damaged of Product In Add Cost Slideout      ${Sub_Damaged_In_Add_Cost_Slideout}
    Verify Total of Product In Add Cost Slideout            ${Total_In_Add_Cost_Slideout}
    Verify Total Recovered of Product In Add Cost Slideout  ${Total_Recovered_In_Add_Cost_Slideout}
    Verify Total Damaged of Product In Add Cost Slideout    ${Total_Damaged_In_Add_Cost_Slideout}
    ${count2}   Get The Count of Products In Add Cost Slideout
    should be equal as numbers  ${count1}  ${count2}  Number of Costs added is not same
    Click On Confirm Button In Add Cost Slideout


Verify Event Cost In Search Event Edit Workflow
    [Documentation]    Test to Verify Event Cost Added While Adding A New Event Is Same While Editing the Event
    [Tags]  Add-Event2
    Navigate To New Event Page
    Select Event Category  Security & Crime
    Select Event Outcome  Violence
    Select Event Type   Verbal Abuse
    Verify Reporter Step Is Completed
    Click On Next Button
    Select Locate Me Option In Map
    Verify Location Step Is Completed
    Click On Next Button
    Verify Detail Step Is Completed
    Click On Next Button
    Verify Assessment Step Title Is Shown
    Go To Invoved Entities Step
    Go To Add People To Incident And Select No Option
    Go To Add Cost Question And Select Yes Option
    Increment The Product Number
    ${Cost_Category_In_Slideout}  Select Any Cost Category
    ${Brand_Name_In_Slideout}  Enter Brand Name
    ${Product_Name_In_Slideout}  Enter Product Name
    ${Product_Code_In_Slideout}  Enter Product Code
    ${Product_Value_In_Slideout}  Enter Product Value
    ${Product_Quantity_In_Slideout}  Enter Product Quantity
    ${Product_Recovered_In_Slideout}  Enter Product Recovered Quantity
    ${Product_Damaged_In_Slideout}  Enter Product Damaged Quantity
    ${Sub_Total_In_Add_Cost_Slideout}  Verify Subtotal of Product
    ${Sub_Recovered_In_Add_Cost_Slideout}  Verify Recovered Subtotal of Product
    ${Sub_Damaged_In_Add_Cost_Slideout}  Verify Damaged Subtotal of Product
    ${Total_In_Add_Cost_Slideout}   Verify Total Amount Of Products
    ${Total_Recovered_In_Add_Cost_Slideout}   Verify Total Amount Of Recovered Products
    ${Total_Damaged_In_Add_Cost_Slideout}   Verify Total Amount Of Damaged Products
    ${count1}   Get The Count of Products In Add Cost Slideout
    Click On Confirm Button In Add Cost Slideout
    Validate Yes Option Is Selected For Cost Question
    Verify Fields Under Add Cost Question In Workflow
    Click On Submit Button
    Verify Confirmation Popup And Select Proceed Option
    Verify Toast Message for Event Created Successfull
    Verify Toast Message for Event Cost Linked Successfull
    ${ID}   Verify Event Created Successfully
#    Click On App Logo Button
#    reload page and allow location access
    Navigate To Search Page
    Search For Event  ${ID}
    Verify Search Page Elements
    Edit The Searched Event
    Go To Add Cost Slideout While Editing Event
    wait until element is visible  ${COST_EDIT_BUTTON_IN_WORKFLOW}
    click element  ${COST_EDIT_BUTTON_IN_WORKFLOW}
    Validate Edit Cost Slideout Is Shown
    Verify Cost Category In Add Cost Slideout      ${Cost_Category_In_Slideout}
    Verify Brand Name In Add Cost Slideout         ${Brand_Name_In_Slideout}
    Verify Product Name In Add Cost Slideout       ${Product_Name_In_Slideout}
    Verify Product Code In Add Cost Slideout       ${Product_Code_In_Slideout}
    Verify Product Value In Add Cost Slideout      ${Product_Value_In_Slideout}
    Verify Product Quantity In Add Cost Slideout   ${Product_Quantity_In_Slideout}
    Verify Product Recovered In Add Cost Slideout  ${Product_Recovered_In_Slideout}
    Verify Product Damaged In Add Cost Slideout    ${Product_Damaged_In_Slideout}
    Verify Subtotal of Product In Add Cost Slideout        ${Sub_Total_In_Add_Cost_Slideout}
    Verify Sub Recovered of Product In Add Cost Slideout    ${Sub_Recovered_In_Add_Cost_Slideout}
    Verify Sub Damaged of Product In Add Cost Slideout      ${Sub_Damaged_In_Add_Cost_Slideout}
    Verify Total of Product In Add Cost Slideout            ${Total_In_Add_Cost_Slideout}
    Verify Total Recovered of Product In Add Cost Slideout  ${Total_Recovered_In_Add_Cost_Slideout}
    Verify Total Damaged of Product In Add Cost Slideout    ${Total_Damaged_In_Add_Cost_Slideout}
    ${count2}   Get The Count of Products In Add Cost Slideout
    should be equal as numbers  ${count1}  ${count2}  Number of Costs added is not same
    Click On Confirm Button In Add Cost Slideout
    Click On Submit Button
    Verify Confirmation Popup And Select Proceed Option
    Verify Event Edited Successfully

Editing An Event By Updating Date Of Event And Adding Event Cost
    [Documentation]    Test to Verify Event Editing By Updating date and time of event and adding event costs
    [Tags]  Add-Event
    Navigate To New Event Page
    Select Event Category  Security & Crime
    Select Event Outcome  Violence
    Select Event Type   Verbal Abuse
    ${Date_Time_Of_Event_Selected1}  Get Selected Date And Time Of Event
    Verify Reporter Step Is Completed
    Click On Next Button
    Select Locate Me Option In Map
    Verify Location Step Is Completed
    Click On Next Button
    Verify Detail Step Is Completed
    Click On Next Button
    Verify Assessment Step Title Is Shown
    Go To Invoved Entities Step
    Go To Add People To Incident And Select No Option
    Go To Add Cost Question And Select No Option
    Click On Submit Button
    Verify Confirmation Popup And Select Proceed Option
    Verify Toast Message for Event Created Successfull
    ${ID}   Verify Event Created Successfully
    ${Date_Time_Of_Event_In_Detail1}  Get Date And Time Of Event Shown In Event Detail Page
    should be equal as strings  ${Date_Time_Of_Event_Selected1}  ${Date_Time_Of_Event_In_Detail1}
    Click On Edit Button In Event Overview Page
    Add Date And Time Of Event  01/01/2020 12:34
    ${Date_Time_Of_Event_Selected2}  Get Selected Date And Time Of Event
    Go To Add Cost Slideout While Editing Event
    Go To Add Cost Question And Select Yes Option
    Increment The Product Number
    ${Cost_Category_In_Slideout}  Select Any Cost Category
    ${Brand_Name_In_Slideout}  Enter Brand Name
    ${Product_Name_In_Slideout}  Enter Product Name
    ${Product_Code_In_Slideout}  Enter Product Code
    ${Product_Value_In_Slideout}  Enter Product Value
    ${Product_Quantity_In_Slideout}  Enter Product Quantity
    ${Product_Recovered_In_Slideout}  Enter Product Recovered Quantity
    ${Product_Damaged_In_Slideout}  Enter Product Damaged Quantity
    ${Sub_Total_In_Add_Cost_Slideout}  Verify Subtotal of Product
    ${Sub_Recovered_In_Add_Cost_Slideout}  Verify Recovered Subtotal of Product
    ${Sub_Damaged_In_Add_Cost_Slideout}  Verify Damaged Subtotal of Product
    ${Total_In_Add_Cost_Slideout}   Verify Total Amount Of Products
    ${Total_Recovered_In_Add_Cost_Slideout}   Verify Total Amount Of Recovered Products
    ${Total_Damaged_In_Add_Cost_Slideout}   Verify Total Amount Of Damaged Products
    ${count1}   Get The Count of Products In Add Cost Slideout
    Click On Confirm Button In Add Cost Slideout
    Click On Submit Button
    Verify Confirmation Popup And Select Proceed Option
    Verify Event Edited Successfully
    ${Date_Time_Of_Event_In_Detail2}  Get Date And Time Of Event Shown In Event Detail Page
    should be equal as strings  ${Date_Time_Of_Event_Selected2}  ${Date_Time_Of_Event_In_Detail2}
    Go To Add Cost Slideout From Event Overview Page
    Verify Cost Category In Add Cost Slideout      ${Cost_Category_In_Slideout}
    Verify Brand Name In Add Cost Slideout         ${Brand_Name_In_Slideout}
    Verify Product Name In Add Cost Slideout       ${Product_Name_In_Slideout}
    Verify Product Code In Add Cost Slideout       ${Product_Code_In_Slideout}
    Verify Product Value In Add Cost Slideout      ${Product_Value_In_Slideout}
    Verify Product Quantity In Add Cost Slideout   ${Product_Quantity_In_Slideout}
    Verify Product Recovered In Add Cost Slideout  ${Product_Recovered_In_Slideout}
    Verify Product Damaged In Add Cost Slideout    ${Product_Damaged_In_Slideout}
    Verify Subtotal of Product In Add Cost Slideout        ${Sub_Total_In_Add_Cost_Slideout}
    Verify Sub Recovered of Product In Add Cost Slideout    ${Sub_Recovered_In_Add_Cost_Slideout}
    Verify Sub Damaged of Product In Add Cost Slideout      ${Sub_Damaged_In_Add_Cost_Slideout}
    Verify Total of Product In Add Cost Slideout            ${Total_In_Add_Cost_Slideout}
    Verify Total Recovered of Product In Add Cost Slideout  ${Total_Recovered_In_Add_Cost_Slideout}
    Verify Total Damaged of Product In Add Cost Slideout    ${Total_Damaged_In_Add_Cost_Slideout}
    ${count2}   Get The Count of Products In Add Cost Slideout
    should be equal as numbers  ${count1}  ${count2}  Number of Costs added is not same
    Click On Confirm Button In Add Cost Slideout

Viewing An Event And Verifying Pages And Tabs
    [Documentation]    Test to Verify Event details and view the details page header and all pages and tabs configured for that Event category.
    [Tags]  Add-Event
    Navigate To Search Page
    Search For Event  sec
    Verify Search Page Elements
    View The Searched Event
    Verify Event Details Page Header And All Pages And Tabs

Assigning Event To A User
    [Documentation]    Test to Verify Assigning An user to Event works fine and same is reflected in event detail page
    [Tags]  Add-Event
    Navigate To Search Page
    Search For Event  sec
    Verify Search Page Elements
    View The Searched Event
    ${first_assigned}   Get Assigned To User In Event Detail Page
    log to console  First Assigned To=${first_assigned}
    ${selected_owner}  Assign User To The Event
    ${second_assigned}   Get Assigned To User In Event Detail Page
    log to console  Second Assigned To=${second_assigned}
    should be equal  ${selected_owner}  ${second_assigned}
    should not be equal  ${first_assigned}  ${second_assigned}

Add A Response Form With Attachments within the Event Detail Page And Validate Data in Response list
    [Documentation]    Test to Verify from within the Event ‘view' page, being able to submit a new entry/record of a Response form.
    [Tags]  Add-Event
    Navigate To Search Page
    Search For Event  sec
    Verify Search Page Elements
    View The Searched Event
    sleep  15
    Go To Responses Page
    Add Vehicle Response Form

Add A Task To An Searched Event With Attachments And Validate Data in Tasks list and task preview page
    [Documentation]    Test to Verify from within the Event ‘view' page, being able to submit a new entry/record of a  task.
    [Tags]  Add-Event
    Navigate To Search Page
    Search For Event  sec
    Verify Search Page Elements
    View The Searched Event
    sleep  15
    Go To Tasks Page In Event Detail Page
    ${fileuploaded}  Add New Task  yes
    Run Keyword If    '${fileuploaded}' == 'False'    Fail    File upload failed or timed out but added task successfully


Add A Task From Event Detail Page After EVent Creation And Validate Data in Tasks list and Task preview page
    [Documentation]    Test to Verify from within the Event ‘view' page, being able to submit a new entry/record of a  task.
    [Tags]  Add-Event
    Navigate To New Event Page
    Select Event Category  Security & Crime
    Select Event Outcome  Violence
    Select Event Type   Verbal Abuse
    ${Date_Time_Of_Event_Selected1}  Get Selected Date And Time Of Event
    Verify Reporter Step Is Completed
    Click On Next Button
    Select Locate Me Option In Map
    Verify Location Step Is Completed
    Click On Next Button
    Verify Detail Step Is Completed
    Click On Next Button
    Verify Assessment Step Title Is Shown
    Go To Invoved Entities Step
    Go To Add People To Incident And Select No Option
    Go To Add Cost Question And Select No Option
    Click On Submit Button
    Verify Confirmation Popup And Select Proceed Option
    Verify Toast Message for Event Created Successfull
    ${ID}   Verify Event Created Successfully
    Go To Tasks Page In Task Module
    Add New Task

Add A Task From Tasks Module And Validate Data in Tasks list and Task preview page
    [Documentation]    Test to Verify from within the Event ‘view' page, being able to submit a new entry/record of a  task.
    [Tags]  Add-Event
    Navigate To Tasks Module
    Go To Tasks Page In Task Module
    Add New Task

Update A Task From Tasks Module And Validate Data in Tasks list and Task preview page
    [Documentation]    Test to Verify from within the Event ‘view' page, being able to submit a new entry/record of a  task.
    [Tags]  Add-Event3
    Navigate To Tasks Module
    Go To Tasks Page In Task Module
    Add New Task
    Update Task And Verify Data

Changing Event Status
    [Documentation]    Test to Verify user is able to change the status and verify audit in event timeline
    [Tags]  Add-Event
    Navigate To Search Page
    Search For Event  sec
    Verify Search Page Elements
    View The Searched Event
    ${first_status}   Get Current Event Status In Event Detail Page
    log to console  First Event Status=${first_status}
    ${selected_status}  Change The Event Status
    ${second_status}   Get Current Event Status In Event Detail Page
    log to console  Second Event Status=${second_status}
    should be equal  ${selected_status}  ${second_status}
    should not be equal  ${first_status}  ${second_status}
    Validate Event TimeLine For Status Change  ${second_status}

Changing Event Severity
    [Documentation]    Test to Verify user is able to change the severity and verify audit in event timeline
    [Tags]  Add-Event
    Navigate To Search Page
    Search For Event  sec
    Verify Search Page Elements
    View The Searched Event
    ${first_severity}   Get Current Event Severity In Event Detail Page
    log to console  First Event Severity=${first_severity}
    ${selected_severity}  Change The Event Severity
    ${second_severity}   Get Current Event Severity In Event Detail Page
    log to console  Second Event Severity=${second_severity}
    should be equal  ${selected_severity}  ${second_severity}
    should not be equal  ${first_severity}  ${second_severity}
    Validate Event TimeLine For Severity Change  ${second_severity}

Changing Event Priority
    [Documentation]    Test to Verify user is able to change the Priority and verify audit in event timeline
    [Tags]  Add-Event
    Navigate To Search Page
    Search For Event  sec
    Verify Search Page Elements
    View The Searched Event
    ${first_priority}   Get Current Event Priority In Event Detail Page
    log to console  First Event Priority=${first_priority}
    ${selected_priority}  Change The Event Priority
    ${second_priority}   Get Current Event Priority In Event Detail Page
    log to console  Second Event Priority=${second_priority}
    should be equal  ${selected_priority}  ${second_priority}
    should not be equal  ${first_priority}  ${second_priority}
    Validate Event TimeLine For Priority Change  ${second_priority}

Search Event in Ag-grid List Filter
    [Documentation]    Test to Verify user is able to search for the event from ag-grid list filter
    [Tags]  Add-Event
    Navigate To Event Page
    Select All Records Page
    ${reference}   Get Random Event ID From The List Widget
    Search And Open Any Event Reference From List  ${reference}
    Validate Event Detail Page is opened  ${reference}

Search Event From Search Module
    [Documentation]    Test to Verify user is able to search for the event from search module
    [Tags]  Add-Event
    Navigate To Event Page
    Select All Records Page
    ${reference}   Get Random Event ID From The List Widget
    Navigate To Search Page
    Search For Event  ${reference}
    View The Searched Event
    Validate Event Detail Page is opened  ${reference}

Search Event From Event List query builder
    [Documentation]   Test to Verify user is able to search for the event from list widget query builder
    [Tags]  Add-Event
    Navigate To DashBoard Page
    ${event_page_present}  run keyword and return status  Select Events Page
    run keyword if  '${event_page_present}'=='False'  run keywords  Add And Verify New Dashboard Page
                                ...     Edit Added Dashboard Page
                                ...     Add Incidents List Widget In DashBoard Page
    ${reference}   Get Random Event ID From The List Widget
    Add A Query Builder To Filter Event Reference  ${reference}
    Click On Event Reference in List Widget To Open The Event
    Validate Event Detail Page is opened  ${reference}

To answer all supported questions in event workflow and verifying after adding
    [Documentation]    Test to verify user is able to answer all the supported questions and verifying the questions and answers
    [Tags]    Add-supported
    Navigate To New Event Page
    Select Event Category  Security & Crime
    Select Event Outcome  Violence
    Select Event Type   Verbal Abuse
    ${who_is_the_reporter_answer}     ${full_name}    ${contact_number}    ${email}    Who Is The Reporter Question Answer As External/Contractor
    Verify Reporter Step Is Completed
    Click On Next Button
    Select Locate Me Option In Map
    Verify Location Step Is Completed
    ${entered_text}    Answer To Describe The Specific Location Question In Workflow
    Click On Next Button
    ${selected_options}    Answer To Select The Option(s) That Best Describes The Verbal Abuse Question
    ${Is_CCTV available_at_the_location_question_answer}    Answer To Is CCTV Available At The Location Question
    ${Written_summary_value}    Answer To Written Summary
    Verify Detail Step Is Completed
    Click On Next Button
    ${Has a copy of the CCTV been saved_question_answer}    Answer To Has A Copy Of The CCTV Been Saved Question
    ${Has a copy been uploaded to Analyst_question_answer}    Answer To Has A Copy Been Uploaded To Analyst Question
    ${Was a weapon present question_answer}    Answer To Was A Weapon Present Question
    ${all_option_texts}    Answer To What Was The Type Of Weapon(s) Present Question
    Verify Assessment Step Title Is Shown
    Go To Involved Entities Step
    Go To Add People To Incident And Select No Option
    Go To Add Cost Question And Select No Option
    Click On Submit Button
    Verify Confirmation Popup And Select Proceed Option
    Verify Toast Message for Event Created Successfull
    Verify Event Created Successfully
    Navigate To The Widget Which Contains All The Dynamic Questions
    Verify All Dynamic Questions In Detail Page Configured Widget
    Verifying Answer For Who Is The Reporter Dynamic Question In The Add Event Workflow    ${who_is_the_reporter_answer}
    Verify Name,Email,and Contact Number For External Contractor On Add Event Workflow    ${full_name}    ${contact_number}    ${email}
    Verify the answer of Describe the specific location question on add event workflow    ${entered_text}
    ${all_option_texts}    Verify the dropdown option for Select the option(s) that best describes the verbal abuse on add event workflow
    Verify Is CCTV Available At The Location Question answer on add event workflow     ${Is_CCTV available_at_the_location_question_answer}
    Verify Answer to Written Summary on add event workflow    ${Written_summary_value}
    Verify Detail Step Is Completed
    Click On Next Button
    Verify Answer to Has a copy of the CCTV been saved question on add event workflow      ${Has a copy of the CCTV been saved_question_answer}
    Verify Answer to Has a copy been uploaded to Analyst question on add event workflow    ${Has a copy been uploaded to Analyst_question_answer}
    Verify Answer to Was a weapon present question on add event workflow    ${Was a weapon present question_answer}
    Verify Answer to What was the type of weapon(s) present question on add event workflow

