*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${MAIN_PAGE_TITLE}    This was a main page title
${BROWSER}    chrome


*** Keywords ***
Open Login Page
    [Documentation]    Open browser on given page, maximize, set timeout, chacke title page
    open browser    https://this_was_a_page_name/auth/login   ${BROWSER}    options=add_experimental_option("excludeSwitches", ["enable-logging"])
    maximize browser window
    set selenium timeout    6
    title should be    ${MAIN_PAGE_TITLE}

Close The Browser
    close browser
