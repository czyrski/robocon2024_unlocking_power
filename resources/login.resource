*** Settings ***
Variables    ..${/}variables${/}sauce_demo_xpaths.yaml

*** Keywords ***
Open Shop Webpage
    New Browser        chromium    headless=false
    New Page           https://www.saucedemo.com/
    Get Title          ==    Swag Labs

Login To Shop
    [Arguments]                  ${username}           ${password}
    Fill Text                    ${user name input}    ${username}
    Fill Text                    ${password input}     ${password}
    Click                        ${login button}
    Wait For Elements State      ${main app logo}