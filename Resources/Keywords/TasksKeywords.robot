*** Settings ***
Library    Selenium2Library
Library    Collections
Library    DateTime
Library    OperatingSystem
Library    String

Resource   ../Variables.robot
Resource   General.robot

*** Keywords ***
Navigate To Tasks Module
    scroll element into view   ${TASKS_MODULE}
    wait until element is visible  ${TASKS_MODULE}  5  Tasks module is not shown
    click element   ${TASKS_MODULE}

Go To Tasks Page In Task Module
    wait until element is visible  ${TASKS_PAGE}  5  Tasks module is not shown
    click element   ${TASKS_PAGE}