*** Settings ***
Library    SeleniumLibrary

*** Variables ***


*** Keywords ***
Check if password is still valid
    [Documentation]    just check if the password is ok works with Excel file data.xlsx using user/password/envlocator
    [Arguments]    ${arg1}    ${arg2}
    input text    j_username    ${arg1}
    click button    continue
    wait until element is visible    j_password
    element should be visible    login
    input password    j_password    ${arg2}
    click button    login
    ${count}=  Get Element Count    //span[@class="vv_widget_text vv_ellipsis vaultLink"]          #checks code checks if there are multiple environments for current user
    run keyword if    ${count} > 0    Select first enironment from the list of environments        #selects the first environment from available if user got this view prompted

Assert current user login
    [Documentation]    check the login of current user on the context user profile panel
    [Arguments]    ${arg1}
    click button    //button[contains(@class,"vv-navbar-circle")]
    wait until page contains    ${arg1}

Select first enironment from the list of environments
    click element    //span[@class="vv_widget_text vv_ellipsis vaultLink"]
    wait until page contains    Disclaimer
    click element    //a[contains(@class,"ok")]
    wait until page does not contain    Disclaimer
