*** Settings ***
Library    Browser    enable_presenter_mode=${True}
Resource    .${/}resources${/}login.resource
Test template    Login To Shop
Test Setup        Open Shop Webpage
# Test Teardown    Close Browser

*** Test Cases ***                USERNAME                     PASSWORD
Standard User                     standard_user                secret_sauce
Locked Out User                   locked_out_user              secret_sauce
Problem User                      problem_user                 secret_sauce
Performance Glitch User           performance_glitch_user      secret_sauce
Error User                        error_user                   secret_sauce
Visual User                       visual_user    secret_sauce

    