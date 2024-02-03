*** Settings ***
Library    Browser    enable_presenter_mode=${True}
Variables    ./Variables/sauce_demo_xpaths.yaml

*** Variables ***
${USER}        standard_user
${PASSWORD}    secret_sauce
&{CLIENT}      firstname=John    lastname=Doe     zip=55555

*** Test Cases ***
User Should Be Able To Order Products
    [Setup]    Open Shop Webpage
    Login To Shop    ${USER}    ${PASSWORD}
    Check If Shopping Cart Is Empty
    Add 3 Products To Cart    &{products add to cart button}
    Open Shopping Cart And Check If Contains 3 Items
    Proceed To Checkout
    Fill Client Information And Proceed To Finalization     &{CLIENT}
    Finish Order And Expect Success
    # [Teardown]    Close Browser

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

Check If Shopping Cart Is Empty
    Get Text    ${cart icon}   ==    ${EMPTY}

Add 3 Products To Cart
    [Arguments]    &{products}
    FOR     ${product}  ${xpath}    IN     &{products}
        Click    ${xpath}
    END
    Get Text    ${cart icon}   ==    3

Open Shopping Cart And Check If Contains 3 Items
    Click     ${cart icon}
    Wait For Elements State    ${cart_page_title}
    Get Element Count    ${cart_item_element}    ==    3

Proceed To Checkout
    Click    ${checkout_button}
    Wait For Elements State    ${checkout_title}

Fill Client Information And Proceed To Finalization
    [Arguments]    &{client}
    Fill Text    ${client_firstname_input}    ${client.firstname}
    Fill Text    ${client_lastname_input}    ${client.lastname}
    Fill Text    ${client_zip_input}    ${client.zip}
    Click    ${continue_to_finalization_button}
    Wait For Elements State    ${checkout_overview_title}

Finish order and expect Success
    Click    ${finish button}
    Wait for elements State    ${thank_you_notification}