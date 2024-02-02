*** Settings ***
Library    Browser    enable_presenter_mode=${True}

*** Test cases ***
Login with valid credential should pass
    New Browser                chromium    headless=false
    New Context                viewport={'width': 1920, 'height': 1080}
    New Page                   https://www.saucedemo.com/
    Fill Text                  //input[@id="user-name"]    standard_user
    Fill Text                  //input[@id="password"]     secret_sauce
    Click                      //input[@id="login-button"]
    Wait For Elements State     //div[@class="app_logo"]