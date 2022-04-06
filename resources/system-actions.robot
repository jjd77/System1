*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LANDING_PAGE_ENV_BADGE}    css=span.vv_widget_text vv_ellipsis vaultLink
${OK_LINK}    css=a.ok
${NAV_BAR_CIRCLE}    css=button.vv-navbar-circle

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
    ${count}=  Get Element Count    ${LANDING_PAGE_ENV_BADGE}          #checks code checks if there are multiple environments for current user
    run keyword if    ${count} > 0    Select first enironment from the list of environments        #selects the first environment from available if user got this view prompted

Assert current user login
    [Documentation]    check the login of current user on the context user profile panel
    [Arguments]    ${arg1}
    click button    ${NAV_BAR_CIRCLE}
    wait until page contains    ${arg1}

Select first enironment from the list of environments
    click element    ${LANDING_PAGE_ENV_BADGE}
    wait until page contains    Disclaimer
    click element    ${OK_LINK}
    wait until page does not contain    Disclaimer
