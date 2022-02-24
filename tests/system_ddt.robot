*** Settings ***
Library    SeleniumLibrary
Library    DataDriver    ../resources/data.xlsx
Resource    ../resources/common.robot
Resource    ../resources/system-actions.robot
Test Template    Login and password check
Test Teardown    common.Close the Browser

*** Test Cases ***
DDT Verify if user can log in    ${alias}    ${password}


*** Keywords ***
Login and password check
    [Documentation]    Data Driven Sanity Test that can be used to test if users got valid passwords in the system 
    [Arguments]    ${alias}    ${password}
    common.Open Login Page
    system-actions.Check if password is still valid    ${alias}    ${password}
    wait until page contains    Disclaimer
    click element    //a[contains(@class,"ok")]
    wait until page does not contain    Disclaimer
    Assert current user login    ${alias}



