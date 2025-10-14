*** Settings ***
Documentation    This test suite is for adding and editing checkpoints
Resource    ../Resources/Keywords/General.robot
Resource    ../Resources/Keywords/WidgetExportKeywords.robot
Resource     ../Resources/Keywords/AddEditCheckpointKeywords.robot

Suite Setup      Open The Synapse Analyst Url
Test Setup       Go To Home Page
Test Teardown    Stop Test Case Recording
Suite Teardown   Close Browser

*** Test Cases ***
C_01_Open the application and click on locations module
    [Documentation]    Open the synapse app and navigate to locations module and verify the web elements under the locations module
    [Tags]    checkpoints
    Navigate To Locations Module
    Verify The Web Elements Present Under The Locations Module

C_02_Verify the Site names and select a site to add a checkpoint
    [Documentation]    verifying the site names and selecting a site
    [Tags]    checkpoints
    Verify The Site Names
    Select The Site    21356

C_03_Verify Add Checkpoint Form Elements while add checkpoint form is triggered
    [Documentation]    verify the add checkpoint form labels and  fields along with the buttons
    [Tags]    checkpoints
    Navigate To Locations Module
    Select The Site    21356
    Sleep    5
    Verify Add Checkpoint Form Elements

C_04_Adding a checkpoint with Barcode Verification Method
    [Documentation]    Adding a checkpoint with Barcode Verification Method and verifying its details
    [Tags]    add-verify-checkpoint-barcode
    Navigate To Locations Module
    Select The Site    21356
    Sleep    5
    Add A Checkpoint With Barcode Checkpoint Verification Method
    Verify The Checkpoint Details Added For Barcode Verification Method

C_05_Editing a checkpoint with Barcode Verification Method
    [Documentation]    Edit the created checkpoint details with Barcode Verification Method
    [Tags]    edit-checkpoint-barcode
    Navigate To Locations Module
    Sleep    5
    Select The Site  21356
    Sleep    4
    Edit The Checkpoint Details Added For Barcode    AutomatedCheckpoint_2024-11-20 12:14:08
    
C_06_Verify the checkpoint details after editing the checkpoint added for Barcode Verification Method
    [Documentation]    verify the checkpoint details of Barcode after editing
    [Tags]    verifyEdited-checkpoint-barcode
    Navigate To Locations Module
    Sleep    5
    Select The Site  21356
    Sleep    4
    Verify The Checkpoint Details After Editing The Checkpoint Added For Barcode    AutomatedCheckpoint_2024-11-21 14:40:18

C_07_Adding a checkpoint with NFC Verification Method
    [Documentation]    Adding a checkpoint with NFC Verification Method and verifying its details
    [Tags]    add-verify-checkpoint-nfc
    Navigate To Locations Module
    Select The Site    21356
    Sleep    5
    Add A Checkpoint With NFC Verification Method
    Verify The Checkpoint Details Added For NFC Verification Method
    
C_08_Editing a checkpoint with NFC verification Method
    [Documentation]    Edit the checkpoints details with NFC Verification Method
    [Tags]    edit-checkpoint-nfc
    Navigate To Locations Module
    Sleep    5
    Select The Site  21356
    Sleep    4
    Edit The Checkpoint Details Added For NFC    AutomatedCheckpoint_2024-11-21 14:24:38

C_09_Verify the checkpoint details after editing the checkpoint added for NFC Verification Method
    [Documentation]     verify the checkpoint details of NFC after editing
    [Tags]    verifyEdited-checkpoint-nfc
    Navigate To Locations Module
    Sleep    5
    Select The Site  21356
    Sleep    4
    Verify the checkpoint details after editing the checkpoint added for NFC    AutomatedCheckpoint_2024-11-21 14:52:20

C_10_Adding a checkpoint with Image META Verification Method
    [Documentation]    Adding a checkpoint with Image META Verification Method and verifying its details
    [Tags]    add-verify-checkpoint-ImageMETA
    Navigate To Locations Module
    Select The Site    21356
    Sleep    5
    Add A Checkpoint With Image META Verification Method
    Verify The Checkpoint Details Added For Image META Verification Method

C_11_Editing a checkpoint with Image META Verification Method
    [Documentation]    Editing a checkpoint with Image META Verification Method
    [Tags]    edit-checkpoint-ImageMETA
    Navigate To Locations Module
    Sleep    5
    Select The Site  21356
    Sleep    4
    Editing The Checkpoint Details Added For Image META Verification Method    AutomatedCheckpoint_2024-12-02 16:22:25

C_12_Verifying a checkpoint with Image META Verification Method
    [Documentation]      verify the checkpoint details of Image META after editing
    [Tags]      verifyEdited-checkpoint-ImageMETA
    Navigate To Locations Module
    Sleep    5
    Select The Site  21356
    Sleep    4
    Verify the checkpoint details after editing the checkpoint added for Image META    AutomatedCheckpoint_2024-12-02 16:22:25

C_13_Adding a checkpoint with Location Tracking Verification Method
    [Documentation]    Adding a checkpoint with Location Tracking Verification Method and verifying its details
    [Tags]    add-verify-checkpoint-LocationTracking
    Navigate To Locations Module
    Select The Site    21356
    Sleep    5
    Add A Checkpoint With Location Tracking Verification Method
    Verify The Checkpoint Details Added For Location Tracking Verification Method

C_14_Editing a checkpoint with Location Tracking verification Method
    [Documentation]    Edit the checkpoints details with location Tracking Verification Method
    [Tags]    edit-checkpoint-LocationTracking
    Navigate To Locations Module
    Sleep    5
    Select The Site  21356
    Sleep    4
    Edit The Checkpoint Details Added For Location Tracking    AutomatedCheckpoint_2024-11-21 18:27:50
    
C_15_Verify the checkpoint details after editing the checkpoint added for Location Tracking Verification Method
    [Documentation]    verify the checkpoint details of Location tracking after editing
    [Tags]    verifyEdited-checkpoint-LocationTracking
    Navigate To Locations Module
    Sleep    5
    Select The Site  21356
    Sleep    4
    Verify the checkpoint details after editing the checkpoint added for Location Tracking    AutomatedCheckpoint_2024-11-21 18:27:50

C_16_Enabling and Disabling a checkpoint along with verifying its behavior
    [Documentation]    Enabling and Disabling a checkpoint and also verifying that the selected checkpoint is enabled/disabled
    [Tags]    Checkpoint-enable-disable
    Navigate To Locations Module
    Sleep    5
    Select The Site  21356
    Sleep    4
    Verifying The Disabling Of Checkpoint    AutomatedCheckpoint_2024-12-02 16:22:25
    Verifying The Enabling Of Checkpoint    AutomatedCheckpoint_2024-12-02 16:22:25





    
    






    









